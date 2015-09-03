global enum config string;

enum.enumtype.action                 = 100;
enum.enumtype.status                 = 200;
enum.enumtype.direction              = 300;
enum.enumtype.orderstatus            = 400;

% Policy�ļ����ض��� type                  = 100
enum.action.noaction                 = 0;	% �޶���
enum.action.openlong                 = 1;	% ����
enum.action.openshort                = 2;	% ����
enum.action.closelong                = 3;	% ƽ��
enum.action.closeshort               = 4;	% ƽ��
enum.action.cancle                   = 10; % ���󳷵�

% �ֵ�״̬ type                          = 200
enum.status.nohold                   = 0;	% ��ǰδ�ֵ�
enum.status.longhold                 = 1;	% ��ǰ���ж൥
enum.status.shorthold                = 2;	% ��ǰ���пյ�
enum.status.reporting_openlong       = 11;	% ���ڱ��࿪��
enum.status.reporting_openshort      = 12;	% ���ڱ��տ���
enum.status.reporting_closelong      = 13;	% ���ڱ���ƽ��
enum.status.reporting_closeshort     = 14;	% ���ڱ���ƽ��

% ���� type                            = 300
enum.direction.undefined             = 0;	% ����δ��
enum.direction.long                  = 1;	% �෽��
enum.direction.short                 = 2;	% �շ���

% ����״̬ type                          = 400
enum.orderstatus.inactive            = 0;	% ��ǰ�޵��
enum.orderstatus.active              = 1;	% ��ǰ�е��

config.software.verison              = '0.0.1';
config.CTP.filename                  = '<TODO>';
config.CTP.username                  = '<TODO>';
config.CTP.password                  = '<TODO>';
config.realtime.instrumentid         = 'if1509';
config.recall.FileFormat             = '.csv';
config.recall.ExcelRange             = 'A3:Q32000';
config.recall.OrderTradeDelay        = 2;

string.startup                       = 'CTP�ۺϲ���ƽ̨\nPowered by Backlighting\n����ʱ�䣺%s\n�汾��%s\n�������ã�\n\tCTP������Ϣ��\n\t\t�ʺţ�%s\n\t\t�����ļ���%s\n\t��ǰ��Լ��%s\n\n';
string.info_OnInitFinished           = '��ʼ�����';
string.info_OnMarketDataConnected    = '������������';
string.info_OnMarketDataDisconnected = '�������ݶϿ�';
string.info_OnTradeConnected         = '������������';
string.info_OnTradeDisConnected      = '�������ݶϿ�';
string.info_SelectCommand            = '�ز�������recall��ʵ��������real������Ĭ��recall��\n>> ';
string.info_IllegalCommand           = '����ʶ�������';
string.info_SelectCsvFile            = '��ѡ��CTPԭʼcsv�ļ�';
string.info_PrepareReadCsv           = '׼����ȡcsv�ļ�';
string.info_ConfirmCsvFile           = '��ѡ���CTPԭʼ�ļ��ǣ�%s�����ڶ�ȡ�ļ�����';
string.info_SucessReadingCsvFile     = 'CTPԭʼ���ݶ������';
string.info_SelectPolicy             = '�����뱾����Ҫƥ��Ĳ������ƣ�����Ĭ��policy��\n>> ';
string.info_PolicyNotFound           = '�����ļ�������';
string.info_FailOnCTPLoging          = 'CTP��½ʧ�ܣ�������룺%d';
string.info_SucessOnCTPLoging        = 'CTP��¼�ɹ�';
string.info_IllegalPolicyAction      = '�Ƿ��Ĳ��Զ�������';
string.info_OpeningLong              = '��[%s]���࣬��λ[%4.2f]��ԭ��[%s]�����ڱ���';
string.info_OpeningShort             = '��[%s]���գ���λ[%4.2f]��ԭ��[%s]�����ڱ���';
string.info_SucessOpeningLong        = '��[%s]����ɹ�����λ[%4.2f]';
string.info_SucessOpeningShort       = '��[%s]���ճɹ�����λ[%4.2f]';
string.info_ClosingLong              = '��[%s]ƽ�࣬��λ[%4.2f]��ԭ��[%s]�����ڱ���';
string.info_ClosingShort             = '��[%s]ƽ�գ���λ[%4.2f]��ԭ��[%s]�����ڱ���';
string.info_SucessClosingLong        = '��[%s]ƽ��ɹ�����λ[%4.2f]������[%3.2f]';
string.info_SucessClosingShort       = '��[%s]ƽ�ճɹ�����λ[%4.2f]������[%3.2f]';
string.info_SucessCancleOrder        = '��[%s]�����ɹ�';
string.info_RecallCaseReport         = '�ز���������';
string.info_ShowAllOrder             = '������ţ�%03d\n\t������[%s](%4.2f)\t{������%s,%4.2f}\n\tƽ����[%s](%4.2f)\t{������%s,%4.2f}\t\t���棺%3.2f';
string.info_SelectDelay              = '�����뱾����Ҫƥ��Ĳ������ƣ�����Ĭ��%2dTicks��\n>> ';
string.info_InputNotNumeric          = '��Ҫ����һ������';

string.error_IllegalPolicyAction1    = '���Զ�������Ƿ�����δ�ֵ�������£����ó���ƽ��';
string.error_IllegalPolicyAction2    = '���Զ�������Ƿ������ѳֵ�������£����ó��Կ���';
string.error_IllegalPolicyAction3    = '���Զ�������Ƿ����ڷǱ���������£����ó��Գ���';
string.error_IllegalPolicyPoint      = '����λ��\n\tTickID��%d\n\tTime  : %s\n\tStatus: %s\n\tAction: %s';
