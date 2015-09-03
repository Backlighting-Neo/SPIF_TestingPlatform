global enum config string;

enum.enumtype.action                 = 100;
enum.enumtype.status                 = 200;
enum.enumtype.direction              = 300;
enum.enumtype.orderstatus            = 400;

% Policy文件返回动作 type                  = 100
enum.action.noaction                 = 0;	% 无动作
enum.action.openlong                 = 1;	% 开多
enum.action.openshort                = 2;	% 开空
enum.action.closelong                = 3;	% 平多
enum.action.closeshort               = 4;	% 平空
enum.action.cancle                   = 10; % 请求撤单

% 持单状态 type                          = 200
enum.status.nohold                   = 0;	% 当前未持单
enum.status.longhold                 = 1;	% 当前持有多单
enum.status.shorthold                = 2;	% 当前持有空单
enum.status.reporting_openlong       = 11;	% 正在报多开单
enum.status.reporting_openshort      = 12;	% 正在报空开单
enum.status.reporting_closelong      = 13;	% 正在报多平单
enum.status.reporting_closeshort     = 14;	% 正在报空平单

% 方向 type                            = 300
enum.direction.undefined             = 0;	% 方向未定
enum.direction.long                  = 1;	% 多方向
enum.direction.short                 = 2;	% 空方向

% 报单状态 type                          = 400
enum.orderstatus.inactive            = 0;	% 当前无单活动
enum.orderstatus.active              = 1;	% 当前有单活动

config.software.verison              = '0.0.1';
config.CTP.filename                  = '<TODO>';
config.CTP.username                  = '<TODO>';
config.CTP.password                  = '<TODO>';
config.realtime.instrumentid         = 'if1509';
config.recall.FileFormat             = '.csv';
config.recall.ExcelRange             = 'A3:Q32000';
config.recall.OrderTradeDelay        = 2;

string.startup                       = 'CTP综合测试平台\nPowered by Backlighting\n启动时间：%s\n版本：%s\n参数设置：\n\tCTP配置信息：\n\t\t帐号：%s\n\t\t配置文件：%s\n\t当前合约：%s\n\n';
string.info_OnInitFinished           = '初始化完成';
string.info_OnMarketDataConnected    = '行情数据连接';
string.info_OnMarketDataDisconnected = '行情数据断开';
string.info_OnTradeConnected         = '交易数据连接';
string.info_OnTradeDisConnected      = '交易数据断开';
string.info_SelectCommand            = '回测请输入recall，实盘请输入real（留空默认recall）\n>> ';
string.info_IllegalCommand           = '不能识别的命令';
string.info_SelectCsvFile            = '请选择CTP原始csv文件';
string.info_PrepareReadCsv           = '准备读取csv文件';
string.info_ConfirmCsvFile           = '您选择的CTP原始文件是：%s，正在读取文件……';
string.info_SucessReadingCsvFile     = 'CTP原始数据读入完毕';
string.info_SelectPolicy             = '请输入本次需要匹配的策略名称（留空默认policy）\n>> ';
string.info_PolicyNotFound           = '策略文件不存在';
string.info_FailOnCTPLoging          = 'CTP登陆失败，错误代码：%d';
string.info_SucessOnCTPLoging        = 'CTP登录成功';
string.info_IllegalPolicyAction      = '非法的策略动作代码';
string.info_OpeningLong              = '在[%s]开多，点位[%4.2f]，原因[%s]，正在报单';
string.info_OpeningShort             = '在[%s]开空，点位[%4.2f]，原因[%s]，正在报单';
string.info_SucessOpeningLong        = '在[%s]开多成功，点位[%4.2f]';
string.info_SucessOpeningShort       = '在[%s]开空成功，点位[%4.2f]';
string.info_ClosingLong              = '在[%s]平多，点位[%4.2f]，原因[%s]，正在报单';
string.info_ClosingShort             = '在[%s]平空，点位[%4.2f]，原因[%s]，正在报单';
string.info_SucessClosingLong        = '在[%s]平多成功，点位[%4.2f]，收益[%3.2f]';
string.info_SucessClosingShort       = '在[%s]平空成功，点位[%4.2f]，收益[%3.2f]';
string.info_SucessCancleOrder        = '在[%s]撤单成功';
string.info_RecallCaseReport         = '回测用例报告';
string.info_ShowAllOrder             = '订单编号：%03d\n\t开单：[%s](%4.2f)\t{报单：%s,%4.2f}\n\t平单：[%s](%4.2f)\t{报单：%s,%4.2f}\t\t收益：%3.2f';
string.info_SelectDelay              = '请输入本次需要匹配的策略名称（留空默认%2dTicks）\n>> ';
string.info_InputNotNumeric          = '需要输入一个数字';

string.error_IllegalPolicyAction1    = '策略动作代码非法：在未持单的情况下，不得尝试平单';
string.error_IllegalPolicyAction2    = '策略动作代码非法：在已持单的情况下，不得尝试开单';
string.error_IllegalPolicyAction3    = '策略动作代码非法：在非报单的情况下，不得尝试撤单';
string.error_IllegalPolicyPoint      = '错误位：\n\tTickID：%d\n\tTime  : %s\n\tStatus: %s\n\tAction: %s';
