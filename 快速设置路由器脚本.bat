@echo off & setlocal enabledelayedexpansion
color 1A
TITLE 快速设置路由器脚本  --华工路由器正式群出品
set routerPasswd=admin
set route_ip=192.168.1.1
pushd "%CD%"
CD /D "%~dp0"
echo =========================================================
echo 	本脚本由#华工路由器正式群#提供
echo 	欢迎加入#华工路由器正式群#    审核群号：262939451
echo 	注意：登陆路由器密码必须为%routerPasswd%，否则必然失败
echo. 密码不是admin的，请关掉本脚本自行改路由器密码后再来
echo =========================================================
echo.
echo 提示：脚本先测试路由连通性
pause
:_PING
ping OpenWrt
IF %errorlevel% EQU 0 ( goto _OK ) else ( goto NO_OPENWRT )
pause
:NO_OPENWRT
echo 该系统可能为非OPENWRT官方系统（或者是不是用OpenWrt做主机名），可能不适宜继续执行脚本
echo 如果已经确定是OpenWrt系统可以继续
pause
echo.
ping -a %route_ip%
IF %errorlevel% EQU 0 ( goto _OK ) else ( goto _FAIL )

:_OK
echo.
echo 提示：准备telnet路由开通SSH，把密码改为admin,如果出现
echo FATAL ERROR: Network error: Connection refused
echo 也不用理会
pause
type telnet.scut|plink -telnet root@%route_ip%
echo.
echo 提示：准备传送setup_ipk文件夹到路由的/tmp/下面
pause
echo y|pscp -scp -P 22 -pw %routerPasswd%  -r ./setup_ipk root@%route_ip%:/tmp/ | findstr 100% && echo OK || goto _FAIL
echo 提示：准备在路由执行init.scut脚本
pause
echo y|plink -P 22 -pw %routerPasswd% root@%route_ip% "sed -i 's/\r//g;' /tmp/setup_ipk/init.scut && chmod 755 /tmp/setup_ipk/init.scut && /tmp/setup_ipk/init.scut"
echo 提示：自动安装成功，请现在使用浏览器进入http://%route_ip%，能看到路由器管理登陆界面即可
echo 以后换帐号，换ip,MAC等等情况都可以使用%routerPasswd%进入管理页面，进行拨号等等相关设置，本脚本已经完成使命
pause
goto _EXIT

:_FAIL
echo.
echo.
echo 电脑与路由没通过连通性测试，请检查
echo 1.路由没通电
echo 2.网线松了，坏了质量不过关
echo 3.路由系统不是第三方的OpenWrt系统,请向卖家确认是否已经刷好固件。
echo 4.可能路由器密码不是%routerPasswd%，按新手教程密码专题更改路由器密码为%routerPasswd%
echo 5.改了密码还不行可能路由器的固件有问题，按新手教程刷一把固件。
echo 6.遇到ping命令不是内部或外部命令，也不是可运行的程序或批处理文件，请更换另一台电脑重试或者重装非精简版系统。
pause
exit

:_EXIT
pause
echo 能上网以后，可以使用浏览器进入http://%route_ip%，使用密码%routerPasswd%登录路由网页界面慢慢摸索，可以切换中文。
echo 按任意键结束本次设置过程，窗口自动关掉，或者等能上网了再关掉也行
pause
exit