@echo off
reg delete "hklm\system\currentcontrolset\control\keyboard layout" /v "ScanCode Map" /f
echo "键位已恢复，重启系统后生效"
pause