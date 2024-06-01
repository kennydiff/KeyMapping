---
[English](./README.md) |中文
---

## 目标

 为了让`macOS`和`Windows`两套系统使用相近的快捷键方案，不至于频繁切换两系统让自己**精神*****分裂***~~~

### 更新日志

- 总体
    - [x] Chrome、输入法、复制黏贴等常用双系统的操作热键保持一致。主要为Windows兼容Mac的操作习惯
    - [x] 输入法同步为Mac & Windows 统一热键，`⌘ + Space` / `Shift`
    - [x] 原`CapsLock`位置的键的定义为`Ctrl/Esc`
    - [x] 交换 Backspace & \
- MAC
    - [x] 最左下的键定义为HyperKey(4修饰按键同时按下)
    - [x] `Left_Shift` + (下面的)`HyperKey`(最左下) 的组合键,实现原本的`CapsLock`
    - [x] 新增`Dota2`的兼容支持，防止误触
    - [x] 微信，QQ，Dash 等 `⌘+Q` 的操作定义为最小化而不是关掉进程，杀进程用 `Shift+⌘+W`
- Windows
    - [x] 注册表实现`Alt - Ctrl`键的互换
    - [x] 某些微软的应用里AHK直接整个失效 ... fixed
    - [x] 实现类似Mac的`⌘+Backspace`删除的操作
    - [x] `Left_Shift` + (上面的)`CapsLock`(已改为Ctrl的定义)的组合键,实现原本的CapsLock切换
    - [x] `⌘+↓`映射为`Windows`的`Enter`
    - [x] AutoHotkey迁移到了支持V2版本的代码
    - [x] ~~添加Evernote支持(Win+S -> F9)  # K_24518 // 已放弃Evernote~~


### 其他说明

- AHK在Win10无法自动启动,出现未计量，解决方法如下：

    建立一个"AutoHotkey.cmd"批处理.发送到启动文件中

    ```shell
    start "" "D:\bk\AutoHotkey\MacKeyboard-KenMod.exe"
    exit
    ```


- AHK(forWin) 全称 AutoHotKey ，有用，但无法完整的Hack，还需要用到注册表进行系统级改，不过也算可以完美实现需求，至少使用chrome的时候不至于精神分裂了，目前已支持V2
- macOS直接使用的开源软件karabiner,非常好用，这是个工具，已经满足我需求
- Win 10 有些微软自己的一些应用，如服务、管理、PowerShell等，会直接跳过Autohotkey的脚本。解决办法：
  找到"C:\Program Files\AutoHotkey\AutoHotkey.exe", 反键属性，在兼容性页面里将这个程序设置用“管理员权限”执行即可解决问题。
  UAC规则在Windows 10中已经改变。一些在Windows 7中运行良好的AutoHotkey脚本在Windows 10中不再工作。
```
	1. 找到你的AutoHotkey可执行文件，通常位于：C:\Program Files\AutoHotkey\AutoHotkey.exe
	2. 右键点击AutoHotkey.exe
	3. 选择“兼容性”标签页
	4. 勾选"以管理员身份运行此程序"
```
  请注意，即使你正在以管理员身份运行，也必须这样做。希望这能帮助到大家~~~

