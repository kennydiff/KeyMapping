# 目标

为了让MAC和Windows两套系统使用接近的快捷键，不至于让自己**精神*****分裂***，同时分享给有需要的人使用。

## 功能列表

- 总体
    - [x] Chrome、输入法、复制黏贴等常用双系统的操作热键保持一致。主要为Windows兼容Mac的操作习惯（使用过的都知道Mac的热键更人性化一些）
    - [x] CapsLock的定义为Ctrl简单了点,已改为Hyper键意义更大
    - [x] "Shift & CapsLock" 实现原本的CapsLock
    - [x] 输入法同步为Mac & Windows 统一热键，Cmd & Shift
    
- MAC
    - [x] 本地键盘完美实现
    - [x] 外接蓝牙的达尔优(Dareu)87key键盘也完美实现

- Windows
    - [x] 注册表实现"Alt = Win"的互换
    - [x] AHK的实现剩余功能
    - [ ] win + R  reload 操作和 windows的打开运行之间的冲突。(Mac里没有打开运行项)
    
- Others
    - [ ] github repo里有些mac系统的垃圾文件

## 其他说明

- AHK(forWin) 全称 AutoHotKey ，有用，但无法完整的Hack，还需要用到注册表进行系统级改，不过也算可以完美实现需求，至少使用chrome的时候不至于精神分裂了。
- MAC直接使用的开源软件karabiner,非常好用，这是个工具，已经满足我需求