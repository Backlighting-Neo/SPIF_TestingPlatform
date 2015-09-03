function functionvalue = support(str)
	functionvalue = str2func(str);
end

function value = now()
	cur_data = date;
	cur_time = fix(clock);
	str = sprintf('%s %.2d:%.2d:%.2d', cur_data, cur_time(4), cur_time(5), cur_time(6));
	value = str;
end

function value = time()
	cur_time = fix(clock);
	str = sprintf('%.2d:%.2d:%.2d', cur_time(4), cur_time(5), cur_time(6));
	value = str;
end

function log(varargin)
	global outputdata;
	seed = nargin;
	if seed >= 2
		logstring = varargin{1};
	else
		logstring = cell2mat(varargin);
	end
	temp = sprintf('[%s] %s\n',time(),logstring);
	outputdata.systemlog = strcat(outputdata.systemlog,temp);
	fprintf(seed,'%s',temp);
end

function logwithouttime(string)
	global outputdata;
	temp = sprintf('%s\n',string);
	outputdata.systemlog = strcat(outputdata.systemlog,temp);
	fprintf('%s',temp);
end

function value = convert2time(time,milli)
	time    = floor(time / 1.157407407e-05);
	second  = mod(time,60);
	minutes = floor(mod(time, 3600) / 60);
	hours   = floor(time / 3600);
	value   = sprintf('%d:%02d:%02d.%03d',hours,minutes,second,milli);
end

function clearall()
	clear enum string config;
	clear now time log logwithouttime policy;
	clear policy_temp;
end

function value = convert2enum(enumtype,enumvalue)
	global enum;
	temp = enumtype + enumvalue;
	switch temp
		case enum.enumtype.action + enum.action.noaction
			value = 'enum.action.noaction';
		case enum.enumtype.action + enum.action.openlong
			value = 'enum.action.openlong';
		case enum.enumtype.action + enum.action.openshort
			value = 'enum.action.openshort';
		case enum.enumtype.action + enum.action.closelong
			value = 'enum.action.closelong';
		case enum.enumtype.action + enum.action.closeshort
			value = 'enum.action.closeshort';
		case enum.enumtype.status + enum.status.nohold
			value = 'enum.status.nohold';
		case enum.enumtype.status + enum.status.longhold
			value = 'enum.status.longhold';
		case enum.enumtype.status + enum.status.shorthold
			value = 'enum.status.shorthold';
		case enum.enumtype.status + enum.status.reporting_openlong
			value = 'enum.status.reporting_openlong';
		case enum.enumtype.status + enum.status.reporting_openshort
			value = 'enum.status.reporting_openshort';
		case enum.enumtype.status + enum.status.reporting_closelong
			value = 'enum.status.reporting_closelong';
		case enum.enumtype.status + enum.status.reporting_closeshort
			value = 'enum.status.reporting_closeshort';
		case enum.enumtype.direction + enum.direction.undefined
			value = 'enum.direction.undefined';
		case enum.enumtype.direction + enum.direction.long
			value = 'enum.direction.long';
		case enum.enumtype.direction + enum.direction.short
			value = 'enum.direction.short';
		case enum.enumtype.orderstatus + enum.orderstatus.inactive
			value = 'enum.orderstatus.inactive';
		case enum.enumtype.orderstatus + enum.orderstatus.active
			value = 'enum.orderstatus.active';
	end
end

function value = test
	clear counter;
end