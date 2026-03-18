#Requires AutoHotkey v2.0
#SingleInstance Ignore
path := A_ScriptDir . "\non-ascii-identifier-probe.generated.ahk"
if (fileExist(path))
    fileDelete(path)
code := "#Requires AutoHotkey v2.0`r`n"
    . "i := 0`r`n"
loop 0x10FFFF    {
    i := A_Index
    if (i < 0x0080)
        continue
    if (0xD800 <= i && i <= 0xDFFF)
        continue
    code .= chr(A_Index) . " := true `;  " . format("U+{:04X}", A_Index) . "`r`n"
        . "i += %chr(" A_Index ")%`r`n"
}
code .= "msgbox(i)" ;  1111936
fileAppend(code, path, "UTF-8")