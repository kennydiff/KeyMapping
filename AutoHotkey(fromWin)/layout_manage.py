# --------------------------------------------------------------
# 代码来源: http://www.voidcn.com/article/p-ydargamv-ta.html
# --------------------------------------------------------------

import sys
import os

save_format = "bat"    #这个值可以修改，有两个选项(bat和reg)，可选择生成bat批处理文件或者reg注册表脚本文件,功能一样

class CountError(Exception):    #文本文件格式错误异常
    pass

class FileFormatError(Exception):    #save_format值异常
    pass


if save_format not in ["bat","reg"]:
    raise FileFormatError("The variable 'save_format'`s value must be 'bat' or 'reg'.")


if __name__ == "__main__":
    
    if not os.path.isdir("layout_"+save_format):
        os.mkdir("layout_"+save_format)

    if len(sys.argv) == 1:
        if save_format == "bat":
            with open("layout_bat/recover.bat",'w') as f:
                f.write('@echo off\nreg delete "hklm\\system\\currentcontrolset\\control\\keyboard layout" /v "ScanCode Map" /f\necho "键位已恢复，重启系统后生效"\npause')
            input("恢复文件recover.bat已生成至layout_bat文件夹下，以管理员身份右键执行该文件后重启系统生效。\n按回车键退出程序...")

        else:
            with open("layout_reg/recover.reg",'w') as f:
                f.write('Windows Registry Editor Version 5.00\n[HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Keyboard Layout]\n"ScanCode Map"=hex:00,00,00,00,00,00,00,00,01,00,00,00,00,00,00,00')
            input("恢复文件recover.reg已生成至layout_reg文件夹下，双击执行该文件后重启系统生效。\n按回车键退出程序...")

    elif len(sys.argv) == 2:
        scan_code_dict = {
            "00 00":"None",
            "01 00":"Esc",    #即Esc键的扫描码是"0001"
            "02 00":"1",
            "03 00":"2",
            "04 00":"3",
            "05 00":"4",
            "06 00":"5",
            "07 00":"6",
            "08 00":"7",
            "09 00":"8",
            "0a 00":"9",
            "0b 00":"0",
            "0c 00":"-",
            "0d 00":"+",
            "0e 00":"Backspace",
            "0f 00":"Tab",
            "10 00":"Q",
            "11 00":"W",
            "12 00":"E",
            "13 00":"R",
            "14 00":"T",
            "15 00":"Y",
            "16 00":"U",
            "17 00":"I",
            "18 00":"O",
            "19 00":"P",
            "1a 00":"[",
            "1b 00":"]",
            "1c 00":"Enter",
            "1d 00":"Left Ctrl",
            "1e 00":"A",
            "1f 00":"S",
            "20 00":"D",
            "21 00":"F",
            "22 00":"G",
            "23 00":"H",
            "24 00":"J",
            "25 00":"K",
            "26 00":"L",
            "27 00":";",
            "28 00":"'",
            "29 00":"`",
            "2a 00":"Left Shift",
            "2b 00":"\\",
            "2c 00":"Z",
            "2d 00":"X",
            "2e 00":"C",
            "2f 00":"V",
            "30 00":"B",
            "31 00":"N",
            "32 00":"M",
            "33 00":",",
            "34 00":".",
            "35 00":"/",
            "36 00":"Right Shift",
            "37 00":"n*",
            "38 00":"Left Alt",
            "39 00":"Space",
            "3a 00":"Caps Lock",
            "3b 00":"F1",
            "3c 00":"F2",
            "3d 00":"F3",
            "3e 00":"F4",
            "3f 00":"F5",
            "40 00":"F6",
            "41 00":"F7",
            "42 00":"F8",
            "43 00":"F9",
            "44 00":"F10",
            "45 00":"Num Lock",
            "46 00":"Scroll Lock",
            "47 00":"n7",
            "48 00":"n8",
            "49 00":"n9",
            "4a 00":"n-",
            "4b 00":"n4",
            "4c 00":"n5",
            "4d 00":"n6",
            "4e 00":"n+",
            "4f 00":"n1",
            "50 00":"n2",
            "51 00":"n3",
            "52 00":"n0",
            "53 00":"n.",
            "57 00":"F11",
            "58 00":"F12",
            "1c e0":"nEnter",
            "1d e0":"Right Ctrl",
            "37 e0":"PrtSc",
            "38 e0":"Right Alt",
            "47 e0":"Home",
            "48 e0":"Up",
            "49 e0":"Page Up",
            "4b e0":"Left",
            "4d e0":"Right",
            "4f e0":"End",
            "50 e0":"Down",
            "51 e0":"Page Down",
            "52 e0":"Insert",
            "53 e0":"Delete",
            "5b e0":"Left Windows",
            "5c e0":"Right Windows",
            }

        fun_key_dict = dict((m.upper(),n) for n,m in scan_code_dict.items())    #键值互换,键值全大写
        content = '00 00 00 00 00 00 00 00'
        
        #用于暂时保存映射前后的键位，判断这次键位修改是否有风险
        before_map_set = set()
        after_map_set = set()

        with open(sys.argv[1]) as f:
            p = f.read().strip().split(';')
            p.remove('')
            content += ' {:0>2x} 00 00 00'.format(len(p)+1)
            try:
                for i in p:
                    if len(i.strip().split(':')) == 2:
                        before_map_set.add(i.split(':')[0].strip().upper())
                        after_map_set.add(i.split(':')[1].strip().upper())
                        content += ' '+fun_key_dict[i.split(':')[1].strip().upper()]+' '+fun_key_dict[i.split(':')[0].strip().upper()]
                    else:
                        raise CountError
                content += ' 00 00 00 00'
            except KeyError:
                print("文件中键名称有误")
                
            except CountError:
                print("文件中未按格式书写")
            else:
                if before_map_set != after_map_set:
                    run = input("此次键位替换存在风险，{}键功能将在键盘上无对应按键，是否继续？(输入y继续，否则退出程序)".format(str(before_map_set-after_map_set)[1:-1]))
                    if run != 'y':
                        sys.exit()

                if save_format == "bat":
                    with open("layout_bat/"+'.'.join(sys.argv[1].split('\\')[-1].split('.')[:-1])+'.bat','w') as g:
                        g.write('@echo off\nreg add "hklm\\system\\currentcontrolset\\control\\keyboard layout" /v "ScanCode Map" /t REG_BINARY /d "{}" /f\necho "键位已完成修改，重启系统后生效"\npause'.format(''.join(content.split())))
                    input("...\n{}文件已生成至layout_bat目录下，右键以管理员身份执行该文件后重启系统生效。\n按回车键退出程序...".format('.'.join(sys.argv[1].split('\\')[-1].split('.')[:-1])+'.'+save_format))

                else:
                    with open("layout_reg/"+'.'.join(sys.argv[1].split('\\')[-1].split('.')[:-1])+'.reg','w') as g:
                        g.write('Windows Registry Editor Version 5.00\n[HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Keyboard Layout]\n"ScanCode Map"=hex:{}'.format(','.join(content.split())))

                    input("...\n{}文件已生成至layout_reg目录下，双击执行该文件后重启系统生效。\n按回车键退出程序...".format('.'.join(sys.argv[1].split('\\')[-1].split('.')[:-1])+'.'+save_format))
    else:
        input("传入参数错误，按回车键退出程序...")