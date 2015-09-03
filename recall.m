clear command;
[fname,pname] = uigetfile(config.recall.FileFormat, string.info_SelectCsvFile);
log(sprintf(string.info_ConfirmCsvFile,fname));
[csvdata,csvstring]= xlsread([pname,fname],config.recall.ExcelRange);
log(string.info_SucessReadingCsvFile);
clear fname pname;
recordcount = size(csvdata,1);
recall_instrumentID = cell2mat(csvstring(1));
clear csvstring;

flag = true;
while flag
	delay = input(sprintf(string.info_SelectDelay, ...
		config.recall.OrderTradeDelay),'s');
	if isempty(delay)
		flag = false;
	else
		temp = str2num(delay);
		if ~isempty(temp)
			flag = false;
			config.recall.OrderTradeDelay = temp;
		else
			logwithouttime(string.info_InputNotNumeric);
		end
	end
end
clear delay temp flag;

for counter = 1:recordcount
	marketdata.TickID             = counter;
	marketdata.InstrumentID       = recall_instrumentID;
	marketdata.BidPrice1          = csvdata(counter,1);
	marketdata.BidVolume1         = csvdata(counter,2);
	marketdata.AskPrice1          = csvdata(counter,3);
	marketdata.AskVolume1         = csvdata(counter,4);
	marketdata.OpenPrice          = csvdata(counter,5);
	marketdata.HighestPrice       = csvdata(counter,6);
	marketdata.LowestPrice        = csvdata(counter,7);
	marketdata.LastPrice          = csvdata(counter,8);
	marketdata.OpenInterest       = csvdata(counter,9);
	marketdata.Volume             = csvdata(counter,10);
	marketdata.UpperLimitPrice    = csvdata(counter,11);
	marketdata.LowerLimitPrice    = csvdata(counter,12);
	marketdata.PreSettlementPrice = csvdata(counter,13);
	marketdata.AveragePrice       = csvdata(counter,14);
	marketdata.UpdateTime         = convert2time(csvdata(counter,15),csvdata(counter,16));

	% 收益计算
	if status == enum.status.longhold ...
		|| status == enum.status.shorthold
		if orderstatus.direction == enum.direction.long
			orderstatus.benefit = marketdata.LastPrice - orderstatus.open_traded_price;
		elseif orderstatus.direction == enum.direction.short
			orderstatus.benefit = orderstatus.open_traded_price - marketdata.LastPrice;
		end
	end

	% 模拟成交
	if (status == enum.status.reporting_openlong ...
		|| status == enum.status.reporting_openshort) ...
		&& (counter - orderstatus.open_report_tickID) > config.recall.OrderTradeDelay

		orderstatus.open_traded_tickID = counter;
		orderstatus.open_traded_time   = marketdata.UpdateTime;
		orderstatus.open_traded_price  = marketdata.LastPrice;
		if status == enum.status.reporting_openlong
			status = enum.status.longhold;
			log(sprintf(string.info_SucessOpeningLong,marketdata.UpdateTime,marketdata.LastPrice));
		elseif status == enum.status.reporting_openshort
			status = enum.status.shorthold;
			log(sprintf(string.info_SucessOpeningShort,marketdata.UpdateTime,marketdata.LastPrice));
		end

	elseif (status == enum.status.reporting_closelong ...
		|| status == enum.status.reporting_closeshort) ...
		&& (counter - orderstatus.close_report_tickID) > config.recall.OrderTradeDelay

		orderstatus.status              = enum.orderstatus.inactive;
		orderstatus.close_traded_tickID = counter;
		orderstatus.close_traded_time   = marketdata.UpdateTime;
		orderstatus.close_traded_price  = marketdata.LastPrice;
		if status == enum.status.reporting_closelong
			log(sprintf(string.info_SucessClosingShort,marketdata.UpdateTime,marketdata.LastPrice,orderstatus.benefit));
		elseif status == enum.status.reporting_closeshort
			log(sprintf(string.info_SucessClosingShort,marketdata.UpdateTime,marketdata.LastPrice,orderstatus.benefit));
		end
		status = enum.status.nohold;
		orderlist(ordercount) = orderstatus;
		ordercount = ordercount + 1;
		reset_orderstatus;

	end

	[action, reason] = policy(marketdata,status,orderstatus);

	% 检查action是否合法
	if status == enum.status.nohold ...
		&& ( action == enum.action.closelong ...
			|| action == enum.action.closeshort)
		% 未持单时不得请求平单
		errorstring = string.error_IllegalPolicyAction1;
		policyerror;

	elseif (status == enum.status.longhold ...
		|| status == enum.status.shorthold) ...
	&& ( action == enum.action.openlong ...
		|| action == enum.action.openshort)
		% 持单时不得请求开单
		errorstring = string.error_IllegalPolicyAction2;
		policyerror;

	elseif (status < 10) ...
		&& action == enum.action.cancle 
		% 非报单状态不允许撤单
		errorstring = string.error_IllegalPolicyAction3;
		policyerror;

	end

	% 处理action的请求
	if action == enum.action.openlong ...
		|| action == enum.action.openshort 
		% 处理报开
		status                         = enum.status.reporting_openlong;
		orderstatus.status             = enum.orderstatus.active;
		orderstatus.open_report_tickID = counter;
		orderstatus.open_report_time   = marketdata.UpdateTime;
		orderstatus.open_report_price  = marketdata.LastPrice;
		orderstatus.open_reason        = reason;
		
		if action == enum.action.openlong
			orderstatus.direction          = enum.direction.long;
			log(sprintf(string.info_OpeningLong,marketdata.UpdateTime,marketdata.LastPrice, reason));
		else
			orderstatus.direction          = enum.direction.short;
			log(sprintf(string.info_OpeningShort,marketdata.UpdateTime,marketdata.LastPrice, reason));
		end
		
	elseif action == enum.action.closelong ...
		|| action == enum.action.closeshort
		% 处理报平

		orderstatus.close_report_tickID = counter;
		orderstatus.close_report_time   = marketdata.UpdateTime;
		orderstatus.close_report_price  = marketdata.LastPrice;
		orderstatus.close_reason        = reason;

		if action == enum.action.closelong
			status = enum.status.reporting_closelong;
			log(sprintf(string.info_ClosingLong,marketdata.UpdateTime,marketdata.LastPrice, reason));
		else
			status = enum.status.reporting_closeshort;
			log(sprintf(string.info_ClosingShort,marketdata.UpdateTime,marketdata.LastPrice, reason));
		end
		
	elseif action == enum.action.cancle
		% 处理撤单
		if status == enum.status.reporting_openlong ...
			|| status == enum.status.reporting_openshort
			% 开单撤单
			reset_orderstatus;
			status = enum.status.nohold;
		else
			% 平单撤单
			orderstatus.close_report_tickID = -1;
			orderstatus.close_report_time = '';
			orderstatus.close_report_price = -1;

			if status == enum.status.reporting_closelong
				status = enum.status.longhold;
			else
				status = enum.status.shorthold;
			end
		end
		log(string.info_SucessCancleOrder,marketdata.UpdateTime);
	end
end

clear csvdata csvstring action;