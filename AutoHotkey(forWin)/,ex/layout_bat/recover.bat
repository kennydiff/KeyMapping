@echo off
reg delete "hklm\system\currentcontrolset\control\keyboard layout" /v "ScanCode Map" /f
echo "��λ�ѻָ�������ϵͳ����Ч"
pause