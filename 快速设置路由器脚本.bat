@echo off & setlocal enabledelayedexpansion
color 1A
TITLE ��������·�����ű�  --����·������ʽȺ��Ʒ
set routerPasswd=admin
set route_ip=192.168.1.1
pushd "%CD%"
CD /D "%~dp0"
echo =========================================================
echo 	���ű���#����·������ʽȺ#�ṩ
echo 	��ӭ����#����·������ʽȺ#    ���Ⱥ�ţ�262939451
echo 	ע�⣺��½·�����������Ϊ%routerPasswd%�������Ȼʧ��
echo. ���벻��admin�ģ���ص����ű����и�·�������������
echo =========================================================
echo.
echo ��ʾ���ű��Ȳ���·����ͨ��
pause
:_PING
ping OpenWrt
IF %errorlevel% EQU 0 ( goto _OK ) else ( goto NO_OPENWRT )
pause
:NO_OPENWRT
echo ��ϵͳ����Ϊ��OPENWRT�ٷ�ϵͳ�������ǲ�����OpenWrt���������������ܲ����˼���ִ�нű�
echo ����Ѿ�ȷ����OpenWrtϵͳ���Լ���
pause
echo.
ping -a %route_ip%
IF %errorlevel% EQU 0 ( goto _OK ) else ( goto _FAIL )

:_OK
echo.
echo ��ʾ��׼��telnet·�ɿ�ͨSSH���������Ϊadmin,�������
echo FATAL ERROR: Network error: Connection refused
echo Ҳ�������
pause
type telnet.scut|plink -telnet root@%route_ip%
echo.
echo ��ʾ��׼������setup_ipk�ļ��е�·�ɵ�/tmp/����
pause
echo y|pscp -scp -P 22 -pw %routerPasswd%  -r ./setup_ipk root@%route_ip%:/tmp/ | findstr 100% && echo OK || goto _FAIL
echo ��ʾ��׼����·��ִ��init.scut�ű�
pause
echo y|plink -P 22 -pw %routerPasswd% root@%route_ip% "sed -i 's/\r//g;' /tmp/setup_ipk/init.scut && chmod 755 /tmp/setup_ipk/init.scut && /tmp/setup_ipk/init.scut"
echo ��ʾ���Զ���װ�ɹ���������ʹ�����������http://%route_ip%���ܿ���·���������½���漴��
echo �Ժ��ʺţ���ip,MAC�ȵ����������ʹ��%routerPasswd%�������ҳ�棬���в��ŵȵ�������ã����ű��Ѿ����ʹ��
pause
goto _EXIT

:_FAIL
echo.
echo.
echo ������·��ûͨ����ͨ�Բ��ԣ�����
echo 1.·��ûͨ��
echo 2.�������ˣ���������������
echo 3.·��ϵͳ���ǵ�������OpenWrtϵͳ,��������ȷ���Ƿ��Ѿ�ˢ�ù̼���
echo 4.����·�������벻��%routerPasswd%�������ֽ̳�����ר�����·��������Ϊ%routerPasswd%
echo 5.�������뻹���п���·�����Ĺ̼������⣬�����ֽ̳�ˢһ�ѹ̼���
echo 6.����ping������ڲ����ⲿ���Ҳ���ǿ����еĳ�����������ļ����������һ̨�������Ի�����װ�Ǿ����ϵͳ��
pause
exit

:_EXIT
pause
echo �������Ժ󣬿���ʹ�����������http://%route_ip%��ʹ������%routerPasswd%��¼·����ҳ�������������������л����ġ�
echo ������������������ù��̣������Զ��ص������ߵ����������ٹص�Ҳ��
pause
exit