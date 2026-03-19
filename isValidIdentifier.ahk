#Requires AutoHotkey v2.0.0+
;==============================================================
; isValidIdentifier — Validates whether a string is a legal AutoHotkey identifier name
;
; GitHub: https://github.com/SevenKeyboard/is-valid-identifier
; Author: SevenKeyboard Ltd. (2026)
; License: The Unlicense
;
; Documentation / References:
;   Details - Names
;     https://www.autohotkey.com/docs/v2/Concepts.htm#names
;   Way to validate variable name validity for v2?
;     https://www.autohotkey.com/boards/viewtopic.php?t=140363
;==============================================================

/*
Example Usage:
    msgbox(isValidIdentifier("var"))        ;  true
    msgbox(isValidIdentifier("가"))         ;  true
    msgbox(isValidIdentifier("0"))          ;  false
    msgbox(isValidIdentifier("Class.Prop")) ;  false
*/

class VersionManager_isValidIdentifier
{
    static _ := this._init()
    static _init()    {
        global
        ISVALIDIDENTIFIER_VERSION := "1.0.1"
    }
}
isValidIdentifier(name)    {
    static identifierPattern := "\A[A-Z_a-z[:^ascii:]][0-9A-Z_a-z[:^ascii:]]*\z"
        ,keywords := map("as",true, "and",true, "contains",true, "false",true, "in",true
            ,"is",true, "isset",true, "not",true, "or",true, "super",true
            ,"true",true, "unset",true
            ,"break",true, "case",true, "catch",true, "continue",true, "else",true
            ,"finally",true, "for",true, "global",true, "goto",true, "if",true
            ,"local",true, "loop",true, "return",true, "static",true, "switch",true
            ,"throw",true, "try",true, "until",true, "while",true)
    return name is string && name !== "" && strLen(name) <= 253 && name ~= identifierPattern && !keywords.has(strLower(name))
}