% FILENAME
% 	policy
% 	综合测试平台 策略样本

% AUTHOR
% 	Backlighting Software Studio

% DATE
% 	Aug. 24, 2015

% VERSION
% 	0.0.1

% DESCRIPTION
%	这个函数将在主程序每次收到Tick数据时被调用
% 	您可以随意命名以下的函数名（main除外）
% 	在同一目录中允许存在多个策略函数文件
% 	在每次真实交易或回测时将由用户指定一个策略函数
% 	您的策略函数将在每个Tick数据到达时被调用
% 	您需要自行维护用来存储历史数据的数据结构
%	外部将为您提供一个policy_temp结构体变量以供您的中间数据存储使用
%	请在您的策略函数中，将policy_temp结构体声明为global
%	这个结构体变量将不会被清除

function [action, reason] = policy(marketdata, status, orderstatus)
	global enum;
	global policy_temp;  % 您的临时变量 所有数据都应该存储在这个变量中
	tickid             =  marketdata.TickID;
	instrumentid       =  marketdata.InstrumentID;	% 合约编号
	bidprice1          =  marketdata.BidPrice1;	% 买一价
	bidvolume1         =  marketdata.BidVolume1;	% 买一量
	askprice1          =  marketdata.AskPrice1;	% 卖一价
	askvolume1         =  marketdata.AskVolume1;	%	卖一量
	openprice          =  marketdata.OpenPrice;	% 开盘价
	highestprice       =  marketdata.HighestPrice;	% 最高价
	lowestprice        =  marketdata.LowestPrice;	% 最低价
	lastprice          =  marketdata.LastPrice;	% 最新价
	openinterest       =  marketdata.OpenInterest;	% 持仓量
	volume             =  marketdata.Volume;	% 成交量
	upperlimitprice    =  marketdata.UpperLimitPrice;	% 涨停价
	lowerlimitprice    =  marketdata.LowerLimitPrice;	% 跌停价
	presettlementprice =  marketdata.PreSettlementPrice;	% 昨日结算价
	averageprice       =  marketdata.AveragePrice;	% 今日平均价
	updatetime         =  marketdata.UpdateTime;	% Tick时间，格式hh:mm:ss.millisecond

	% TODO 在这里写相关的策略代码





	% TODO 在这里最终返值 六选一 分别为 无动作，开多，开空，平多，平空，撤单
	action = enum.action.noaction;
	action = enum.action.openlong;
	action = enum.action.openshort;
	action = enum.action.closelong;
	action = enum.action.closeshort;
	action = enum.action.cancle;

end
