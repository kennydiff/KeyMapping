# 目标
为了让MAC和Windows两套系统使用接近的快捷键，不至于让自己**精神*****分裂***，同时分享给有需要的人使用。

## 功能列表
- 总体
    - [x] Chrome、输入法、复制黏贴等常用双系统的操作热键保持一致。主要为Windows兼容Mac的操作习惯（使用过的都知道Mac的热键更人性化一些）
    - [x] CAPS LOCKS 实现为组合键为Ctrl ，单按为 ESC
    - [x] "Shift & CapsLock" 实现原本的CapsLock
    - [ ] 输入法同步为Mac & Windows 统一热键

- MAC
    - [x] 本地键盘完美实现
    - [x] 外接蓝牙的达尔优(Dareu)87key键盘也完美实现

- Windows
    - [x] 注册表 Alt Win互换
    - [x] AHK的实现剩余功能
    
- Others
    - [ ] github repo里面好多mac系统的垃圾文件

## AHK 是为Windows的键盘适配的
AHK(fromWin) 全称 autohotkey ，有用，但无法完整的Hack，还需要用到注册表改，
