Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
"ScanCode Map"=hex:00,00,00,00,00,00,00,00,05,00,00,00,38,00,1d,00,1d,00,38,00,38,e0,1d,e0,1d,e0,38,e0,\
00,00,00,00

// -- 分解步骤 ------------------------------------

"ScanCode Map"=hex:
00,00,00,00,        // 第一行必须是4个0
00,00,00,00,        // 第二行必须是4个0
05,00,00,00,        // 第三行的第一位数是以下的行数（这行不算，下面有5行，所以就是05，00，00，00）
38,00,1d,00,        // "38 00":"Left Alt" 将被 "1d 00":"Left Ctrl" 替换 
1d,00,38,00,        // 以下类同，按键对应的16进制数，具体参见:layout_manage.py
38,e0,1d,e0,        
1d,e0,38,e0,\       // 倒数第二行要有一个"\"字符作为结尾，并换行(CRLF)
00,00,00,00         // 最后一行必须是4个0，除了最后一行的4个0将之前的全部合并成一行，放到 "ScanCode Map"=hex: 的后面。



恢复这些reg的修改，执行以下批处理
```
layout_bat/recover.bat
```

