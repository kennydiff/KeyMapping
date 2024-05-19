---
English | [中文](./README_ZH.md)
---

## GOAL

 To ensure that both `macOS` and `Windows` systems use a similar set of shortcut keys, so as not to frequently switch between the two systems and cause oneself to become **mentally confused** ~~~


### CHANGE LOG

- Overall
    - [x] Chrome, input method, copy and paste, and other commonly used dual system operation hotkeys are kept consistent. Mainly for Windows compatibility with Mac's operation habits.
    - [x] Input method synchronization for Mac & Windows with unified hotkey: `⌘ + Space` / `Shift`
    - [x] The key originally at the `CapsLock` position is defined as `Ctrl/Esc`.
    - [x] Swap Backspace & \
- MAC
    - [x] The key at the bottom left is defined as HyperKey (4 modifier keys pressed simultaneously).
    - [x] The combination of `Left_Shift` and the `HyperKey` (bottom left) achieves the original function of `CapsLock`.
    - [x] Add compatibility support for `Dota 2` to prevent accidental touches.
    - [x] WeChat, QQ, Dash, and other operations of `⌘+Q` are defined as minimizing rather than terminating the process. To terminate the process, use `Shift+⌘+W`.
- Windows
    - [x] Implementation swaps the `Alt` and `Ctrl` keys through Windows registry.
    - [x] In some Microsoft applications, AHK is completely disabled... Fixed.
    - [x] Implement the operation similar to Mac's `⌘+Backspace` for deletion.
    - [x] The combination of `Left_Shift` + (`CapsLock` which has been redefined as `Ctrl`) achieves the original function of `CapsLock` toggling.
    - [x] AutoHotkey has migrated to code supporting version V2.
    - [x] ~~Add Evernote support (Win+S -> F9) # K_24518 // Evernote Support has been discontinued~~
- 其他
    - [ ] There are some junk files of the Mac system in the GitHub repository.

### Other Information

- AHK cannot start automatically on Win10, and there is an issue with non-measurement. The solution is as follows:

    Create a "AutoHotkey.cmd" batch file. Send it to the startup folder.

    ```
    `start "" "D:\bk\AutoHotkey\MacKeyboard-KenMod.exe"
     exit`
    ```

- AHK(forWin), full name AutoHotKey, is useful but cannot fully hack. It also requires registry modification for system-level changes. However, it can also perfectly meet the needs. At least when using Chrome, it won't cause a mental breakdown. It currently supports V2.

- The open-source software karabiner, which is directly used on macOS, is very practical. It's a tool that has already fulfilled my needs.

- Win 10 has some Microsoft applications, such as services, management, PowerShell, etc., that will bypass Autohotkey scripts directly. Solution:
    Locate "C:\Program Files\AutoHotkey\AutoHotkey.exe", right-click for properties, and set this program to run with "Administrator privileges" on the Compatibility tab to resolve the issue.
    UAC rules have changed with Windows 10. Some AutoHotkey scripts that worked fine in Windows 7 no longer work in Windows 10.
```
      1. Find your AutoHotkey executable, typically here: C:\Program Files\AutoHotkey\AutoHotkey.exe
      2. Right-click on AutoHotkey.exe
      3. Select the Compatibility tab
      4. Enable Run this program as Administrator
```
  Note you have to do this even though you are running as an Administrator.  Hope this helps others.