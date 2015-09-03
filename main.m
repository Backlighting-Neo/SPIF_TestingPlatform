% WARNING: DO NOT MODIFY THIS FILE

format long g;
clc;
configset;

global now time log logwithouttime convert2time convert2enum;

now            = support('now');
time           = support('time');
log            = support('log');
logwithouttime = support('logwithouttime');
convert2time   = support('convert2time');
convert2enum   = support('convert2enum');

global policy_temp;
policy_temp.global = true;

global outputdata;
outputdata.global = true;
outputdata.systemlog = '';

logwithouttime(sprintf(string.startup ,...
	now(),config.software.verison,config.CTP.username,config.CTP.filename));

flag = true;
while flag
	policyname = input(string.info_SelectPolicy,'s');
	if strcmp(policyname,'')
		policyname = 'policy';
	end
	if exist(strcat(policyname, '.m'),'file') == 2
		flag = false;
		policy = str2func(policyname);
		clear policyname;
	else
		fprintf('%s\n',string.info_PolicyNotFound);
	end
end

flag = true;
while flag
	command = input(string.info_SelectCommand,'s');
	if strcmp(command,'')
		command = 'recall';
	end
	if strcmp(command,'real') 
		flag = false;
		command = 0;
	elseif strcmp(command,'recall')
		flag = false;
		command = 1;
	else
		fprintf('%s\n',string.info_IllegalCommand);
	end
end
clear flag;

action = -1;
status = enum.status.nohold;
reset_orderstatus;
ordercount = 1;
orderlist(1) = orderstatus;

if command == 1
	recall;

elseif command == 0
	% real;
	% clear command;
	% actCTP = actxserver('ctpcom.ICTPClientAPI');
	% actCTP.registerevent({'OnMDConnected' mycallbacks('funOnMDConnected');...
	%     'OnMDDisconnected' mycallbacks('funOnMDDisconnected');...
	%     'OnTradeConnected' mycallbacks('funOnTradeConnected');...
	%     'OnTradeDisconnected' mycallbacks('funOnTradeDisconnected')});
	% actCTP.registerevent({'OnMarketData' ctpcallback('funOnMarketData'));

	% verify = Login(actCTP, config.CTP.filename, config.CTP.username, config.CTP.password);
	% if verify ~= 0
	% 	log(sprintf(string.info_FailOnCTPLoging,verify));
	% 	return;
	% else
	% 	log(string.info_SucessOnCTPLoging);
	% end

	% SubscribeMD(actCTP, config.realtime.instrumentid);
end

oc_result;

% clear enum string config;
% clear now time log logwithouttime policy;
% clear policy_temp;


