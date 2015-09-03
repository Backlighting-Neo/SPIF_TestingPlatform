if status == enum.status.longhold ...
	&& orderstatus.benefit < -module_stoploss_config.stoplosspoint
	clear module_stoploss_config;
	action = enum.action.closelong;
	reason = 'StopLoss';
	return;
elseif status == enum.status.shorthold ...
	&& orderstatus.benefit < -module_stoploss_config.stoplosspoint
	clear module_stoploss_config;
	action = enum.action.closeshort;
	reason = 'StopLoss';
	return;
end


