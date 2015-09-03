function functionvalue = ctpcallback(str)
	functionvalue = str2func(str);
end

function funOnInitFinished(varargin)
	global log string;
	log(string.info_OnInitFinished);
end

function funOnMDConnected(varargin)
	global log string;
	log(string.info_OnMarketDataConnected);
end

function funOnMDDisconnected(varargin)
	global log string;
	log(string.info_OnMarketDataDisconnected);
end

function funOnTradeConnected(varargin)
	global log string;
	log(string.info_OnTradeConnected);
end

function funOnTradeDisconnected(varargin)
	global log string;
	log(string.info_OnTradeDisConnected);
end
