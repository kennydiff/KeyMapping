## 目标

 为了让MAC和Windows两套系统使用相近的快捷键方案，不至于频繁切换两系统让自己**精神*****分裂***~~~

### 功能列表

- 总体
    - [x] Chrome、输入法、复制黏贴等常用双系统的操作热键保持一致。主要为Windows兼容Mac的操作习惯（使用过的都知道Mac的热键更人性化一些）
    - [x] CapsLock的定义为Ctrl简单了点,已改为Hyper键意义更大
    - [x] "CapsLock & `"(tab上的那个点)的组合键,实现原本的CapsLock
    - [x] 输入法同步为Mac & Windows 统一热键，Cmd & Shift
    
- MAC
    - [x] 本地键盘完美实现
    - [x] 外接蓝牙的达尔优(Dareu)87key键盘也完美实现

- Windows
    - [x] 注册表实现"Alt = Win"的互换
    - [x] AHK的实现剩余功能    
    - [x] 添加Evernote支持(Win+S -> F9)
    - [x] 两边ALt Ctrl交换注册表    
    - [x] 某些微软的应用里AHK直接整个失效 ... fixed
    
    
- Others
    - [ ] github repo里有些mac系统的垃圾文件

### 其他说明

- AHK(forWin) 全称 AutoHotKey ，有用，但无法完整的Hack，还需要用到注册表进行系统级改，不过也算可以完美实现需求，至少使用chrome的时候不至于精神分裂了。
- MAC直接使用的开源软件karabiner,非常好用，这是个工具，已经满足我需求
- Win 10 有些微软自己的一些应用，如服务、管理、PowerShell等，会直接跳过Autohotkey的脚本。解决办法：
    找到"C:\Program Files\AutoHotkey\AutoHotkey.exe", 反键属性，在兼容性页面里将这个程序设置用“管理员权限”执行即可解决问题。    
    UAC rules have changed with Windows 10. Some AutoHotkey scripts that worked fine in Windows 7 no longer work in Windows 10.

      1. Find your AutoHotkey executable, typically here: C:\Program Files\AutoHotkey\AutoHotkey.exe
      2. Right-click on AutoHotkey.exe
      3. Select the Compatibility tab
      4. Enable Run this program as Administrator
         Note you have to do this even though you are running as an Administrator.  Hope this helps others.