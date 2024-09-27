SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
TT_duration = 1000
if( WinExist( "Debugging] ahk_class SciTEWindow") )
	suspendTT = 1

new_g_configurations := ", gui_x_offset_g, smart_replace_search_term_g, smart_replace_replacement_g, dbCache_members, dbCache_primaryKey_members, dbCache_house_registrations, dbCache_primaryKey_house_registrations, dbCache_error_logs, dbCache_primaryKey_error_logs, easy_typing_g"
g_configurations()

iniClipList()

clipList_A_Index := 1
scaffold_columns_g = -1
	
recentFunctions := Object()	; creates initially empty stack

#Include PWT_v2_include.ahk

newStacks := "pixel dev,18t;Advent of Code - Parabolic Reflector Dish - Challenge Day 14,18u;goblin.tools AI,18v;chrome password manager,18w;git credential cache,18y;git remote set-url,18z;freeCodeCamp connect to pSql,19a;devdocs.io,19b;ts-node-dev,19c;js log after fetch,19d;gemen-reporting.te.egov.mv,19e;bing translator,19f;waitSetClipboard clip set,19g;white noise generator,19h;phind find ai chat bot,19i;git rebase --autostash,19j;git patch,19k;efaas dev admin,19l;ecouncil gemen local,19m;laravel auth login,19n;xpat grab workpermits of site,19o;r correlation,19p;"
loadStacks()


SetTitleMatchMode, 1
SetTitleMatchMode, slow
SetTitleMatchMode RegEx
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;~ #Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force
;~ #KeyHistory 0
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

AutoTrim, off
SetKeyDelay, 100


picOffset:=(A_ScreenWidth-Width)/2

SysGet, Mon1, Monitor, 1
SysGet, Mon2, Monitor, 2

SearchMode=Questions
zHayStack:= zStacks
StringReplace, zHayStack, zHayStack, `;, `n, All
StringSplit, zHayStack,zHayStack,`n

CustomColor:= "E5EEF8"
Gui, Color, %CustomColor%, FFE5C9
Gui +LastFound  ; Make the GUI window the last found window for use by the line below.
WinSet, TransColor, E7EEF8 240

Gui, +Resize
if(!gui_x_offset_g)
	gui_x_offset_g = 680
Gui, Add, Pic, x-%gui_x_offset_g% y0 vPic1
Gui, Add, Pic, x-480 y0 vPic2 +0x4000000 
gui, font, , Courier New
Gui, Add, Button, x12 y60 w460 h60 gButton1 vButton1, %Button1_Label%
Gui, Add, Button, x12 y130 w460 h60 gButton2 vButton2, %Button2_Label%
Gui, Add, Button, x12 y200 w460 h60 gButton3 vButton3, %Button3_Label%
Gui, Add, Button, x12 y270 w460 h60 gButton4 vButton4, %Button4_Label%
Gui, Add, Button, x12 y10 w80 h30 , Back
Gui, Add, Edit, x42 y350 w370 h320 vMyEdit, 
Gui, Add, Button, x432 y10 w30 h30 , D
Gui, Add, Edit, x102 y20 w310 h20 gSearch vSearch,
Gui, Add, ListBox, x12 y50 w460 h300 gListBox vlistSel ,
; Generated using SmartGUI Creator for SciTE

;~ Gui, Show, w486 h685 , Decision Tree v2
Gui, Show, w486 h700 , Decision Tree v2
Gui, +HwndMyGuiHwnd
OnMessage(0x200, "WM_MOUSEMOVE")

OnMessage(0x0100, "WM_KEYUP")

OnMessage(0x14, "WM_ERASEBKGND")

RedPen := DllCall("CreatePen", "int", PS_SOLID:=0, "int", 5, "uint", 0xff)

GuiControl, Hide, MyEdit

;~ xCoord:=A_ScreenWidth
xCoord:=1920

;~ if(Picture = "ERROR")
	Picture=%A_ScriptDir%\shortcut.jpg
GuiControl,, Pic1, *w%xCoord% *h-1 %Picture%
;~ GuiControl,, Pic2, *w%xCoord% *h-1 %Picture%


GuiControl,, Edit2, % "~" Stack "~"
chooseFirst()


FileRead, WindowList_global, %A_ScriptDir%\WindowList_global.txt
if ErrorLevel
	MyTT("Read Skipped1")


;~ WindowList_global=%WindowList_global%`r`n`r`n%A_Year%%A_MMM%%A_DD% %A_Hour%:%A_Min%

WindowList_globalCounter:=A_Min-1
OnExit, OnExitFunction

if (a_hour=14 and a_min>=0 and PWT_Backed_Up=0)
	MsgBox CheckIn


DriveGet, Devices2, List, REMOVABLE
if( WinExist( "Debugging] ahk_class SciTEWindow") )
	MyTT("Debug Mode")
else
	SetTimer, PeriodicJobsTimer, 60000
suspendTT = 0

hotkeys := "abcdefghijklmnopqrstuvwxyz "
loop, Parse, hotkeys
	registerModifiers(A_LoopField)

lastNonHotkeys_time_g := 0

OnClipboardChange("ClipChanged")
return




PeriodicJobsTimer:
	if (PeriodicJobsRunning)
		return
	
	if( WinExist( "Debugging] ahk_class SciTEWindow") )
		SetTimer, PeriodicJobsTimer, 60000

	PeriodicJobsRunning:=1
	
		

		;~ Loop {
			CoordMode, Mouse, Screen
			MouseGetPos, x, y
			if(x != oldX or y != oldY){
				oldX := x 
				oldY := y
				
				x1 := x - 10
				y1 := y - 10
				x2 := x + 10
				y2 := y - 10
				x3 := x + 10
				y3 := y + 10
				x4 := x - 10
				y4 := y + 10
				
									;~ WinMove, hammadhOverlay, , -13, -8, 1920, 1080
					;~ WinSet, TransColor, 0D0D0D 255, hammadhOverlay
					;~ WinSet, Region, %x1%-%y1% 2000-%y1% 2000-0 0-0 0-2000 2000-2000 2000-%y1% %x2%-%y2% %x3%-%y3% %x4%-%y4%, hammadhOverlay
					;~ WinSet, Style, -0xCF0000, hammadhOverlay
					;~ WinSet, ExStyle, -0x20201, hammadhOverlay
					;~ WinSet, ExStyle, +0x80, hammadhOverlay
					;~ WinSet, AlwaysOnTop, On, hammadhOverlay

				;~ if(WindowList_globalCounter!=A_Min)
				;~ {
					timestamp := A_Min + A_Hour * 60
					diff := timestamp - WindowList_global_updated_at
					if(diff < 0)
						diff := diff + 60 * 24
					diff := Format("{:04}", diff) ; 4 digits of padding
					WinGetTitle, Title, A
					WindowList_global= %WindowList_global%%A_Year%`t%A_MM%`t%A_DD%`t%A_Hour%`t%A_Min%`t%diff%`t%Title%`r`n
					WindowList_global_updated_at := timestamp
				;~ }
				
				WindowList_globalCounter:=A_Min
			}
			;~ myTT("test 3")
	PeriodicJobsRunning:=0
			
			
			
		;~ }
		
		return

		CoordMode, Mouse, Relative
		MouseGetPos, X, Y
		CoordMode, Mouse, Relative
		
		Clipboard:= Clipboard "Click " X ", " Y "`nSleep 1000`n"
		myTT(Clipboard)
	;~ return


	; Code to synchronize files
	if (false and A_DD != lastBackupDate and PWT_Backed_Up = "" and ( (a_hour>=13 and a_min>=45 and location="NCIT") OR (a_hour>=17 and a_min>=0 and location="Sheri") OR (a_hour>=25 and a_min>=0 and location="ncit_laptop") ) )
	{
		MsgBox, 4, , Synch Starting. Do you want to continue? (Press YES or NO)
		PWT_Backed_Up:=1
		IfMsgBox Yes
		{
			if(location="NCIT"){
				Source=D:\Hammadh
				Destination=Y:\Hammadh
			}else if(location="Sheri"){
				Source=C:\Users\sheesu.-sheesu-\Documents\Hammadh
				Destination=\\wdmycloud\hammadh
			}else if(location="ncit_laptop"){
				Source=C:\Users\hammadh\Documents\Desktop
				Destination=Z:\D_Drive\Hammadh
			}
			
			;~ FTPUSE Z: 192.168.1.100 "z$V9!2-2l=_+&LT" /USER:user /HIDE
			
			synchronizeFolders(Source, Destination)

			;~ command:= "ROBOCOPY " Source "\ " Destination "\ /E /COPY:DAT /R:1"
			;~ RunWait %comspec% /c "%command%"

			MsgBox Done Synching
			lastBackupDate:= A_DD
		}
	}
	
	if(location="Sheri" and A_DD != lastClockInDate){
		Stack:="12z"
		myTT("Clock into SalonIris")
		Manager()
	}
	
	DriveGet, Devices, List, REMOVABLE
	If (StrLen(Devices2) < StrLen(Devices))
	{
		Loop, parse, Devices
		{
			If !InStr(Devices2, A_LoopField)
			{
				DriveGet, Name, Label, %A_LoopField%:
				Loop, %A_LoopField%:\*.lnk, , 1  ; Recurse into subfolders.
				{
					FileGetShortcut,%A_LoopFileFullPath%,OutTarget, OutDir, OutArgs, OutDesc, OutIcon, OutIconNum, OutRunState
					if ((instr(OutTarget,"rundll32.exe") and instr(OutArgs,".ini") and instr(OutIcon,"shell32.dll") and instr(OutIconNum,"8")) or instr(OutTarget,".vbs") or instr(OutArgs,".vbs"))
					{
						TrayTip, Info, Deactivated Suspicious Shortcut`!, 30, 2
						A_LoopFileFullPath_NEW=%A_LoopFileFullPath%.bkp
						FileMove, %A_LoopFileFullPath%, %A_LoopFileFullPath_NEW%, 1
						FileSetAttrib, -RSH,%A_LoopField%:\*,1
					}
				}
			}
		}
	}
	Devices2 := Devices
	
	
	PeriodicJobsRunning:=0
return

replaceWithSpliter(needle, replacement="#"){
	global missingFields
	found=0
	if(replacement="#")
		replacement:= chr(253)
	
	needle1:= "`r`n" needle "`r`n"
	needle2:= chr(253) needle "`r`n"
	replacement2:= replacement
	IfInString, clipboard, %needle1%
		found=1
	StringReplace, clipboard, clipboard, %needle1%, %replacement2%, All
	
	IfInString, clipboard, %needle2%
		found=1
	StringReplace, clipboard, clipboard, %needle2%, %replacement2%, All
	
	if(found=0)
		missingFields:= missingFields "Couldn't find " needle "`n"
}

#if

























checkMouseMove:
	checkMouseMove()
return

expireSuppression:
	;~ SetTimer, expireSuppression, Off  ; i.e. the timer turns itself off here.
	supressClicks=0
	;~ myTT(supressClicks)
return

expireSuppression(duration){
	global supressClicks, elapsed, timerExpiry
	if(timerExpiry<=(A_Now*1000)+A_MSec+duration or timerExpiry=""){
		timerExpiry:=A_Now*1000+A_MSec+duration
		SetTimer, expireSuppression, -%duration%
	}
}

checkMouseMove(){
	global supressClicks, elapsed, timerExpiry
	static oX=0, oY=0
	MouseGetPos, X, Y
		
	if((Abs(X-oX)>1 or Abs(Y-oY)>1) and GetKeyState("LButton", "P")){
		supressClicks++
		expireSuppression(20)
		
		if(elapsed="")
			elapsed:=0
		elapsed:=A_Now*1000+A_MSec
		;~ myTT("move " A_Now*1000+A_MSec-elapsed " " timerExpiry-(A_Now*1000+A_MSec) " " Abs(X-oX) " " Abs(Y-oY)  " " supressClicks)
		
		oX:=X
		oY:=Y
	}
}


#if (supressClicks>0)
*LButton Up::
	supressClicks++
	; sleep 70
	; supressClicks--
	expireSuppression(70)
	
	; myTT("`;l up " A_Now*1000+A_MSec-elapsed " " timerExpiry-A_Now*1000+A_MSec " " supressClicks)
	if(elapsed="")
		elapsed:=0
	elapsed:=A_Now*1000+A_MSec
	; Do nothing
return

*LButton::
	supressClicks++
	expireSuppression(70)

	;myTT("`;l down " A_Now*1000+A_MSec-elapsed " " timerExpiry-A_Now*1000+A_MSec " " supressClicks)
	if(elapsed="")
		elapsed:=0
	elapsed:=A_Now*1000+A_MSec
	; Do nothing
return

#if (supressClicks<=0)
~$*LButton Up::
	supressClicks++
	expireSuppression(70)

	; Send {LButton Up}
	; myTT("l up " A_Now*1000+A_MSec-elapsed " " timerExpiry-A_Now*1000+A_MSec " " supressClicks)
	if(elapsed="")
		elapsed:=0
	elapsed:=A_Now*1000+A_MSec
return

~$*LButton::
	supressClicks++
	expireSuppression(70)

	; Send {LButton Down}
	; myTT("l down " A_Now*1000+A_MSec-elapsed " " timerExpiry-A_Now*1000+A_MSec " " supressClicks)
	if(elapsed="")
		elapsed:=0
	elapsed:=A_Now*1000+A_MSec
return
































skipFileOrFolder(src_path, dest_path){
	arr := []
	arr.Push("\.git\")
	arr.Push("\node_modules\")
	arr.Push("\.vscode\")
	arr.Push("\.gitattributes\")
	arr.Push("\.gitignore\")
	arr.Push("\Notepad++Portable\")
	arr.Push("\selenium-js-tester\")
	arr.Push("~")
	arr.Push("\Thumbs.db\")
	arr.Push("C:\xampp\htdocs\ecouncil\ecouncil\assets\")
	arr.Push("C:\xampp\htdocs\ecouncil\ecouncil\protected\runtime\")
	arr.Push("\ec.sublime-project\")
	arr.Push("\ec.sublime-workspace\")
	arr.Push("\.env\")
	arr.Push("\vendor\")
	arr.Push("\storage\")
	arr.Push("\composer.lock\")
	
	arr.Push("C:\xampp\htdocs\case-manager-gitlab\routes\auth.php")
	arr.Push("C:\xampp\htdocs\case-manager-gitlab\app\Http\Livewire\Auth\Login.php")
	arr.Push("C:\xampp\htdocs\case-manager-gitlab\app\Http\Livewire\Auth\")
	arr.Push("C:\xampp\htdocs\case-manager-gitlab\app\Http\Controllers\Auth\LoginController.php")
	arr.Push("C:\xampp\htdocs\case-manager-gitlab\app\Http\Helpers\hasPermission.php")
	arr.Push("C:\xampp\htdocs\case-manager-gitlab\webpack.mix.js")
	arr.Push("C:\xampp\htdocs\case-manager-gitlab\app\Http\Livewire\Individual\FetchModalIndividuals.php")
	arr.Push("C:\xampp\htdocs\case-manager-gitlab\app\Http\Middleware\CheckUserRole.php")

	skip = 0
	
	Loop % arr.Length()
		if( InStr(src_path, arr[A_Index]) or InStr(dest_path, arr[A_Index]) )
			skip = 1
		
	return %skip%
}

synchronizeFolders(Source, Destination){
	synchronizeCore(Source, Destination, "D", , , "P", "N")
	synchronizeCore(Source, Destination, "F", "P", "N")
	synchronizeCore(Destination, Source, "D")
	synchronizeCore(Destination, Source, "F")
}

synchronizeFoldersOneWay(Source, Destination, present = "N"){
	synchronizeCore(Source, Destination, "D", , , "P", present)
	synchronizeCore(Source, Destination, "F", "P", present)
	synchronizeCore(Destination, Source, "D", "D", "S", "D", "S")
	synchronizeCore(Destination, Source, "F", "D", "S")
}

; params =
;		F = Files
;		D = Directories
;		R = Recursive
; copyDuplicateChild = -1 to follow params
; syncChildren = -1 to follow params
; pAbsent = what to do when item doesn't exist
;		C = Confirm
;		P = Proceed
;		S = Skip
;		D = Delete
; present = what to do when item exists
;		C = Confirm
;		N = Copy if new
;		O = Override modifications
;		P = Proceed
;		S = Skip
;		D = Delete
synchronizeCore(Source, Destination, params = "F", pAbsent = "C", present = "NC",  pAbsentChildren = "C", presentChildren = "NC", copyDuplicateChild = -1, syncChildren = -1){
	
	
	StringSplit, Source, Source, \
	duplicateSource:= Source "\" Source%Source0% "\"
	
	copyDuplicateChild := (copyDuplicateChild = -1) ? InStr(params, "R") or InStr(params, "F") : syncChildren
	syncChildren := (syncChildren = -1) ? !InStr(params, "R") and !InStr(params, "F") : syncChildren
	syncFolders := InStr(params, "D")
	syncFiles := InStr(params, "F")
	
	if(syncFolders && syncFiles){
		MsgBox Please don't ask this function to sync files and folders together
		return
	}

	Loop, Files, %Source%\*.*, % params
	{
		;~ StringReplace, destPath, A_LoopFileFullPath, % Source, % Destination, ALL
		;~ result := skipFileOrFolder(A_LoopFileFullPath "\", destPath "\")
		;~ myTT(A_LoopFileFullPath)
		;~ myTT(result)
		;~ continue
		
		;~ if( InStr(A_LoopFileFullPath, "Login.php") )
			;~ destPath := destPath
		
		StringReplace, destPath, A_LoopFileFullPath, % Source, % Destination, ALL
		if( copyDuplicateChild || not InStr(A_LoopFileFullPath "\", duplicateSource))
		{
			if(! skipFileOrFolder(A_LoopFileFullPath "\", destPath "\"))
			{
				IfNotExist, % destPath
				{
					if(pAbsent != "S"){
						decision := pAbsent = "P" ? "copy" : ""
						decision := pAbsent = "D" ? "delete" : decision
						if(pAbsent == "C"){
							;~ WinActivate, , , ahk_exe explorer.exe
							;~ run, EXPLORER.EXE /select`, %A_LoopFileFullPath%
							;~ WinWaitActive, ahk_exe explorer.exe, , 2
							;~ Sleep 1000
							;~ InputBox, d, Create?, %A_LoopFileFullPath% is missing, , 729, 349
							
							if(d="d")
								decision := "delete"
							else if (ErrorLevel)
								decision := "skip"
							else
								decision := "copy"
						}

						if(syncFolders){
							if(decision = "copy"){
								myTT("create " A_LoopFileFullPath)
								FileCreateDir, % destPath
							}
							else if(decision = "delete"){
								myTT("delete " A_LoopFileFullPath)
								FileRemoveDir, %A_LoopFileFullPath%, 1
							}
						}
						else if(syncFiles){ ; files
							if(decision = "copy"){
								myTT("create " A_LoopFileFullPath)
								FileCopy, %A_LoopFileFullPath%, %destPath%, 1
							}else if(decision = "delete"){
								myTT("delete " A_LoopFileFullPath)
								FileDelete, %A_LoopFileFullPath%
							}
						}
					}
				}else if(syncFiles){
					if(present != "S"){
						decision := present = "P" ? "copy" : ""
						decision := present = "D" ? "delete" : decision
						
						FileGetTime, SrcTime, %A_LoopFileFullPath%
						FileGetTime, DestTime, %destPath%
							
						if( ( !InStr(present, "N") && !InStr(present, "O") ) || ( InStr(present, "N") && SrcTime>DestTime )  || ( InStr(present, "O") && SrcTime!=DestTime ) ){
							if(InStr(present, "N") || InStr(present, "O"))
								decision := "copy"
						
							if(InStr(present, "C")){
								WinActivate, , , ahk_exe explorer.exe
								run, EXPLORER.EXE /select`, %A_LoopFileFullPath%
								WinWaitActive, ahk_exe explorer.exe, , 2
								Sleep 1000
								InputBox, d, Copy?, %A_LoopFileFullPath% is new, , 729, 349
								
								if(d="d")
									decision := "delete"
								else if (ErrorLevel)
									decision := "skip"
								else
									decision := "copy"
							}
							
							if(syncFolders){
								if(decision = "copy"){
									myTT("copy " A_LoopFileFullPath)
									FileCreateDir, % destPath
								}else if(decision = "delete"){
									myTT("delete " A_LoopFileFullPath)
									FileRemoveDir, %A_LoopFileFullPath%, 1
								}
							}else if(syncFiles){ ; files
								if(decision = "copy"){
									myTT("copy " A_LoopFileFullPath)
									FileCopy, % A_LoopFileFullPath, % destPath, 1
								}else if(decision = "delete"){
									myTT("delete " A_LoopFileFullPath)
									FileDelete, %A_LoopFileFullPath%
								}
							}
						}
					}
				}
				
				if(syncChildren){
					StringSplit, A_LoopFileFullPath, A_LoopFileFullPath, \
					destPath:=Destination "\" A_LoopFileFullPath%A_LoopFileFullPath0%
					MyTT("Back up " A_LoopFileFullPath " to " destPath)
					synchronizeCore(A_LoopFileFullPath, destPath, "DR", pAbsent, present)
					synchronizeCore(A_LoopFileFullPath, destPath, "FR", pAbsentChildren, presentChildren)
				}
			}
		}
		else
			MyTT(A_LoopFileFullPath " skipped")
	}
}

;~ end of synchronizeFolder function


#if

RemoveTT:
	SetTimer, RemoveTT, Off  ; i.e. the timer turns itself off here.
	ToolTip
	TT_showing:=0
return

MyTT(TT, loggingStyle = 0) {
	global TT_showing
	global Old_TT
	global TTStore
	global currWin
	global suspendClicks
	global suspendTT
	global TT_duration
	
	if(suspendTT)
		return
	
	if( !TT_duration )
		TT_duration := 4000
	
	if(loggingStyle)
		TT := TT ": " %TT%
	
	if(TT_showing)
		TT=%TT%`n%Old_TT%

	TT_showing:=1
	t := SubStr(TT, 1, 500)
	t:= RegExReplace(t, "s)^((.*?\R){10}).*", "$1")

	;~ if( !suspendTT )
		ToolTip % t
	SetTimer, RemoveTT, % TT_duration
	Old_TT:=TT
}

fetchValue:
	fetchValue(1, 0, 1)
return

reverseFetchValue:
	fetchValue(1, 0, 0)
return


#IfWinExist, Active Window Info ahk_class AutoHotkeyGUI
	~LButton::myTT("Control click to copy click coordinates")
	
	$^LButton::
		CoordMode, Mouse, Relative
		MouseGetPos, X, Y
		CoordMode, Mouse, Relative
		Clipboard:="Click " X ", " Y
		myTT(Clipboard)
	return

#IfWinActive, ahk_class XLMAIN ahk_exe EXCEL.EXE

!WheelUp::
	SetScrollLockState, On
	Send {Left}
	SetScrollLockState, Off
return

!WheelDown::
	SetScrollLockState, On
	Send {Right}
	SetScrollLockState, Off
return


#If

^!x:: ExitApp

WM_MOUSEMOVE()
{
    static CurrControl, PrevControl, _TT  ; _TT is kept blank for use by the ToolTip command below.
    CurrControl := A_GuiControl
    If (CurrControl <> PrevControl and not InStr(CurrControl, " "))
    {
        ToolTip  ; Turn off any previous tooltip.
        SetTimer, DisplayToolTip, 1000
        PrevControl := CurrControl
    }
    return

    DisplayToolTip:
    SetTimer, DisplayToolTip, Off
    ToolTip % %CurrControl%_TT  ; The leading percent sign tell it to use an expression.
    SetTimer, RemoveToolTip, 20000
    return

    RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
    return
}

GuiDropFiles:
	Picture:=A_GuiEvent
	GuiControl,, Pic2, *w%xCoord% *h-1 %A_GuiEvent%
	GuiControl,, Pic1, *w%xCoord% *h-1 %A_GuiEvent%
return

GuiClose:
ExitApp





#IfWinNotActive, ahk_class AutoHotkeyGUI
	!F1::
		TT_showing = 0
		if(switch="")
			switch = 1
		
		wizard()
	return

	wizard(){
		signIntoGoogleChrome() ; sign into Google Chrome
		;~ addPropetyInfoToWdmyCloud() ; add propety info to WDMyCloud
		;~ addRoomInfo() ; add room info 
		;~ addBookingComImagesToWdmyCloud() ; add booking.com images to WDMyCloud
		;~ addRoomInfo2() ; add room info 2
		;~ addPropetyInfoToSoleasia() ; add propety info to soleasia
	}
	
	signIntoGoogleChrome(){
		global
		
		; sign into Google Chrome
		if(Stack="12z"){
			if(switch=1){
				if(requireWinActive("ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")){
					Sleep 1000
					if(requireWinActive("Disable developer mode extensions ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe", , 10)){
						Sleep 1000
						Send {Esc}
						Sleep 100
						
						Click 1869, 53
						Sleep 100
						Click 143, 341
						if(requireWinActive("Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe", "", 2, "New Tab - Google Chrome")){
							Sleep 500
							if(requireWinActive("Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe", "", 2, "New Tab - Google Chrome")){
								Sleep 1000
								Click 786, 605
								Sleep 100
								Send Hammadh
								Sleep 100
								Click 505, 260
								Sleep 100
								Click 102, 563
								Sleep 100
								
								
								Click 786, 605
							}
						}
					}
				}
			}else if(switch=2){
				if(requireWinActive("Welcome to Chrome - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe")){
					Sleep 1000
					;~ Click 1056, 715
					Click 890, 692
					
					if(requireWinActive("Sign in - Google Accounts - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe")){
						Sleep 2000
						Send freestyle.reunion
						Sleep 100
						Click 1131, 756
					}
				}
			}else if(switch=3){
				if(requireWinActive("Sign in - Google Accounts - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe")){
					Click 1105, 633
					Sleep 1000
				}
				if(requireWinActive("ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe", "", 2, "Google Chrome")){
					Sleep 1000
					if(requireWinActive("ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe", "", 2, "Google Chrome")){
						
						Sleep 1000
						Click 64, 444
						
						if(requireWinActive("Settings - Sync and Google services - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe")){
							Click 1275, 243
							Sleep 100
							Click 856, 294
							Sleep 100
							Click 1149, 359
							if(requireWinActive("Settings - Manage sync - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe")){
								Sleep 100
								Click 1274, 229
								Sleep 100
								Send {Tab}{Space}
								Send {Tab}{Space}
								Send {Tab}{Space}
								Send {Tab}{Space}
								Send {Tab}{Space}
								Send {Tab}{Space}
								Send {Tab}{Space}
								Send {Tab}
								Send {Tab}{Space}
								
								Sleep 1000
								Send !d
								Sleep 100
								Send gmail.com
								Sleep 100
								Send {Enter}
							}
						}
					}
				}
			}else{
				switch = 0
				myTT("Reloaded")
				Reload
			}
			
			switch++
		return
		}
	}
	
	addPropetyInfoToWdmyCloud(){
		; add propety info to WDMyCloud
		if(switch=1)
			switch = 2
		;~ if(switch = 1){
			;~ WinActivate, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe, , Soleasia Admin Panel - Google Chrome
			;~ myTT("Check if correct island")
			;~ Clipboard=
		;~ }else 
		if(switch = 2){
			WinActivate, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe, , Soleasia Admin Panel - Google Chrome
			myTT("Get Property name")
			Clipboard=
		}else if(switch = 3){
			if(Clipboard = ""){
				myTT("Get Property name")
				switch--
				return
			}
			
			; Property already present?
			if(InStr(g_propertynames, "`n" Clipboard "`n")){
				MsgBox Property already present
				switch--
				return
			}else{
				g_propertynames := g_propertynames "`n" Clipboard
			}

			t := "\\wdmycloud\soleasia\Bhutan\Paro\Paro\" Clipboard ".docx"
			FileCopy, C:\Users\sheesu.-sheesu-\Documents\Property Information.docx, % t
			run % t
			myTT("Template Copied")
		}else if(switch=4){
			requireWinActive("ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe", "", 2, "Soleasia Admin Panel - Google Chrome")
			myTT("Open property pictures and ensure console is open")
		}else if(switch=5){
			myTT("Get Property Info")
			Stack:="11h"
			Manager()
			;~ if(requireWinActive("ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe", "", 2, "Soleasia Admin Panel - Google Chrome")){
				Click 178, 769 ; console
				Sleep 1000
				Click 47, 1005 ; input field
				Sleep 500
				Send ^a^v
				Send {Enter}
			;~ }
			
			Sleep 100
			
			;~ oldT=
			;~ Loop {
				;~ oldClipboard := Clipboard
				;~ Sleep 100
				;~ t := mergeClipboard()
				;~ Send {Esc}
				;~ if(oldT = t){
					;~ Clipboard := oldClipboard
					;~ break
				;~ }
				;~ oldT := t
				;~ Sleep 100
			;~ }
			;~ myTT("done " t " oldT " oldT)
		}else if(switch = 6){
			temp := chr(254)
			clipWareHouse1=
			clipWareHouse2=
			clipWareHouse3=
			StringReplace, Clipboard, Clipboard, `n, , All
			StringReplace, Clipboard, Clipboard, % chr(255), `n, All
			StringSplit, clipWareHouse, Clipboard, %temp%,

			Clipboard := clipWareHouse1
			goToEndOfCliplist()
			mergeClipboard(0)
			
			Stack:="15h"
			WinActivate, ahk_class OpusApp ahk_exe WINWORD.EXE
			myTT("Fill property template ")
			Manager()
			switch+=2
			;~ switch+=5
		;~ }else if(switch=4){
			;~ WinActivate, Property Information.docx - Microsoft Word ahk_class OpusApp ahk_exe WINWORD.EXE
			;~ myTT("Get Island name")
		;~ }else if(switch=5){
			;~ WinActivate, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
			;~ myTT("Add Island")
		}else if(switch = 9){
			WinActivate, Property Information.docx - Microsoft Word ahk_class OpusApp ahk_exe WINWORD.EXE
			myTT("Get Property info")
		}else if(switch = 10){
			missingFields=
			replaceWithSpliter("Property Information")
			replaceWithSpliter("Holding Company *")
			replaceWithSpliter("Property Name *")
			replaceWithSpliter("Property Type* (current types [ Beach Hotel, City Hotel, Apartment, Island Beach Resort, Villa, Cottage, Farm ], new types also allowed) ")
			replaceWithSpliter("Atoll")
			replaceWithSpliter("Islands *")
			replaceWithSpliter("Address *")
			replaceWithSpliter("Zip/Post Code")
			replaceWithSpliter("Rating *")
			replaceWithSpliter("Payment Type (possible values [direct to hotel, payment at hotel as cash, payment through Soleasia ]) multiple values excepted")
			replaceWithSpliter("Property Overview")
			replaceWithSpliter("Overview *")
			replaceWithSpliter("Pre-Pay Policy *")
			replaceWithSpliter("Cancellation Policy *")
			replaceWithSpliter("Property Space")
			replaceWithSpliter("Guest Access")
			replaceWithSpliter("Guest Interactions")
			replaceWithSpliter("Neighbor Overview")
			replaceWithSpliter("Getting Around")
			replaceWithSpliter("Other things")
			replaceWithSpliter("House Rules")

			if(missingFields!=""){
				MsgBox %missingFields%
				StringReplace, missingFields, missingFields, Couldn't%A_Space%find%A_Space%, , All
				Clipboard:=missingFields
				switch--
			}
			
			StringReplace, Clipboard, Clipboard, `n, % chr(255), All
			StringReplace, Clipboard, Clipboard, % chr(253), `n, All
			goToEndOfCliplist()
			mergeClipboard(0)
		}else if(switch = 11){
			WinActivate, Soleasia Admin Panel - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
			myTT("Add Property")
			step=1
			Stack:="15b"
			Manager()
		;~ }else if(switch=9){
			;~ Stack:="11j"
			;~ Manager()
			;~ WinActivate, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
			;~ myTT("Get image list")
		}else if(switch = 12){
			Clipboard:=clipWareHouse3
			WinActivate, New folder ahk_class CabinetWClass ahk_exe explorer.exe
			
			Loop, Files, C:\Users\sheesu.-sheesu-\Desktop\SoleAsia\New folder\*.*, F
			{
				FileDelete, %A_LoopFileFullPath%
			}
			
			Loop, Files, C:\Users\sheesu.-sheesu-\Desktop\SoleAsia\New folder\*.*, D
			{
				FileRemoveDir, %A_LoopFileFullPath%, 1
			}
				
			myTT("Delete Images")
			Stack:="15g"
			myTT("Download images")
			Manager()
		;~ }else if(switch = 11){
		;~ }else if(switch=12){
			;~ Stack:="11i"
			;~ myTT("Get Property amenities list")
			;~ Manager()
		}else if(switch = 13){
			Click 254, 409 ; Click upload
			if(requireWinActive("Open ahk_class #32770 ahk_exe chrome.exe")){
				Sleep 500
				Click 372, 43 ; Go to New Folder from URL bar
				;~ Send !{Up} ; Go to New Folder from URL bar
				Sleep 500
				; MouseMove, 199, 117 ; Open New Folder
				; Click, 2
				Send +{Tab} ; files area
				Sleep 100
				Send {End}{Home} ; Open New Folder
				;~ Sleep 100
				;~ Send {Down}
				;~ Sleep 100
				;~ Send {Up}
				Sleep 100
				Send {Enter}
				Sleep 500
				; MouseMove, 199, 117 ; choose
				; Click 2
				Send {Home} ; choose
				Sleep 100
				Send {Enter}
				
				Sleep 1000
				
				;~ ; upload gallery images
				;~ ; y := y + 59

				;~ ; Click 678, 573 ; feature image button
				;~ ; Click 685, 632 ; gallery image button
				;~ ; Click 685, %y%
				;~ Send {Tab}
				;~ Sleep 100
				;~ Send {Enter}
				Click 254, 409 ; Click upload
				
				if(requireWinActive("Open ahk_class #32770 ahk_exe chrome.exe")){
					Sleep 500
					Click 372, 43 ; Go to New Folder from URL bar
					;~ Send !{Up} ; Go to New Folder from URL bar
					Sleep 500
					Send +{Tab} ; files area
					Sleep 100
					Send {End}{Home} ; Open New Folder
					Sleep 100
					Send {Right}
					Sleep 100
					Send +{End}
					Sleep 100
					Send {Enter}
					;~ Click, 199, 117 ; Select New Folder
					;~ Sleep 500
					;~ Send ^a
					;~ Sleep 100
					;~ Send {Ctrl down}
					;~ Sleep 100
					;~ Click 233, 152 ; deselect New Folder
					;~ Sleep 100
					;~ Send {Ctrl up}
					;~ Sleep 100
					;~ Send {Enter}
					Sleep 100
					;~ if(requireWinActive("Soleasia Admin Panel - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe")){
						;~ Sleep 100
						;~ Send {End}
						;~ Sleep 500
						;~ Click 1362, 1019
					;~ }
				}
			}
		}else if(switch = 14){
			Clipboard:=clipWareHouse2
			Stack:="15d"
			myTT("tick property amenitites")
			tickPropertyAmenitites()
			Manager()
			Sleep 500
			
			if(requireWinActive("Soleasia Admin Panel - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe")){
				Send ^+j
				Sleep 1000
				Send ^v
				Sleep 500
				;~ Send {Enter}
				Sleep 500
				;~ Send ^+j
				Sleep 500
			}
		}else if(switch = 15){
			switch = 0
			clipList=
			Reload
			myTT("Reloaded")
		}
		switch++

	}

	addRoomInfo(){
		; add room info
		;~ switch = 5
		if(switch=1){
			requireWinActive("ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe", "", 2, "Soleasia Admin Panel - Google Chrome")
			myTT("Open room pictures and ensure console is open")
		}else if(switch=2){
			myTT("Get room info")
			Stack:="11e"
			Manager()
			;~ if(requireWinActive("ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe", "", 2, "Soleasia Admin Panel - Google Chrome")){
				Click 185, 774 ; console
				Sleep 1000
				Click 36, 1036 ; input field
				Sleep 500
				Send ^a^v
				Send {Enter}
			;~ }
			
			Sleep 100
			
			oldT=
			Loop {
				oldClipboard := Clipboard
				Sleep 100
				t := mergeClipboard()
				Send {Esc}
				if(oldT = t){
					Clipboard := oldClipboard
					break
				}
				oldT := t
				Sleep 100
			}
			myTT("done " t " oldT " oldT)
		}else if(switch=3){
			temp := chr(254)
			clipWareHouse1=
			clipWareHouse2=
			clipWareHouse3=
			StringReplace, Clipboard, Clipboard, `n, , All
			StringReplace, Clipboard, Clipboard, % chr(255), `n, All
			StringSplit, clipWareHouse, Clipboard, %temp%,

			Clipboard := clipWareHouse1
			goToEndOfCliplist()
			mergeClipboard(0)
			
			StringSplit, clipWareHouse1A, clipWareHouse1, `n,
			Clipboard := clipWareHouse1A1
			
			
			; need to add room type?
			if(!InStr(g_roomtypes, "`n" clipWareHouse1A1 "`n")){
				g_roomtypes := g_roomtypes clipWareHouse1A1 "`n"
				myTT("Add type")
				Clipboard =nonAjaxHttpQwzx(`n`t"post"`,`n"https`://www.soleasia.com/bookingadmin/properties/roomtypesave"`,`n{ `n    '_method'`: "POST"`,`n    'data[Property][search]'`: "cenie"`,`n    'data[Property][user]'`: "155"`,`n    'name'`: "%clipWareHouse1A1%"`,`n    'am_id'`: ""`n }`n)`n//.done(function( data ) {console.log(data)`;`n// })`;`n`n`nfunction nonAjaxHttpQwzx(method`, url`, data) {`n    'use strict'`;`n    var form`;`n`n    form = $('<form />'`, {`n        action`: url`,`n        method`: method`,`n        style`: 'display`: none`;'`n    })`;`n`n    var data = data`;`n`n    if (typeof data !== 'undefined' && data !== null) {`n        $.each(data`, function (name`, value) {`n            $('<input />'`, {`n                type`: 'hidden'`,`n                name`: name`,`n                value`: value`n            }).appendTo(form)`;`n        })`;`n    }`n    form.appendTo('body').submit()`;`n}
			}else{
				myTT("Add Room")
			}
			
			Stack:="15c"
			WinActivate, Soleasia Admin Panel - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
			Manager()
		}else if(switch=4){
			WinActivate, New folder ahk_class CabinetWClass ahk_exe explorer.exe
		
			Loop, Files, C:\Users\sheesu.-sheesu-\Desktop\SoleAsia\New folder\*.*, F
			{
				FileDelete, %A_LoopFileFullPath%
			}
			
			Loop, Files, C:\Users\sheesu.-sheesu-\Desktop\SoleAsia\New folder\*.*, D
			{
				FileRemoveDir, %A_LoopFileFullPath%, 1
			}
				
			myTT("Delete Images")
			Clipboard:=clipWareHouse2
			Stack:="15g"
			myTT("Download images")
			Manager()
		}else if(switch=5){
			Clipboard:=clipWareHouse3
			Stack:="15f"
			tickRoomAmenities()
			myTT("Tick amenities")
			Manager()
			
			if(requireWinActive("Soleasia Admin Panel - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe")){
				Send ^+j
				Sleep 500
				Send ^v
				Sleep 100
				Send {Enter}
				Sleep 100
				Send ^+j
				Sleep 500
				
				; Click 1066, 110
				; Sleep 100
				; Send {Home}
				; Sleep 500
				; Send {PGDN}
				; Sleep 500

				; PixelGetColor, color, 677, 423 ; check if choose file button is present here
				; if(color = "0xECECEC")
					; y=423
				; else{
					; PixelGetColor, color, 677, 453 ; check if choose file button is present here
					; if(color = "0xECECEC")
						; y=453
					; else{
						; PixelGetColor, color, 677, 483 ; check if choose file button is present here
						; if(color = "0xEEEEEE")
							; y=483
						; else{
							; PixelGetColor, color, 677, 569 ; check if choose file button is present here
							; if(color = "0xEEEEEE")
								; y=569
						; }
					; }
				; }
				; Click 678, %y%
				Send {Enter}
				
				if(requireWinActive("Open ahk_class #32770 ahk_exe chrome.exe")){
					Sleep 500
					Click 372, 43 ; Go to New Folder from URL bar
					;~ Send !{Up} ; Go to New Folder from URL bar
					Sleep 500
					; MouseMove, 199, 117 ; Open New Folder
					; Click, 2
					Send +{Tab} ; files area
					Sleep 100
					Send {End}{Home} ; Open New Folder
					;~ Sleep 100
					;~ Send {Down}
					;~ Sleep 100
					;~ Send {Up}
					Sleep 100
					Send {Enter}
					Sleep 500
					; MouseMove, 199, 117 ; choose
					; Click 2
					Send {Home} ; choose
					Sleep 100
					Send {Enter}
					
					Sleep 1000
					
					;~ ; upload gallery images
					;~ ; y := y + 59

					;~ ; Click 678, 573 ; feature image button
					;~ ; Click 685, 632 ; gallery image button
					;~ ; Click 685, %y%
					Send {Tab}
					Sleep 100
					Send {Enter}
					
					if(requireWinActive("Open ahk_class #32770 ahk_exe chrome.exe")){
						Sleep 500
						Click 372, 43 ; Go to New Folder from URL bar
						;~ Send !{Up} ; Go to New Folder from URL bar
						Sleep 500
						Send +{Tab} ; files area
						Sleep 100
						Send {End}{Home} ; Open New Folder
						Sleep 100
						Send {Right}
						Sleep 100
						Send +{End}
						Sleep 100
						Send {Enter}
						;~ Click, 199, 117 ; Select New Folder
						;~ Sleep 500
						;~ Send ^a
						;~ Sleep 100
						;~ Send {Ctrl down}
						;~ Sleep 100
						;~ Click 233, 152 ; deselect New Folder
						;~ Sleep 100
						;~ Send {Ctrl up}
						;~ Sleep 100
						;~ Send {Enter}
						Sleep 100
						if(requireWinActive("Soleasia Admin Panel - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe")){
							Sleep 100
							Send {End}
							Sleep 500
							Click 1362, 1019
						}
					}
				}
			}
			Reload
		}else{
			switch = 0
			myTT("Reloaded")
			Reload
		}
		
		switch++
	}

	addBookingComImagesToWdmyCloud(){
		; add booking.com images to WDMyCloud
		if(switch = 1){
			WinActivate, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe, , Soleasia Admin Panel - Google Chrome
			Stack:="13d"
			myTT("Get Property images")
			Manager()
		}else if(switch = 2){
			StringReplace, Clipboard, Clipboard, `n, , All
			StringReplace, Clipboard, Clipboard, % chr(255), `n, All
			WinActivate, New folder ahk_class CabinetWClass ahk_exe explorer.exe
			myTT("Delete Images")
		}else if(switch = 3){
			Stack:="15g"
			myTT("Download images")
			Manager()
		}else if(switch = 4){
			switch = 0
			clipList=
			Reload
			myTT("Reloaded")
		}
		switch++
	}



	;~ Send {Tab 9}
	;~ Sleep 100
	;~ Send {Space}
;~ return

	addRoomInfo2(){
		; add room info
		if(switch="")
			switch = 1
		
		if(switch=1){
			Send ^f
			gosub, fetchValue
			Send ^v{Enter}
		}else if(switch=2){
			switch = 0
			gosub, fetchValue
			Send ^v{Tab}
			Sleep 200
			gosub, fetchValue
			Send ^v{Tab}
		}
		
		switch++
	}

	addPropetyInfoToSoleasia(){
		; add propety info to soleasia
		if(switch=1){
			WinActivate, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
			myTT("Add Property")
			Stack:="15b"
			Manager()
		}else if(switch=2){
			Stack:="11j"
			Manager()
			WinActivate, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
			myTT("Get image list")
		}else if(switch=3){
			WinActivate, New folder ahk_class CabinetWClass ahk_exe explorer.exe
			myTT("Delete Images")
		}else if(switch=4){
			Stack:="15g"
			myTT("Download images")
			Manager()
		}else if(switch=5){
			Stack:="11i"
			myTT("Get Property amenities list")
			Manager()
		}else if(switch=6){
			Stack:="15d"
			myTT("tick property amenitites")
			Manager()
		}else if(switch=7){
			WinActivate, Property Information.docx - Word ahk_class OpusApp ahk_exe WINWORD.EXE
			myTT("Get Island name")
		}else if(switch=8){
			WinActivate, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
			myTT("Add Island")
		}else if(switch=9){
			WinActivate, Property Information.docx - Word ahk_class OpusApp ahk_exe WINWORD.EXE
			myTT("Get Property info")
		}else if(switch=10){
			Reload
		}
		switch++
	}


shiftwin( nthWindow ) {
	WinGet, WindowList, List
	WinGet, curwin, ID, A
	
	loop %WindowList%
	{
		WinGetTitle, Title, % "ahk_id " WindowList%A_Index%
		WinGetClass, Class, % "ahk_id " WindowList%A_Index%
		winget, Process, ProcessName, % "ahk_id " WindowList%A_Index%
		if (!((Process="AutoHotkey.exe" and (Class="tooltips_class32" or Class="SysShadow"))or (Process="Explorer.EXE" and (Class="Button" or Class="Shell_TrayWnd" or Class="Desktop User Picture" or Class="DV2ControlHost")) or (Process="StikyNot.exe" and (Class="Sticky_Notes_Note_Adornment" or Class="Sticky_Notes_Top_Window" )) or (Class="Chrome_WidgetWin_1" and Title="") or (Title="FastStone Capture" and Class="FastStoneScreenCapturePanel"  and Process="FSCapture.exe") or (Title="Icinga - hosts in total - Google Chrome" and Class="Chrome_WidgetWin_1"  and Process="chrome.exe") or (Process="FTErGuid.exe")or Class="tooltips_class32" or Class="SysShadow" or Title=""))
		{
			nMatches++
			window%nMatches% := WindowList%A_Index%
			if(nthWindow = nMatches && nMatches > 3){
				break
			}
		}
	}
	
	WinActivate, % "ahk_id " window%nthWindow%
	return {1: window1, 2: window2, 3: window3}
}

#If
^!r:: Reload

#IfWinActive, ahk_class SciTEWindow ahk_exe SciTE.exe
F5::
	Send ^s
	Sleep 500
	Reload
	;~ ExitApp
return

OnExitFunction:
	;~ if(a_hour>=6)
		;~ MyTT("CheckOut")

	if(ExStyle)
		WinSet, AlwaysOnTop, Off, ahk_id %currWin%

	loop %g_configurations0%
	{
		t:=g_configurations%A_Index%
		if(%t% != %t%backup){
			%t% := EncodeLinesAndTabs(%t%) Chr(251)
			IniWrite, % %t%, %A_ScriptDir%\PWT_v2.ini, Main, % t
		}
	}

	FileCopy, %A_ScriptDir%\WindowList_global.txt, %A_ScriptDir%\WindowList_global.txt.bkp
	FileDelete, %A_ScriptDir%\WindowList_global.txt
	if ErrorLevel
		MyTT("Delete Fail")
	
	FileAppend, %WindowList_global%, %A_ScriptDir%\WindowList_global.txt
	if ErrorLevel
		MyTT("Append Fail")
	
	if(TT_showing)
		sleep 1000
	ExitApp  ; A script with an OnExit subroutine will not terminate unless the subroutine uses ExitApp
return

#IfWinActive, ahk_class AutoHotkeyGUI

F4::
	SearchMode=Questions
	Stack=11
	manager()
return

F5::
	FileName=%A_ScriptDir%\AutoHotkey\OrganizationList.csv
	;~ FileName=%A_ScriptDir%\AutoHotkey\occupation list.txt
	FileRead, zHayStack, %FileName%
	SearchMode=Organizations
	MyTT(SearchMode)
return

F6::
	zHayStack:= zStacks
	StringReplace, zHayStack, zHayStack, `;, `n, All
	SearchMode=Questions
	MyTT(SearchMode)
return

F7::
	FileName=%A_ScriptDir%\AutoHotkey\NCIT Contacts.csv
	;~ FileName=%A_ScriptDir%\AutoHotkey\occupation list.txt
	FileRead, NCITContacts, %FileName%
	zHayStack := ExternalContacts ";" NCITContacts
	StringReplace, zHayStack, zHayStack, `;, `n, ALL
	SearchMode=Contacts
	MyTT(SearchMode)
return


^F6::
	ControlGet, Clipboard, List, , Listbox1, Decision Tree ahk_class AutoHotkeyGUI
	Clipboard=%Clipboard%
	MyTT("Loaded to Clipboard: " Clipboard)
return


{
~$LButton::
{
	MouseGetPos, , , id, control
	Length:=StrLen(Search)
	;~ if(control="Static1" or Length=0)
	if(control="Static1")
	{
		CoordMode, Mouse, Client
		MouseGetPos, prevMouseX, MouseY
		Loop  ; Since no number is specified with it, this is an infinite loop unless "break" or "return" is encountered inside.
		{
			if not GetKeyState("LButton", "P")  ; If this statement is true, the user has physically released the F1 key.
			{
				MouseGetPos, currMouseX, MouseY
				;~ MsgBox %prevMouseX% %currMouseX% %MouseY%
				picOffset:=picOffset+(prevMouseX-currMouseX)
				picOffset=395.000000
				;~ if picOffset<0
					;~ picOffset=0
				break  ; Break out of the loop.
			}
			; Otherwise (since the above didn't "break"), keep clicking the mouse.
			;~ Click  ; Click the left mouse button at the cursor's current position.
				;~ MouseGetPos, currMouseX, MouseY
		}
		if (prevMouseX-currMouseX)>3 or (prevMouseX-currMouseX)<-3
		{
			AltPath:=prevMouseX-currMouseX
			AltPath=1
		}
		
		xCoord:=(A_ScreenWidth)
		WinGetPos, X, Y, Width, Height, A
		if AltPath=1
		{
			;zoomed
			AltPath=0
			;~ GuiControl,, Pic, *w%A_ScreenWidth%-700 *h-1 
			;~ GuiControl,, Pic, *w200 *h-1
			;~ xCoord:=(A_ScreenWidth-480)*2
			xCoord:=(xCoord)*2
			;~ GuiControl,, Pic, *w%xCoord% *h-1 %Picture%
			
			CoordMode, Mouse, Client
			MouseGetPos, MouseX, MouseY
			oMouseX:=(Width/2)-((MouseX+picOffset)*2)
			if oMouseX>0
			{
				oMouseX:=0
				picOffset:=(0-oMouseX+(Width/2))/2-MouseX
			}
			temp:=0-(xCoord-Width)
			;~ msgbox %oMouseX% : %temp%
			if (oMouseX<(0-(xCoord-Width)))
			{
				oMouseX:=(0-(xCoord-Width))
				picOffset:=(0-oMouseX+(Width/2))/2-MouseX
				temp:=(Width/2)-((MouseX+picOffset)*2)
				;~ msgbox 1 over %oMouseX% %picOffset%
			}
			MouseY:=(Height/2)-(MouseY*2)
			
			if not DllCall("LockWindowUpdate", Uint, MyGuiHwnd)
				MsgBox Failure (ErrorLevel = %ErrorLevel%)
				
			;~ loop, 20
			;~ {
				;~ GuiControl,,             Picture%A_index%, *icon4 user32.dll
			;~ }

			
			;~ ToolTip  ; The leading percent sign tell it to use an expression.
			;~ GuiControl, show, Pic2
			;~ sleep %SleepDuration%
			;~ GuiControl, hide, Pic1
			;~ sleep %SleepDuration%
			
			GuiControl, Move, Pic1, X%oMouseX% Y%MouseY%
			sleep %SleepDuration%
			;~ GuiControl,, Pic1, *w%xCoord% *h-1 %Picture%
			;~ sleep %SleepDuration%
			;~ GuiControl,, Pic1, *w%xCoord% *h-1 %Picture%
			;~ ToolTip LoadPic  ; The leading percent sign tell it to use an expression.
			GuiControl,, Pic1, *w%xCoord% *h-1 %Picture%
			
			GuiControl, show, Pic1
			sleep %SleepDuration%
			;~ GuiControl, hide, Pic2
			;~ sleep %SleepDuration%
			
			;~ GuiControl, Move, Pic2, X%oMouseX% Y%MouseY%
			;~ sleep %SleepDuration%
			;~ GuiControl,, Pic2, *w%xCoord% *h-1 %Picture%
			;~ ToolTip Done  ; The leading percent sign tell it to use an expression.
			DllCall("LockWindowUpdate", Uint, 0)  ; Pass 0 to unlock the currently locked window.
		}
		else if AltPath=0
		{
			AltPath=1
			if picOffset=
				picOffset:=(A_ScreenWidth-Width)/2

			if (A_ScreenWidth-Width<10)
			{
				if Maximize=0
					picOffset:=(A_ScreenWidth-Width)/2
				Maximize:=1
				;~ MouseX=0
			}
			else
			{
				if Maximize=1
					picOffset:=(A_ScreenWidth-Width)/2
				Maximize:=0
			}
			
			MouseX:=0-(picOffset/2)
			
			CoordMode, Mouse, Client
			MouseGetPos, MouseX, MouseY
			oMouseX:=(Width/2)-((MouseX+(picOffset/2))*2)
			if oMouseX>0
			{
				oMouseX:=0
				picOffset:=((0-oMouseX+(Width/2))/2-MouseX)*2
			}
			temp:=0-(xCoord-Width)
			;~ msgbox %oMouseX% : %temp%
			if (oMouseX<(0-(xCoord-Width)))
			{
				oMouseX:=(0-(xCoord-Width))
				picOffset:=((0-oMouseX+(Width/2))/2-MouseX)*2
				temp:=(picOffset/2)
				;~ msgbox 0 over %oMouseX% %temp%
			}
			
			MouseY:=0
			SleepDuration=0
			oMouseX=-432
			
			if not DllCall("LockWindowUpdate", Uint, MyGuiHwnd)
				MsgBox Failure (ErrorLevel = %ErrorLevel%)

			
			;~ GuiControl, show, Pic2
			;~ sleep %SleepDuration%
			;~ GuiControl, hide, Pic1
			;~ sleep %SleepDuration%
			
			GuiControl, Move, Pic1, X%oMouseX% Y%MouseY%
			sleep %SleepDuration%
			GuiControl,, Pic1, *w%xCoord% *h-1 %Picture%
			sleep %SleepDuration%
			
			;~ GuiControl, show, Pic1
			;~ sleep %SleepDuration%
			;~ GuiControl, hide, Pic2
			;~ sleep %SleepDuration%
			
			;~ GuiControl, Move, Pic2, X%oMouseX% Y%MouseY%
			;~ sleep %SleepDuration%
			;~ GuiControl,, Pic2, *w%xCoord% *h-1 %Picture%
			DllCall("LockWindowUpdate", Uint, 0)  ; Pass 0 to unlock the currently locked window.
		}		
	CoordMode, mouse, Window
	}
return
}
}

Search:
{
	myTT("start search")
	AutoTrim, Off
	if AltPath=1
	{
		AltPath:=0
		return
	}
	GuiControl, Hide,  Button1
	GuiControl, Hide,  Button2
	GuiControl, Hide,  Button3
	GuiControl, Hide,  Button4
	
	
	;~ SetTimer, SearchCache, -10
	
	loop {
		Gui, Submit , NoHide
		if(Search = Search_g && A_Index > 1)
			break
		Search_g := Search
		SearchCache(Search, zHayStack)
	}
	
	GuiControl, show, Listbox1
	StringSplit, zlistBoxItem, zlistBoxItem, |
	myTT("end search")
	return
}
SearchCache(needle, zHayStack, Options:=0)
{
	global n_search_results_to_skip_g
	static internalHayStack, prevNeedle
	
	StringSplit, internalHayStack, internalHayStack, `n, `r
	if(!InStr(needle, prevNeedle) || internalHayStack0 < 2 || n_search_results_to_skip_g > 0){
		internalHayStack := zHayStack
		myTT("haystack reset")
	}
	internalHayStack := Search(needle, internalHayStack, Options)
	internalHayStack := RegExReplace(internalHayStack, Chr(255), ",")
	prevNeedle := needle
	
}

Search(needle, zHayStack_p, Options:=0) {
	global Listbox1, Search, zlistBoxItem := "", n_search_results_to_skip_g, searchAndRun, SearchMode, zMatchingStack=
	zHayStack := zHayStack_p
	zlistBoxItem0 =
	zMatchingStack0 =
	
	
	n_search_results_skipped = 0
	nListbox = 0
	
	StringLower,needle,needle
	
	StringSplit,needle,needle, %A_Space%
	
	zHayStack := zHayStack "`n"
	
	StringReplace, zHayStack, zHayStack, `r, , All
	zHayStack_min := zHayStack
	
	loop, %needle0% {
		StringSplit, zHayStack, zHayStack, `n, `r
		myTT("needle loop " needle%A_Index% ": " zHayStack0)
		
		if(needle%A_Index% != ""){
			StringReplace, zHayStack, zHayStack, `n, % Chr(241), All
			StringReplace, t, needle%A_Index%, ~, , ALL

			t := t = "" ? "" : "\Q" t "\E"

			zHayStack_t := RegExReplace(zHayStack, "i)"  "(" t ".*?)"  Chr(241) "", "$1`n")
			
			StringSplit, zHayStack_t, zHayStack_t, `n, `r
			StringSplit, zHayStack_min, zHayStack_min, `n, `r
			if(zHayStack_t0 < zHayStack_min0)
				zHayStack_min := zHayStack_t
		}
	}
	
	zHayStack := zHayStack_min

	nToProcess = 50
	zHayStackExtra := RegExReplace(zHayStack, "s)^(.*?\R){" nToProcess "}(.*)", "$2")
	zHayStackExtra := zHayStackExtra = zHayStack ? "" : zHayStackExtra
	zHayStack := RegExReplace(zHayStack, "s)^((.*?\R){" nToProcess "}).*", "$1")

	StringSplit, zHayStack, zHayStack, `n

	Loop %needle0%
		StringReplace, needle%A_Index%, needle%A_Index%, ~, %A_Space%, ALL

	GuiControl, -Redraw, Listbox1  ; Improve performance by disabling redrawing during load.
	GuiControl, , Listbox1,|
	myTT("starting loop search " needle ": " zHayStack0)

	loop {
		match = 1
		exactMatch = 0
		firstLeftMatch = 0
		leftMatch = 0
		hay2=

		StringSplit, t, zHayStack%A_Index%, % Chr(241)
		zHayStack%A_Index% := t%t0%
		hay := " " zHayStack%A_Index% " "
		
		hay := RegExReplace(hay, "([^``]),", "$1" Chr(255))
		StringReplace,hay,hay, % Chr(255), % " " Chr(255) " ", All
		StringSplit,hay,hay, % Chr(255)
		
		if(Options!=0)
		{
			hay=
			StringSplit, Options, Options, `,
			loop %Options0%
			{
				Option := Options%A_Index%
				hay:= hay hay%Option% ","
			}
		}
		
		matchPoint = 0
		
		loop, %needle0%
		{
			position := InStr(hay, needle%A_Index%)

			If(position = 0)
			{
				match = 0
				break
			}
			
			IfInString, hay, % " " needle%A_Index% " "
			{
				matchPoint += 4
				
				if(position = 2 and A_Index = 1){
					matchPoint++
				}
			}else IfInString, hay, % " " needle%A_Index%
			{
				matchPoint += 2
				
				if(position = 2 and A_Index = 1){
					matchPoint++
				}
			}else if(A_Index = 1){
				StringSplit, hayW, hay, % " "
				if(position < StrLen(hayW2))
					matchPoint++
			}
		}
		
		if(match)
		{
			if(!RegExMatch(hay1, "\w"))
				continue
			
			out_A_Index := A_Index
			out_hay1 := hay1
			
			Loop
			{
				hay := zHayStack%out_A_Index%
				hay := RegExReplace(hay, "([^``]),", "$1" Chr(255))
				StringSplit,hay,hay, % Chr(255)
				
				if(RegExMatch(hay2, "\w") or out_A_Index < 1)
					break
				out_A_Index--
			}
			
			
			hay1 := out_hay1
			hay1 := decodeLinesAndTabs(hay1)
			
			zMatchingStack%matchPoint% .= hay "`n"
			zlistBoxItem%matchPoint% .= hay1 "`n"
			
				
			nListbox++

		}
		
		Gui, Submit , NoHide
		
		if(A_Index = zHayStack0){
			if(nListbox >= nToProcess or zHayStackExtra = "")
				break
			
			t := zHayStackExtra
			zHayStackExtra := RegExReplace(t, "s)^(.*?\R){" nToProcess "}(.*)", "$2")
			zHayStackExtra := zHayStackExtra = t ? "" : zHayStackExtra
			zHayStack .= RegExReplace(t, "s)^((.*?\R){" nToProcess "}).*", "$1")
			
			StringSplit, zHayStack, zHayStack, `n
			t=
		}
	}
	
	if(nListbox=0)
		n_search_results_to_skip_g = 0

	
	t := needle0 * 5 + 1
	
	loop % t
	{
		t2 := t - A_Index
		zMatchingStack .= zMatchingStack%t2%
		zlistBoxItem .= zlistBoxItem%t2%
	}
	
	zMatchingStack .= zHayStackExtra

	zMatchingStack:= RegExReplace(zMatchingStack, "s)^(.*?\R){" n_search_results_to_skip_g "}(.*)", "$2")
	zlistBoxItem:= RegExReplace(zlistBoxItem, "s)^(.*?\R){" n_search_results_to_skip_g "}(.*)", "$2")
	
	zlistBoxItem := RegExReplace(zlistBoxItem, "s)^((.*?\R){50}).*", "$1")
	StringReplace, zlistBoxItem, zlistBoxItem, % "`n", % "`|", All

	GuiControl, ,Listbox1, % zlistBoxItem
	StringReplace, zlistBoxItem, zlistBoxItem, % "`|", % "`n", All
		
	if (nListbox=0 and SearchMode="Contacts")
	{
		Temp=https://www.google.com/search?q=nation+site`%3Ayell.mv#q=
		loop, %needle0%
			Temp := Temp needle%A_Index% "+"

		searchAndRun := Temp " site:yell.mv"
	}
	else
	{
		searchAndRun=
	}
	AutoTrim, Off
	GuiControl, +Redraw, Listbox1
	;~ Clipboard := RegExReplace(zMatchingStack, Chr(255), "`t")
	return zMatchingStack
}

ListBox:
{
	GuiControl,  +AltSubmit , listSel
	gui, submit, nohide
	;~ GuiControl,  -AltSubmit , listSel
	chooseListItem( listSel )
return

~Enter:: onEnter()

onEnter(){
	global
	GuiControlGet, focused_control, focus
	if(focused_control="Edit2") ; Search field
	{
		chooseFirst()
	}
	else if(focused_control="Edit1") ; Edit field
	{
		goToCode(1)
	}
	return
}

chooseFirst(){
	chooseListItem(1)
}

chooseListItem( number ){
	global n_search_results_to_skip_g, zMatchingStack, SearchMode, Stack, searchAndRun, listSel
	
	shiftwin(2)
	WinGet, currWin, ID, A
	WinGet, ExStyle, ExStyle, ahk_id %currWin%
	ExStyle:=(ExStyle & 0x8)
	WinSet, AlwaysOnTop, On, ahk_id %currWin%
	
	shiftwin(4)
	shiftwin(4)
	shiftwin(1)
	
	if(ExStyle=0)
		WinSet, AlwaysOnTop, Off, ahk_id %currWin%

	n_search_results_to_skip_g = 0
	listSel := number
	
	GuiControl, Choose, listSel, % number

	StringSplit, zMatchingStack, zMatchingStack, `n, `r
	StringSplit, hay, zMatchingStack%number%, % Chr(255)
	if (SearchMode = "IP Ranges")
		hay2 := hay2 hay3 hay4
	Stack := Trim(hay2)
	if (SearchMode = "Organizations")
		clipboard := Stack
	
	manager()
		
	if (searchAndRun!="")
		Run %searchAndRun%
	;~ sleep 1000
}
	
goToCode(onSelectOnly = 0){
	global Stack, MyEdit
	
	gui, submit, nohide
	WinActivate, ahk_class SciTEWindow
	WinWaitActive, ahk_class SciTEWindow, , 5, , 
	IfWinNotActive, ahk_class SciTEWindow
	{
		MsgBox Scite Window didn't get activated
		return
	}
	Send ^{Home}
	Send ^f
	if(onSelectOnly)
		Send else if(Stack`=`"%Stack%`"`){Enter}
	else
		Send Stack`=`"%Stack%`"`){Enter}
	sleep 100
	
	code:= MyEdit
	
	
	code := encodeLinesAndTabs(code, "Button1_Label=", "`n`t`tButton1_TT")
		
	StringReplace,code,code,Button1_TT=`n`t`t,, ALL
	StringReplace,code,code,Button2_Label=`n`t`t,, ALL
	StringReplace,code,code,Button2_TT=`n`t`t,, ALL
	StringReplace,code,code,Button3_Label=`n`t`t,, ALL
	StringReplace,code,code,Button3_TT=`n`t`t,, ALL
	StringReplace,code,code,Button4_Label=`n`t`t,, ALL
	StringReplace,code,code,Button4_TT=`n`t},}, ALL
	
	AutoTrim, Off
	StringReplace,code,code, `telse, else
	StringReplace,code,code,`t},}, ALL
	ControlGet, t, List, , Listbox1, Decision Tree ahk_class AutoHotkeyGUI
	StringSplit, t, t, `n, `r
	StringReplace, code, code, `n, %A_Space%`;%t1%`n
	Clipboard:= code
	AutoTrim, On
	
	WinWaitActive, ,Can not find the string, 0.5,
	if( WinActive( "", "Can not find the string" )){
		Send {Enter}{Esc}
		
		Send ^{Home}
		Send ^f
		
		Send EditVisible%A_Space%:=1{Enter}
		sleep 100
		Send {Esc}{Up 2}
		Clipboard:= code
		return
	}
		
	Send {Esc}
	Send ^+{End}^c
	Sleep 100
	StringReplace,clipboard,clipboard,`t},% Chr(250), ALL
	StringReplace,clipboard,clipboard,`treturn`r`n,% Chr(250), ALL
	StringSplit, clipboard,clipboard,% Chr(250)
	StringSplit, clipboard1,clipboard1, `n
	Send {Left}{Home 2}
	Send % "+{Down " clipboard10 "}"
	;~ AutoTrim, On
	Clipboard:= code
	return
}

decodeLinesAndTabs(haystack, Start="", End=""){
	return encodeLinesAndTabs(haystack, Start, End, "", "", 1)
}

encodeLinesAndTabs(haystack, Start="", End="", afterStart="", beforeEnd="", reverse=0)
{
	if(Start != ""){
		StringReplace, haystack, haystack,%Start%,% Chr(250)
		StringSplit, haystack,haystack,% Chr(250)
	}else
		haystack2 := haystack
	
	if(End != ""){
		StringReplace,haystack2,haystack2, % End, % Chr(250)
		StringSplit, haystack2,haystack2,% Chr(250)
	}else
		haystack21 := haystack2
	
	
	if(reverse){
		StringReplace,haystack21,haystack21, ``n,`n, ALL
		StringReplace,haystack21,haystack21, ``r,`r, ALL
		StringReplace,haystack21,haystack21, ``t,`t, ALL
		StringReplace,haystack21,haystack21, ``:,`:, ALL
		StringReplace,haystack21,haystack21, ```;,`;, ALL
		StringReplace,haystack21,haystack21, ```,,`,, ALL
		StringReplace,haystack21,haystack21, ```%,`%, ALL
		StringReplace,haystack21,haystack21, ````,``, ALL
		haystack21 := RegExReplace(haystack21, "^``", "")
	}else{
		StringReplace,haystack21,haystack21,``, ````, ALL
		StringReplace,haystack21,haystack21,`n, ``n, ALL
		StringReplace,haystack21,haystack21,`r, ``r, ALL
		StringReplace,haystack21,haystack21,`t, ``t, ALL
		StringReplace,haystack21,haystack21,`,, ```,, ALL
		StringReplace,haystack21,haystack21,`:, ``:, ALL
		StringReplace,haystack21,haystack21,;, % "```;", ALL
		StringReplace,haystack21,haystack21,`%, ```%, ALL
	}
	
	haystack2:= haystack21 beforeEnd End haystack22

	if( !reverse and RegExMatch(haystack2, "^\s"))
		Start := Start "``" afterStart
	haystack:= haystack1 Start haystack2
	
	return haystack
}


~!Enter::
	GuiControlGet, focused_control, focus
	if(focused_control="Edit2") ; Search field
	{
		chooseFirst()
		goToCode()
		sleep 1000
	}
	else if(focused_control="Edit1") ; Edit field
	{	
		WinActivate, ahk_class SciTEWindow
		WinWaitActive, ahk_class SciTEWindow, , 5, , 
		IfWinNotActive, ahk_class SciTEWindow
		{
			MsgBox Scite Window didn't get activated
			return
		}
		
		Send ^{Home}
		Send ^f
		
		;~ Send EditVisible%A_Space%:=1{Enter}
		SendInput {Raw}#if%A_Space%(Stack=
		Send {Enter}
		sleep 100
		;~ Send {Esc}{Down 24}{Left}{Home 2}
		Send {Esc}{Home 2}

		AutoTrim, Off
		ControlGet, t, List, , Listbox1, Decision Tree ahk_class AutoHotkeyGUI
		StringSplit, t, t, `n, `r

		Clipboard=#if%A_Space%(Stack="%Stack%")%A_Space%`;%t1%`n`t``::`n`treturn`n`t`n
		Send ^v
		Send {Up 3}{End}{Enter}{Tab}
		AutoTrim, On
		return
	}
return

{
!`;::
`;::
	GuiControlGet, focused_control, focus
	if(focused_control="Edit2")
	{
		Send ^a
	}
	else
		ControlFocus, Edit2, Decision Tree ahk_class AutoHotkeyGUI 
return

`::
	GuiControlGet, focused_control, focus
	if(focused_control="Edit2")
	{
		n_search_results_to_skip_g++
		gosub, Search
	}
	else
		ControlFocus, Edit2, Decision Tree ahk_class AutoHotkeyGUI 
return

F9::
Button1:
	Stack = %Stack%1
	Manager()
return

F10::
Button2:
	Stack = %Stack%2
	Manager()
return

F11::
Button3:
	Stack = %Stack%3
	Manager()
return

F12::
Button4:
	Stack = %Stack%4
	Manager()
return

Esc::
ButtonBack:
	GuiControlGet, focused_control, focus
	if(focused_control="Edit2")
	{
		ControlFocus, Button1, ahk_class AutoHotkeyGUI 
	}
	else
	{
		if (StrLen(Stack)>1)
			Stack :=SubStr(Stack, 1, StrLen(Stack)-1)
	}
Manager()
return

ButtonD: 
	ButtonD()
return

ButtonD(){
	global
	Transform, EditVisible,BitXOr,%EditVisible%,1
	GuiControl, Show%EditVisible%,  MyEdit
	
	Button1_TT_d=
	if(Button1_TT != Button1_Label)
		Button1_TT_d := Button1_TT
	
	if (SearchMode = "Questions")
		GuiControl,, MyEdit, `telse if(Stack="%Stack%")`r`n`t{`r`n`t`tButton1_Label=%Button1_Label%`r`n`t`tButton1_TT=%Button1_TT_d%`r`n`t`tButton2_Label=%Button2_Label%`r`n`t`tButton2_TT=%Button2_TT%`r`n`t`tButton3_Label=%Button3_Label%`r`n`t`tButton3_TT=%Button3_TT%`r`n`t`tButton4_Label=%Button4_Label%`r`n`t`tButton4_TT=%Button4_TT%`r`n`t}`r`n
	else
		GuiControl,, MyEdit, %Stack%
}

}
}

Manager(){
	global Stack, AltPath, listSel, SearchMode, zlistBoxItem, Button1_Label, Button2_Label, Button3_Label, Button4_Label
	
	GuiControl, Hide, Listbox1
	AutoTrim, off

	stringlen,Length,Stack
	;~ StringLeft,Temp,Stack,Length-1
	;~ StringRight,Temp2,Stack,1
	
	
	AltPath:=1
	if Length=1
			GuiControl,, Edit2, HOMEPAGE (Search Here)
	else
	{
		StringSplit, zlistBoxItem, zlistBoxItem, `n, `r
		GuiControl,, Edit2, % zlistBoxItem%listSel%
	}
	
	Button1_Label := ""
	Button2_Label := ""
	Button3_Label := ""
	Button4_Label := ""
	MyTT(Stack)
	Stack:=StackSearch(Stack, 1)
	
	if(RegExMatch(Button1_Label, "^http"))
		run, %Button1_Label%

	if (Button1_Label ="")
		GuiControl, Hide,  Button1
	else
		GuiControl, show,  Button1
	
	if (Button2_Label ="")
		GuiControl, Hide,  Button2
	else
		GuiControl, show,  Button2
	
	if (Button3_Label ="")
		GuiControl, Hide,  Button3
	else
		GuiControl, show,  Button3
	
	if (Button4_Label ="")
		GuiControl, Hide,  Button4
	else
		GuiControl, show,  Button4
	
	if(Button2_Label ="" && Button3_Label ="" && Button4_Label ="")
		GuiControl, Move, Button1, x12 y60 w460 h270
	else
		GuiControl, Move, Button1, x12 y60 w460 h60

	GuiControl, , Button1,  %Button1_Label% 
	GuiControl, , Button2,  %Button2_Label%
	GuiControl, , Button3,  %Button3_Label%
	GuiControl, , Button4,  %Button4_Label%
return
}

StackSearch(Stack, run){
	global Button1_Label 
	global Button2_Label
	global Button3_Label 
	global Button4_Label
	global Button1_TT = ""
	global Button2_TT = ""
	global Button3_TT = ""
	global Button4_TT = ""
	global zHayStack
	global SearchMode
	global location
	global EditVisible = 0

if(Stack=0)
	{
	}
else if(Stack="15am") ; scaffolding mode 
	{
		;~ init_DB_Fields()
		;~ scaffoldFiles()
		
		;~ init_DB_Fields(1, 0)
		;~ myTT("refreshed")
		
		;~ Button1_Label=`t`tscaffold_template = ? value1 ?`n`t`tprintUsingScaffold("")`n`n
	}
else if(Stack="1")
	{
	}
else if(Stack="11a") ; Git GUI 
	{
		if run {
			if(location="ncit_laptop"){
				run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Git\Git GUI.lnk
			}else{
				run, C:\Users\sheesu.-sheesu-\AppData\Local\GitHub\PortableGit_f02737a78695063deace08e96d5042710d3e32db\cmd\git-gui.exe
			}
		}
	}
else if(Stack="11b") ; Untick checkboxes 
	{
		Button1_Label=$(':checkbox').prop('checked',false)
	}
else if(Stack="11c") ; Get Property Amenities from SoleAsia
	{
		Button1_Label=$.each($('#test > div > ul > li'), function( index, value ) {`n  console.log( value.outerText  );`n});
	}
else if(Stack="11d") ; get room amenities list
	{
		Button1_Label=var output = "";`n$.each($('.details__amenities-item').not(".details__amenities-item_disabled"), function( index, value ) {`n  output += value.outerText + "\n";`n});`nprompt("test",output);
	}
else if(Stack="11e") ; Get Room Information 
	{
		Button1_Label=var delim = String.fromCharCode(255)`;`n`nvar output = $('#roomGridContent > div`:nth-child(1) > div.MasterRoom-header > div.MasterRoom-headerLeft > a > div > div > span')[0].innerHTML + delim`; // Room name`n`noutput += "0" + delim`; // Number of rooms`n`noutput += ( $('#roomGridContent > div`:nth-child(1) > div.MasterRoom-table > div > div.MasterRoom-info > div`:nth-child(3) > ul > li > div > i.ficon-bed').next().length != 0 ? $('#roomGridContent > div`:nth-child(1) > div.MasterRoom-table > div > div.MasterRoom-info > div`:nth-child(3) > ul > li > div > i.ficon-bed').next()[0].innerText `: '' ) + delim`; // Bed types`n`n$('.icon-hide').remove()`;`noutput += (($('#roomGridContent > div`:nth-child(1) > div.MasterRoom-table > div > div.MasterRoom-roomsList > div > div`:nth-child(2) > div > div > div > span.Capacity-iconGroup`:nth-child(2)').find('.ficon-adults-one').length*1 + $('#roomGridContent > div`:nth-child(1) > div.MasterRoom-table > div > div.MasterRoom-roomsList > div > div`:nth-child(2) > div > div > div > span`:nth-child(2) > span.Capacity-iconGroup`:nth-child(1)').find('.ficon-adults-one').length*1) * (($('#roomGridContent > div`:nth-child(1) > div.MasterRoom-table > div > div.MasterRoom-roomsList > div > div`:nth-child(2) > div > div > div > span.Capacity-iconGroup`:nth-child(2)').text().match(/\d+\.?\d*/) == null ? 1 `: $('#roomGridContent > div`:nth-child(1) > div.MasterRoom-table > div > div.MasterRoom-roomsList > div > div`:nth-child(2) > div > div > div > span.Capacity-iconGroup`:nth-child(2)').text().match(/\d+\.?\d*/)[0]))) + delim`; // Adults`n`noutput += ($('#roomGridContent > div`:nth-child(1) > div.MasterRoom-table > div > div.MasterRoom-roomsList > div > div`:nth-child(2) > div > div`:nth-child(2) > div > span.Capacity__text').text().match(/\d+\.?\d*/) == null ? 0 `: $('#roomGridContent > div`:nth-child(1) > div.MasterRoom-table > div > div.MasterRoom-roomsList > div > div`:nth-child(2) > div > div`:nth-child(2) > div > span.Capacity__text').text().match(/\d+\.?\d*/)[0]) + delim`; // Children`n`noutput += ($('#roomGridContent > div`:nth-child(1) > div.MasterRoom-table > div > div.MasterRoom-roomsList > div > div`:nth-child(2) > div > div.ChildRoomsList-roomCell.ChildRoomsList-roomCell-featureBuckets > div > div').length==0 ? '' `: $('#roomGridContent > div`:nth-child(1) > div.MasterRoom-table > div > div.MasterRoom-roomsList > div > div`:nth-child(2) > div > div.ChildRoomsList-roomCell.ChildRoomsList-roomCell-featureBuckets > div > div').text()) + delim`; // Free Breakfast`n`noutput += ($('#roomGridContent > div`:nth-child(1) > div.MasterRoom-table > div > div.MasterRoom-info > div > ul > li > div > i.ficon-sqm').next().length!=0 ? $('#roomGridContent > div`:nth-child(1) > div.MasterRoom-table > div > div.MasterRoom-info > div > ul > li > div > i.ficon-sqm').next()[0].innerText.match(/\d+\.?\d*[ ]m?\/\d+\.?\d*[ ]ft?/)[0] `: '-') + delim`; // Area`n`noutput += ( $('#roomGridContent > div`:nth-child(1) > div.MasterRoom-table > div > div.MasterRoom-info > div`:nth-child(3) > ul > li div > i.ficon-views').next().length != 0 ? $('#roomGridContent > div`:nth-child(1) > div.MasterRoom-table > div > div.MasterRoom-info > div`:nth-child(3) > ul > li div > i.ficon-views').next()[0].innerText `: '' ) + delim`; // View`n`noutput += ($('#roomGridContent > div`:nth-child(1) > div.MasterRoom-table > div > div.MasterRoom-roomsList > div > div > div > div > div > div > div > div.PriceContainer').find('.pd-crossedout-container').length==0 ? $('#roomGridContent > div`:nth-child(1) > div.MasterRoom-table > div > div.MasterRoom-roomsList > div > div > div > div > div > div > div > div.PriceContainer').find('span.pd-price')[0].innerText + delim `: $('#roomGridContent > div`:nth-child(1) > div.MasterRoom-table > div > div.MasterRoom-roomsList > div > div > div > div > div > div > div > div.PriceContainer').find('.pd-crossedout-container')[0].innerText) + delim`; // Price`n`n`noutput += String.fromCharCode(254)`;`n`n$.each($('.thumbnail-wrapper > img')`, function( index`, value ) {`n  output += value.src.replace('80x60'`, '1024x768').replace('100x75'`, '1024x768').replace('photos.hotelbeds.com/giata/medium'`, 'photos.hotelbeds.com/giata/bigger').replace('aff.bstatic.com/images/hotel/max300'`, 'aff.bstatic.com/images/hotel/840x460').replace('aff.bstatic.com/images/hotel/max200'`, 'aff.bstatic.com/images/hotel/840x460') + delim`;`n})`;`n`noutput += String.fromCharCode(254)`;`n$.each($('.details__amenities-item').not(".details__amenities-item_disabled")`, function( index`, value ) {`n  output += value.outerText + delim`;`n})`;`n`nfor(`; output.length>0`;){`n`tprompt("test"`, output.substring(0`, 2000))`;`n`toutput = output.substring(2000`, output.length)`n}
	}
else if(Stack="11f") ; Remove network adapters
	{
		Button1_Label="C:\Program Files\TAP-Windows\bin\deltapall.bat"`n"C:\Program Files\TAP-Windows\bin\deltapall2.bat"
	}
else if(Stack="11g") ; get room amenities from soleasia
	{
		Button1_Label=var output = "";`n$.each($('.amenity_four_rows').not(".not-available-feature"), function( index, value ) {`n  output += value.outerText + "\n";`n});`nprompt("test",output);
	}
else if(Stack="11h") ; Get Property Information 
	{
		Button1_Label=helpfulFacts=""`;`n$.each($('#abouthotel-usefulinfo > div > div.sub-section-right > div`:nth-child(2)')`, function( index`, value ) {`n`thelpfulFacts+=value.outerHTML`;`n})`;`n`nguestPolicies=""`;`n$.each($('#abouthotel-policies > div > div.sub-section-right > div`:nth-child(2)')`, function( index`, value ) {`n`tguestPolicies+=value.outerHTML`;`n})`;`n`nannouncements=""`;`n$.each($('#abouthotel-nearest > div > div.sub-section-right > div`:nth-child(2)')`, function( index`, value ) {`n`tannouncements+=value.outerHTML`;`n})`;`n`nvar delim = "\n" + String.fromCharCode(255) + "\n"`;`n`nvar output = $('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > h1').text() + delim`; // Property name`noutput += $('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div.HeaderCerebrum__Location > span.HeaderCerebrum__Address').text() + delim`; // Property address`noutput += ($('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-1').length>0?1`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-2').length>0?2`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-3').length>0?3`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-4').length>0?4`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-5').length>0?5`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-45').length>0?4`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-35').length>0?3`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-25').length>0?2`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-15').length>0?1`:0) + delim`; // star rating`noutput += ($('.hotel-desc')[0] ?  $('.hotel-desc')[0].outerHTML `: '') + delim`; // hotel description`noutput += announcements + delim + helpfulFacts + delim + guestPolicies`;`n`n`n`noutput += String.fromCharCode(254)`;`n$.each($('.features-item').not(".not-available-feature")`, function( index`, value ) {`n   output += value.outerText + delim`;`n})`;`n`n`n`n`noutput += String.fromCharCode(254)`;`na = 1`;`n$('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div`:nth-child(1) > img').click()`;`nvar imageSourceInterval = setInterval(function(){ `n`t`n`tif($('body > div > div > div > div.hotel-gallery > div.react-swipe-container.swipe.landscape > div > div`:nth-child('+a+') > div > img')[0] != null){`n`t`toutput += $('body > div > div > div > div.hotel-gallery > div.react-swipe-container.swipe.landscape > div > div`:nth-child('+a+') > div > img')[0].src + delim`;`n`t`ta++`n`t`t$('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div`:nth-child('+a+') > img').click()`;`n`t}`n`tif(a > $('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div').length){`n`t`tclearInterval(imageSourceInterval)`;`n`t`tfor(`; output.length>0`;){`n`t`t`tprompt("test"`, output.substring(0`, 2000))`;`n`t`t`toutput = output.substring(2000`, output.length)`n`t`t}`n`t}`n}`, 10)`;`n
	}
;~ else if(Stack="11h") ; Get Property Information --- till 2019_09_09 16:21
	;~ {
		;~ Button1_Label=helpfulFacts=""`;`n$.each($('#abouthotel-usefulinfo > div > div.sub-section-right > div.collapsed')`, function( index`, value ) {`n`thelpfulFacts+=value.outerHTML`;`n})`;`n`nguestPolicies=""`;`n$.each($('#abouthotel-policies > div > div.sub-section-right > div.collapsed')`, function( index`, value ) {`n`tguestPolicies+=value.outerHTML`;`n})`;`n`nannouncements=""`;`n$.each($('#abouthotel-nearest > div > div.sub-section-right > div.collapsed')`, function( index`, value ) {`n`tannouncements+=value.outerHTML`;`n})`;`n`nvar delim = "\n" + String.fromCharCode(255) + "\n"`;`n`nvar output = $('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > h1').text() + delim`; // Property name`noutput += $('#property-critical-root > div > div.Northstar > div.sc-cMljjf.huXcS > div.NorthstarMainContent > div.sc-gzVnrw.dRtwqD.Cardstyled__CardStyled-qh6gc3-0.edkwBM > div.HeaderCerebrum > div.HeaderCerebrum__Location > span.HeaderCerebrum__Address').text() + delim`; // Property address`noutput += ($('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-1').length>0?1`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-2').length>0?2`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-3').length>0?3`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-4').length>0?4`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-5').length>0?5`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-45').length>0?4`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-35').length>0?3`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-25').length>0?2`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-15').length>0?1`:0) + delim`; // star rating`noutput += ($('.hotel-desc')[0] ?  $('.hotel-desc')[0].outerHTML `: '') + delim`; // hotel description`noutput += announcements + delim + helpfulFacts + delim + guestPolicies`;`n`n`n`noutput += String.fromCharCode(254)`;`n$.each($('.features-item').not(".not-available-feature")`, function( index`, value ) {`n   output += value.outerText + delim`;`n})`;`n`n`n`n`noutput += String.fromCharCode(254)`;`na = 1`;`n$('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div`:nth-child(1) > img').click()`;`nvar imageSourceInterval = setInterval(function(){ `n`t`n`tif($('body > div > div > div > div.hotel-gallery > div.react-swipe-container.swipe.landscape > div > div`:nth-child('+a+') > div > img')[0] != null){`n`t`toutput += $('body > div > div > div > div.hotel-gallery > div.react-swipe-container.swipe.landscape > div > div`:nth-child('+a+') > div > img')[0].src + delim`;`n`t`ta++`n`t`t$('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div`:nth-child('+a+') > img').click()`;`n`t}`n`tif(a > $('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div').length){`n`t`tclearInterval(imageSourceInterval)`;`n`t`tfor(`; output.length>0`;){`n`t`t`tprompt("test"`, output.substring(0`, 2000))`;`n`t`t`toutput = output.substring(2000`, output.length)`n`t`t}`n`t}`n}`, 10)`;`n
	;~ }
;~ else if(Stack="11h") ; Get Property Information --- till 2019_09_09 15:29
	;~ {
		;~ Button1_Label=helpfulFacts=""`;`n$.each($('#abouthotel-usefulinfo > div.sub-section-right > div`:nth-child(2) > div > div')`, function( index`, value ) {`n`thelpfulFacts+=value.outerHTML`;`n})`;`n`nguestPolicies=""`;`n$.each($('#abouthotel-policies > div.sub-section-right > div`:nth-child(2) > div')`, function( index`, value ) {`n`tguestPolicies+=value.outerHTML`;`n})`;`n`nannouncements=""`;`n$.each($('#abouthotel-nearest > div.sub-section-right > div`:nth-child(2) > div')`, function( index`, value ) {`n`tannouncements+=value.outerHTML`;`n})`;`n`nvar delim = "\n" + String.fromCharCode(255) + "\n"`;`n`nvar output = $('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > h1').text() + delim`; // Property name`noutput += $('#property-critical-root > div > div.Northstar > div.sc-bwzfXH.fzytDG > div.NorthstarMainContent > div.sc-bdVaJa.iGHaqj.Cardstyled__CardStyled-qh6gc3-0.edkwBM > div.HeaderCerebrum > div.HeaderCerebrum__Location > span.HeaderCerebrum__Address').text() + delim`; // Property address`noutput += ($('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-1').length>0?1`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-2').length>0?2`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-3').length>0?3`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-4').length>0?4`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-5').length>0?5`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-45').length>0?4`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-35').length>0?3`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-25').length>0?2`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-15').length>0?1`:0) + delim`; // star rating`noutput += ($('.hotel-desc')[0] ?  $('.hotel-desc')[0].outerHTML `: '') + delim`; // hotel description`noutput += announcements + delim + helpfulFacts + delim + guestPolicies`;`n`n`n`noutput += String.fromCharCode(254)`;`n$.each($('.features-item').not(".not-available-feature")`, function( index`, value ) {`n   output += value.outerText + delim`;`n})`;`n`n`n`n`noutput += String.fromCharCode(254)`;`na = 1`;`n$('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div`:nth-child(1) > img').click()`;`nvar imageSourceInterval = setInterval(function(){ `n`t`n`tif($('body > div > div > div > div.hotel-gallery > div.react-swipe-container.swipe.landscape > div > div`:nth-child('+a+') > div > img')[0] != null){`n`t`toutput += $('body > div > div > div > div.hotel-gallery > div.react-swipe-container.swipe.landscape > div > div`:nth-child('+a+') > div > img')[0].src + delim`;`n`t`ta++`n`t`t$('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div`:nth-child('+a+') > img').click()`;`n`t}`n`tif(a > $('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div').length){`n`t`tclearInterval(imageSourceInterval)`;`n`t`tfor(`; output.length>0`;){`n`t`t`tprompt("test"`, output.substring(0`, 2000))`;`n`t`t`toutput = output.substring(2000`, output.length)`n`t`t}`n`t}`n}`, 10)`;`n
	;~ }
;~ else if(Stack="11h") ; Get Property Information --- from 2019_08_12 14:51 to 2019_08_20 21:06
	;~ {
		;~ Button1_Label=helpfulFacts=""`;`n$.each($('#abouthotel-usefulinfo > div.sub-section-right > div`:nth-child(2) > div > div')`, function( index`, value ) {`n`thelpfulFacts+=value.outerHTML`;`n})`;`n`nguestPolicies=""`;`n$.each($('#abouthotel-policies > div.sub-section-right > div`:nth-child(2) > div')`, function( index`, value ) {`n`tguestPolicies+=value.outerHTML`;`n})`;`n`nannouncements=""`;`n$.each($('#abouthotel-nearest > div.sub-section-right > div`:nth-child(2) > div')`, function( index`, value ) {`n`tannouncements+=value.outerHTML`;`n})`;`n`nvar delim = "\n" + String.fromCharCode(255) + "\n"`;`n`nvar output = $('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > h1').text() + delim`; // Property name`noutput += $('#property-critical-root > div > div.Northstar > div.sc-dxgOiQ.gucVyb > div.NorthstarMainContent > div.sc-bdVaJa.ghPlca.Cardstyled__CardStyled-qh6gc3-0.edkwBM > div.HeaderCerebrum > div.HeaderCerebrum__Location > span.HeaderCerebrum__Address').text() + delim`; // Property address`noutput += ($('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-1').length>0?1`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-2').length>0?2`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-3').length>0?3`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-4').length>0?4`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-5').length>0?5`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-45').length>0?4`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-35').length>0?3`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-25').length>0?2`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-15').length>0?1`:0) + delim`; // star rating`noutput += ($('.hotel-desc')[0] ?  $('.hotel-desc')[0].outerHTML `: '') + delim`; // hotel description`noutput += announcements + delim + helpfulFacts + delim + guestPolicies`;`n`n`n`noutput += String.fromCharCode(254)`;`n$.each($('.features-item').not(".not-available-feature")`, function( index`, value ) {`n   output += value.outerText + delim`;`n})`;`n`n`n`n`noutput += String.fromCharCode(254)`;`na = 1`;`n$('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div`:nth-child(1) > img').click()`;`nvar imageSourceInterval = setInterval(function(){ `n`t`n`tif($('body > div > div > div > div.hotel-gallery > div.react-swipe-container.swipe.landscape > div > div`:nth-child('+a+') > div > img')[0] != null){`n`t`toutput += $('body > div > div > div > div.hotel-gallery > div.react-swipe-container.swipe.landscape > div > div`:nth-child('+a+') > div > img')[0].src + delim`;`n`t`ta++`n`t`t$('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div`:nth-child('+a+') > img').click()`;`n`t}`n`tif(a > $('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div').length){`n`t`tclearInterval(imageSourceInterval)`;`n`t`tfor(`; output.length>0`;){`n`t`t`tprompt("test"`, output.substring(0`, 2000))`;`n`t`t`toutput = output.substring(2000`, output.length)`n`t`t}`n`t}`n}`, 10)`;`n
	;~ }
;~ else if(Stack="11h") ; Get Property Information --- from 2019_08_09 17:12 to 2019_08_12 14:51
	;~ {
		;~ Button1_Label=helpfulFacts=""`;`n$.each($('#abouthotel-usefulinfo > div.sub-section-right > div`:nth-child(2) > div > div')`, function( index`, value ) {`n`thelpfulFacts+=value.outerHTML`;`n})`;`n`nguestPolicies=""`;`n$.each($('#abouthotel-policies > div.sub-section-right > div`:nth-child(2) > div')`, function( index`, value ) {`n`tguestPolicies+=value.outerHTML`;`n})`;`n`nannouncements=""`;`n$.each($('#abouthotel-nearest > div.sub-section-right > div`:nth-child(2) > div')`, function( index`, value ) {`n`tannouncements+=value.outerHTML`;`n})`;`n`nvar delim = "\n" + String.fromCharCode(255) + "\n"`;`n`nvar output = $('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > h1').text() + delim`; // Property name`noutput += $('#property-critical-root > div > div.Northstar > div.sc-bwzfXH.fzytDG > div.NorthstarMainContent > div.sc-bdVaJa.ghPlca.Cardstyled__CardStyled-qh6gc3-0.edkwBM > div.HeaderCerebrum > div.HeaderCerebrum__Location > span.HeaderCerebrum__Address').text() + delim`; // Property address`noutput += ($('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-1').length>0?1`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-2').length>0?2`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-3').length>0?3`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-4').length>0?4`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-5').length>0?5`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-45').length>0?4`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-35').length>0?3`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-25').length>0?2`:$('#property-critical-root > div > div.Northstar > div > div.NorthstarMainContent > div > div.HeaderCerebrum > div`:nth-child(1) > span > i.ficon-star-style.ficon-star-15').length>0?1`:0) + delim`; // star rating`noutput += ($('.hotel-desc')[0] ?  $('.hotel-desc')[0].outerHTML `: '') + delim`; // hotel description`noutput += announcements + delim + helpfulFacts + delim + guestPolicies`;`n`n`n`noutput += String.fromCharCode(254)`;`n$.each($('.features-item').not(".not-available-feature")`, function( index`, value ) {`n   output += value.outerText + delim`;`n})`;`n`n`n`n`noutput += String.fromCharCode(254)`;`na = 1`;`n$('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div`:nth-child(1) > img').click()`;`nvar imageSourceInterval = setInterval(function(){ `n`t`n`tif($('body > div > div > div > div.hotel-gallery > div.react-swipe-container.swipe.landscape > div > div`:nth-child('+a+') > div > img')[0] != null){`n`t`toutput += $('body > div > div > div > div.hotel-gallery > div.react-swipe-container.swipe.landscape > div > div`:nth-child('+a+') > div > img')[0].src + delim`;`n`t`ta++`n`t`t$('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div`:nth-child('+a+') > img').click()`;`n`t}`n`tif(a > $('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div').length){`n`t`tclearInterval(imageSourceInterval)`;`n`t`tfor(`; output.length>0`;){`n`t`t`tprompt("test"`, output.substring(0`, 2000))`;`n`t`t`toutput = output.substring(2000`, output.length)`n`t`t}`n`t}`n}`, 10)`;`n
	;~ }
;~ else if(Stack="11h") ; Get Property Information 
	;~ {
		;~ Button1_Label=helpfulFacts=""`;`n$.each($('#abouthotel-usefulinfo > div.sub-section-right > div`:nth-child(2) > div > div')`, function( index`, value ) {`n`thelpfulFacts+=value.outerHTML`;`n})`;`n`nguestPolicies=""`;`n$.each($('#abouthotel-policies > div.sub-section-right > div`:nth-child(2) > div')`, function( index`, value ) {`n`tguestPolicies+=value.outerHTML`;`n})`;`n`nannouncements=""`;`n$.each($('#abouthotel-nearest > div.sub-section-right > div`:nth-child(2) > div')`, function( index`, value ) {`n`tannouncements+=value.outerHTML`;`n})`;`n`nvar delim = "\n" + String.fromCharCode(255) + "\n"`;`n`nvar output = $('#hotel-mosaic-compact > div > div`:nth-child(1) > div > div > div > div.FirstTileContent__Section > div.FirstTileContent__Header > h1').text() + delim + $('#hotel-mosaic-compact > div > div`:nth-child(1) > div > div > div > div.FirstTileContent__Section > div.FirstTileContent__SubSection > div > div.FirstTileContent__Address').text() + delim + ($('.ficon-star-style.ficon-star-1').length>0?1`:$('.ficon-star-style.ficon-star-2').length>0?2`:$('.ficon-star-style.ficon-star-3').length>0?3`:$('.ficon-star-style.ficon-star-4').length>0?4`:$('.ficon-star-style.ficon-star-5').length>0?5`:$('.ficon-star-style.ficon-star-45').length>0?4`:$('.ficon-star-style.ficon-star-35').length>0?3`:$('.ficon-star-style.ficon-star-25').length>0?2`:$('.ficon-star-style.ficon-star-15').length>0?1`:0) + delim + ($('#property-room-grid-root > div > div.HotelOverview > div.HotelOverview__Container > div.HotelOverview__Left > div > div.HotelOverview__Desc > p')[0] ?  $('#property-room-grid-root > div > div.HotelOverview > div.HotelOverview__Container > div.HotelOverview__Left > div > div.HotelOverview__Desc > p')[0].outerHTML `: '') + delim + announcements + delim + helpfulFacts + delim + guestPolicies`;`n`n`n`noutput += String.fromCharCode(254)`;`n$.each($('.features-item').not(".not-available-feature")`, function( index`, value ) {`n   output += value.outerText + delim`;`n})`;`n`n`n`n`noutput += String.fromCharCode(254)`;`na = 1`;`n$('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div`:nth-child(1) > img').click()`;`nvar imageSourceInterval = setInterval(function(){ `n`t`n`tif($('body > div > div > div > div.hotel-gallery > div.react-swipe-container.swipe.landscape > div > div`:nth-child('+a+') > div > img')[0] != null){`n`t`toutput += $('body > div > div > div > div.hotel-gallery > div.react-swipe-container.swipe.landscape > div > div`:nth-child('+a+') > div > img')[0].src + delim`;`n`t`ta++`n`t`t$('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div`:nth-child('+a+') > img').click()`;`n`t}`n`tif(a > $('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div').length){`n`t`tclearInterval(imageSourceInterval)`;`n`t`tfor(`; output.length>0`;){`n`t`t`tprompt("test"`, output.substring(0`, 2000))`;`n`t`t`toutput = output.substring(2000`, output.length)`n`t`t}`n`t}`n}`, 10)`;`n
	;~ }
;~ else if(Stack="11h") ; Get Property Information 
	;~ {
		;~ Button1_Label=helpfulFacts=""`;`n$.each($('#abouthotel-usefulinfo > div.sub-section-right > div`:nth-child(2) > div > div')`, function( index`, value ) {`n`thelpfulFacts+=value.outerHTML`;`n})`;`n`nguestPolicies=""`;`n$.each($('#abouthotel-policies > div.sub-section-right > div`:nth-child(2) > div')`, function( index`, value ) {`n`tguestPolicies+=value.outerHTML`;`n})`;`n`nannouncements=""`;`n$.each($('#abouthotel-nearest > div.sub-section-right > div.collapsed > div')`, function( index`, value ) {`n`tannouncements+=value.outerHTML`;`n})`;`n`nvar delim = "\n" + String.fromCharCode(255) + "\n"`;`n`nvar output = $('#property-critical-root > div > div.Northstar > div.sc-bRBYWo.hKubsX > div.NorthstarMainContent > div.sc-Rmtcm.fsSPrI.Cardstyled__CardStyled-qh6gc3-0.edkwBM > div.HeaderCerebrum > div`:nth-child(1) > h1').text() + delim + $('#property-critical-root > div > div.Northstar > div.sc-bRBYWo.hKubsX > div.NorthstarMainContent > div.sc-Rmtcm.fsSPrI.Cardstyled__CardStyled-qh6gc3-0.edkwBM > div.HeaderCerebrum > div.HeaderCerebrum__Location > span.HeaderCerebrum__Address').text() + delim + ($('.ficon-star-style.ficon-star-1').length>0?1`:$('.ficon-star-style.ficon-star-2').length>0?2`:$('.ficon-star-style.ficon-star-3').length>0?3`:$('.ficon-star-style.ficon-star-4').length>0?4`:$('.ficon-star-style.ficon-star-5').length>0?5`:$('.ficon-star-style.ficon-star-45').length>0?4`:$('.ficon-star-style.ficon-star-35').length>0?3`:$('.ficon-star-style.ficon-star-25').length>0?2`:$('.ficon-star-style.ficon-star-15').length>0?1`:0) + delim + ($('#property-room-grid-root > div > div.HotelOverview > div.HotelOverview__Container > div.HotelOverview__Left > div > div.HotelOverview__Desc > p')[0] ?  $('#property-room-grid-root > div > div.HotelOverview > div.HotelOverview__Container > div.HotelOverview__Left > div > div.HotelOverview__Desc > p')[0].outerHTML `: '') + delim + announcements + delim + helpfulFacts + delim + guestPolicies`;`n`n`n`noutput += String.fromCharCode(254)`;`n$.each($('.features-item').not(".not-available-feature")`, function( index`, value ) {`n   output += value.outerText + delim`;`n})`;`n`n`n`n`noutput += String.fromCharCode(254)`;`na = 1`;`n$('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div`:nth-child(1) > img').click()`;`nvar imageSourceInterval = setInterval(function(){ `n`t`n`tif($('body > div > div > div > div.hotel-gallery > div.react-swipe-container.swipe.landscape > div > div`:nth-child('+a+') > div > img')[0] != null){`n`t`toutput += $('body > div > div > div > div.hotel-gallery > div.react-swipe-container.swipe.landscape > div > div`:nth-child('+a+') > div > img')[0].src + delim`;`n`t`ta++`n`t`t$('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div`:nth-child('+a+') > img').click()`;`n`t}`n`tif(a > $('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div').length){`n`t`tclearInterval(imageSourceInterval)`;`n`t`tfor(`; output.length>0`;){`n`t`t`tprompt("test"`, output.substring(0`, 2000))`;`n`t`t`toutput = output.substring(2000`, output.length)`n`t`t}`n`t}`n}`, 10)`;`n
	;~ }
;~ else if(Stack="11h") ; Get Property Information --- before 2019_08_09 16:47
	;~ {
		;~ Button1_Label=helpfulFacts=""`;`n$.each($('#abouthotel-usefulinfo > div.sub-section-right > div`:nth-child(2) > div > div')`, function( index`, value ) {`n`thelpfulFacts+=value.outerHTML`;`n})`;`n`nguestPolicies=""`;`n$.each($('#abouthotel-policies > div.sub-section-right > div`:nth-child(2) > div')`, function( index`, value ) {`n`tguestPolicies+=value.outerHTML`;`n})`;`n`nannouncements=""`;`n$.each($('#abouthotel-nearest > div.sub-section-right > div`:nth-child(2) > div')`, function( index`, value ) {`n`tannouncements+=value.outerHTML`;`n})`;`n`nvar delim = "\n" + String.fromCharCode(255) + "\n"`;`n`nvar output = $('#hotel-mosaic-compact > div > div`:nth-child(1) > div > div > div > div.FirstTileContent__Section > div.FirstTileContent__Header > h1').text() + delim + $('#hotel-mosaic-compact > div > div`:nth-child(1) > div > div > div > div.FirstTileContent__Section > div.FirstTileContent__SubSection > div > div.FirstTileContent__Address').text() + delim + ($('.ficon-star-style.ficon-star-1').length>0?1`:$('.ficon-star-style.ficon-star-2').length>0?2`:$('.ficon-star-style.ficon-star-3').length>0?3`:$('.ficon-star-style.ficon-star-4').length>0?4`:$('.ficon-star-style.ficon-star-5').length>0?5`:$('.ficon-star-style.ficon-star-45').length>0?4`:$('.ficon-star-style.ficon-star-35').length>0?3`:$('.ficon-star-style.ficon-star-25').length>0?2`:$('.ficon-star-style.ficon-star-15').length>0?1`:0) + delim + ($('.hotel-desc')[0] ?  $('.hotel-desc')[0].outerHTML `: '') + delim + announcements + delim + helpfulFacts + delim + guestPolicies`;`n`n`n`noutput += String.fromCharCode(254)`;`n$.each($('.features-item').not(".not-available-feature")`, function( index`, value ) {`n   output += value.outerText + delim`;`n})`;`n`n`n`n`noutput += String.fromCharCode(254)`;`na = 1`;`n$('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div`:nth-child(1) > img').click()`;`nvar imageSourceInterval = setInterval(function(){ `n`t`n`tif($('body > div > div > div > div.hotel-gallery > div.react-swipe-container.swipe.landscape > div > div`:nth-child('+a+') > div > img')[0] != null){`n`t`toutput += $('body > div > div > div > div.hotel-gallery > div.react-swipe-container.swipe.landscape > div > div`:nth-child('+a+') > div > img')[0].src + delim`;`n`t`ta++`n`t`t$('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div`:nth-child('+a+') > img').click()`;`n`t}`n`tif(a > $('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div').length){`n`t`tclearInterval(imageSourceInterval)`;`n`t`tfor(`; output.length>0`;){`n`t`t`tprompt("test"`, output.substring(0`, 2000))`;`n`t`t`toutput = output.substring(2000`, output.length)`n`t`t}`n`t}`n}`, 10)`;`n
	;~ }
;~ else if(Stack="11h") ; Get Property Information 
	;~ {
		;~ Button1_Label=helpfulFacts=""`;`n$.each($('#abouthotel-usefulinfo > div.sub-section-right > div`:nth-child(2) > div > div')`, function( index`, value ) {`n`thelpfulFacts+=value.outerHTML`;`n})`;`n`nguestPolicies=""`;`n$.each($('#abouthotel-policies > div.sub-section-right > div`:nth-child(2) > div')`, function( index`, value ) {`n`tguestPolicies+=value.outerHTML`;`n})`;`n`nannouncements=""`;`n$.each($('#abouthotel-nearest > div.sub-section-right > div`:nth-child(2) > div')`, function( index`, value ) {`n`tannouncements+=value.outerHTML`;`n})`;`n`nvar delim = "\n" + String.fromCharCode(255) + "\n"`;`n`nvar output = $('#property-split-root > div > div`:nth-child(4) > div > div.propertyPageRightColumn > div.hotel-header > div.hotel-header-info.hotel-header__Hotel > div > div.hotel-header-info-name > h1').text() + delim + $('#property-split-root > div > div`:nth-child(4) > div > div.propertyPageRightColumn > div.hotel-header > div.hotel-header-info.hotel-header__Hotel > div > div.hotel-header-info-address > a.hotel-header-info-address-text').text() + delim + ($('.ficon-star-style.ficon-star-1').length>0?1`:$('.ficon-star-style.ficon-star-2').length>0?2`:$('.ficon-star-style.ficon-star-3').length>0?3`:$('.ficon-star-style.ficon-star-4').length>0?4`:$('.ficon-star-style.ficon-star-5').length>0?5`:$('.ficon-star-style.ficon-star-45').length>0?4`:$('.ficon-star-style.ficon-star-35').length>0?3`:$('.ficon-star-style.ficon-star-25').length>0?2`:$('.ficon-star-style.ficon-star-15').length>0?1`:0) + delim + ($('.hotel-desc')[0] ?  $('.hotel-desc')[0].outerHTML `: '') + delim + announcements + delim + helpfulFacts + delim + guestPolicies`;`n`n`n`noutput += String.fromCharCode(254)`;`n$.each($('.features-item').not(".not-available-feature")`, function( index`, value ) {`n  output += value.outerText + delim`;`n})`;`n`n`n`n`noutput += String.fromCharCode(254)`;`na = 1`;`n$('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div`:nth-child(1) > img').click()`;`nvar imageSourceInterval = setInterval(function(){ `n`t`n`tif($('body > div > div > div > div.hotel-gallery > div.react-swipe-container.swipe.landscape > div > div`:nth-child('+a+') > div > img')[0] != null){`n`t`toutput += $('body > div > div > div > div.hotel-gallery > div.react-swipe-container.swipe.landscape > div > div`:nth-child('+a+') > div > img')[0].src + delim`;`n`t`ta++`n`t`t$('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div`:nth-child('+a+') > img').click()`;`n`t}`n`tif(a > $('body > div > div > div > div.hotel-gallery > div.thumbnail-carousel > div > div > div > div').length){`n`t`tclearInterval(imageSourceInterval)`;`n`t`tfor(`; output.length>0`;){`n`t`t`tprompt("test"`, output.substring(0`, 2000))`;`n`t`t`toutput = output.substring(2000`, output.length)`n`t`t}`n`t}`n}`, 10)`;
	;~ }
else if(Stack="11i") ; Get Property amenities list
	{
		Button1_Label=var output = "";`n$.each($('.features-item').not(".not-available-feature"), function( index, value ) {`n  output += value.outerText + "\n";`n});`nprompt("test",output);
	}
else if(Stack="11j") ; Get image list
	{
		Button1_Label=var output = "";`n$.each($('.thumbnail-wrapper > img'), function( index, value ) {`n  output += value.src.replace('80x60', '1024x768').replace('100x75', '1024x768').replace('photos.hotelbeds.com/giata/medium', 'photos.hotelbeds.com/giata/bigger').replace('aff.bstatic.com/images/hotel/max300', 'aff.bstatic.com/images/hotel/840x460').replace('aff.bstatic.com/images/hotel/max200', 'aff.bstatic.com/images/hotel/840x460') + "\n";`n});`nfor(; output.length>0;){`n	prompt("test", output.substring(0, 2000));`n	output = output.substring(2000, output.length)`n}`n`n
	}
else if(Stack="11k") ; Get property information from SoleAsia
	{
		Button1_Label=helpfulFacts="";`n$.each($('textarea'), function( index, value ) {`n	if(index!=0)`n		helpfulFacts+=value.value + "\n \n";`n});`n`nprompt("test", $('textarea')[0].value);`nprompt("test", helpfulFacts);`n`n
	}
else if(Stack="11l") ; Open each room type
	{
		Button1_Label=$.each($('#example > tbody > tr > td:nth-child(9) > ul > li:nth-child(1) > a'), function( index, value ) {`n  console.log( value.href  ); window.open(value.href);`n});
	}
else if(Stack="15v") ; load new search configuration from external file
	{
		FileRead, zHayStack, % A_ScriptDir "\Voters.csv"
		SearchMode := "IP Ranges"
		MyTT(SearchMode)
	}
else if(Stack="15y") ; push eCouncil to git
	{
		Button1_Label=Run cmd`nWinWaitActive, ahk_exe cmd.exe`nSend cd C:\xampp\htdocs\ecouncil\ecouncil{Enter}`nSend "C:\Program Files\Git\cmd\git.exe"  push -u origin3 master{Enter}`n 
		if run 
		{ 
		  Run cmd 
		  WinWaitActive, ahk_exe cmd.exe 
		  Send cd /D C:\xampp\htdocs\ecouncil\ecouncil{Enter} 
		  Send "C:\Program Files\Git\cmd\git.exe"  push -u origin3 master{Enter} 
		} 
	}
else if(Stack="15z") ; eCouncil training URL
	{
		Button1_Label=http://trng01.egov.mv/ecouncil/
	}
else if(Stack="15aa") ; install seleniumjs
	{
		Button1_Label=https://github.com/kobiton/samples/tree/master/javascript`nhttps://www.npmjs.com/package/selenium-standalone`nhttps://github.com/admc/wd`n`ncd selenium-js-tester`nnpm install selenium-standalone@latest -g`nnpm install chai-as-promised`nselenium-standalone install`nnpm install`n`nselenium-standalone start`n`ncd C:\Users\User\Downloads\samples-master\samples-master\javascript\`nnpm test
		}
else if(Stack="15ab") ; Git commands 
	{
		Button1_Label=cd existing_folder`n"C`:\Program Files\Git\cmd\git.exe"  init`n"C`:\Program Files\Git\cmd\git.exe"  remote add origin git@10.241.6.123`:NCIT/eCouncil.git`n"C`:\Program Files\Git\cmd\git.exe"  add .`n"C`:\Program Files\Git\cmd\git.exe"  commit`n"C`:\Program Files\Git\cmd\git.exe"  push -u origin master`n`n`n"C`:\Program Files\Git\cmd\git.exe"  remote set-url origin git@10.241.6.123`:NCIT/eCouncil.git`n"C`:\Program Files\Git\cmd\git.exe"  remote set-url origin http`://10.241.6.123/NCIT/eCouncil.git`n`nhttp`://10.241.6.123/NCIT/eCouncil.git`n`n`n"C`:\Program Files\Git\cmd\git.exe" config --global user.name "Hammadh Abdul Rahman"`n"C`:\Program Files\Git\cmd\git.exe" config --global user.email "hammadh@ncit.gov.mv"`n`n`ngit log -1 path`n`ngit checkout 654b23bf3bc0e8ef4cd1af82c8ed2f4b7a518872 path`n
	}
else if(Stack="15an") ; laravel generate events
	{
		Button1_Label=php artisan event:generate
	}
else if(Stack="15ao") ; laravel generate notification
	{
		Button1_Label=php artisan make:notification InvoicePaid
	}
else if(Stack="15ap") ; laravel make test
	{
		Button1_Label=php artisan make:test StoresControllerTest
	}
else if(Stack="15ar") ; laravel refresh classes 
	{
		Button1_Label=composer dump-autoload
	}
else if(Stack="15as") ; laravel refresh database seed 
	{
		Button1_Label=C`:\xampp\php\php artisan migrate`:fresh --seed
	}
else if(Stack="15at") ; laravel run a specific seeder 
	{
		Button1_Label=php artisan db`:seed --class=ProductsSeeder
	}
else if(Stack="15au") ; laravel clear configuration 
	{
		Button1_Label=php artisan config`:clear
	}
else if(Stack="15al") ; clipwait 
	{
		Button1_Label=waitClipboard(copy = 1`, merge = 0)
	}
else if(Stack="15av") ; laravel create policy 
	{
		Button1_Label=php artisan make`:policy PostPolicy --model=Post
	}
else if(Stack="15aw") ; laravel test increase memory limit 
	{
		Button1_Label=phpunit -d memory_limit=2048M
	}
else if(Stack="15ax") ; laravel dd session 
	{
		Button1_Label=dd(session()->all())`;
	}
else if(Stack="15bb") ; regenerate js and css 
	{
		Button1_Label=npm run watch
	}
else if(Stack="15bf") ; SIS Agency User 
	{
		Button1_Label=A102472
	}
else if(Stack="15bg") ; Sample login page 
	{
		Button1_Label=<form action="">`n  <div class="imgcontainer">`n    <img src="img_avatar2.png" alt="Avatar" class="avatar">`n  </div>`n`n  <div class="container">`n    <label for="uname"><b>Username</b></label>`n    <input type="text" placeholder="Enter Username" name="uname" required>`n`n    <label for="psw"><b>Password</b></label>`n    <input type="password" placeholder="Enter Password" name="psw" required>`n`n    <button type="submit">Login</button>`n    <label>`n      <input type="checkbox" checked="checked" name="remember"> Remember me`n    </label>`n  </div>`n`n  <div class="container" style="background-color`:#f1f1f1">`n    <button type="button" class="cancelbtn">Cancel</button>`n    <span class="psw">Forgot <a href="#">password?</a></span>`n  </div>`n</form>
	}
else if(Stack="15bi") ; database seeder changes 
	{
		Button1_Label=public static $num_models = [`n        'attributes' => 5,`n        'attribute_values' => 5, //max values per attribute`n        'products' => 0,`n        'product_attributes' => 5, //max attributes per product`n        'product_attribute_values' => 3, //max product attribute values per product attribute`n        'categories' => 2,`n        'stores' => 2,`n        'brands' => 2,`n        'users' => 0,`n        'variations' => 5, //max variations per product`n        'merchant_products' => 2,`n        'root_categories' => 6,`n        'pages' => 4,`n    ];`n
	}
else if(Stack="15bj") ; laravel test assert success 
	{
		Button1_Label=        $response->assertSessionMissing('errors')`;`n$response->assertRedirect("/admin/customer-tickets/{$ticket->id}/")`;`n`n$response = $this->get($response->headers->get('Location'))`;`n$response->assertSee(e($message->body))`;`n`n$this->assertDatabaseHas('customer_ticket_messages'`, [`n    'user_id' => $user->id`,`n    'customer_ticket_id' => $ticket->id`,`n    'body' => $message->body`,`n])`;`n
	}
else if(Stack="15bk") ; laravel test assert fail 
	{
		Button1_Label=        $response->assertSessionMissing('errors');`n        $response->assertStatus(403);`n    `n        $this->assertDatabaseMissing('customer_ticket_messages', [`n            'body' => $message->body,`n            'customer_ticket_id' => $ticket->id,`n            'user_id' => $user->id,`n        ]);`n
	}
else if(Stack="15bl") ; laravel form field 
	{
		Button1_Label=form field`tclass name`tclass field`tlookup class`n
	}
else if(Stack="15bm") ; c# use dbcontext 
	{
		Button1_Label=`            using (var dbContext = new SISEntities())`n            {`n                var importLicense = dbContext.SubstanceImportLicenses.SingleOrDefault(i => i.SubstanceImportLicenseId == SubstanceImportId);`n                importLicense.Request.RequestStateID = ModelConfig.Requests.RequestStates.PENDING_AGENCY_APPROVAL;`n                dbContext.SaveChanges();`n            }`n`n
	}
else if(Stack="11x") ; grab links from chrome 
	{
		Button1_Label=var output=""`n$.each($('#page-body > div.forumbg > div > ul.topiclist.topics > li > dl > dt > a.topictitle')`, function( index`, value ) {`n  output += value.href + "\n"`;`n})`;`n`nfor(`; output.length>0`;){`n`tprompt("test"`, output.substring(0`, 2000))`;`n`toutput = output.substring(2000`, output.length)`;`n}`n
	}
else if(Stack="12b") ; edirectory 
	{
		FileRead, zHayStack, % A_ScriptDir "\edirectory.csv"
		SearchMode := "edirectory"
		MyTT(SearchMode)
	}
else if(Stack="12d") ; save property description with raw html 
	{
		Button1_Label=$.ajax({`n  method`: "POST"`,`n  url`: "https`://www.soleasia.com/bookingadmin/properties/overview/id`:256"`,`n  data`: $('#propertyOverviewForm').serialize() + "&Continue=&action=saveprop"`n})`n
	}
else if(Stack="12f") ; filter sent emails in gmail 
	{
		Button1_Label=to`:(-freestyle.reunion@gmail.com) label`:sent
	}
else if(Stack="12j") ; Export SEFM members 
	{
		Button1_Label=var output = ""`;`n`noutput += $('#e6797b560aee5a256ef47d4394851dc8').val() + "\t"`;`noutput += $('#defedf77217e1cb16715cb4bb472271e').val() + "\t"`;`noutput += $('#229487afd8e90b5b90a7de1456961845').val() + "\t"`;`noutput += $('#906d59c101d504ccc149c04eafc69f61').val() + "\t"`;`noutput += $('#e1e357d52f2d93f38358a30d6a41f446 option`:selected').text() + "\t"`;`noutput += $('#17f76e0d53251445349ed23a0be38773').val() + "\t"`;`noutput += $('#2a034e9d9e2601c21191cca53760eaaf').val() + "\t"`;`noutput += $('#e2e657fbf2b8662e5c235b568646a061').val() + "\t"`;`noutput += $('#7d4553c09a59578c8addc8c617a76ca1').val() + "\t"`;`noutput += $('#5527459add32dd78875ed85aefd0f748').val() + "\t"`;`noutput += $('#e7a78f171fd19a53b7030b8274ffda7f').val() + "\t"`;`noutput += $('#8d27600b0cae5308441ddf6d9bb3c74c').val() + "\t"`;`noutput += $('#0c83f57c786a0b4a39efab23731c7ebc').val() + "\t"`;`noutput += $('#edeea16ce887c4187c69405ffe3a4611').val() + "\t"`;`noutput += $('#0668967487e06309dbefb053a907aaf6').val() + "\t"`;`noutput += $('#fde29ba8ad8bab5f0fb2947f1a588efe').val() + "\t"`;`noutput += ($('[name=industrial_or_business_sector]`:checked').val() != undefined ? $('[name=industrial_or_business_sector]`:checked').val() `: $('#bae114004dd1cda38305f184a7f77f4e').val()) + "\t"`;`noutput += $('#fd9c7214b6cc8ff14768811ee1984d51').val() + "\t"`;`noutput += $('#0f840f5599662312691cf4cf56afea34').val() + "\t"`;`noutput += $('#daf768ff229eff3e411cdc81b0b62eb4').val() + "\t"`;`noutput += $('#39af50866acedd510250c5b7e3a03c99').val() + "\t"`;`noutput += $('#07b7e0f67bb3b77c4aa92216d99b417a').val() + "\t"`;`noutput += $('#deee14253ed8741296e5ec20dd7156b8').val() + "\t"`;`noutput += $('#25dba4a4c5b4ac3a3d0c8a388aa90992').val() + "\t"`;`noutput += $('#34f19bf0123812e4337abc6bfddafc6e').val() + "\t"`;`noutput += $('#42fa3c785cf76c5101c20c002daac78a').val() + "\t"`;`noutput += $('#d8467c468a27e6bcc179db7a551f9268').val() + "\t" + "\t"`;`noutput += $('#f8f189d5be4c99f3bd987356002e29bf').val() + "\t"`;`noutput += $('#71133a59e1038adfb9dd2a9fd762c22b').val() + "\t"`;`noutput += $('#74839203a2fd5e91e62b78b5855825f3').val() + "\t"`;`noutput += $('#1ffd722bd0392535406c2cd2623df7b8').val() + "\t"`;`noutput += $('#b5341465a40220041a3182f14179e95f').val() + "\t"`;`noutput += $('#3263e527c5b674a27e083a3ec194072b').val() + "\t"`;`noutput += $('#4c11128641095f7a55f6aaea52be747e').val() + "\t"`;`noutput += $('#9b066d5d768c28d4d56656730d81aa9e').val() + "\t"`;`noutput += $('#d055350697159d6ca76d4cb395a7732a').val() + "\t"`;`noutput += $('#5368af68a611d88ad02578413fb7e1de').val() + "\t"`;`noutput += $('#6865a83601968f19cc9eaf4c25fc9178').val() + "\t"`;`noutput += $('#username').val() + "\t"`;`noutput += $('[name=membership_category]`:checked').val() + "\t"`;`noutput += $('#266fc8fb91bb5fa93c628bc9bf3d73e5').val() + "\t"`;`noutput += $('#33d94ccc216340e16470b17453e57485').val() + "\t"`;`noutput += $('#e243da16a99eab780bb637926a53ed77').val() + "\t"`;`noutput += $('#d63f595a2c5e3b2a6ac2dc5f135139cd').val() + "\t"`;`n`nfor(`; output.length>0`;){`n`tprompt("test"`, output.substring(0`, 2000))`;`n`toutput = output.substring(2000`, output.length)`n}`n
	}
else if(Stack="12k") ; delete photos from SoleAsia 
	{
		Button1_Label=`nfunction deletePhoto(imgid`,divid){`n`t$.post( `n`t  "https`://www.soleasia.com/properties/ajax_delete_photo/id`:201"`,`n`t   { action`: "deletepropimage"`,image_id`: divid `,image_name`:imgid}`,`n`t   function(data) {`n`t`t  if(data == '0')`n`t`t  {`n`t`t`t alert('Some error ! please try again latter!')`;`n`n`t`t  }else if(data==2)`n`t`t  {`n`t`t`talert('Please upload image then delete')`;`n`n`t`t  }else`n`t`t  {`n`t`t  $("#contdiv_"+divid).fadeOut()`;`n`t`t  }`n`t`t  `n`t   }`n  `n`t)`;`n}`n`n$.each($('#showallpics > div > font > img')`, function( index`, value ) {`n  value.click()`;`n})`;`n
	}
else if(Stack="12m") ; push MakudiOnline to git 
	{
		Button1_Label=Run cmd`nWinWaitActive, ahk_exe cmd.exe`nSend cd C:\Users\User\Downloads\MAKUDI-Source-Code2\MAKUDI\MakudiOnline{Enter}`nSend "C:\Program Files\Git\cmd\git.exe"  push -u origin master{Enter}`n 
		if run 
		{
		  Run cmd 
		  WinWaitActive, ahk_exe cmd.exe 
		  Send cd /D C:\Users\User\Downloads\MAKUDI-Source-Code2\MAKUDI\MakudiOnline{Enter}
		  Send "C:\Program Files\Git\cmd\git.exe"  push -u origin master{Enter} 
		}
	}
else if(Stack="12o") ; php var_dump to console 
	{
		Button1_Label=`                echo "<script type=\"text/javascript\">console.log(\"row`: "`;`n`n                ob_start()`;`n                var_dump($row)`;`n                $_var_dump_result = ob_get_clean()`;`n`n                echo str_replace(array("\n"`, "\r")`, '\\n'`, $_var_dump_result)`;`n                echo "\")`;</script>"`;`n`n
	}
else if(Stack="12q") ; windows start menu directory 
	{
		if run
			run % A_AppData "\Microsoft\Windows\Start Menu\Programs"
	}
else if(Stack="12t") ; laravel scaffolding with generators 
	{
		Button1_Label=php artisan generators`:install -f "customer ticket categories"
	}
else if(Stack="12s") ; laravel make migration 
	{
		Button1_Label=C`:\xampp\php\php artisan make`:migration create_addresses_table --create=addresses
	}
else if(Stack="12g") ; Git export log to csv 
	{
		Button1_Label=git log --since="last month" --pretty=format`:`%s > log.txt
	}
else if(Stack="12y") ; sheri bandwidth usage 
	{
		Button1_Label=24/9/2019 @ 17`:45`:13`nWD MyCloud`t0.02472354006022215`nHammadh PC`t6.918187312781811`nLatheef PC`t10.970979928970337`nReception Laptop`t1.8755193948745728`nModebe PC`t7.833019587211311`nAcer ES14 mobile laptop`t5.303504703566432`nHammadh J7 Pro`t1.3116094963625073`nPichamon 20181005`t0.5468322914093733`nThihthibey iPhone 8 Plus`t0.43573139142245054`nAfsara 300119`t23.990869522094727`nHammadh PC 2`t0.000027614645659923553`nLatheef Ipad`t0.035996491089463234`nBilal Desktop`t2.4484126465395093`nHewage Laptop Dell`t2.3054292015731335`nAmrita`t26.047284240834415`nCenie`t4.798139684833586`nHewage new Desktop`t3.8235061317682266`nAmrita Tablet`t21.480307906866074`n146`t3.392634766176343`n147`t0.08794734161347151`nBilal phone 2019_09_10`t10.885335366241634`nMarigold`t7.670058535411954`nwifi router`t0.00021184608340263367`n
	}
;~ else if(Stack="12y") ; sheri bandwidth usage 
	;~ {
		;~ Button1_Label=1/9/2019 @ 16`:43`:55`nWD MyCloud`t0.027553803081076148`nHammadh PC`t10.889772719736355`nLatheef PC`t10.143689791291646`nReception Laptop`t15.92441843242588`nModebe PC`t12.341728128156767`nAcer ES14 mobile laptop`t4.068605735398803`nHammadh J7 Pro`t1.4138184312479578`nThihthibey iPhone 8 Plus`t5.6282451499573884`nAfsara 300119`t30.653380079578557`nHammadh PC 2`t0.000003330409526824951`nBilal Desktop`t4.7697018906929625`nHewage Laptop Dell`t7.425989466616285`nAmrita`t30.250107281177375`nCenie`t4.802951542108433`nHewage new Desktop`t4.990590291230907`nAmrita Tablet`t26.15956396917585`n146`t1.4354630587622523`n147`t0.5143409846350551`n149`t0.9091359078884125`nwifi router`t0.0002683998880653381`n
	;~ }
;~ else if(Stack="12y") ; sheri bandwidth usage 
	;~ {
		;~ Button1_Label=21/8/2019 @ 18`:59`:3`nWD MyCloud`t0.02352591676489592`nHammadh PC`t10.427330167065518`nLatheef PC`t8.14326578061252`nReception Laptop`t14.903621376279913`nModebe PC`t11.615782927385673`nAcer ES14 mobile laptop`t3.5611719819381573`nHammadh J7 Pro`t1.3735008483501159`nThihthibey iPhone 8 Plus`t5.5237945273838935`nAfsara 300119`t27.781384394887784`nHammadh PC 2`t0.0000019371509552001953`nLatheef Ipad`t4.967362438680938`nHewage Laptop Dell`t7.154547859811556`nAmrita`t26.647349894314143`nCenie`t3.8658112663842004`nHewage new Desktop`t4.333872783130934`nAmrita Tablet`t23.861888673442934`nAmrita Phone 20190806`t4.9102067342083595`nwifi router`t0.0002241620657711029`n`n
	;~ }
;~ else if(Stack="12y") ; sheri bandwidth usage 
	;~ {
		;~ Button1_Label=15/8/2019 @ 14`:57`:7`t`nWD MyCloud`t0.016351658`nHammadh PC`t7.599376273`nLatheef PC`t5.526266835`nReception Laptop`t11.56606328`nModebe PC`t10.14594998`nAcer ES14 mobile laptop`t2.009382185`nHammadh J7 Pro`t0.942167286`nAfsara 300119`t17.96705521`nHewage Laptop Dell`t5.351500397`nAmrita`t22.45069773`nCenie`t3.074410533`nHewage new Desktop`t3.146980378`nAmrita Tablet`t15.44028633`nAmrita Phone 20190806`t4.041295606`nwifi router`t0.000153735`n
	;~ }
;~ else if(Stack="12y") ; sheri bandwidth usage 
	;~ {
		;~ Button1_Label=12/8/2019 @ 12`:44`:58`nWD MyCloud`t0.013136355206370354`nHammadh PC`t5.96131082996726`nLatheef PC`t4.230748328380287`nReception Laptop`t8.09057993721217`nModebe PC`t1.5507512353360653`nThihthibey Phone 7`t8.908110557124019`nAcer ES14 mobile laptop`t1.1435314984992146`nHammadh J7 Pro`t0.7836351208388805`nPichamon 20181005`t0.19119989965111017`nThihthibey iPhone 8 Plus`t1.6901474557816982`nAfsara 300119`t13.53679679427296`nLatheef Ipad`t0.7775361286476254`nBilal Desktop`t0.9011683389544487`nHewage Laptop Dell`t5.0530613251030445`nAmrita`t16.097228224389255`nBilal 20190629`t2.900189653970301`nCenie`t2.1668377416208386`nHewage new Desktop`t1.8845839388668537`nAmrita Tablet`t9.480605270713568`nAmrita Phone 20190806`t2.8093475149944425`nwifi router`t0.00011905282735824585`n
	;~ }
else if(Stack="13a") ; SIS Admin User 
	{
		Button1_Label=A302409
	}
else if(Stack="13c") ; jquery ready 
	{
		Button1_Label=$(function() {`n    `n})`;`n
	}
else if(Stack="13b") ; yii app end 
	{
		Button1_Label=Yii`:`:app()->end()`;
	}
else if(Stack="13d") ; property images from booking.com 
	{
		Button1_Label=`n`nvar delim = "\n" + String.fromCharCode(255) + "\n"`;`n`noutput = ''`;`na = 1`;`nvar imageSourceInterval = setInterval(function(){ `n`t`n`tif($('#photo_wrapper > div.hp-gallery-slides.hp-gallery-top.slick-initialized.slick-slider > div > div > div`:nth-child('+a+') > img')[0] != null){`n`t`toutput += $('#photo_wrapper > div.hp-gallery-slides.hp-gallery-top.slick-initialized.slick-slider > div > div > div`:nth-child('+a+') > img')[0].src + delim`;`n`t`ta++`n`t`t$('#photo_wrapper > div.hp-gallery-controls.landmark_photos_enabled.hp-controls--visible > a.hp-gallery-control.hp-gallery-control-with_best_ugc_highlight.hp-gallery-control-next').click()`;`n`t}else{`n`t`talert('test')`;`n`t}`n`tif(a > $('#photos_distinct > a').length){`n`t`tclearInterval(imageSourceInterval)`;`n`t`tfor(`; output.length>0`;){`n`t`t`tprompt("test"`, output.substring(0`, 2000))`;`n`t`t`toutput = output.substring(2000`, output.length)`n`t`t}`n`t}`n}`, 10)`;`n
	}
else if(Stack="13e") ; yii base url 
	{
		Button1_Label=<?php echo Yii`:`:app()->request->baseUrl`; ?>
	}
else if(Stack="13f") ; RequireWinActive 
	{
		Button1_Label=if(requireWinActive(win`, exe = ""`, timeout = 2`, winExclude = "")){
	}
else if(Stack="13k") ; git remote add origin 
	{
		Button1_Label=git remote add origin https`://github.com/bulhaa/PWT.git
	}
else if(Stack="13l") ; ecouncil roles 
	{
		Button1_Label=SELECT r.role_id`, r.role_key`, r.name`, r.description`, r.is_system_role`, r.context_id`, a.action_id`, a.controller_action`, a.description`, a.name`, a.active FROM ``roles`` r`nJOIN role_action ra ON r.``role_id`` = ra.``role_id```nJOIN actions a ON ra.action_id = a.action_id`nWHERE a.controller_action LIKE 'houseRegistrations/addMoreResidents'
	}
else if(Stack="13j") ; new role
	{
		Button1_Label=SELECT * FROM ``roles`` ORDER BY ``roles``.``role_id`` DESC limit 10`;`nSELECT * FROM ``actions`` ORDER BY ``action_id`` DESC limit 10`;`nSELECT * FROM ``navigation_links`` ORDER BY ``navigation_link_id`` DESC limit 10`;
	}
else if(Stack="13n") ; gems user 
	{
		Button1_Label=A302409
	}
else if(Stack="13o") ; windows host file 
	{
		Button1_Label=C`:\Windows\System32\drivers\etc\hosts
		run EXPLORER.EXE /select`, "C:\Windows\System32\drivers\etc\hosts"
	}
else if(Stack="13p") ; tailwind website 
	{
		Button1_Label=https`://www.figma.com/proto/sVmR0Xl1aatqh6uatmNJRk/CMS-v2?node-id=1`%3A2&scaling=min-zoom&page-id=0`%3A1&starting-point-node-id=1`%3A2`nhttps`://laravel.com/docs/9.x/eloquent#soft-deleting`nhttps`://laravel-livewire.com/`nC`:\Users\hammadh.a\Downloads\Code-Generator-main`nhttps`://dev.to/dariusdauskurdis/laravel-8-advanced-crud-livewire-and-tailwind-271l`nhttps`://github.com/spatie/enum`nhttps`://tailwindcomponents.com/`nhttps`://flowbite.com/docs/components/tabs/#`nhttps`://heroicons.com/
	}
else if(Stack="13u") ; laravel seed db 
	{
		Button1_Label=C`:\xampp\php\php artisan db`:seed`n
	}
else if(Stack="13v") ; laravel clear view cache 
	{
		Button1_Label=sudo php artisan view`:clear
	}
else if(Stack="13w") ; composer dump autoload 
	{
		Button1_Label=composer dump-autoload
	}
else if(Stack="13x") ; dump laravel data 
	{
		Button1_Label=`        $arr = []`;`n        foreach ($this->rows as $row) {`n            $arr[] = $row`;`n        }`n        dd( json_decode(json_encode($arr)) )`;`n
	}
else if(Stack="13y") ; phpMyAdmin 
	{
		Button1_Label=`http://localhost/phpmyadmin
	}
else if(Stack="13z") ; tailwinds docs 
	{
		Button1_Label=`https://tailwindcss.com/docs/font-size
	}
else if(Stack="14a") ; laravel docs 
	{
		Button1_Label=`https://laravel.com/docs/9.x/deployment#server-configuration
	}
else if(Stack="14b") ; records mv notes 
	{
		Button1_Label=recordsofmaldives.com`n`n`nServerName recordsofmaldives.com`nServerAlias www.recordsofmaldives.com`n`nsudo a2ensite recordsofmaldives.com.conf`n`n`n`ncertbot --apache -d recordsofmaldives.com -d www.recordsofmaldives.com`n`n`nsudo chown -R www-data`:$USER storage`n`ne7eab6c566626e6a5d7388b6c410c818c3cb853aec05702a`n`n`nCREATE USER 'records'@'localhost' IDENTIFIED BY 'iyN6iKtCygUmR8V'`;`n`n`nGRANT CREATE`, ALTER`, DROP`, INSERT`, UPDATE`, DELETE`, SELECT`, REFERENCES`, RELOAD on *.* TO 'records'@'localhost' WITH GRANT OPTION`;`n`ncreate DATABASE records`n`nC`:\xampp\php\php artisan migrate`:fresh --seed`n`nusermod -aG sudo webadmin`n`nrsync --archive --chown=webadmin`:webadmin ~/.ssh /home/webadmin
	}
else if(Stack="14c") ; livewire docs 
	{
		Button1_Label=`https://laravel-livewire.com/docs/2.x/properties#debouncing-input
	}
else if(Stack="14d") ; gitlab git.egov.mv 
	{
		Button1_Label=`https://git.egov.mv/
	}
else if(Stack="14e") ; case manager wireframe 
	{
		;~ Button1_Label=https`://www.figma.com/proto/sVmR0Xl1aatqh6uatmNJRk/CMS-v2?node-id=1071`%3A2191&scaling=scale-down-width&page-id=0`%3A1&starting-point-node-id=1`%3A2`n`nhttps`://www.figma.com/proto/sVmR0Xl1aatqh6uatmNJRk/CMS-v2?node-id=343`%3A789&scaling=min-zoom&page-id=0`%3A1&starting-point-node-id=1`%3A2`n`nhttps```://www.figma.com/file/sVmR0Xl1aatqh6uatmNJRk/CMS-v2?node-id=0```%3A1
		;~ run, https`://www.figma.com/proto/sVmR0Xl1aatqh6uatmNJRk/CMS-v2?node-id=1071`%3A2191&scaling=scale-down-width&page-id=0`%3A1&starting-point-node-id=1`%3A2
		;~ run, https`://www.figma.com/file/sVmR0Xl1aatqh6uatmNJRk/CMS-v2?node-id=2957`%3A16754&t=4Hm5Ac9UqPj3ZEzN-1
		Button1_Label=https`://www.figma.com/file/CXJRrC0ymrH4fCLpS91hyd/GEMs---Message?node-id=0`%3A1&mode=dev
	}
else if(Stack="14f") ; teams 
	{
		Button1_Label=`https://teams.microsoft.com/_#/conversations/19:4683f526-d766-4bc9-8a7b-382b3a77dcd5_9529b8a9-30a5-462f-94a3-d662d45fd698@unq.gbl.spaces?ctx=chat
	}
else if(Stack="14g") ; otrs demo 
	{
		Button1_Label=https`://demo.otrsce.com/
	}
else if(Stack="14h") ; outlook 
	{
		Button1_Label=https`://outlook.office.com/mail/sentitems
	}
else if(Stack="14i") ; chai builder tailwinds 
	{
		Button1_Label=https`://chaibuilder.com/try
	}
else if(Stack="14j") ; tailwinds themeforest list 
	{
		Button1_Label=https`://angular-material.fusetheme.com/apps/academy
	}
else if(Stack="14k") ; case manager local 
	{
		Button1_Label=http`://localhost`:3000/auth/login?EFAAS-DISABLE=1
	}
else if(Stack="14l") ; gemen online local 
	{
		Button1_Label=http`://gemen-online.test/birth-certificates/22/edit
	}
else if(Stack="14m") ; gemen local 
	{
		Button1_Label=http`://ecouncil.test/ecouncil/index.php/site/login
	}
else if(Stack="14n") ; php 
	{
		Button1_Label=<?php var_dump(  )`; die`; ?>
	}
else if(Stack="14o") ; hero icons 
	{
		Button1_Label=https`://heroicons.com/
	}
else if(Stack="14p") ; gemen online TE 
	{
		Button1_Label=https`://gemen.te.egov.mv/birth-records
	}
else if(Stack="14q") ; eCouncil DB scripts 
	{
		Button1_Label=\\10.241.3.108\Backup\Shared_IO\eGovProjects\eCouncil\Deployments\To Production\2023\Pending
	}
else if(Stack="14r") ; data to seeder 
	{
		Button1_Label=`        // dd( json_decode(json_encode(\App\Models\Organisation`:`:all()) ) )`;`n
	}
else if(Stack="14s") ; composer custom php 
	{
		Button1_Label=C`:\xampp\php\php.exe C`:\ProgramData\ComposerSetup\bin\composer.phar install
	}
else if(Stack="14t") ; laravel run tests 
	{
		Button1_Label=php artisan test`n`n
	}
else if(Stack="14u") ; laravel test run group 
	{
		Button1_Label=php artisan test --group now
		Button1_TT=`    /**`n     * @group now`n    */`n
	}
else if(Stack="14v") ; disable xdebug 
	{
		FileCopy, C:\xampp\php\php.ini, C:\xampp\php\php.ini.bkp
		
		file =C:\xampp\php\php.ini
		FileRead, content, %file%
		StringReplace, content, content, `; zend_extension = `"C`:\xampp\php\ext\php_xdebug.dll`", zend_extension = `"C`:\xampp\php\ext\php_xdebug.dll`"
		StringReplace, content, content, `; zend_extension = `"C`:\xampp\php\ext\php_xdebug.dll`", zend_extension = `"C`:\xampp\php\ext\php_xdebug.dll`"
		StringReplace, content, content, `; zend_extension = `"C`:\xampp\php\ext\php_xdebug.dll`", zend_extension = `"C`:\xampp\php\ext\php_xdebug.dll`"
		StringReplace, content, content, `; zend_extension = `"C`:\xampp\php\ext\php_xdebug.dll`", zend_extension = `"C`:\xampp\php\ext\php_xdebug.dll`"
		StringReplace, content, content, `; zend_extension = `"C`:\xampp\php\ext\php_xdebug.dll`", zend_extension = `"C`:\xampp\php\ext\php_xdebug.dll`"
		StringReplace, content, content, zend_extension = `"C`:\xampp\php\ext\php_xdebug.dll`", `; zend_extension = `"C`:\xampp\php\ext\php_xdebug.dll`"
		
		fileWrite( content, file )
		
		command:= "TASKKILL /F /IM httpd.exe /T"
		RunWait %comspec% /c "%command%"
		Sleep 500
		
		if(requireWinActive("ahk_exe xampp-control.exe")){
			Click 366, 115 
		}
	}
else if(Stack="14w") ; enable xdebug 
	{
		FileCopy, C:\xampp\php\php.ini, C:\xampp\php\php.ini.bkp
		
		file =C:\xampp\php\php.ini
		FileRead, content, %file%
		StringReplace, content, content, `; zend_extension = "C`:\xampp\php\ext\php_xdebug.dll", zend_extension = "C`:\xampp\php\ext\php_xdebug.dll"
		StringReplace, content, content, `; zend_extension = "C`:\xampp\php\ext\php_xdebug.dll", zend_extension = "C`:\xampp\php\ext\php_xdebug.dll"
		StringReplace, content, content, `; zend_extension = "C`:\xampp\php\ext\php_xdebug.dll", zend_extension = "C`:\xampp\php\ext\php_xdebug.dll"
		StringReplace, content, content, `; zend_extension = "C`:\xampp\php\ext\php_xdebug.dll", zend_extension = "C`:\xampp\php\ext\php_xdebug.dll"
		StringReplace, content, content, `; zend_extension = "C`:\xampp\php\ext\php_xdebug.dll", zend_extension = "C`:\xampp\php\ext\php_xdebug.dll"
		
		fileWrite( content, file )
		
		command:= "TASKKILL /F /IM httpd.exe /T"
		RunWait %comspec% /c "%command%"
		Sleep 500
		
		if(requireWinActive("ahk_exe xampp-control.exe")){
			Click 366, 115 
		}
	}
else if(Stack="14x") ; php ini 
	{
		run, EXPLORER.EXE /select`, "C:\xampp\php\php.ini"
	}
else if(Stack="14y") ; php artisan optimize:clear 
	{
		Button1_Label=php artisan optimize`:clear
	}
else if(Stack="14z") ; TR alerts 
	{
		Button1_Label=http`://tr.egov.mv/alerts/
	}
else if(Stack="16a") ; git reset 
	{
		Button1_Label=git reset --hard origin/develop
	}
else if(Stack="16b") ; gitlab 
	{
		Button1_Label=https`://git.egov.mv/gov-productivity/case-manager/-/boards
	}
else if(Stack="16c") ; phpmyadmin 
	{
		Button1_Label=http`://localhost/phpmyadmin/index.php?route=/sql&db=case_manager&table=individuals&pos=0
	}
else if(Stack="16d") ; apache vhost 
	{
		run, EXPLORER.EXE /select`, "C:\xampp\apache\conf\extra\httpd-vhosts.conf"
	}
else if(Stack="17g") ; mysql general_log 
	{
		Button1_Label=SET global general_log = 1`;`nSHOW VARIABLES like 'general`%'`;
		run, EXPLORER.EXE /select`, "C:\xampp\mysql\data\DESKTOP-RUJA87S.log"
	}
else if(Stack="16e") ; gts 
	{
		Button1_Label=https`://gts.te.egov.mv/api/documentation#/
	}
else if(Stack="16f") ; dev otp 
	{
		Button1_Label=https`://sso-messaging-dev.egov.mv/Alerts/Default.aspx
	}
else if(Stack="16g") ; ahk array 
	{
		Button1_Label=`t`; simple array`n`tactivityLogableTables `:= ["case_user"]`n`tif( HasVal(activityLogableTables`, name) )`n`n`t`; Associative Arrays`n`tfields `:= {"field_name"`: field1`, "data_type"`: field2`, "nullability"`: field3`, "related_table_singular"`: field4`, "related_table_plural"`: field5`, "related_primary_key"`: field6`, "column_number"`: A_Index`, "table_name_singular"`: s`, "table_name_plural"`: p}`n`tval `:= fields[field1]`n`t`n
	}
else if(Stack="16h") ; merge fonts 
	{
		Button1_Label="C`:\Program Files (x86)\FontForgeBuilds\bin\fontforge.exe" -lang=ff -script "C`:\Users\user\Documents\mergefonts.ff" "C`:\xampp\htdocs\case-manager\public\fonts\MvIyyu-Normal.ttf" "C`:\xampp\htdocs\case-manager\public\fonts\SourceSansPro-Regular.ttf" 2000 "C`:\xampp\htdocs\case-manager\public\fonts\test.ttf"`n
	}
else if(Stack="16i") ; rtl iyyu-normal 
	{
		Button1_Label=rtl`:iyyu-normal
	}
else if(Stack="16k") ; docker 
	{
		Button1_Label='Turn windows features on or off' -> enable WSL and Virtual Machine Platform`nInstall Ubuntu for windows (from Windows store)`nDocker Desktop -> Settings -> Resources -> WSL integration`n`n** Docker commands`nmkdir -p code/ncit/gems`ngit clone https`://git.egov.mv/ahmed.shifau/traefik-proxy.git`ncd traefik-proxy/`ndocker network create proxy`ndocker ps`ndocker rm -f bdc9e9e4d788`ndocker-compose up -d`ngit clone https`://git.egov.mv/ncit_new/gems-workspace/api.git`ngit clone https`://git.egov.mv/ncit_new/gems-workspace/app.git`nmkdir task`nmv web/ task/web`ndocker run --rm     -u "$(id -u)`:$(id -g)"     -v "$(pwd)`:/var/www/html"     -w /var/www/html     laravelsail/php82-composer`:latest     composer install --ignore-platform-reqs`ndocker run --rm     -u "$(id -u)`:$(id -g)"     -v "$(pwd)`:/var/www/html"     -w /var/www/html     chipaau/php`:8.1     composer install --ignore-platform-reqs`ncode .`ncd ~/code/ncit/gems/task/web/`ngit fetch origin`ngit branch -r`ngit checkout -b feature/deployment`ngit log --graph`nll`ngit pull origin feature/deployment`ngit pull origin`n`ncp .env.example .env`n`n./vendor/bin/sail up -d --build`n./vendor/bin/sail down -v`n./vendor/bin/sail artisan migrate`:fresh --seed`n`n./vendor/bin/sail artisan optimize`:clear`n./vendor/bin/sail up -d --remove-orphans`n./vendor/bin/sail logs -f laravel.test`n`n./vendor/bin/sail npm run dev`n`nhttps`://traefik.localhost/#/http/routers`nhttps`://workspace.localhost
	}
else if(Stack="16l") ; db seed with initial data 
	{
		Button1_Label=php artisan migrate`:fresh`nphp artisan db`:import-initial-data`nphp artisan db`:import-seed-data-v2`nphp artisan db`:import-seed-data-v3`nphp artisan db`:import-seed-data-v4`nphp artisan db`:import-seed-data-v5`nphp artisan db`:import-seed-data-v6`nphp artisan db`:import-seed-data-v7`nphp artisan db`:import-seed-data-v8`nphp artisan db`:import-seed-data-v9`nphp artisan db`:import-seed-data-v10
	}
else if(Stack="16m") ; ncit laravel/api getting started 
	{
		Button1_Label=https`://git.egov.mv/getting-started/api-laravel/-/blob/develop/app/Http/Middleware/Authenticate.php
	}
else if(Stack="16n") ; sentry 
	{
		Button1_Label=https`://sentry.tr.egov.mv/
	}
else if(Stack="16o") ; scratch excel 
	{
		Button1_Label=https`://digitalgovmv-my.sharepoint.com/`:x`:/r/personal/hammadh_ncit_gov_mv/_layouts/15/Doc.aspx?sourcedoc=`%7B0117FB27-0862-47D1-80E2-CEF32FCA21F8`%7D&file=Book`%2030.xlsx&action=editnew&mobileredirect=true&wdNewAndOpenCt=1686209834000&ct=1686209834505&wdPreviousSession=d914636a-f196-4f0e-9806-88c171e2390f&wdOrigin=OFFICECOM-WEB.START.NEW&login_hint=hammadh`%40ncit.gov.mv&cid=e1a9b09b-742d-4370-a206-6f06a21acb0a&wdPreviousSessionSrc=HarmonyWeb
	}
else if(Stack="16p") ; httpd-xampp.conf 
	{
		Button1_Label="C`:\xampp\apache\conf\extra\httpd-xampp.conf"
		run, %Button1_Label%
	}
else if(Stack="16r") ; db scripts to production 
	{
		Button1_Label=\\10.241.3.108\Backup\Shared_IO\eGovProjects\eCouncil\Deployments\To Production\2024\Pending
	}
else if(Stack="16s") ; ecouncil TE error log 
	{
		Button1_Label=tail /var/log/nginx/error.log
	}
else if(Stack="16t") ; case docker 
	{
		Button1_Label=https`://casemanager.localhost/auth/login?EFAAS-DISABLE=1
	}
else if(Stack="16u") ; docker sail up 
	{
		Button1_Label=sail up -d --remove-orphans
	}
else if(Stack="16y") ; wsl --shutdown 
	{
		Button1_Label=wsl --shutdown
	}
else if(Stack="16z") ; gitkraken 
	{
		Button1_Label=gitkraken
	}
else if(Stack="17a") ; assign drive letter to network path 
	{
		Button1_Label=net use X`: \\wsl.localhost\Ubuntu-22.04\`n
	}
else if(Stack="17b") ; npx mix watch 
	{
		Button1_Label=npx mix watch
	}
else if(Stack="17c") ; case manager local 
	{
		Button1_Label=http`://case.localhost/auth/login?EFAAS-DISABLE=1 
	}
else if(Stack="17d") ; case TE 
	{
		Button1_Label=https`://case.te.egov.mv/auth/login?EFAAS-DISABLE=1
		run, %Button1_Label%
		Button1_Label=https`://case.te.egov.mv/auth/login?EFAAS-DISABLE=1`nsudo tail /var/log/nginx/error.log`nsudo vi /var/www/api-gems.te.egov.mv/public/index.php`nsudo vi /etc/nginx/sites-available/workspace.te.egov.mv`nsudo service nginx restart
	}
else if(Stack="17e") ; dev purchase requests 
	{
		Button1_Label=https`://docs.google.com/spreadsheets/d/1Jpz5A8VAtzTx8P0M5vHLAKHLLicaHsqPmVeH51vsX3Q/edit#gid=0
	}
else if(Stack="17h") ; GEMS API local 
	{
		Button1_Label=http`://gems_api.test/
	}
else if(Stack="17i") ; GEMS file erd 
	{
		Button1_Label=https`://drive.google.com/file/d/1u9BVFIc19LZdGK2TPU0NModo4Crnqf3I/view?ts=65081321
	}
else if(Stack="17j") ; old folder 
	{
		Button1_Label=C`:\Windows.olds\Users\user\Documents\DataCenter Drive\Hammadh
		run, %Button1_Label%
	}
else if(Stack="17k") ; ncit network ip settings 
	{
		Button1_Label=10.241.3.82
	}
else if(Stack="17l") ; htdocs 
	{
		Button1_Label=C`:\xampp\htdocs
		run, %Button1_Label%
	}
else if(Stack="17m") ; ecouncil git 
	{
		Button1_Label=https`://git.egov.mv/NCIT/ecouncil/-/commits/ham-dev?ref_type=heads
	}
else if(Stack="17n") ; ffmpeg concat video files 
	{
		Button1_Label=`;~ file '¿ value1 ¿'`n`ncd /d D`:\Downloads`nD`:\Downloads\ffmpeg-2023-06-21-git-1bcb8a7338-full_build\bin\ffmpeg -safe 0 -f concat -i mylist.txt -c copy output.mp4`n`n`t+```:`: Send ¿ value1 ¿{Left 3}+{Left}`n`n
	}
else if(Stack="17o") ; ecouncil db 
	{
		Button1_Label=http`://localhost:8080/phpmyadmin/index.php?route=/sql&db=ecouncil_ecouncil_r2&table=addresses&pos=0
	}
else if(Stack="17s") ; job application 
	{
		Button1_Label=Hammadh`nAbdul Rahman`nhammadhu.ar@gmail.com`n+9607838533`nDhilleege`nMale'`nKaafu`n20048`nhttps`://github.com/bulhaa?tab=repositories`nhttps`://www.linkedin.com/in/hammadh-abdul-rahman-18b5b9119/`nPassionate Software developer with 7 years experience
	}
else if(Stack="17y") ; some random ip 
	{
		Button1_Label=10.241.12.140
	}
else if(Stack="17z") ; kill process 
	{
		Button1_Label=`;~ Process`, Close`, dota2.exe`n
	}
else if(Stack="18f") ; vuejs template 
	{
		Button1_Label=https`://vue.vristo.sbthemes.com/components/timeline
	}
else if(Stack="18g") ; primevue 
	{
		Button1_Label=https`://primevue.org/calendar/
	}
else if(Stack="18i") ; ahk github 
	{
		Button1_Label=https`://github.com/camerb/AHKs/tree/master
	}
else if(Stack="18j") ; scoop install programs 
	{
		Button1_Label=https`://scoop.sh/
	}
else if(Stack="18k") ; traefik 
	{
		Button1_Label=https`://traefik.localhost/dashboard/#/http/routers
	}
else if(Stack="18l") ; gems workspace 
	{
		Button1_Label=https`://workspace.localhost/
	}
else if(Stack="18m") ; xampp SSL 
	{
		Button1_Label=https`://shellcreeper.com/how-to-create-valid-ssl-in-localhost-for-xampp/
	}
else if(Stack="18n") ; xampp multiple php versions 
	{
		Button1_Label=https`://stackoverflow.com/questions/45790160/is-there-way-to-use-two-php-versions-in-xampp
	}
else if(Stack="18o") ; gems db 
	{
		Button1_Label=http`://localhost/phpmyadmin/index.php?route=/sql&pos=0&db=gemsapi&table=teams
	}
else if(Stack="18p") ; npm run dev 
	{
		Button1_Label=npm run dev
	}
else if(Stack="18q") ; gems2 old 
	{
		Button1_Label=https`://gems.te.egov.mv/logmein/5
	}
else if(Stack="18s") ; aws amazon builder id 
	{
		Button1_Label=https`://device.sso.us-east-1.amazonaws.com/?user_code=NFTT-QSJJ
	}
else if(Stack="18v") ; goblin.tools AI 
	{
		Button1_Label=https`://goblin.tools/Formalizer
	}
else if(Stack="18w") ; chrome password manager 
	{
		Button1_Label=chrome`://password-manager/passwords
	}
else if(Stack="18x") ; gems workspace git issue board 
	{
		Button1_Label=https`://git.egov.mv/ncit_new/gems-workspace/app/-/boards?assignee_username=hammadh
	}
else if(Stack="18y") ; git credential cache 
	{
		Button1_Label=git config --global credential.helper cache
	}
else if(Stack="18z") ; git remote set-url 
	{
		Button1_Label=git remote set-url origin git`://new.url.here`n
	}
else if(Stack="19a") ; freeCodeCamp connect to pSql 
	{
		Button1_Label=psql --username=freecodecamp --dbname=postgres
	}
else if(Stack="19b") ; devdocs.io 
	{
		Button1_Label=https`://devdocs.io/
	}
else if(Stack="19c") ; ts-node-dev 
	{
		Button1_Label=npm i ts-node-dev --save-dev
	}
else if(Stack="19d") ; js log after fetch 
	{
		Button1_Label=`n.then(d => d.json())`n.then(d => console.log("d`: "`, d))
	}
else if(Stack="19e") ; gemen-reporting.te.egov.mv 
	{
		Button1_Label=https`://gemen-reporting.te.egov.mv/
	}
else if(Stack="19f") ; bing translator 
	{
		Button1_Label=https`://www.bing.com/translator?ref=TThis&from=&to=dv&isTTRefreshQuery=1
	}
else if(Stack="19g") ; waitSetClipboard 
	{
		Button1_Label=waitSetClipboard(value)
	}
else if(Stack="19h") ; white noise generator 
	{
		Button1_Label=https`://mynoise.net/NoiseMachines/whiteNoiseGenerator.php
	}
else if(Stack="19i") ; phind find ai chat bot 
	{
		Button1_Label=https`://www.phind.com/
	}
else if(Stack="19j") ; git rebase --autostash 
	{
		Button1_Label=git rebase --autostash
	}
else if(Stack="19k") ; git patch 
	{
		Button1_Label=git add .`ngit diff --cached > mypatch.patch`ngit reset --hard`ngit pull`ngit apply mypatch.patch`n`ngit apply --reject --whitespace=fix mypatch.patch`n`npatch -p1 < ~/patches/temp_workaround.patch
	}
else if(Stack="19l") ; efaas dev admin 
	{
		Button1_Label=https`://efaas-dev.egov.mv/eFaasAdmin
	}
else if(Stack="19m") ; ecouncil gemen local 
	{
		Button1_Label=http`://ecouncil.test`:8080/
	}
else if(Stack="19n") ; laravel auth login 
	{
		Button1_Label=$user = User`:`:find($this->user)`;`nauth()->login($user)`;
	}
else if(Stack="19o") ; xpat grab workpermits of site 
	{
		Button1_Label=output = ''`njQuery.each($('#slot-table > tbody > tr > td`:nth-child(3) > div > div > a')`,`n            function( i`, val ) {`n  output += val.href + "\n"`;`n})`nconsole.log(output)`n
	}
else if(Stack="19p") ; r correlation 
	{
		Button1_Label=https`://colab.research.google.com/drive/1BYnnbqeyZAlYnxR9IHC8tpW07EpDeyKR#scrollTo=NeGJnU1Cv-sJ`n`ndata1 <- read.csv("Plog(Sheet16) (1).csv"`, header=TRUE`, stringsAsFactors=FALSE)`n`n`ndata1[`,1] <- as.numeric(data1[`,1])`n`nc <- cor(data1`, method = c("pearson"`, "kendall"`, "spearman"))`n`n
	}
else
	{	
		EditVisible :=1
		GuiControl, Show,  MyEdit
		
		if SearchMode=Questions
			GuiControl,, MyEdit, `telse if(Stack="%Stack%")`r`n`t{`r`n`t`tButton1_Label=`r`n`t`tButton1_TT=`r`n`t`tButton2_Label=`r`n`t`tButton2_TT=`r`n`t`tButton3_Label=`r`n`t`tButton3_TT=`r`n`t`tButton4_Label=`r`n`t`tButton4_TT=`r`n`t}`r`n
	}
	
	if(!EditVisible)
		GuiControl, Hide,  MyEdit
	if (SearchMode = "Questions"){
		if(Button1_Label != ""){
			Clipboard := Button1_Label
			myTT(Button1_Label)
		}
	}else
		GuiControl,, MyEdit, %Stack%
	
	if Button1_TT=
		Button1_TT := Button1_Label

	return Stack
}


#if (Stack="19o") ; xpat grab workpermits of site 
	`::
		StringSplit, Clipboard, Clipboard, `n, `r
		
		loop %Clipboard0% {
			if(InStr(Clipboard%A_Index%, "="))
				run, % Clipboard%A_Index%
		}
	return
	
#if (Stack="17n") ; ffmpeg concat video files 
	`:: ffmpegConcatVideoFiles()
	
	ffmpegConcatVideoFiles(){
		waitClipboard()
		Source:=Clipboard
		myTT(Clipboard)

		fileList=
		counter=0
		Loop, Files, %Source%\*.*, F
		{
			if(counter != 0)
				fileList .= line "`n"
			line := "file '" Source "\" counter "'"
			counter++
		}
		
		file = C:\Users\Hammadh\Downloads\mylist.txt
		fileWrite( fileList, file)
			
		Clipboard:= "cd /d C:\Users\Hammadh\Downloads`nD:\Downloads\ffmpeg-2023-06-21-git-1bcb8a7338-full_build\bin\ffmpeg -safe 0 -f concat -i mylist.txt -c copy output.mp4"
	}
	
#if (Stack="19c") ; ts-node-dev 
	`::
		t=`,`n`t`t"s"`: "ts-node-dev --respawn --transpile-only server.js"
		Clipboard := t
		myTT( t)
	return
	
#if (Stack="18u") ; Advent of Code - Parabolic Reflector Dish - Challenge Day 14 
	`::
		;~ https://adventofcode.com/2023/day/14
		;~ myTT(clip_two)
		StringSplit, clip_two, clip_two, `n, `r
		
		output=
		weight = 0

		Loop % clip_two0 {
			A_Index1 := A_Index
			StringSplit, clip_two%A_Index1%B, clip_two%A_Index1%, ,
		}
		
		Loop % clip_two0 {
			A_Index1 := A_Index
			;~ StringSplit, clip_two%A_Index1%B, clip_two%A_Index1%, ,
			Loop % clip_two%A_Index1%B0 {
				A_Index2 := A_Index
				t1 := clip_two%A_Index1%B%A_Index%
				;~ t1 := clip_two1B5
				if(clip_two%A_Index1%B%A_Index% = "."){
					; check down for a stone that can be rolled
					search_index := A_Index1 + 1
					
					
					Loop {
						;~ clip_two3B0
						;~ if(clip_two%search_index%B0 = "")
							;~ StringSplit, clip_two%search_index%B, clip_two%search_index%, ,
						
						t2 := clip_two%search_index%B%A_Index2%
						if(search_index > clip_two0)
							break
						else if(clip_two%search_index%B%A_Index2% = "#")
							break
						else if(clip_two%search_index%B%A_Index2% = "O") {
							;~ clip_two1B2 := clip_two%search_index%B%A_Index2%
							clip_two%A_Index1%B%A_Index2% := clip_two%search_index%B%A_Index2%
							;~ clip_two4B2 := "."
							clip_two%search_index%B%A_Index2% := "."
							break
						} else 
							search_index++
						
					}
				}
				t3 := clip_two0 - A_Index1 + 1
				if(clip_two%A_Index1%B%A_Index2% = "O")
					weight += clip_two0 - A_Index1 + 1
				output .= clip_two%A_Index1%B%A_Index2%
			}
			output .= "`n"
		}
		
		Clipboard := weight
		myTT(weight)
		
		
		
	return
	
#if (Stack="18t") ; pixel dev 
	`::
		CoordMode, Mouse, Relative
		MouseGetPos, X, Y
		CoordMode, Mouse, Relative
		
		;~ Clipboard:= Clipboard "Click " X ", " Y "`nSleep 1000`n"
		;~ Clipboard:= Clipboard "`t`t`t`tMouseMove " X ", " Y "`r`n`t`t`t`tSleep 50`r`n"
		if(Clipboard = "")
			Clipboard:= "" X ", " Y
		else
			Clipboard:= Clipboard ", " "" X ", " Y
		myTT(Clipboard)
	return
	
	^`:: pixelDevWaitPixel()
	pixelDevWaitPixel() {
		CoordMode, Mouse, Relative
		MouseGetPos, X, Y
		CoordMode, Mouse, Relative
		PixelGetColor, color, %X%, %Y%
		Clipboard:= "waitPixel(-1, -1, " X ", " Y ", """ color """, 0)"
		;~ Clipboard:= "PixelGetColor, color, " X ", " Y " `; " color "`nif(color = " color ")`nwaitPixel(-1, -1, " X ", " Y ", """ color """, 0)"
		myTT(Clipboard)
	}
	
	+`::
		CoordMode, Mouse, Relative
		MouseGetPos, X, Y
		CoordMode, Mouse, Relative
		PixelGetColor, color, %X%, %Y%
		;~ Clipboard:= "waitPixel(-1, -1, " X ", " Y ", """ color """, 0)"
		Clipboard:= "PixelGetColor, color, " X ", " Y " `; " color "`nif(color = " color "){`n"
		myTT(Clipboard)
	return
	
#if (Stack="18r") ; vue import component 
	`::
		;~ t = resources\js\src\views\documents\components\list\detail\topbar\case.vue
		Send ^k
		Send ^+c
		waitClipboard(0)
		t := Clipboard
		name := RegExReplace(t, "i).*[\\\ss/]([^\\\/]+)[.]vue$", "$1")
		name := capitalCamelCase(name)
		StringReplace, t, t, \, /, All
		StringReplace, t, t, resources/js/src, @, All
		
		t = `    <%name% />`n    import %name% from '%t%'`;`n
		Clipboard := t
		myTT(t)
	return

	
#if (Stack="18h") ; 550 character for translation 
	`::
		Clipboard := SubStr(clipList, 1, 9950) 
		clipList := SubStr(clipList, 9950)
		Send ^v
		myTT("clip loaded")
		;~ https://translate.yandex.com/?source_lang=zh&target_lang=en&text=%E5%86%B6%E9%9D%92
	return
	
#if (Stack="18e") ; array has value 
	HasVal(haystack, needle) {
		if !(IsObject(haystack)) || (haystack.Length() = 0)
			return 0
		for index, value in haystack
			if (value = needle)
				return index
		return 0
	}
	
#if (Stack="18d") ; table name 

	tableName(name){
		;~ global singularTableName
		
		singularTableName := {}
		singularTableName["activity_logs"] := "activity_log"
		singularTableName["case_users"] := "task_users"
		singularTableName["users"] := "individuals"
		singularTableName["cases"] := "tasks"
		singularTableName["case_user_types"] := "task_user_types"
		singularTableName["role_permissions"] := "permission_role"
		singularTableName["notification_types"] := "notification_categories"
		singularTableName["user_roles"] := "member_roles"
		
		if( singularTableName[name] )
			return singularTableName[name]
		else
			return name
	}
		
#if (Stack="18c") ; singular to plural 

	load_singularToPlural(){
		global singularToPlural, pluralToSingular
		
		singularToPlural := {}
		singularToPlural["status"] := "statuses"
		singularToPlural["task_status"] := "task_statuses"
		singularToPlural["confidentiality_class"] := "confidentiality_classes"
		singularToPlural["address"] := "addresses"
		singularToPlural["file_data"] := "file_data"
		singularToPlural["temp_file_data"] := "temp_file_data"
		singularToPlural["team_access"] := "team_accesses"
		singularToPlural["po_status"] := "po_statuses"
		
		pluralToSingular := {}
		
		for index, value in singularToPlural
			pluralToSingular[value] := index
		
	}
	
#if (Stack="18b") ; wizard 
	wizard()

#if (Stack="18a") ; functions

#if (prevWindowActive_g >= 1)

	^d:: myTT("sleep: ^d")
	^g:: myTT("sleep: ^g")
	!d:: myTT("sleep: !d")
	!g:: myTT("sleep: !g")

	handleDoubleS() {
		global
		if( allowDoubleS_g ) {
			allowDoubleS_g = 0
			resetModifiers()
			if(scaffold_mode_g) {
				; copy as separate elements
				resetModifiers()
				scaffold_output_mode = 0
				scaffoldSingle( scaffold_columns_g )
				myTT("copy as separate elements")
			} else
				saveCodeAndRefreshChrome()
		}
	}

	handleDoubleD() {
		global
		if( allowDoubleD_g ) {
			allowDoubleD_g = 0
			resetModifiers()
			if(scaffold_mode_g) {
				; set scaffold template
				oldClipboard := Clipboard
				waitClipboard()
				if(Clipboard="")
					Clipboard:=oldClipboard
				clip_two := Clipboard
				scaffold_template := Clipboard
				myTT("set scaffold template")
			} else
				consoleLog()
		}
	}
	
	peekPrevTab() {
		Send ^{Tab}
		;~ myTT("peekPrevTab: ")
		if(!prevWindowActive_g)
			prevWindowActive_g = 1
		
		sleep 200
		Loop  ; Since no number is specified with it, this is an infinite loop unless "break" or "return" is encountered inside.
		{
			if( GetKeyState("G", "P")) {
				prevWindowActive_g++
				if(prevWindowActive_g = 2) {
					;~ WinActivate, % "ahk_id " result.1
					;~ WinWaitActive, % "ahk_id " result.1, , 1
					
					
					;~ myTT("Ctrl: " prevWindowActive_g)
					
					Send {Ctrl Down}
					Send {Tab}
					Send +{Tab}
				} else if(prevWindowActive_g > 2) {
					;~ myTT("prevWindowActive_g: " prevWindowActive_g)
					;~ t := prevWindowActive_g - 1
					;~ Send ^{Tab}
					;~ Send {Ctrl Down}
					;~ Loop %t%
					;~ {
					;~ Send {Ctrl Down}
					Send {Tab}
					;~ }
					;~ Send {Ctrl Up}
				}
				
				sleep 150
			}
			
			if !GetKeyState("D", "P") {
				;~ myTT("sleep: ")
				if(prevWindowActive_g = 1) {
					Send ^{Tab}
				} else {
					Send {Ctrl Up}
				}
				
				break
			}
			sleep 10
		}
		prevWindowActive_g = 0
	}

	handleModifiers( key="", isDown = 0, isShift = 0 ){
		global
		local skip
		
		StringReplace, key, A_ThisHotkey, % " Up"
		key := RegExReplace(key, "^[^A-z 0-9]*([A-z 0-9]+).*", "$1")
		if( RegExMatch(key, "[^a-z]") )
			variablePrefix := "g_" ( key = " " ? "Space" : key )
		else
			variablePrefix := key
		
		
		time := A_DD * 24 * 3600 * 1000 + A_Hour * 3600 * 1000 + A_Min * 60 * 1000 + A_Sec * 1000 + A_MSec
		skip = 0
		if( (time - lastNonHotkeys_time_g) < 1500 and A_ThisHotkey != lastHotkeys_g)
		;~ if( lastNonHotkeys_time_g )
			skip = 1
		
		diff := time - lastNonHotkeys_time_g
		lastHotkeys_g := A_ThisHotkey
		
		
		
		if( !InStr(A_ThisHotkey, " Up") ){
			%variablePrefix%Pressed_g = 1
			if( !GetKeyState("Shift") )
				%variablePrefix%Pressed_g := 0
			if( GetKeyState("CapsLock", "T") )
				%variablePrefix%Pressed_g++
				
			if( key != "Space" ){
				if( %variablePrefix%Pressed_g = 1 )
					output := capitalCase(key)
				else
					output := key
			} else {
				output := " "
			}
			
			if(skip) {
				lastNonHotkeys_time_g := time
				
				;~ myTT(key " " skip " " key_output_buffer_g " " diff " " A_ThisHotkey " " modifier_active_g)
				if(!modifier_active_g){
					SendInput {Raw}%output%
				}else{
					key_output_buffer_g := key_output_buffer_g . output
				}
				return
			}
			
			key_output_buffer_g := key_output_buffer_g . output
			
			if( !%variablePrefix%Pressed_g )
				allowDouble%variablePrefix%_g = 0
			
			%variablePrefix%PressedAlone_g := 1
			%variablePrefix%Pressed_g := 1
			modifier_active_g++
			return
		}
		
		if( %variablePrefix%Pressed_g ){
			allowDouble%variablePrefix%_g = 1
			skip_g := skip
			handleUp()
			;~ SetTimer, handleUp, 1
		}
	}


	handleUp() {
		global
		local variablePrefix_l
		
		variablePrefix_l := variablePrefix
		
		SetTimer, handleUp, Off
		
		if(!skip_g and !prevWindowActive_g) {
			loop 50
			{
				if(!%variablePrefix_l%PressedAlone_g){
					break
				}
				sleep 10
			}
		}
		
		if(easy_typing_g and %variablePrefix_l%PressedAlone_g){
			lastNonHotkeys_time_g := time
			SendInput {Raw}%key_output_buffer_g%
		}
		key_output_buffer_g := ""
		modifier_active_g = 0
		checkKeyPressed()
	}

	checkKeyPressed() {
		global
		
		hotkeys := "abcdefghijklmnopqrstuvwxyz"
		loop, Parse, hotkeys
		{
			if(%A_LoopField%Pressed_g){
				if !GetKeyState(A_LoopField, "P")
					%A_LoopField%Pressed_g := 0
			}
		}
	}

	resetModifiers( ignoreKey = "", up = 1 ){
		global
		
		hotkeys := "abcdefghijklmnopqrstuvwxyz"
		loop, Parse, hotkeys
		{
			if( ignoreKey != A_LoopField )
				%A_LoopField%PressedAlone_g := 0
		}

		;~ if( ignoreKey != "s" )
			;~ sPressedAlone_g := 0
		;~ if( ignoreKey != "d" )
			;~ dPressedAlone_g := 0
		;~ if( ignoreKey != "f" )
			;~ fPressedAlone_g := 0
		;~ if( ignoreKey != "g" )
			;~ gPressedAlone_g := 0
		;~ if( ignoreKey != "l" )
			;~ lPressedAlone_g := 0
		;~ if( ignoreKey != "c" )
			;~ cPressedAlone_g := 0

		
		key_output_buffer_g := ""
		lastNonHotkeys_time_g = 0
		modifier_active_g = 0
		
		checkKeyPressed()
	}
		
		
	consoleLog() {
		global
		
		resetModifiers()
		
		if( WinActive("ahk_exe SciTE.exe") )
			runScaffold( "myTT(""? value1 ?`: "" ? value1 ?)`", Clipboard)
		else if( WinActive("\.py") or WinActive(".ipynb - Colab") )
			runScaffold( "print('? value1 ?`: ', ? value1 ?)", Clipboard)
		else if( WinActive("\.php") )
			runScaffold( "dd('? value1 ?`: ', ? value1 ?);", Clipboard)
		else if( WinActive("\.ctp") )
			runScaffold( "dd('? value1 ?`: ', ? value1 ?);", Clipboard)
		else
			runScaffold( "console.log('? value1 ?`: ', ? value1 ?)`;", Clipboard)
		
		waitSetClipboard(scaffold_row_g)
		Send ^v
	}
		
	toggleBetweenHotkeyAndTyping() {
		global
		time := A_DD * 24 * 3600 * 1000 + A_Hour * 3600 * 1000 + A_Min * 60 * 1000 + A_Sec * 1000 + A_MSec
		skip = 0
		if( (time - lastNonHotkeys_time_g) < 1500) {
		;~ if( lastNonHotkeys_time_g ) {
			lastNonHotkeys_time_g := 0
			MyTT("Hotkey")
		} else {
			lastNonHotkeys_time_g := time
			MyTT("Typing")
		}
	}

	copyWordsAsSeperateElements() {
		global
		resetModifiers()
		Send ^a
		waitClipboard()
		
		Clipboard := RegExReplace(Clipboard, "\W+", "`n")
		
		goToEndOfCliplist()
		encodeAsSingleElement = 0
		mergeClipboard(0, 0, encodeAsSingleElement)
		Send {Esc}a
		scaffold_output_mode = 1
		
		;~ scaffoldSingle( scaffold_columns_g, 1, 1 )
	}
		
	copy() {
		global
		resetModifiers()
		goToEndOfCliplist()
		scaffold_output_mode = 0
		scaffoldSingle( scaffold_columns_g, 1, 1 )
		resetModifiers()
	}
		
	shareCodeToSocialMedia() {
		resetModifiers()
		waitClipboard(1, 0, 1)
		runScaffold( "``````js`n? value1 ?`n```````n", Clipboard)
		Send ^v
	}
	
	reloadVueFile() {
		;~ waitSetClipboard("")
		Clipboard=
		Send ^k
		Send ^+c
		waitClipboard(0)
		path := Clipboard
		StringSplit, path, path, \
		StringReplace, path, path, \, /, All
		Clipboard := path
		
		;~ waitPixel(-1, -1, 312, 660, "0xF36E1B", 0)
		;~ waitPixel(-1, -1, 312, 747, "0xF36E1B", 0)
		;~ 683
		;~ - 683 + 644
		y1 := 747
		y2 := 697 - 683 + y1
		y3 := 651 - 661 + y1
		y4 := 751 - 708 + y1
		y5 := 882 - 708 + y1
		y6 := 911 - 708 + y1
		y7 := 859 - 708 + y1
		y8 := 861 - 699 + y1
		y9 := 857 - 708 + y1
		y10 := 901
		y11 := 725 - 708 + y1
		
		requireWinActive("ahk_exe chrome.exe")
		Sleep 100
		requireWinActive("ahk_exe Code.exe")
		Sleep 100
		
		if(requireWinActive("ahk_exe chrome.exe")){
			Click 314, %y3% ; network tab
			MouseMove, 1, 1
			
			if(waitPixel(-1, -1, 310, y1, "0xF36E1B", 0)){
				
				PixelGetColor, color, 258, %y11% ; 0xFFFFFF
				if(color = 0xFFFFFF){
					Click 256, %y2% ; disable cache
				}

				Click 167, %y4% ; filter query
				Send ^v
				Sleep 500
				;~ return
				MouseMove 68, %y5% ; click request
				Click Right
				
				;~ waitPixel(-1, -1, 1847, y9, "0xFAF2ED", 0)
				
				
				;~ waitSetClipboard("")
				Clipboard=
				Sleep 500
				
				Send {Down 5}
				Send {Right}
				Send {Enter}
				
				;~ waitPixel(-1, -1, 933, y9, "0xF6E8E0", 0)
				
				;~ PixelGetColor, color, 541, %y8% ; 0xFFFFFF
				;~ if(color != 0xF36E1B){
					;~ Sleep 100
					;~ MouseMove 543, %y7%	
					;~ Click 543, %y7% ; Headers tab
				;~ }
				;~ MouseMove, 1, 1
				;~ waitPixel(-1, -1, 541, y8, "0xF36E1B", 0)
				;~ MouseMove 541, %y8% ; 
				;~ MouseMove 750, %y6% ; Request URL
				;~ Click, 2
				;~ Send +{End}
				waitClipboard(0)

				fetch = fetch("%Clipboard%"`, {`n  "headers"`: {`n    "sec-ch-ua"`: "\"Chromium\"`;v=\"122\"`, \"Not(A`:Brand\"`;v=\"24\"`, \"Google Chrome\"`;v=\"122\""`,`n    "sec-ch-ua-mobile"`: "?0"`,`n    "sec-ch-ua-platform"`: "\"Windows\""`n  }`,`n  "referrer"`: "https`://localhost`:5173/resources/js/src/components/mails/modals/CreateIndividualModal.vue"`,`n  "referrerPolicy"`: "strict-origin-when-cross-origin"`,`n  "body"`: null`,`n  "method"`: "GET"`,`n  "mode"`: "cors"`,`n  "credentials"`: "omit"`n})`;
				Clipboard := fetch
		
				Click 185, %y3% ; console tab
				MouseMove, 1, 1
				if(waitPixel(-1, -1, 185, y1, "0xF36E1B", 0)){
					Send ^v
					Send {Enter}
					Click 314, %y3% ; network tab
					MouseMove, 1, 1
					if(waitPixel(-1, -1, 310, y1, "0xF36E1B", 0)){
						Click 256, %y2% ; enable cache
						Send {F5}
						Sleep 100
						;~ PixelGetColor, color, 903, %y10% ; 0xFFFFFF
						;~ if(color = 0xF6E8E0){
							Send {Esc}
							Sleep 100
						;~ }
						waitPixel(-1, -1, 236, 113, "0xFFFFFF", 0)
						Sleep 1000
						waitPixel(-1, -1, 236, 113, "0x595102", 0)
				
						PixelGetColor, color, 258, %y11% ; 0xFFFFFF
						if(color = 0xFFFFFF){
							Click 256, %y2% ; disable cache
							Sleep 100
						}
						Click 185, %y3% ; console tab
					}
				}
			}
		}
	}

	handleF1(){
		IfWinActive, freeCodeCamp
		{
			; freeCodeCamp Submit
			Send {Ctrl Down}{Enter}{Ctrl Up}
			Sleep 200
			Send {Ctrl Down}{Enter}{Ctrl Up}
			Sleep 200
			Send {Ctrl Down}{Enter}{Ctrl Up}
			Sleep 200
			Send {Ctrl Down}{Enter}{Ctrl Up}
			Sleep 200
			Send {Ctrl Down}{Enter}{Ctrl Up}
			Sleep 200
			Send {Ctrl Down}{Enter}{Ctrl Up}
		} else {
			goToReference()
		}
	}

	displayShortcutList(){
		WinActivate, Decision Tree v2 ahk_class AutoHotkeyGUI

		Loop 
		{
			accent := 0
			alt := 0
			
			if !GetKeyState("D", "P")
			break
			sleep 10
		}
		
		shiftwin(2)
		WinGet, currWin, ID, A
		WinGet, ExStyle, ExStyle, ahk_id %currWin%
		ExStyle:=(ExStyle & 0x8)
		WinSet, AlwaysOnTop, On, ahk_id %currWin%
		
		shiftwin(4)
		shiftwin(4)
		shiftwin(1)
		
		if(ExStyle=0)
			WinSet, AlwaysOnTop, Off, ahk_id %currWin%
	}

	htmlTagExpander() {
		; HTML tag expander
		Send {Ctrl Down}{Shift Down}{Left}{Shift Up}{Ctrl Up}
		Sleep 100
		clipBkp := Clipboard
		waitClipboard()
		; create HTML tag
		Clipboard := "<" Clipboard " id="""" class="""">" "</" Clipboard ">"
		Sleep 500
		Send ^v
		Sleep 500
		Send {Ctrl Down}{Left}{Ctrl Up}{Left 2} 
		Clipboard := clipBkp
	}

	loadStacks(){
		global
		coreStacks:= "disable xdebug,14v;gems workspace git issue board,18x;Go to previous window,15o,p;lower case,15ag;none,11n;excel scratch,16o,e;Send datetime,15a,t;generic clipFetch,15e,get value;Request in chrome to javascript,15i,js;scaffolding mode,15am,s;clipLoad,15af;camelCase,15p;send raw clipboard,15q;Toggle Always on top,15r;needle in haystack finder,15s;make/undo file or folder read-only system hidden,15t;replace blank lines,15u;load new search configuration from external file,15v;CapitalCamelCase,15w;snake_case,15x;Toogle Hide Window,15ac;Get First 50000 characters,15ad;fetchRow,15ae,get;Title case,15ah;All Title Case,15ai;CAPITAL CASE,15aj,upper;Go to reference,15ak;clipwait,15al;merge multi-line element,15bh;create new stack,15bo,make;go to end of clipList,11o;clear clipList,11p;set value0,11q;restore clipList_A_Index,11r;prices,11t;snake-case-with-hyphen,11v;Remove useless text with regex,11w;edirectory,12b;Remove Lines,12i;RequireWinActive,13f;Check File Size,13i;"
		personalStacks:= "r,12r;c,12v;a,11y;right click,13m;records mv notes,14b;"
		infrequentStacks:= "Untick checkboxes,11b;Remove network adapters,11f;Copy coordinates in Corel Draw,11m;200k TTS characters to soleasia,11s,100;grab links from chrome,11x;go to next folder,12c;telnet,12h;Export SEFM members,12j;Adjust numbers,12l;screenshot chrome,12n;mouse click,12u;string replace,12x;windows start menu directory,12q;git remote add origin,13k;windows host file,13o;gitlab git.egov.mv,14d;"
		soleAsiaStacks:= "Add Property,15b;Add Room,15c;tick property amenitites,15d;tick room amenities,15f;Download images,15g;Fill property template,15h;create a property,15j;Create Fake Room,15n;Get Property Amenities from SoleAsia,11c;get room amenities list,11d;Get Room Information,11e;get room amenities from soleasia,11g;Get Property Information,11h;Get Property amenities list,11i;Get image list,11j;Get property information from SoleAsia,11k;Open each room type,11l;convert to property function,15bn;save property description with raw html,12d;make number of rooms 0,12e;filter sent emails in gmail,12f;delete photos from SoleAsia,12k;property images from booking.com,13d;"
		seleniumStacks:= "run selenium test,15k;install seleniumjs,15aa;"
		jsStacks:="console log,15l;jquery ready,13c;map.js npm node,13g;"
		ttsStacks:= "Grab Articles for TTS Reader mode,15m;"
		eCouncilStacks:= "push eCouncil to git,15y;eCouncil training URL,15z;purify,11z;new role,13j;ecouncil roles,13l;"
		gitStacks:= "Git commands,15ab;Git GUI,11a;Git export log to csv,12g;"
		laravelStacks:= "laravel make events,15an;laravel make notification,15ao;laravel make test,15ap;laravel refresh classes,15ar;laravel refresh database seed,15as,db;laravel run a specific seeder,15at;laravel clear configuration,15au;laravel create policy,15av;laravel test increase memory limit,15aw;laravel dd session,15ax;laravel run selected test,15ay;laravel remove block comments,15az;laravel add block comments,15ba;laravel open test output in chrome,15be;request in chrome to laravel,11u;php var_dump to console,12o;php null check,12p;laravel make migration,12s;tailwind website,13p;deploy case management,13q;mysql mode,13r;SQLite,13s;laravel pretend migrate,13t;laravel seed db,13u;laravel clear view cache,13v;composer dump autoload,13w;dump laravel data,13x;livewire docs,14c;php,14n;data to seeder,14r;php artisan optimize:clear,14y;"
		nodeJsStacks:= "regenerate js and css,15bb,npm run watch;chai builder tailwinds,14i;tailwinds themeforest,14j;"
		sisStacks:= "SIS Agency User,15bf;push MakudiOnline to git,12m;SIS Admin User,13a;"
		chromeStacks:= "Sample login page,15bg;"
		etukuriStacks:= "laravel test assert success,15bj;laravel test assert fail,15bk;laravel form field,15bl;database seeder changes,15bi;laravel scaffolding with generators,12t;"
		cSharpStacks:= "c# use dbcontext,15bm;"
		sheriStacks:= "sheri bandwidth usage,12y;clock in to SalonIris,12z;"
		fileZillaStacks:= "filezilla convert local path to ftp path,12w;"
		sublimeStacks:= "add watch expression to xdebug in sublime,12a;"
		yiiStacks:= "yii app end,13b;yii base url,13e;"
		vbStacks:= "c# to vb,13h;"
		phpStacks:= "phpMyAdmin,13y;tailwinds docs,13z;laravel docs,14a;"

		ncitStacks := ncitStacks "case manager local,17c;"
		ncitStacks := ncitStacks "case manager docker,16t;"
		ncitStacks := ncitStacks "case manager local mix,14k;"
		ncitStacks := ncitStacks "case TE,17d;teams,14f;otrs demo,14g;outlook,14h;gemen online local,14l;gemen local,14m;hero icons,14o;gemen online TE,14p;eCouncil DB scripts,14q;composer custom php,14s;laravel run tests,14t;laravel test run group,14u;enable xdebug,14w;php ini,14x;mysql general_log,17g;TR alerts,14z;git reset,16a;gitlab,16b;phpmyadmin,16c;apache vhost,16d;gts,16e;dev otp,16f;ahk array,16g;merge fonts,16h;rtl iyyu-normal,16i;localization,16j;docker,16k;db seed with initial data,16l;ncit laravel/api getting started,16m;sentry,16n;httpd-xampp.conf,16p;make case role seeder,16q;db scripts to production,16r;ecouncil TE error log,16s;docker sail up,16u;case manager wireframe figma,14e;sync to case gitlab,16v;sync from case gitlab,16w;sync to ecouncil gitlab,16x;sync folders,15bd;wsl --shutdown,16y;gitkraken,16z;assign drive letter to network path,17a;npx mix watch,17b;dev purchase requests,17e;excel cell to single line,17f;GEMS API local,17h;GEMS file erd,17i;old folder,17j;ncit network ip settings,17k;htdocs,17l;ecouncil git,17m;ffmpeg concat video files,17n,merge join;ecouncil db,17o;ecouncil prod deployment,17p;clear mysql log,17q;reposition,17r;job application,17s;snap,17t;click and preserve mouse position,17u;repeat Command In Vscode,17v;remove surrounding quotes,17w;init DB Fields,17x;some random ip,17y;kill process,17z;functions,18a;wizard,18b;singular to plural,18c;table name,18d;array has value,18e;vuejs template,18f;primevue,18g;550 character for translation,18h;ahk github,18i;scoop install programs,18j;traefik,18k,traffic;gems workspace,18l;xampp SSL,18m;xampp multiple php versions,18n;gems db,18o;npm run dev,18p;gems2 old,18q;vue import component,18r;aws amazon builder id,18s;" newStacks


		allStacks:= coreStacks personalStacks infrequentStacks soleAsiaStacks seleniumStacks jsStacks ttsStacks eCouncilStacks gitStacks laravelStacks nodeJsStacks sisStacks chromeStacks etukuriStacks cSharpStacks sheriStacks fileZillaStacks sublimeStacks yiiStacks vbStacks phpStacks ncitStacks "swap css colors,15bc;gems user,13n;"

		zStacks:= allStacks
	}


	iniClipList(){
		global
		;~ iniClipList= one`t`ttwo`n`nthree`tfour`n
		if(iniClipList != ""){
			clipList .= "`n" iniClipList
		}
	}

	g_configurations(){
		global
				
		;~ g_configurations:= "location, lastBackupDate, laravel_test_filter, clip_two, Stack, Picture, clipList, clipList_A_Index, scaffold_template, lastClockInDate, g_roomtypes, g_propertynames, ecouncil_role_id, ecouncil_action_id"
		g_configurations:= "location, WindowList_global_updated_at,lastBackupDate, laravel_test_filter, clip_two, Stack, Picture, clipList_A_Index, scaffold_template, lastClockInDate, g_roomtypes, g_propertynames, ecouncil_role_id, ecouncil_action_id, ecouncil_navigation_link_id, case_permission_id"

		g_configurations := g_configurations ", dbCache_users, dbCache_cases, dbCache_organisations, dbCache_organisation_types, dbCache_countries, dbCache_teams, dbCache_statuses, dbCache_channels, dbCache_priorities, dbCache_communications, dbCache_case_item_types, dbCache_gender_types, dbCache_tasks, dbCache_case_users, dbCache_case_user_types, dbCache_primaryKey_users, dbCache_primaryKey_cases, dbCache_primaryKey_organisations, dbCache_primaryKey_organisation_types, dbCache_primaryKey_countries, dbCache_primaryKey_teams, dbCache_primaryKey_statuses, dbCache_primaryKey_channels, dbCache_primaryKey_priorities, dbCache_primaryKey_communications, dbCache_primaryKey_case_item_types, dbCache_primaryKey_gender_types, dbCache_primaryKey_tasks, dbCache_primaryKey_case_users, dbCache_primaryKey_case_user_types, dbCache_individuals, dbCache_primaryKey_individuals, dbCache_task_statuses, dbCache_primaryKey_task_statuses, dbCache_electronic_signatures, dbCache_primaryKey_electronic_signatures, dbCache_model_types, dbCache_primaryKey_model_types, dbCache_roles, dbCache_primaryKey_roles, dbCache_permissions, dbCache_primaryKey_permissions, dbCache_role_permission, dbCache_primaryKey_role_permission, dbCache_user_role, dbCache_primaryKey_user_role, dbCache_audits, dbCache_primaryKey_audits, dbCache_activity_log, dbCache_primaryKey_activity_log, dbCache_confidentiality_classes, dbCache_primaryKey_sensitivities, dbCache_tags, dbCache_primaryKey_tags, dbCache_checklists, dbCache_primaryKey_checklists, dbCache_comments, dbCache_primaryKey_comments, dbCache_task_tags, dbCache_primaryKey_task_tags, dbCache_task_users, dbCache_primaryKey_task_users, dbCache_id_types, dbCache_primaryKey_id_types, dbCache_addresses, dbCache_primaryKey_addresses, dbCache_attachments, dbCache_primaryKey_attachments, dbCache_notifications, dbCache_primaryKey_notifications, dbCache_notification_types, dbCache_primaryKey_notification_types, dbCache_data_source_types, dbCache_primaryKey_data_source_types" new_g_configurations
		
		load_g_configurations()
	}
	
	load_g_configurations(){
		global
		StringReplace, g_configurations, g_configurations, %A_Space%, , All
		StringSplit, g_configurations, g_configurations, `,
		Loop, read, %A_ScriptDir%\PWT_v2.ini
		{
			if(A_Index = 1 or Trim(A_LoopReadLine) = "" or StrLen(A_LoopReadLine) < 3 )
				continue
			
			p := InStr( A_LoopReadLine, "=")
			n := SubStr(A_LoopReadLine, 1, p-1)
			v := SubStr(A_LoopReadLine, p+1)
			a := A_Index
			
			t := n
			%t% := decodeLinesAndTabs(v)
			
			;~ if(t = "scaffold_template")
				;~ t := t
			
			; remove everything after end marker (useless content which comes out of no where)
			StringSplit, %t%, %t%, % Chr(251)
			%t% := %t%1
			%t%backup := %t%
		}
		
		if(location = "ERROR")
			MsgBox Could not load location
	}


#if (Stack="17x") ; init DB Fields 

	init_DB_Fields( loadName = 1, cache = 1){
		global modelName, DB_Fields, singularToPlural, pluralToSingular, singular, fields, table_name_singular, table_name_plural, primary_key, primary_key_row
		
		if( loadName )
			currentTableName()
		
		singular := processCamelCase( singular )

		load_singularToPlural()
		
		result := singularToPlural[singular]
		if(result){
			plural := result
		}else{
			result := pluralToSingular[singular]
			if(result){
				plural := singular
				singular := result
			}else{
				singular := toSingular( singular )
				plural := toPlural( singular )
			}
		}
		
		table_name_singular := singular
		table_name_plural := plural
			
		modelName := singular "`t" plural
		
		DB_Fields := getGlobal("dbCache_" plural)
		
		primary_key_row := getGlobal("dbCache_primaryKey_" plural)
		StringSplit, primary_key_row, primary_key_row, `t
		primary_key := primary_key_row1
		
		if(!DB_Fields or !cache){
			dataTypes := getDataTypesByHttp()
			if(dataTypes){
				relations := getRelationsByHttp()
				DB_Fields := mergeDataTypesAndRelationships(dataTypes, relations)
				setGlobal("dbCache_" plural, DB_Fields)
			} else {
				setGlobal("dbCache_" plural, 1)
			}
		}
			
		fields := load_fields()
		specificFieldsArr()
	}

	
#if (Stack="17w") ; remove surrounding quotes 
	`::
		waitClipboard()
		StringSplit, Clipboard, Clipboard, `n, `r
		Clipboard=
		
		Loop %Clipboard0%
		{
			t := RegExReplace(Clipboard%A_Index%, "i)^[^""]*""([^""]*)"".*", "$1")
			if(t != Clipboard%A_Index%)
				Clipboard .= t "`n"
			
		}
		Send ^v
	return
	
#if (Stack="17v") ; repeat Command In Vscode 
	`:: repeatCommandInVscode()
	
	repeatCommandInVscode(){
		if( WinActive("ahk_exe Code.exe") or WinActive("ahk_exe sublime_text.exe") ){
			; repeat previous command in vscode
			Click 1878, 965
			Sleep 100
			Click 1878, 965
			Sleep 100
			Send {Up}
			Sleep 100
			Send {Enter}
		}
	}

	
#if (Stack="17u") ; click and preserve mouse position 
	`::
		MouseGetPos, MouseX, MouseY
		Click 1762, 169
		MouseMove, %MouseX%, %MouseY%
	return
	
#if (Stack="17t") ; snap 
	`::
		;snap
		WinWait, BlueStacks App Player, 
		IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
		WinWaitActive, BlueStacks App Player, 
		
		Loop 100 {
			
			Click 825, 181
			;~ waitPixel(-1, -1, 682, 89, "0x3C3631", 0)
			Sleep 1000
			Click 980, 91
			Sleep 1000
			Click 1188, 85
			Sleep 1000
			Click 791, 666
			Sleep 1000
			Click 773, 892
			Sleep 1000
			Click 1002, 558
			Sleep 3000
			;~ Click 1002, 558
			;~ Sleep 100
			Click 695, 85
			Sleep 1000
			Click 684, 86
			Sleep 1000
		}
	return
	
#if (Stack="17r") ; reposition 
	`::
		Send {Enter}
		waitClipboard()
		Send {Esc}
		
		if( requireWinActive("ahk_exe Code.exe") ){
			Send ^!l
			Sleep 100
			Send ^f
			Sleep 100
			Send {Enter}
			Sleep 100
			;~ Send {F3}
			;~ Sleep 100
			;~ Send +{F3}
			Sleep 100
			Send {Esc}
			Send {Home}
			
			Send +{End}
			
			Send ^v
			Sleep 500
			Send {Left 2}
			Send `, 1
			Send ^!l
		}
	return
	
	
#if (Stack="17q") ; clear mysql log 
	`::
		file := "C:\xampp\mysql\data\DESKTOP-RUJA87S.log"
		content:= ""
		fileWrite( content, file )
  	return
	
#if (Stack="17p") ; ecouncil prod deployment 
	^1::
		Clipboard=sudo ls`n%clip_two%`n
		myTT("sudo ls and password")
	return
	
	^2::
		Clipboard=cd /var/www`nsudo rm eCouncil.zip`nsudo zip -r eCouncil.zip eCouncil`n
		myTT("backup")
	return
	
	^3::
		Clipboard=cd /var/www`nsudo service apache2 stop`nsudo chown -R admin_hammadh`:www-data eCouncil`nsudo chmod -R 755 eCouncil`nsudo rm -r /var/www/eCouncil/web/protected/runtime/views/*`n
		myTT("stop server")
	return
	
	^4::
		Clipboard=sudo chown -R www-data`:www-data eCouncil/web/protected/runtime`nsudo chown -R www-data`:www-data eCouncil/web/assets`nsudo service apache2 start
		myTT("start server")
	return
	
	`::
		folder := "F:\Old desktop\PHPFromProd\" A_yyyy "\" A_yyyy "-" A_MM "-" A_DD
		FileCreateDir, % folder
		run, %folder%
	return
	
	^`::
		Run cmd
		WinWaitActive, ahk_exe cmd.exe
		t := A_yyyy "-" A_MM "-" A_DD
		Send cd /D F:\Old desktop\PHPToProduction\%t%\eCouncil{Enter}
		Send git pull{Enter}
	return
#if (Stack="17f") ; excel cell to single line 
	`::
		Clipboard=
		waitClipboard()
		clip_bkp := Clipboard
		
		Send {Esc}
		Sleep 500
		
		Clipboard=
		waitClipboard()
		Clipboard := clip_bkp
		Sleep 500
		
		StringReplace, Clipboard, Clipboard, `", , All
		Clipboard := Trim(Clipboard)
		StringReplace, Clipboard, Clipboard, `n, , All
		StringReplace, Clipboard, Clipboard, `r, , All
		Send ^v
		Sleep 500
		Send {Down}
		return
	return
	
#if (Stack="16x") ; sync to ecouncil gitlab 
	`::
		Source=C:\xampp\htdocs\ecouncil\ecouncil
		Destination=C:\xampp\htdocs\eCouncil-gitlab\web
		synchronizeFoldersOneWay(Source, Destination, "O") ; overwrite modifications

		MyTT("Done Synching")
		MyTT("Done Synching")
		MsgBox Done Synching
	return
	
#if (Stack="16w") ; sync from case gitlab 
	`::
		Source=\\wsl.localhost\Ubuntu\home\hammadh\code\ncit\gems\app\resources
		Destination=C:\xampp\htdocs\gems-ws-app\resources
		synchronizeFoldersOneWay(Source, Destination, "O") ; overwrite modifications

		MyTT("Done Synching")
		MyTT("Done Synching")
		MsgBox Done Synching
	return
	
#if (Stack="16v") ; sync to case gitlab 
	`::
		;~ Source=C:\xampp\htdocs\viyaFSM
		;~ Destination=C:\xampp\htdocs\case-manager
		;~ synchronizeFoldersOneWay(Source, Destination, "O") ; overwrite modifications
		
		Source=C:\xampp\htdocs\case-manager
		Destination=C:\xampp\htdocs\case-manager-gitlab
		synchronizeFoldersOneWay(Source, Destination, "O") ; overwrite modifications

		MyTT("Done Synching")
		MyTT("Done Synching")
		MsgBox Done Synching
	return
	
#if (Stack="16q") ; make case role seeder 
	`::
		Clipboard=
		waitClipboard()
		StringSplit, Clipboard, Clipboard, `n, `r
		
		output=
		id=0
		Loop %Clipboard0% {
			i := Clipboard%A_Index%
			StringSplit, ClipboardB, Clipboard%A_Index%, `t
			
			outer_index := A_Index
			
			cnt := ClipboardB0
			startColumn := 21
			Loop %cnt% {
				if(A_Index < startColumn)
					continue
				
				if(A_Index > startColumn + 7)
					continue
				
				i := ClipboardB%A_Index%
				
				id := A_Index - startColumn + 1
				
				if(trim(i) = "y")
					output := output ClipboardB1 "`t" id "`n"
			}
		}
		Clipboard := output
		myTT(output)
	return
	
	;~ `::
		Clipboard=
		waitClipboard()
		StringSplit, Clipboard, Clipboard, `n, `r
		
		output=
		id=0
		Loop %Clipboard0% {
			i := Clipboard%A_Index%
		
			if( Mod(A_Index, 2) = 1)
				id++
			
			;~ ;if(A_Index = 9)
				;~ ;id--
				
			if(trim(i) != "")
				output := output id "`n"
		}
		Clipboard := output
		myTT(output)
	return
	
#if (Stack="16j") ; localization 
	`::
		Clipboard=
		waitClipboard()
		
		scaffold_template={{ __('? value1 ?') }}
		if( InStr(Clipboard, "'") or InStr(Clipboard, """") )
			scaffold_template=__(? value1 ?)

		printUsingScaffold( "C", 1, -1) ; scaffold single
	return
	
#if (Stack="14r") ; data to seeder 
	`::
		Send ^a
		Sleep 100
		Clipboard=
		waitClipboard()
		StringReplace, Clipboard, Clipboard, +, , All
		Clipboard := RegExReplace(Clipboard, "i)(.*[""].*)", "$1,") ; put comma at end
		StringReplace, Clipboard, Clipboard, ":, " =>, All
		StringReplace, Clipboard, Clipboard, T00:00:00.000000Z, , All
		Clipboard := RegExReplace(Clipboard, "i).*[{].*", "  [")
		StringReplace, Clipboard, Clipboard, }, ]`,, All
		Clipboard := RegExReplace(Clipboard, "i).*for_editing.*", "")
		Clipboard := RegExReplace(Clipboard, "i).*array.*", "[")
		Clipboard := RegExReplace(Clipboard, "i)(\d{4}[-]\d{2}[-]\d{2})T(\d{2}[:]\d{2}[:]\d{2})[.]\d{6}Z", "$1 $2")
		Clipboard := RegExReplace(Clipboard, "i).*created_by.*", "    ""created_by"" => 1,")
		Clipboard := RegExReplace(Clipboard, "i).*updated_by.*", "    ""updated_by"" => 1,")
		
		Clipboard := replaceBlankLines(0, Clipboard)
  	return
	
#if (Stack="13t") ; laravel pretend migrate 
	`::
		file =C:\xampp\htdocs\gems-ws-api\migrate.sql
		command:= "C:\xampp\php\php artisan migrate --pretend --no-ansi > " file
		RunWait %comspec% /c "%command%", C:\xampp\htdocs\gems-ws-api
		
		FileRead, content, %file%
		;~ StringReplace, content, content, `}); // group end, %route%`}); // group end
		content := RegExReplace(content, ".*:", "")
		content := RegExReplace(content, "(.*)", "$1;")
		StringReplace, content, content, `;`;, `;, All
		StringReplace, content, content, `r, , All
		StringReplace, content, content, `n;, `n, All
		
		FileDelete, %file%
		FileAppend, %content%, %file%
	return
	
#if (Stack="13s") ; SQLite 
	`::
		file := "C:\xampp\htdocs\gems-ws-api\.env"
		content := "APP_NAME=Case-Manager`nAPP_ENV=local`nAPP_KEY=base64`:Jx7g4xVsDQ6t3cyiacsDmuDgkhvqQi2ICgGh8cFevYA=`nAPP_DEBUG=true`nAPP_URL=http`://case-manager.test`n`nLOG_CHANNEL=stack`nLOG_DEPRECATIONS_CHANNEL=null`nLOG_LEVEL=debug`n`nDB_CONNECTION=sqlite`nDB_DATABASE=C`:\xampp\htdocs\case-manager\database.sqlite`n`n#DB_CONNECTION=mysql`n#DB_DATABASE=case_manager`nDB_HOST=127.0.0.1`nDB_PORT=3306`nDB_USERNAME=root`nDB_PASSWORD=`n`nBROADCAST_DRIVER=log`nCACHE_DRIVER=file`nFILESYSTEM_DISK=local`nQUEUE_CONNECTION=sync`nSESSION_DRIVER=file`nSESSION_LIFETIME=120`n`nMEMCACHED_HOST=127.0.0.1`n`nREDIS_HOST=127.0.0.1`nREDIS_PASSWORD=null`nREDIS_PORT=6379`n`nMAIL_MAILER=smtp`nMAIL_HOST=mailhog`nMAIL_PORT=1025`nMAIL_USERNAME=null`nMAIL_PASSWORD=null`nMAIL_ENCRYPTION=null`nMAIL_FROM_ADDRESS=""hello@example.com""`nMAIL_FROM_NAME=""${APP_NAME}""`n`nAWS_ACCESS_KEY_ID=`nAWS_SECRET_ACCESS_KEY=`nAWS_DEFAULT_REGION=us-east-1`nAWS_BUCKET=`nAWS_USE_PATH_STYLE_ENDPOINT=false`n`nPUSHER_APP_ID=`nPUSHER_APP_KEY=`nPUSHER_APP_SECRET=`nPUSHER_APP_CLUSTER=mt1`n`nMIX_PUSHER_APP_KEY=""${PUSHER_APP_KEY}""`nMIX_PUSHER_APP_CLUSTER=""${PUSHER_APP_CLUSTER}""`n"
		
		
		FileDelete, %file%
		FileAppend, %content%, %file%
	return
	
#if (Stack="13r") ; mysql mode 
	`::
		file := "C:\xampp\htdocs\gems-ws-api\.env"
		content := "APP_NAME=Case-Manager`nAPP_ENV=local`nAPP_KEY=base64`:Jx7g4xVsDQ6t3cyiacsDmuDgkhvqQi2ICgGh8cFevYA=`nAPP_DEBUG=true`nAPP_URL=http`://case-manager.test`n`nLOG_CHANNEL=stack`nLOG_DEPRECATIONS_CHANNEL=null`nLOG_LEVEL=debug`n`n#DB_CONNECTION=sqlite`n#DB_DATABASE=C`:\xampp\htdocs\case-manager\database.sqlite`n`nDB_CONNECTION=mysql`nDB_DATABASE=case_manager`nDB_HOST=127.0.0.1`nDB_PORT=3306`nDB_USERNAME=root`nDB_PASSWORD=`n`nBROADCAST_DRIVER=log`nCACHE_DRIVER=file`nFILESYSTEM_DISK=local`nQUEUE_CONNECTION=sync`nSESSION_DRIVER=file`nSESSION_LIFETIME=120`n`nMEMCACHED_HOST=127.0.0.1`n`nREDIS_HOST=127.0.0.1`nREDIS_PASSWORD=null`nREDIS_PORT=6379`n`nMAIL_MAILER=smtp`nMAIL_HOST=mailhog`nMAIL_PORT=1025`nMAIL_USERNAME=null`nMAIL_PASSWORD=null`nMAIL_ENCRYPTION=null`nMAIL_FROM_ADDRESS=""hello@example.com""`nMAIL_FROM_NAME=""${APP_NAME}""`n`nAWS_ACCESS_KEY_ID=`nAWS_SECRET_ACCESS_KEY=`nAWS_DEFAULT_REGION=us-east-1`nAWS_BUCKET=`nAWS_USE_PATH_STYLE_ENDPOINT=false`n`nPUSHER_APP_ID=`nPUSHER_APP_KEY=`nPUSHER_APP_SECRET=`nPUSHER_APP_CLUSTER=mt1`n`nMIX_PUSHER_APP_KEY=""${PUSHER_APP_KEY}""`nMIX_PUSHER_APP_CLUSTER=""${PUSHER_APP_CLUSTER}""`n"
		
		
		FileDelete, %file%
		FileAppend, %content%, %file%
	return
	
#if (Stack="13q") ; deploy case management 
	`::
		Click 70, 284
		Send {Home}
		Send {Down}
		Send {Down}
		Send {Down}{Space}
		Send {CtrlDown}
		
		Send {Down}
		Send {Down}{Space}
		Send {Down}{Space}
		Send {Down}{Space}
		Send {Down}{Space}
		Send {Down}
		Send {Down}{Space}
		Send {Down}{Space}
		Send {Down}{Space}
		Send {Down}
		
		Send {CtrlUp}
	return
	
	^`::
		Click 692, 235
		Sleep 100
		
		Send {Home}
		Send {Down}
		Send {Down}{Space}
		Send {CtrlDown}
		
		Send {Down}
		Send {Down}{Space}
		Send {Down}{Space}
		Send {Down}{Space}
		Send {Down}{Space}
		;~ Send {Down}
		Send {Down}{Space}
		Send {Down}{Space}
		Send {Down}{Space}
		Send {Down}
		
		Send {CtrlUp}
	return
	
#if (Stack="13m") ; right click 
	+`::
		;~ Send {NumLock}
		;~ Sleep 100
		;~ Click 3811, 1149
		;~ Click 2
	;~ return
	
		;~ Click 2
		Click right
	return
	
	
	`::
		MouseClick, left,,, 1, 0, D  ; Hold down the left mouse button.
		Loop
		{
			Sleep, 100
			GetKeyState, state, ``, P
			if state = U  ; The key has been released, so break out of the loop.
				break
			; ... insert here any other actions you want repeated.
		}
		MouseClick, left,,, 1, 0, U  ; Release the mouse button.
	return
	
	^`:: Click, 2

#if (Stack="13j") ; new role 
	`::
		ecouncil_role_id += 1
		ecouncil_action_id += 1
		scaffold_template := "INSERT INTO ``actions`` (``action_id```, ``controller_action```, ``description```, ``name```, ``active``) VALUES (" ecouncil_action_id "`, '? value1 ?'`, NULL`, NULL`, 1)`;`nINSERT INTO ``roles`` (``role_id```, ``role_key```, ``name```, ``description```, ``parent_role_id```, ``is_system_role```, ``context_id```, ``operation_log_id``) VALUES (" ecouncil_role_id "`, '? value1 ?'`, '? value1 ?'`, '? value1 ?'`, NULL`, 0`, 1`, NULL)`;`nINSERT INTO ``role_action``(``role_id```, ``action_id``) VALUES (" ecouncil_role_id "`, " ecouncil_action_id ")`;`n`n`n"
		printUsingScaffold("C")
	return
	
	+`::
		ecouncil_action_id += 1
		scaffold_template := "INSERT INTO ``actions`` (``action_id```, ``controller_action```, ``description```, ``name```, ``active``) VALUES (" ecouncil_action_id "`, '? value1 ?'`, NULL`, NULL`, 1)`;`nINSERT INTO ``role_action``(``role_id```, ``action_id``) VALUES (roleID`, " ecouncil_action_id ")`;`n`n`n"
		printUsingScaffold("C")
	return
	
	!`::
		ecouncil_role_id += 1
		scaffold_template := "INSERT INTO ``roles`` (``role_id```, ``role_key```, ``name```, ``description```, ``parent_role_id```, ``is_system_role```, ``context_id```, ``operation_log_id``) VALUES (" ecouncil_role_id "`, '? value1 ?'`, '? value1 ?'`, '? value1 ?'`, NULL`, 0`, 1`, NULL)`;`n"
		printUsingScaffold("C")
	return
	
	^`::
		ecouncil_navigation_link_id += 1
		scaffold_template := "INSERT INTO ``navigation_links`` (``navigation_link_id```, ``link_name```, ``parent_id```, ``url```, ``is_valid```, ``role_id```, ``display_order```, ``link_type_id```, ``context_id``) `n`tVALUES (" ecouncil_navigation_link_id "`, 'Residents'`, '76'`, '? value1 ?'`, '0'`, '1'`, '4'`, '1'`, '1')`;"
		printUsingScaffold("C")
	return
	
#if (Stack="13i") ; Check File Size 
	`::
		MyTT("Checking file size test")
		AutoTrim, Off
		Send ^c
		sleep 100
		SetBatchLines, -1  ; Make the operation run at maximum speed.
		FolderSize = 0

		StringGetPos, position, Clipboard, \, r1, ;Get Filename
		StringLeft, MyFolder, Clipboard, position
		myMsgLevel=/

		StringSplit, Clipboard, Clipboard, `n, `r
		Loop %Clipboard0%
		{	
			myTT("Checking " Clipboard%A_Index%)
			FolderSize+= checkFileSize(Clipboard%A_Index%)
		}

		StringSplit, MyMsg, MyMsg, `n, `r
		MyMsg=
		loop %MyMsg0%
		{
			cur:=MyMsg0 - A_Index + 1
			MyMsg:= MyMsg MyMsg%cur% "`n"
		}

			MyMsg:= "Foldersize in GB:`n" MyMsg

		AutoTrim, On
		MsgBox %MyMsg%
		Clipboard:=MyMsg
	return
	
	checkFileSize(path){
		global MyMsg
		global myMsgLevel
		fileNames=

		myMsgLevel:=myMsgLevel "`t"
		;~ myMsgLevel++
		
		WhichFolder:=path
		Loop, %WhichFolder%\*.*, 2, 0
			FolderSize+= checkFileSize(A_LoopFileFullPath)
		
		Loop, %WhichFolder%\*.*, 0, 0
		{
			FolderSize+= %A_LoopFileSize%
			;~ fileNames:= myMsgLevel "/" "`t" "/" A_LoopFileName "`n" fileNames 
		}


		sizeInGB:=FolderSize/1024/1024/1024
		sizeInGB:=Round(sizeInGB,1)
		
		length:=StrLen(WhichFolder)
		StringGetPos, position, WhichFolder, \, r1, ;Get Filename
		length:=length-position-1
		StringRight, MyFolder, WhichFolder, length

			;~ MyMsg:= MyMsg fileNames
			;~ MyMsg:= MyMsg myMsgLevel "/" MyFolder "`t" sizeInGB "`n" "`n"
			
		if (sizeInGB>0)
			MyMsg:= MyMsg myMsgLevel "/" MyFolder "`t" sizeInGB "`n"
			
		
		StringLeft, myMsgLevel, myMsgLevel, StrLen(myMsgLevel)-1
		;~ myMsgLevel--
		
		
		return FolderSize
	}

#if (Stack="13h") ; c# to vb 
	`::
		waitClipboard()
		Send ^x
		Send % "Dim "
		Send ^{right 2}
		Send % "As " Clipboard " "
	return
	
#if (Stack="13g") ; map.js npm node 
	`::
		Send +{Home}
		Send +{Up}
		mergeClipboard(1, 1)
	return
	
	^`:: 
		Send {End}
		Send +{Home}
		Send +{Home}
		Send +{Up}
		Sleep 100
		scaffold_template = ? value1 ?`n
		printUsingScaffold("")
	return
	
	+`:: 
		IfWinActive, % "ahk_exe sublime_text.exe"
		{
			Send ^s
			Sleep 1000
		}
		
		statusFile := "C:\xampp\htdocs\visibility-graph-master\use\webpack_status.log"
		FileDelete, % statusFile
		FileAppend, started, % statusFile
		
		
		if(requireWinActive("ahk_exe cmd.exe")){
			oldclip := Clipboard
			Clipboard := "webpack > " statusFile "`r`n"
			Send !{Space}ep
			Sleep 1000
			FileGetTime, oldTime, % statusFile
			
			Loop {
				FileGetTime, currentTime, % statusFile
				if(currentTime > oldTime){
					if(requireWinActive("use - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe")){
						Send {F5}
					}

					; arrange window active history as follow: chrome, sublime, 3rd program like scite, cmd
					WinGet, currWin, ID, A
					WinGet, ExStyle, ExStyle, ahk_id %currWin%
					ExStyle:=(ExStyle & 0x8)
					WinSet, AlwaysOnTop, On, ahk_id %currWin%
					
					shiftwin(4)
					shiftwin(4)
					Sleep 100
					requireWinActive("ahk_exe sublime_text.exe")
					Sleep 100
					shiftwin(1)
					
					if(ExStyle=0)
						WinSet, AlwaysOnTop, Off, ahk_id %currWin%
					
					myTT("webpack done")
					break
				}
				Sleep 1000
			}
			Clipboard := oldclip
		}
	return
	
#if (Stack="13f") ; RequireWinActive 
	requireWinActive(win, exe = "", timeout = 2, winExclude = ""){
		if(exe != ""){
			IfWinNotExist, % win, , % winExclude
				run, % exe
			
			WinWait, % win, , % timeout, % winExclude
		}
		
		Loop % timeout {
			WinActivate, % win, , % winExclude
			WinWaitActive, % win, , % 1, % winExclude
			IfWinActive, % win, , % winExclude
				return 1
		}
		return 0
	}
	
#if (Stack="13d") ; property images from booking.com 
	`::
		mergeClipboard()
		Send {Esc}
	return
	
	
#if (Stack="12z") ; clock in to SalonIris 
	`::
		if(lastClockInDate != A_DD){
			WinActivate, ahk_exe SalonIris.exe
			WinWaitActive, ahk_exe SalonIris.exe, , 2
			IfWinActive, ahk_exe SalonIris.exe
			{
				Send {Alt}
				
				Send {Right 11}
				Send {Down 2}
				Send {Enter}
				Sleep, 469
				
				Send, {h}
				Sleep, 469
				Send, {Tab}
				Sleep, 531
				Send, {u}
				Send, {n}
				Send, {k}
				Send, {n}
				Send, {d}
				Send, {w}
				Send, {n}
				Send, {0}
				Sleep, 313
				Send, {Enter}
				Sleep, 1093
				Send, {Enter}
				
				lastClockInDate:= A_DD
			}
		}else{
			WinActivate, ahk_exe SalonIris.exe
			WinWaitActive, ahk_exe SalonIris.exe, , 2
			IfWinActive, ahk_exe SalonIris.exe
			{
				Send {Alt}
				
				Send {Right 11}
				Send {Down 3}
				Send {Enter}
				Sleep, 469
				
				Send, {h}
				Sleep, 469
				Send, {Tab}
				Sleep, 531
				Send, {u}
				Send, {n}
				Send, {k}
				Send, {n}
				Send, {d}
				Send, {w}
				Send, {n}
				Send, {0}
				Sleep, 313
				Send, {Enter}
				Sleep, 1093
				Send, {Enter}
				
				lastClockInDate := ""
			}
		}
	return
	
#if (Stack="12x") ; string replace 
	`::
		;~ Send ^a
		;~ Sleep 100
		;~ waitClipboard()
		t := Clipboard
		;~ t:= RegExReplace(t, "s)(\R).{21,21}(.*\R)", "$1$2")
		;~ t:= RegExReplace(t, ")(\R).{21,21}(.*\R)", "$1$2")
		StringReplace, t, t, % "`n", % "", All
		StringReplace, t, t, % "`r", % "", All
		Clipboard := t
		Sleep 100
		Send ^v
	return
	
#if (Stack="12w") ; filezilla convert local path to ftp path 
	`::
		Send ^f
		waitClipboard()
		Sleep 100
		Send {Tab}
		Sleep 100
		Send {Tab}
		Sleep 100
		Send {Tab}
		Sleep 100
		
		StringReplace, clipboard, clipboard, C:\Users\sheesu.-sheesu-\Documents\SEFM_website\, /sefm.mv/, All
		StringReplace, clipboard, clipboard, C:\Users\sheesu.-sheesu-\Documents\Casa_website\, /casaretreat.com/, All
		StringReplace, clipboard, clipboard, C:\Users\sheesu.-sheesu-\Downloads\hotel-master\GoodLayers Plugin\gdlr-hotel\gdlr-hotel\, /casaretreat.com/wp-content/themes/hotelmaster/, All
		StringReplace, clipboard, clipboard, C:\Users\sheesu.-sheesu-\Downloads\hotel-master\hotelmaster\hotelmaster\, /casaretreat.com/wp-content/plugins/gdlr-hostel/, All
		StringReplace, clipboard, clipboard, C:\Users\sheesu.-sheesu-\Documents\tropisle, \tropisle, All
		StringReplace, clipboard, clipboard, \, /, All
		
		Send ^v
		Sleep 100
		Send {Enter}
	return
	
#if (Stack="12u") ; mouse click 
	`::
		MouseGetPos, MouseX, MouseY
		Click 2487, 260
		;~ Click 2768, 244

		MouseMove, %MouseX%, %MouseY%
	return
	
#if (Stack="12r") ; r
	`::
		stop_r = 0
		loop 20 {
			
			Loop 111 {
				
				Click 1696, 651
				Sleep 500
				
				PixelGetColor, color, 2127, 1031
				Clipboard := color
				if(color = "0xFFFFFF")
					Click 2042, 1032
				else
					Click 1954, 942
				
				Sleep 2500
				if(stop_r){
					myTT(A_Index)
					return
				}
			}
			Send {F5}
				Sleep 3000
		}
	return
	
^`::
	stop_r = 1
	myTT("stop r")
return

#if (Stack="12p") ; php null check 
	`::
		waitClipboard()
		scaffold_template = !is_null(? value1 ?) ? ? value1 ? : ''
		;~ printUsingScaffold("C")
		runScaffold( scaffold_template, Clipboard)
		Send ^v
		;~ Clipboard := " : ''"
	return
	
	+`::
		mergeClipboard()
		scaffold_template = isset(? value1 ?) ? ? value1 ?
		printUsingScaffold("L")
		Clipboard := " : ''"
	return
	
#if (Stack="12o") ; php var_dump to console 
	`::
		Send {Home 2}
	
	
		old_clip := Clipboard
		Clipboard = `                echo "<script type=\"text/javascript\">console.log('row`: "`;`n`n                ob_start()`;`n                var_dump($row)`;`n                $_var_dump_result = ob_get_clean()`;`n`n                echo str_replace(array("\n"`, "\r")`, ''`, $_var_dump_result)`;`n                echo "')`;</script>"`;`n`n
		Sleep 100
		Send ^v
		Sleep 100
		Clipboard:=old_clip
		
		Send {Up 9}
		Send {End}
		Send {Left 4}
		Send +{Left 3}
	return
	
#if (Stack="12n") ; screenshot chrome 
	`::
		;~ WinMove, A, , -8, -8, 1936, 1176
		;~ return
		
		mode_12n = 1 ; window
		mode_12n = 2 ; control
		
		CoordMode, Mouse, Screen
		MouseGetPos, mouseX, mouseY, id, control
		WinGetPos, WinX, WinY, , , A
		ControlGetPos, x, y, w, h, %control%, ahk_id %id%
		
		if (!WinExist("Circle.html - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe")){
			run Circle.html
			return
		}
		
		WinRestore, Circle.html - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
		WinSet, AlwaysOnTop, On, Circle.html - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
		WinSet, Style, -0xC40000, Circle.html - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
		WinSet, Transparent, 200, Circle.html - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe

		mouseX:=mouseX-8-10
		mouseY:=mouseY-79-11
		WinMove, Circle.html - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe, , % mouseX, % mouseY
		
		WinSet, Region, 8-80 W24 H24 E, Circle.html - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
		
		IfWinNotExist, Snipping Tool ahk_exe SnippingTool.exe
		{
			WinSet, AlwaysOnTop, Off, Circle.html - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
			MsgBox Open snipping tool
			Send #r
			Send snippingtool.exe{Enter}
			return
		}

		WinActivate, Snipping Tool ahk_exe SnippingTool.exe
		WinWaitActive, Snipping Tool ahk_exe SnippingTool.exe, , 1
		
		Send ^n
		Sleep 1000
		
		if(mode_12n = 1)
			MouseClickDrag, L, % WinX+8, % WinY, % x+w+WinX, % y+h+WinY, 100
		else
			MouseClickDrag, L, % x+WinX, % y+WinY, % x+w+WinX, % y+h+WinY, 100
		
		Sleep 100
		WinSet, Region, %mouseX%-%mouseY% W1 H1, Circle.html - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
		WinSet, AlwaysOnTop, Off, Circle.html - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
	return
		
#if (Stack="12l") ; Adjust numbers 
	adjustNumbers(){
		global v_12l, scaffold_template
		Click, 2


		t := scaffold_template
		;~ matrix(1.3333333,0,1.000000,-1.3333333,0,808.81867)
		
		StringReplace, t, t, ? value1 ?, % v_12l, All
		
		Clipboard := t
		Send ^v
		Sleep 100
		Send {Enter}
	}
	
	+Up::
		v_12l += 0.1
		adjustNumbers()
	return
	
	Up::
		v_12l += 1
		adjustNumbers()
	return
	
	^Up::
		v_12l += 10
		adjustNumbers()
	return
	
	!Up::
		v_12l += 100
		adjustNumbers()
	return
	
	+Down::
		v_12l -= 0.1
		adjustNumbers()
	return
	
	Down::
		v_12l -= 1
		adjustNumbers()
	return
	
	^Down::
		v_12l -= 10
		adjustNumbers()
	return
	
	!Down::
		v_12l -= 100
		adjustNumbers()
	return
	
	`:: 
		waitClipboard()
		v_12l := Clipboard
		Sleep 100
		Send ? value1 ?
		Sleep 100
		Send {Enter}
		Sleep 500
		
		Click, 2
		Sleep 100
		waitClipboard()
		scaffold_template := Clipboard
		Send {Esc}
	return
	
#if (Stack="12i") ; Remove Lines 
	`::
		waitClipboard()
		StringReplace, clipboard, clipboard, `n, , All
		StringReplace, clipboard, clipboard, `r, , All
		Send ^v
	return
	
#if (Stack="12h") ; telnet 
	`::
		Run cmd
		WinWaitActive, ahk_exe cmd.exe
		Send cd C:\Windows\WinSxS\amd64_microsoft-windows-telnet-client_31bf3856ad364e35_10.0.17134.1_none_9db21dbc8e34d070{Enter}	
	return
	
#if (Stack="12e") ; make number of rooms 0 
	`::
		Click 631, 423
		Send {BackSpace}0{Enter}
		Send ^{Tab}
	return
	
#if (Stack="11h") ; Get Property Information 
	`::
		oldT=
		Loop {
			t := mergeClipboard()
			Send {Esc}
			if(oldT = t)
				break
			oldT := t
			Sleep 100
		}
		myTT("done " t " oldT " oldT)
	return
	
#if (Stack="11e") ; Get Room Information 
	`::
		mergeClipboard()
		Send {Esc}
	return
	
#if (Stack="12c") ; go to next folder 
	`::
		Send !{Up}
		Sleep 1000
		Send {Down}{Enter}
	return
	
#if (Stack="12a") ; add watch expression to xdebug in sublime 
	`::
		Send !tx
		Send ss{Enter}
		Sleep 500
		
		WinActivate, Sublime Text ahk_class #32770 ahk_exe sublime_text.exe
		WinWaitActive,Sublime Text ahk_class #32770 ahk_exe sublime_text.exe, , 1
		Send {Enter}
		Sleep 500
		shiftwin(2)

		Sleep 500
		Send !tx
		Send s{Enter}
		
		WinWaitActive, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe, , 1
		Sleep 1000
		Send ^w
		Sleep 100
		Send ^w
	return

	+`::
		waitClipboard()
		Send !tx
		Send sssss{Enter}
		Send ^v{Enter}
	return
	
#if (Stack="11z") ; purify 
	`::
		waitClipboard()
		scaffold_template = $parser = new CHtmlPurifier()`;`nreturn $parser->purify(? value1 ?)`;`n
		printUsingScaffold("C")
	return
	
#if (Stack="11y") ; a 

+`::
	Clipboard := clipStore
return

`::
XButton2::
	;~ justPageDown=1
	pauseLoop=0
	nIssues=0
	iterationsSincePageDown=2

	Loop 6000{
		iterationsSincePageDown++
		if(pauseLoop=1)
			break
		if(ycoord ="")
			ycoord=323
		
		if(a_funcCol ="")
			a_funcCol=1

		doPageDown = 1

		IfWinActive, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
		{
			if(buttonNotFound){
				PixelGetColor, color, 29, 1897
				if(color = "0x999999" or color = "0x5C5C5C" or color = "0x949493"){					
					PixelGetColor, color, 1806, 1245
					if(color = "0xB26742"){
						;~ myTT("2431, 984")
						MouseGetPos, MouseX, MouseY
						Click, 1806, 1245
						MouseMove, %MouseX%, %MouseY%
						doPageDown = 0
					}

					PixelGetColor, color, 1333, 1102
					if(color = "0xB26742"){
						;~ myTT("2483, 1752")
						MouseGetPos, MouseX, MouseY
						Click 1333, 1102
						MouseMove, %MouseX%, %MouseY%
						doPageDown = 0
					}

					PixelGetColor, color, 1515, 1817
					if(color = "0xB26742"){
						;~ myTT("3001, 1132")
						MouseGetPos, MouseX, MouseY
						Click, 1515, 1817
						MouseMove, %MouseX%, %MouseY%
						doPageDown = 0
						Sleep 500
					}else{
						PixelGetColor, color, 1802, 1207
						if(color = "0xB26742"){
							;~ myTT("3001, 1093")
							MouseGetPos, MouseX, MouseY
							Click, 1802, 1207
							MouseMove, %MouseX%, %MouseY%
							doPageDown = 0
						}
					}
								
					
					if(issueYcoord != ycoord){
						issueYcoord:=ycoord
						ycoord-=30
					}
					
					if(ycoord<323)
						ycoord=323
					
					Sleep 500

					SetScrollLockState, On
					Send {Right 10}
					SetScrollLockState, Off
					
					Sleep 1000
					
					if(iterationsSincePageDown = 1 or iterationsSincePageDown = 2){
						iterationsSincePageDown =0
						Send {Up}
						Sleep 100
						Send {PGDN}
						Sleep 100


						SetScrollLockState, On
						Send {Right 10}
						SetScrollLockState, Off
						Sleep 1000
					}

					buttonNotFound = 0
				}
			}
		}
		
		if(doPageDown=1)
			nIssues=0
		
		oldClip := Clipboard
		Clipboard=
		waitClipboard=0
		
		PixelGetColor, color, 1011, 298
		if(color = "0xFFFFFF"){
			waitClipboard=1
			Send ^a^c
			Sleep 100
			Send {Enter}
			doPageDown = 0
			Sleep 500

			SetScrollLockState, On
			Send {Right 10}
			SetScrollLockState, Off
		}else{
			if(doPageDown = 1){
				if(buttonNotFound){
					if(a_funcCol = 1){
						ycoord+=72
					}else{
						a_funcCol = 1
						ycoord+=280
					}
				}

				
				if(a_funcCol=1)
					xcoord=450
				else if(a_funcCol=2)
					xcoord=1488

				PixelGetColor, color, %xcoord%, %ycoord%
				buttonNotFound = 0
				MouseGetPos, MouseX, MouseY

				if(color = "0xB26742" && !justPageDown){
					Click %xcoord%, %ycoord%
					Sleep 1000
				}else if(color = "0xF9F7F6" or color = "0xF7F6F5"){
				}else{
					buttonNotFound = 1	
				}
				MouseMove, %MouseX%, %MouseY%
			
				if(!buttonNotFound){
					if(a_funcCol = 1){
						a_funcCol = 2
					}else{
						a_funcCol = 1
						ycoord+=280
					}
				}
								
				if(ycoord>2068 || justPageDown){
					ycoord=323
					issueYcoord=

					if(nPageTries = 2 || justPageDown){
						nPageTries = 1
						Sleep 500
						iterationsSincePageDown = 0
						
						Send {Up}
						Sleep 100
						Send {PGDN}
						Sleep 100


						SetScrollLockState, On
						Send {Right 10}

						SetScrollLockState, Off
						Sleep 500
					} else
						nPageTries = 2
					a_funcCol=1
					nIssues=0
				}
			}
		}

		if(doPageDown = 0){
			nIssues++
			
			if(nIssues>6){
				MsgBox Too many issues
				return
			}

		}else{
			IfWinActive, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
				continue
		}
		

			
		if(waitClipboard)
			ClipWait, 2
		if(Clipboard != ""){
			if(InStr(Clipboard, "https://www.facebook.com/")){
				clipStore := clipStore Clipboard "`n"
				Clipboard := clipStore
				Send {Up}

			}else
				Clipboard := oldClip
		}else{
			Clipboard := oldClip
		}
		Sleep 100
	}
	;~ Run rundll32.exe user32.dll`,LockWorkStation     ; Lock PC
	return

		
	^`::
	XButton1:: 
		pauseLoop=1
		ToolTip stopping
		Sleep 1000
		ToolTip
		
		;~ send {PGUP}
	return

#if (Stack="11x") ; grab links from chrome 
	`::
		Click 706, 476
		Click 706, 476
		Sleep, 100
		Send, {CTRLDOWN}{SHIFTDOWN}{END}{SHIFTUP}{CTRLUP}
		Sleep 100
		waitClipboard(1, 0)
		t = 0
		if(InStr(Clipboard, "Page 1 of 1"))
			Send ^w
		else
			t = 1
		
		Clipboard:= RegExReplace(Clipboard, "s)Display posts from previous.*", "")
		mergeClipboard(0)
		if( t )
			myTT("Other pages present")
	return
	
#if (Stack="11w") ; Remove useless text with regex 
	`::
		waitClipboard(1, 0)

		;~ requestUrl:= RegExReplace(Clipboard, "s)^Top$([^\r\n]*?)\R.*", "$1")
		Clipboard:= RegExReplace(Clipboard, ").*\R.*\RTop\R.*", "")
		myTT(Clipboard)
	return
	
#if (Stack="11u") ; request in chrome to laravel 
	`::
		Send ^a
		waitClipboard(1, 0)

		requestUrl:= RegExReplace(Clipboard, "s)^Request URL: ([^\r\n]*?)\R.*", "$1")
		requestMethod:= RegExReplace(Clipboard, "s).*\RRequest Method: ([^\r\n]*?)\R.*", "$1")
		formData:= RegExReplace(Clipboard, "s).*\RUser-Agent: [^\r\n]*?\R(.*)", "$1")
		formData := formData = Clipboard ? "" : formData
			
		StringSplit, formData, formData, `n, `r
		formData=
		Loop %formData0% {
			fieldName := RegExReplace(formData%A_Index%, "s)^([^:]+): ([^\r\n]*)", "$1")
			if(fieldName = "_method"){
				fieldValue := RegExReplace(formData%A_Index%, "s)^([^:]+): ([^\r\n]*)", "$2")
				requestMethod := fieldValue
				continue
			}else if(fieldName = "_token")
				continue
			
			formData%A_Index% := RegExReplace(formData%A_Index%, "s)^([^:]+): ([^\r\n]*)", "            '$1' => '$2',`n")
			formData := formData formData%A_Index%
		}
		
		Clipboard:= "        $response = $this->" lowerCase(requestMethod) "(""" requestUrl "{$merchant_order->id}""`, [`n" formData "        ])`;`n"
		myTT(Clipboard)
	return
	
#if (Stack="11t") ; prices 
	`::
		Clipboard=
		scaffold_template = ? valueAT1 ?`nMVR ? value3 ?`n`n
		printUsingScaffold("MA", , 4)
		;~ printUsingScaffold()
	return
	
#if (Stack="11s") ; 200k TTS characters to soleasia 
	F1:: 
		if ( !switch){
			switch := 1
			Send {End} ; Go to end \\** To go to end of article
		} else {
			switch := 0
			mergeClipboard()
			Send {Ctrl Down}w{Ctrl Up}
		}
	return

	;~ `:: 
		;~ mergeClipboard()
		;~ return
		
	`:: ttsCharactersToSoleasia()
	
	ttsCharactersToSoleasia() {
		global clipList
		mergeClipboard()
		
		
		t := SubStr(clipList, 1, 200000)
		clipList := SubStr(clipList, 200001)

		;~ FileDelete, C:\xampp\htdocs\router\web\read.html
		;~ FileAppend, % "<button class=""btn"" onclick=""copyContent()"">Copy!</button>`n<p id=""myText"" style=""font-size`: 5px`;"">" t "</p>`n`n<script>`n  const copyContent = async () => {`n    try {`n      let text = document.getElementById('myText').innerHTML`;`n      const textarea = document.createElement('textarea')`;`n      textarea.value = text`;`n`n      // Move the textarea outside the viewport to make it invisible`n      textarea.style.position = 'absolute'`;`n      textarea.style.left = '-99999999px'`;`n`n      document.body.prepend(textarea)`;`n`n      // highlight the content of the textarea element`n      textarea.select()`;`n`n      try {`n        document.execCommand('copy')`;`n      } catch (err) {`n        alert('Failed to copy2`: ' + err)`;`n      } finally {`n        textarea.remove()`;`n      }`n`n    } catch (err) {`n      alert('Failed to copy`: ' + err)`;`n    }`n  }`n</script>", C:\xampp\htdocs\router\web\read.html, UTF-8
		;~ run, http://localhost/read.html
		
		;~ text := EncodeDecodeURI(t)
			
		;~ UrlDownloadToFile https://soleasia.mv/ip.php?mode=update&id=1&text=%text%, %A_ScriptDir%\telegram.html
		
		
		; reddit
		t := RegExReplace(t, ")\R.*\R.*\RShare\R.*\RSave\R.*\R(Comment as freestyleReunion)", "$1")
		t := RegExReplace(t, ")\R.*\R.*\RShare\R.*\RSave\R.*\RUser avatar\R.*\R.*\RPromoted\R(.*\R)?(.*\R)?(.*\R)?(Comment as freestyleReunion)", "$4")
		t := RegExReplace(t, ")Comment as freestyleReunion\R.*\R.*\R.*\R.*\R.*\R.*\R.*\R.*\R.*\R.*\R.*\R.*\R.*\R.*Markdown Mode\RSort By: Best\R|\RSearch comments", "")
		t := RegExReplace(t, ")User avatar\Rlevel \d+\R(.+)\R(OP\R)?.\R\d+ (min\.|hr\.|days|day) ago", "$1")
		t := RegExReplace(t, ")(\d+\R\R\RReply\RShare\R)", "")
		; home reddit
		t := RegExReplace(t, ")Upvote\R\d*\R\RDownvote\RReply\Rreply\R\RShare\RShare\R\R(.+ avatar\R)?(.*\R)(OP\R)?.*\R\d+(m|h|d) ago", "$2")
		t := RegExReplace(t, ")Upvote\R\d*\R\RDownvote\RReply\Rreply\R\RShare\RShare", "$2")
		;~ t := RegExReplace(t, ")(.+ avatar\R)?(.*\R)(OP\R)?.*\R\d+(m|h|d) ago", "$2")
		t := RegExReplace(t, ")(.*\R)(OP\R)?.*\R\d+(m|h|d) ago", "$2")

		; discord Today at 6:48 PM
		t := RegExReplace(t, ")(Today|Yesterday) at \d+:\d+ (AM|PM)", "")
		t := RegExReplace(t, ")\d+[/]\d+[/]\d+ \d+:\d+ (AM|PM)", "")
		
		;~ ToolTip % t
		waitSetClipboard(t)
		;~ Clipboard := t

		;~ Sleep 10000
		;~ ToolTip
		;~ return
		
		StringSplit, t, t, `n
		
		StringReplace, t, t, <, %  "<span" Chr(255) "<</span" Chr(255), All
		StringReplace, t, t, >, <span>></span>, All
		StringReplace, t, t, % Chr(255), >, All
		StringReplace, t, t, `n, <br>, All
		StringReplace, t, t, &, % Chr(255), All
		
		if(t0 = 1)
			t := "<a href=""" t """>" t "</a>"
		
		whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
		whr.Open("POST", "https://soleasia.mv/ip.php?mode=update&id=1", true)
		whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
		whr.Send("text=" EncodeDecodeURI(t))
		whr.WaitForResponse()
		myTT("done")
	}
		
	EncodeDecodeURI(str, encode := true, component := true) {
	   static Doc, JS
	   if !Doc {
		  Doc := ComObjCreate("htmlfile")
		  Doc.write("<meta http-equiv=""X-UA-Compatible"" content=""IE=9"">")
		  JS := Doc.parentWindow
		  ( Doc.documentMode < 9 && JS.execScript() )
	   }
	   Return JS[ (encode ? "en" : "de") . "codeURI" . (component ? "Component" : "") ](str)
	}

#if (Stack="11r") ; restore clipList_A_Index 
	`::
		IniRead, clipList_A_Index, %A_ScriptDir%\PWT_v2.ini, Main,  clipList_A_Index
	return
	
#if (Stack="11q") ; set value0 
	`::
		waitClipboard()
		value0 := Clipboard*1 - 1
	return
	
#if (Stack="11p") ; clear clipList 
	`::
		clipList=
		clipList_A_Index = 1
		myTT("clipList cleared")
	return
	
#if (Stack="11o") ; go to end of clipList
	`:: goToEndOfCliplist()
	goToEndOfCliplist(){
		global
		StringSplit, clipList, clipList, `n, `r
		clipList_A_Index := clipList0 + 1
		;~ myTT("Now at end of clipList")
	}
	return
	

#if (Stack="15l") ; console log 
	`:: 
		runScaffold( "console.log(``? value1 ?`: ${? value1 ?}`` )`;", Clipboard)
		Send ^v
	return
	
#if (Stack="15bo") ; make new stack 
	`::
		stackPrefix := "19"
		newStackAsc := 97
		
		Loop 27 {
			newStack := stackPrefix Chr(newStackAsc)
			if( !InStr(";" allStacks ";", "," newStack ";") and !InStr(";" allStacks ";", "," newStack ",") )
				break
			newStackAsc++
		}
		
		Send % "," newStack ";"
		Stack := newStack
		
		;~ MsgBox % Asc("a")
	return
	
#if (Stack="15bn") ; convert to property function 
	`::
		mergeClipboard()
		scaffold_template = property.? value1 ?()
		printUsingScaffold("L")
	return
	
#if (Stack="15bl") ; laravel form field 
	`::
		scaffold_template =`                <div class="{{ add_error_class($errors->has('? valueS1 ?'), 'form-group') }}">`n                    {!! Form`:`:label('? valueS1 ?', '? valueT1 ?').' *' !!}`n                    <?php`n                    $selected_? valueS1 ? = isset($? valueS2 ?) ? $? valueS2 ?->? valueS3 ? `: old('? valueS1 ?');`n                    $? valueS1 ?s = ['' => ''] + App\? value4 ?`:`:pluck('name', 'id');`n                    ?>`n                    {!! Form`:`:select('? valueS1 ?', $? valueS1 ?s, $selected_? valueS1 ?,`n                        ['class' => 'form-control select2-basic', 'data-allow-clear' => 'true', 'data-placeholder' => __('All')]) !!}`n                    @include('errors._list', ['error' => $errors->get('? valueS1 ?')])`n                </div>`n`n
		printUsingScaffold()
	return
	
#if (Stack="15aw") ; laravel test increase memory limit 
	`::
		laravelOpenTestOutputInChrome( "phpunit_all_test", "phpunit -d memory_limit=2048M", "create" )
	return
	
	laravelOpenTestOutputInChrome(filePrefix, command, resultFile){
		statusFile := "C:\xampp\htdocs\" filePrefix "_status.html"
		logFile := "C:\xampp\htdocs\" filePrefix "_log.html"
		FileDelete, % logFile
		FileDelete, % statusFile
		FileAppend, started, % statusFile
		
		FileGetTime, oldTime, % statusFile
		WinActivate, ahk_exe cmd.exe
		WinWaitActive, ahk_exe cmd.exe
		Send cd c:\xampp\htdocs\etukuri`r`n
		Send php artisan config:clear`r`n
		Clipboard := command " > " logFile "`r`n"
		Send !{Space}ep
		Sleep 500
		Clipboard:="ipconfig > " statusFile "`r`n"
		Send !{Space}ep
		
		Loop {
			FileGetTime, currentTime, % statusFile
			if(currentTime > oldTime){
				FileRead, phpunit_log, % logFile
				html:= RegExReplace(phpunit_log, "s).*(<!DOCTYPE html>.+</html>).*", "$1")
				phpunit_log := RegExReplace(phpunit_log, "s)(<!DOCTYPE html>.+</html>)", Chr(255))
				if(!instr(html, "html"))
					html=

				StringReplace, phpunit_log, phpunit_log, % "`r", % "<br>`r", All
				StringReplace, phpunit_log, phpunit_log, % "`n", % "<br>`n", All
				;~ phpunit_log := RegExReplace(phpunit_log, "s)" Chr(255) "", html)
				phpunit_log := html phpunit_log
				if(instr(phpunit_log, "html")){
					StringReplace, phpunit_log, phpunit_log, \r\n, , All
				}
				FileDelete, % logFile
				FileAppend, %phpunit_log%, % logFile
				FileCopy, % logFile, % "C:\xampp\htdocs\etukuri\resources\views\admin\pages\" resultFile ".blade.php", 1
				break
			}
			Sleep 1000
		}
		
		if(resultFile="index")
			resultFile=
		
		run % "http://etukuri.test/admin/pages/" resultFile
	}

#if (Stack="15bh") ; merge multi-line element 
	`::
		mergeClipboard(1, 1)
	return
	
#if (Stack="15be") ; laravel open test output in chrome 
	`::
		command =phpunit --filter %laravel_test_filter%
		laravelOpenTestOutputInChrome( "phpunit", command, "index" )
	return
	
#if (Stack="15af") ; clipLoad 
	`::
		
	return
	
	ClipLoad:
		ClipLoad()
	return
	
	ClipLoad(){
		global
		
		;~ if(clipList0 = "")
		StringSplit, clipList, clipList, `n, `r
		if(clipList_A_Index > clipList0){
			clipList_A_Index := clipList0 + 1
			scaffold_output_mode := 0
			myTT("Reached end of list")
			clipLine := ""
			return 0
		}else{
			clipCells_A_Index = 0
			clipLine := clipList%clipList_A_Index%
			clipList_A_Index++
			StringSplit, clipCells, clipLine, `t, `r`n
            return 1
		}
	}
		
#if (Stack="15al") ; clipwait 
	`::
	
	return
	
	mergeClipboard(copy = 1, encodeAsSingleElement = 0, copyResult = 1, override="") {
		return waitClipboard(copy, 1, encodeAsSingleElement, copyResult, override)
	}
	
	waitSetClipboard(value) {
		global clipCounter_g
		clipCounterBkp := clipCounter_g
		
		if(Clipboard != value) {
			Clipboard := value
			;~ myTT("Clipboard: " Clipboard " value: " value)
			
			Loop 100
			{
				if(clipCounterBkp != clipCounter_g)
					break
				Sleep 10
				
				if(A_Index = 100)
					return 0
			}
			Sleep 50
		}
		
		return 1
	}

	waitClipboard(copy = 1, merge = 0, encodeAsSingleElement = 0, copyResult = 1, override="") {
		global clipList, clipList_A_Index, clipCounter_g
		

		;~ Sleep 100
		
		
		if(copy = 1)
		{
			oldClipboard := Clipboard
			;~ Clipboard=
			clipCounterBkp := clipCounter_g
			Send ^c
			;~ Sleep 100
		
		
			Loop 100
			{
				if(clipCounterBkp != clipCounter_g)
					break
				Sleep 10
				
				if(A_Index = 100)
					return
			}
		}
		
		ClipWait, 0.5
		;~ Send {Esc}
		
		if !ErrorLevel
		{
			if(override)
				temp := override
			else
				temp := Clipboard
			preview := RegExReplace(temp, "s)^((.*?\R){10}).*", "$1")
			
			if(encodeAsSingleElement)
			{
				StringReplace, temp, temp, `t, % chr(254), All
				StringReplace, temp, temp, `n, % chr(255), All
				StringReplace, temp, temp, `r,, All
			}
			
			output := temp
			if(copyResult)
				waitSetClipboard(temp)

			if(merge){
				emptyClipList = 0
				if (clipList != "")
					clipList .= "`n" temp
				else {
					emptyClipList = 1
					clipList := temp
				}
				
				StringSplit, clipList, clipList, `n, `r
				
				if(copyResult){
					output=
					loop % clipList0-clipList_A_Index+1 {
						t := clipList_A_Index + A_Index - 1
						if (output != "")
							output .= "`n" clipList%t%
						else
							output := clipList%t%
					}
					
					if(copyResult)
						waitSetClipboard(output)
				}
			}
				
			myTT(preview)
			;~ Send {Esc}{Tab} 
		}
		else{
			MyTT("Clipboard could not be loaded")
			;~ Clipboard := oldClipboard
		}
		
		return output
	}
	
	ClipChanged(DataType) {
		global
		;~ ToolTip Clipboard data type: %DataType%
		;~ Sleep 1000
		;~ ToolTip  ; Turn off the tip.
		;~ Send ^v
		;~ myTT("Clipboard: " Clipboard)
		clipCounter_g++
	}
	

#if (Stack="15bd") ; sync folders 
	`::
	
		;~ StringReplace, clipboard, clipboard, `r, , All
		;~ StringReplace, clipboard, clipboard, `n, :, All
		;~ StringReplace, clipboard, clipboard, :, `n, All
	;~ return		
		
	
		;~ Source=C:\xampp\htdocs\gems-ws-api
		;~ Destination=C:\xampp\htdocs\gems-ws-api
		
		;~ synchronizeFoldersOneWay(Source, Destination, "O") ; overwrite modifications
		
		;~ Source=C:\xampp\htdocs\gems-ws-api
		;~ Destination=C:\xampp\htdocs\gems-ws-api-gitlab
		
		
		Source=C:\xampp\htdocs\gems-ws-api-gitlab
		Destination=C:\xampp\htdocs\gems-ws-api
		
		
		;~ Source=C:\xampp\htdocs\gemen-reporting-module
		;~ Destination=C:\xampp\htdocs\eCouncil-gitlab\web

		
		;~ Source=C:\xampp\htdocs\eCouncil-gitlab\web
		;~ Destination=C:\xampp\htdocs\gemen-reporting-module
		
		;~ Source=C:\xampp\htdocs\Main\Source\LGAStatsSln\Source\yii
		;~ Destination=C:\xampp\htdocs\gemen-reporting-module\yii
			
		;~ Source=C:\Users\User\Downloads\MAKUDI-Source-Code2\MAKUDI\MakudiOnline - LOCAL
		;~ Destination=C:\Users\User\Downloads\MAKUDI-Source-Code2\MAKUDI\MakudiOnline
		
		;~ Source=C:\Users\User\Downloads\MAKUDI-Source-Code2\MAKUDI\MakudiOnline
		;~ Destination=C:\Users\User\Downloads\MAKUDI-Source-Code2\MAKUDI\MakudiOnline - LOCAL
		
		;~ Source=C:\Users\User\Source\Workspaces\SubstanceInformationSystem\SIS
		;~ Destination=C:\Users\User\Downloads\SIS
		
		;~ Source=C:\Users\User\Downloads\SIS
		;~ Destination=C:\Users\User\Source\Workspaces\SubstanceInformationSystem\SIS
		
		;~ Source=C:\Users\User\Source\Workspaces\SubstanceInformationSystem\SIS
		;~ Destination=D:\makudi-admin
		
		;~ synchronizeFoldersOneWay(Source, Destination) ; copy if new
		synchronizeFoldersOneWay(Source, Destination, "O") ; overwrite modifications

		MyTT("Done Synching")
		MyTT("Done Synching")
		MsgBox Done Synching
	return
	
#if (Stack="15bc") ; swap css colors 
	`::

		Send {End}^+{Left 3}
		Sleep 100
		Send ^x
		waitClipboard(0)
		Send {Down}
		Send {End}^{Left 3}
		Sleep 100
		Send ^v
		Sleep 100
		Send +{End}
		Sleep 100
		Send ^x
		waitClipboard(0)
		Send {Up}{End}
		Sleep 100
		Send ^v
		Sleep 100
		Send {Down 5}
	return
	
#if (Stack="15ba") ; laravel add block comments 
	`::
		waitClipboard()
		Clipboard := "/*" Clipboard "*/"
		Send ^v
	return
	
#if (Stack="15az") ; laravel remove block comments 
	`::
		waitClipboard()
		StringReplace, Clipboard, Clipboard, /*, , All
		StringReplace, Clipboard, Clipboard, */, , All
		Send ^v
	return
	
#if (Stack="15ay") ; laravel run selected test 
	`:: 
		Send ^{Right}^+{Left}
		waitClipboard()
		laravel_test_filter:= Clipboard
		Send ^s
	return
	
scaffoldFields(template, withID = 1){
	global DB_Fields, primary_key
	
	clipList := DB_Fields
	
	if(withID)
		clipList := primary_key_row() "`n" clipList
	
	return runScaffold( template, clipList)
}
	
scaffoldModel(template, skip = 0){
	global modelName
	
	if( skip )
		return template
	
	return runScaffold( template, modelName)
}

runScaffold( template, data, params = "MA", nRows = 1, nColumns = -1, next = 1, defaultTemplate = 0 ){
	global clipList, scaffold_template, clipList_A_Index, clipCells0
	
	clipList_bkp := clipList
	
	value0=-1
	clipList := data "`n"
	old_scaffold_template := scaffold_template
	scaffold_template := template
	clipList_A_Index = 1
	;~ StringSplit, clipList, clipList, `n, `r
	ClipLoad()
	;~ Clipboard=
	output := printUsingScaffold(params, nRows, nColumns, next, defaultTemplate)
	clipList := ""
	scaffold_template := old_scaffold_template
	clipList_A_Index = 1
	clipCells0 := ""
	
	clipList := clipList_bkp
	
	return output
}

model_casts( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	if(data_type = "datetime" or data_type = "timestamp" )
		t := "`        '? valueS1 ?' => 'datetime'`,`n"
	else if(data_type = "date" )
		t := "`        '? valueS1 ?' => 'date'`,`n"
	else
		t := ""

	return t
}

model_appends( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	if(data_type = "datetime" or data_type = "timestamp" or data_type = "date" )
		t := "`        '? valueS1 ?_for_editing'`,`n"
	else
		t := ""

	return t
}

model_validationRules( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	arr := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	if( HasVal(arr, field_name) )
		return ""
	
	required := "nullable|"`
	if( InStr(nullability, "No") )
		required := "required|"
	
	numeric := ""
	if( InStr(data_type, "int(") and !related_table_singular )
		numeric := "numeric|"
	
	if(table_name_plural = "case_users" and field_name = "task_user_type_id")
		t := "`            $prefix.'? value1 ?' => 'required|'`,`n"
	else if(data_type = "datetime" or data_type = "timestamp" or data_type = "date" )
		t := "`            $prefix.'? value1 ?_for_editing' => '" required "'`,`n"
	else
		t := "`            $prefix.'? value1 ?' => '" required numeric "'`,`n"

	return t
}

yii_searchModel_validationRules( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	arr := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	if( HasVal(arr, field_name) )
		return ""
	
		t := "`            // [['? value1 ?']`, 'safe']`,`n"
	
	numeric := ""
	;~ if( InStr(data_type, "int(") and !related_table_singular )
	if( InStr(data_type, "int(")  )
		t .= "`            [['? value1 ?']`, 'integer']`,`n"
	else if(data_type = "datetime" or data_type = "timestamp" or data_type = "date" )
		t .= "`            [['? value1 ?']`, 'date']`,`n"
	;~ else
		;~ t .= "`            [['? value1 ?']`, 'string']`,`n"
	

	return t
}

yii_searchModel_filters( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	;~ arr := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	;~ if( HasVal(arr, field_name) )
		;~ return ""
	
		t := "`            '? value1 ?' => $this->? value1 ?`,`n"
	
	;~ numeric := ""
	;~ if( InStr(data_type, "int(") and !related_table_singular )
	;~ if( InStr(data_type, "int(")  )
		;~ t .= "`            [['? value1 ?']`, 'integer']`,`n"
	;~ else if(data_type = "datetime" or data_type = "timestamp" or data_type = "date" )
		;~ t .= "`            [['? value1 ?']`, 'date']`,`n"
	;~ else
		;~ t .= "`            [['? value1 ?']`, 'string']`,`n"
	

	return t
}

yii_model_validationRules( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	arr := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	if( HasVal(arr, field_name) )
		return ""
	
	if( InStr(nullability, "No") )
		t := "`            [['? value1 ?']`, 'required']`,`n"
	
	numeric := ""
	;~ if( InStr(data_type, "int(") and !related_table_singular )
	if( InStr(data_type, "int(")  )
		t .= "`            [['? value1 ?']`, 'integer']`,`n"
	else if(data_type = "datetime" or data_type = "timestamp" or data_type = "date" )
		t .= "`            [['? value1 ?']`, 'date']`,`n"
	else
		t .= "`            [['? value1 ?']`, 'string']`,`n"
	

	return t
}

model_nullable( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	
	arr := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	if( HasVal(arr, field_name) )
		return ""
	
	if(table_name_plural = "case_users" and field_name = "task_user_type_id")
		t := ""
	else if( InStr(nullability, "Yes") )
		t := "`        '? value1 ?' => ''`,`n"
	else
		t := ""
	
	return t
}

model_dateGettersAndSetters( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	if(data_type = "datetime" or data_type = "timestamp" or data_type = "date" )
		t := "`    public function get? valueCC1 ?ForEditingAttribute()`n    {`n        return $this->? valueS1 ? ? $this->? valueS1 ?->format('d/m/Y') `: ''`;`n    }`n`n    public function set? valueCC1 ?ForEditingAttribute($value)`n    {`n        $this->? valueS1 ? = parseDate($value)`;`n    }`n`n"
	else
		t := ""
	
	return t
}

yii_model_relations( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	valueCC4 := "? valueCC4 ?"
	if( customModelName(related_table_singular) )
		valueCC4 := customModelName(related_table_singular)
	
	name := scaffoldModel("? valueL1 ?")
	plural := scaffoldModel("? valueL2 ?")
	plural_C := scaffoldModel("? valueCC2 ?")
	model := scaffoldModel("? valueCC1 ?")
	
	if(related_table_singular != "" ){
		t := "`    /**`n     * Get the ? valueL4 ? that owns the " name ".`n     */`n    public function get? valueCC12 ?()`n    {`n        return $this->hasOne(" valueCC4 "`:`:className()`, ['" related_primary_key "' => '? value1 ?'])`;`n    }`n`n    // /**`n    //  * Get the " plural " for the ? valueL4 ?.`n    //  */`n    // public function get" plural_C "()`n    // {`n    //     return $this->hasMany(" model "`:`:className()`, ['? value1 ?' => '" related_primary_key "'])`;`n    // }`n`n"
		without_id := StrReplace(field_name, "_id", "")
		t := replaceMarker(without_id, t, 91)
	}else
		t := ""
	
	return t
}

model_relations( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	valueCC4 := "? valueCC4 ?"
	if( customModelName(related_table_singular) )
		valueCC4 := customModelName(related_table_singular)
	
	name := scaffoldModel("? valueL1 ?")
	plural := scaffoldModel("? valueL2 ?")
	plural_C := scaffoldModel("? valueC2 ?")
	model := scaffoldModel("? valueCC1 ?")
	
	if(related_table_singular != "" ){
		t := "`    /**`n     * Get the ? valueL4 ? that owns the " name ".`n     */`n    public function ? valueC12 ?()`n    {`n        return $this->belongsTo(" valueCC4 "`:`:class`, '? valueS1 ?'`, '" related_primary_key "')`;`n    }`n`n    // /**`n    //  * Get the " plural " for the ? valueL4 ?.`n    //  */`n    // public function " plural_C "()`n    // {`n    //     return $this->hasMany(" model "`:`:class`, '? valueS1 ?'`, '" related_primary_key "')`;`n    // }`n`n"
		without_id := StrReplace(field_name, "_id", "")
		t := replaceMarker(without_id, t, 91)
	}else
		t := ""
	
	return t
}

isActivityLoggableTables(){
	global table_name_plural
	arr := ["case_users", "attachments", "communications", "cases", "checklists", "tasks", "comments", "task_users"]
	if( HasVal(arr, table_name_plural) )
		return true
	else
		return false
}

table_name_plural(){
	global table_name_plural
	return table_name_plural
}

table_name_singular(){
	global table_name_singular
	return table_name_singular
}

model_includes_more() {
	arr := {}
	arr["user"] := "use Illuminate\Support\Facades\DB`;`nuse Illuminate\Support\Facades\Session`;`nuse Ncit\Rolify\Traits\HasPermission`;`n"
	arr["communication"] := "use Storage;`n"
	arr["case"] := "use App\Enum\CaseUserTypesEnum`;`nuse App\Enum\StatusEnum`;`nuse App\Enum\TaskStatusesEnum`;`nuse Illuminate\Database\Eloquent\Builder`;`n"
	arr["role"] := "use Cocur\Slugify\Slugify`;`n`n"
	arr["task"] := "use App\Enum\StatusEnum;`nuse App\Enum\TaskStatusesEnum;`n`n"
	arr["member"] := "use Ncit\Rolify\Models\? valueCC1 ?Role`;`nuse Ncit\Rolify\Models\Role`;`n`n"
	
	return arr[table_name_singular()]
}

model_includes() {
	t := t "use Carbon\Carbon`;`nuse Illuminate\Database\Eloquent\Factories\HasFactory`;`nuse Illuminate\Database\Eloquent\Model`;`nuse WithPagination`;`nuse Illuminate\Support\Facades\Auth`;`nuse Illuminate\Database\Eloquent\SoftDeletes`;`nuse OwenIt\Auditing\Contracts\Auditable`;`n"
	
	if(table_name_singular() = "user")
		t := t "use Illuminate\Contracts\Auth\MustVerifyEmail`;`nuse Illuminate\Foundation\Auth\? valueAT1 ? as Authenticatable`;`nuse Illuminate\Notifications\Notifiable`;`nuse Laravel\Sanctum\HasApiTokens`;`n"
	
	if( isActivityLoggableTables() )
		t := t "use Spatie\Activitylog\LogOptions`;`nuse Spatie\Activitylog\Models\Activity`;`nuse Spatie\Activitylog\Traits\LogsActivity`;`n"
	
	;~ logActivity := runSubScaffold( "model_properties", 1)
	
	;~ t := t "use App\Traits\LocalizerTrait;`nuse Spatie\Activitylog\Facades\CauserResolver;`n" model_includes_more()
	t := t "use Spatie\Activitylog\Facades\CauserResolver;`n" model_includes_more()
	
	return t
}

yii_model_includes() {
	t := t "use Yii`;`nuse yii\base\NotSupportedException`;`nuse yii\behaviors\TimestampBehavior`;`nuse yii\db\ActiveRecord`;`n"
	
	;~ if(table_name_singular() = "user")
		;~ t := t "use Illuminate\Contracts\Auth\MustVerifyEmail`;`nuse Illuminate\Foundation\Auth\? valueAT1 ? as Authenticatable`;`nuse Illuminate\Notifications\Notifiable`;`nuse Laravel\Sanctum\HasApiTokens`;`n"
	
	;~ if( isActivityLoggableTables() )
		;~ t := t "use Spatie\Activitylog\LogOptions`;`nuse Spatie\Activitylog\Models\Activity`;`nuse Spatie\Activitylog\Traits\LogsActivity`;`n"
	
	;~ logActivity := runSubScaffold( "model_properties", 1)
	
	;~ t := t "use App\Traits\LocalizerTrait;`nuse Spatie\Activitylog\Facades\CauserResolver;`n" model_includes_more()
	;~ t := t "use Spatie\Activitylog\Facades\CauserResolver;`n" model_includes_more()
	
	return t
}

model_inheritance() {
	global fields
	
	name := scaffoldModel("? valueS1 ?")
	
	if(fields["deleted_at"])
		softDeletes := "`, SoftDeletes"
		
	if( isActivityLoggableTables() )
		activityLog := "`, LogsActivity"
		
	if(name = "user" )
		t := "Authenticatable implements Auditable`n{`n    use HasPermission, HasApiTokens`, HasFactory`, Notifiable" softDeletes "`, LocalizerTrait`, \OwenIt\Auditing\Auditable`;"
	else
		;~ t := "Model implements Auditable`n{`n    use HasFactory" softDeletes activityLog "`, LocalizerTrait`, \OwenIt\Auditing\Auditable`;"
		t := "Model implements Auditable`n{`n    use HasFactory" softDeletes activityLog "`, \OwenIt\Auditing\Auditable`;"
	
	return t
}

opposite_relations(table_name_plural){
	arr := {}
	arr["individuals"] := "`    /**`n     * Get the id cards for the individual.`n     */`n    public function idCards()`n    {`n        return $this->hasMany(IdCard`:`:class`, 'business_entity_id'`, 'business_entity_id')`;`n    }`n`n"
	arr["services"] := "`    /**`n     * Get the requests for the service.`n     */`n    public function request()`n    {`n        return $this->hasOne(Request`:`:class`, 'service_id'`, 'service_id')`;`n    }`n`n"
	arr["birth_records"] := "`    /**`n     * Get the birth certificates for the birth record.`n     */`n    public function birthCertificate()`n    {`n        return $this->hasOne(BirthCertificate`:`:class`, 'birth_records_id'`, 'birth_records_id')`;`n    }`n`n"
	arr["case_users"] := "`    public function activity()`n    {`n        return $this->hasMany(Activity`:`:class`, 'subject_id'`, 'id')->orderByDesc('created_at')`;`n    }`n`n    public function toggleCaseUserType(){`n        if ($this->task_user_type_id == 1 ) // if edit`n            return $this->update([""task_user_type_id"" => 2])`;`n    }`n`n"
	arr["users"] := "`    /**`n     * Get the team that owns the user.`n     */`n    public function team()`n    {`n        return $this->members->where(""org_id""`, $this->getCurrentOrg()[""id""])->first()->team`;`n    }`n`t`n    /**`n     * The roles that belong to the user.`n     */`n    public function roles()`n    {`n        return $this->members()->where('org_id'`, $this->getCurrentOrg())->first()->roles`;`n    }`n`n    public function hasRole($role){`n        return in_array($role`, auth()->user()->roles()->pluck(""name"")->toArray())`;`n    }`n`n    public function members()`n{`n        return $this->hasMany(Member`:`:class`, 'individual_id'`, 'id')`;`n    }`n`n    public function member(){`n        return $this->members()->orderByDesc('last_accessed')->first()`;`n    }`n`t`n    public function getCurrentOrg()`n    {`n        if (Session`:`:has('currentOrg')) {`n            return  Session`:`:get('currentOrg')`;`n        } else {`n            $org =`n                $this->members()->orderBy('last_accessed'`, 'DESC')->get()->first()->organisation`;`n            return ['id' => $org->id`, 'dv' => $org->name_short_dv`, 'en' => $org->name]`;`n        }`n    }`n`n    public function cases()`n    {`n        return $this->hasMany(CaseUser`:`:class`, 'individual_id'`, 'id')`;`n    }`n`n"
	arr["attachments"] := "`    /**`n     * Get the parent attachable model (case-item or task).`n     */`n    public function attachable()`n    {`n        return $this->morphTo()`;`n    }`n`n    public function activity()`n    {`n        return $this->hasOne(Activity`:`:class`, 'subject_id'`, 'id')->where('subject_type'`,'App\Models\Attachment')`;`n    }`n`n"
	arr["communications"] := "`n    public function attachmentUrl()`n    {`n        return $this->attachment`n            ? Storage`:`:disk('public')->url($this->attachemnt)`n            `: ''`;`n    }`n`n`n    /**`n     * Get all of the communication's attachments.`n     */`n    public function attachments()`n    {`n        return $this->morphMany(Attachment`:`:class`, 'attachable')`;`n    }`n`t`n`t`n    public function activity()`n    {`n        return $this->hasMany(Activity`:`:class`, 'subject_id'`, 'id')->where('subject_type'`, 'App\Models\Communication')->with('causer')->orderByDesc('created_at')`;`n    }`n`n`n"
	arr["cases"] := "`    public function getOverallProgressAttribute()`n    {`n        $this->loadCount([`n            'tasks'`,`n            'tasks as completed_tasks_count' => function (Builder $query) {`n                $query->where('status_id'`, StatusEnum`:`:closed()->value)`;`n            }`,`n        ])`;`n`n        if ($this->tasks_count == 0)`n            return 0`;`n        else`n            return $this->completed_tasks_count / $this->tasks_count * 100`;`n    }`n`n    public function assignRefId()`n    {`n        if (!$this->ref_id) {`n            $this->ref_id = $this->makeRefId()`;`n            $duplicate = CaseModel`:`:where('ref_id'`, $this->ref_id)->first()`;`n`n            if ($duplicate)`n                $this->ref_id = $this->makeRefId()`;`n`n            // $this->save()`;`n        }`n    }`n`n    public function makeRefId()`n    {`n        $permitted_chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'`;`n        return '0000' . substr(str_shuffle($permitted_chars)`, 0`, 4)`;`n    }`n`n    public function getRefIdForDisplayAttribute()`n    {`n        return 'CAS-' . substr($this->ref_id`, 4)`;`n    }`n`n    /**`n     * Get the tasks for the case.`n     */`n    public function tasks()`n    {`n        return $this->hasMany(Task`:`:class`, 'parent_id'`, 'id')`;`n    }`n`n`t/**`n     * Get the case users for the case.`n     */`n    public function caseUsers()`n    {`n        return $this->hasMany(CaseUser`:`:class`, 'task_id'`, 'id')`;`n    }`n`t`n    public function taskUsers()`n    {`n        return $this->hasMany(TaskUser`:`:class`,""task_id""`,""parent_id"")`;`n    }`n`n    public static function scopeDailyCount($query`, $start`, $end`, $dateField)`n    {`n        return  $query->whereBetween($dateField`, [$start`, $end])`n            ->selectRaw('DATE_FORMAT(' . $dateField . '`,""`%Y-`%m-`%d"") as date`, count(*) as total')`n            ->groupByRaw('DATE_FORMAT(' . $dateField . '`,""`%Y-`%m-`%d"")')`n            ->orderBy(""date"")`n            ->get()`;`n    }`n`t`n    public static function scopeMonthlyCount($query`, $start`, $end`, $dateField)`n    {`n        return`n            $query->whereBetween($dateField`, [$start`, $end])`n            ->selectRaw(""`n        YEAR(recieved_date) as year`,`n        MONTH(recieved_date) as month`,`n        count(*) as total"")`n            ->groupBy('year'`, 'month')`n            ->orderBy('year')`n            ->orderBy('month')`n            ->get()`;`n    }`n`t`n    public static function scopeWeeklyCount($query`, $start`, $end`, $dateField)`n    {`n        return  $query->whereBetween($dateField`, [$start`, $end])`n            ->selectRaw(""`n        WEEK(recieved_date) as week`,`n        YEAR(recieved_date) as year`,`n        count(*) as total"")`n            ->groupBy('week'`, 'year')`n            ->orderBy(""week"")`n            ->get()`;`n    }`n`n    public static function  getCasesQueryForIndividual($byOrg=false`, $byTeam=false`, $byHandler=false`,$byUser=false)`n    {`n        $org =  Auth`:`:user()->getCurrentOrg()['id']`;`n        $team =  Auth`:`:user()->team()->id`;`n        $query = CaseModel`:`:query()`;`n        // $query = $query->Orwhere('handler_id'`,Auth`:`:id())`;`n`n        if($byOrg){`n            $query = $query->where(""organisation_id""`, $org)`;`n        }else if ($byTeam){`n            $query = $query->where(""team_id""`, $team)`;`n        }else if($byUser){`n            $task_ids = CaseUser`:`:whereIndividualId(Auth`:`:id())->pluck(""task_id"")`;`n            $query = $query->wherein(""id""`,$task_ids)`;`n        } else {`n            $task_ids = CaseUser`:`:whereIndividualId(Auth`:`:id())->pluck(""task_id"")`;`n            $query = $query->where('organisation_id'`,$org)`n                            ->wherein(""id""`, $task_ids)`n                            ->where(""team_id""`, $team)`;`n`n        }`n`n`n        return $query`;`n    }`n`n    public static function scopeByStatus($query`, $id)`n    {`n        return $query->where('status_id'`, $id)`;`n    }`n`n    public function communications()`n    {`n        return $this->hasMany(CaseItem`:`:class`, ""task_id""`, ""id"")`;`n    }`n`n    public function comments(){`n        return $this->hasMany(TaskComment`:`:class`,'task_id'`, 'id')`;`n    }`n`n    public function activity()`n    {`n        return $this->hasMany(Activity`:`:class`, 'subject_id'`, 'id')->where('subject_type'`,'App\Models\CaseModel')->orderByDesc('created_at')`;`n    }`n`n    public function activities()`n    {`n        $activities = collect()`;`n        $caseItems = $this->communications()->withTrashed()->with('activity')->get()`;`n        $caseItemsActivity = $this->communications()->withTrashed()->with('activity')->get()->pluck(""activity"")`;`n        if (!$caseItemsActivity->isEmpty()) {`n            foreach ($caseItemsActivity as $caseItem) {`n                foreach($caseItem as $act){`n                    $activities->push($act)`;`n                }`n            }`n        }`n`n        foreach ($this->caseUsers as $user) {`n            if($user->activity->isNotEmpty()){`n                $activities->push($user->activity->first())`;`n            }`n        }`n`n        foreach($this->tasks as $task){`n            foreach($task->taskUsers as $act){`n                $activities->push($act->activity->first())`;`n            }`n        }`n        foreach($this->tasks as $task){`n            foreach($task->activity as $act){`n                $activities->push($act)`;`n            }`n        }`n`n        foreach($this->comments as $comment){`n            $activities->push($comment->activity->first())`;`n            // dd($comment)`;`n        }`n        if ($this->activity->isNotEmpty()){`n            $caseModel = $this->activity()->with('causer')->get()`;`n            foreach ($caseModel as $model) {`n                $activities->push($model)`;`n            }`n            // dd($caseModel)`;`n            $activities = $activities->sortByDesc(function ($activity) {`n                return $activity->created_at`;`n            })`;`n        }`n        return $activities`;`n    }`n`t`n`t"
	arr["checklists"] := "`n    public function toggleStatus()`n    {`n        $this->is_done = !$this->is_done`;`n    }`n`n`n    public function activity()`n    {`n        return $this->hasMany(Activity`:`:class`, 'subject_id'`, 'id')->orderByDesc('created_at')`;`n    }`n"
	arr["organisations"] := "`    public function user(){`n        return $this->belongsToMany(User`:`:class`, 'individual_organisation'`,'organisation_id'`,'individual_id')`;`n`n    }`n`t`n    public function team(){`n        return $this->hasMany(Team`:`:class)`;`n    }`n`n"
	arr["roles"] := "`n    /**`n     * The permissions that belong to the user.`n     */`n    public function permissions()`n    {`n        return $this->belongsToMany(Permission`:`:class)->wherePivot('deleted_at'`, null)`;`n    }`n`n"
	arr["tasks"] := "`    public static function scopeGetUserTasks($query`, $userId)`n    {`n        return $query->whereIn(""id""`, TaskUser`:`:whereUserId($userId)->get()->pluck(""task_id""))`;`n    }`n`n`tpublic function toggleStatus()`n    {`n        if ($this->status_id == StatusEnum`:`:completed()->value) {`n            $this->status_id = StatusEnum`:`:not_started()->value`;`n            $this->closed_date = null`;`n        } else {`n            $this->status_id = StatusEnum`:`:completed()->value`;`n            $this->closed_date = now()`;`n        }`n    }`n`n    public function checkLists()`n    {`n        return $this->hasMany(Checklist`:`:class`, 'task_id'`, 'id')`;`n    }`n`n    public  function  isComplete()`n    {`n        if ($this->status_id == StatusEnum`:`:completed()->value) {`n            $checklist = $this->checkLists()->get()`;`n            $total = $checklist->count()`;`n            $counter = 0`;`n            foreach ($checklist as $check) {`n                if ($check->is_done === 1)`n                    $counter = $counter + 1`;`n            }`n            return $total == $counter`;`n        } else`n            return true`;`n    }`n`n    public static function scopeDailyCount($query`, $start`, $end`, $dateField)`n    {`n        return  $query->whereBetween($dateField`, [$start`, $end])`n            ->selectRaw('DATE_FORMAT(' . $dateField . '`,""`%Y-`%m-`%d"") as date`, count(*) as total')`n            ->groupByRaw('DATE_FORMAT(' . $dateField . '`,""`%Y-`%m-`%d"")')`n            ->orderBy(""date"")`n            ->get()`;`n    }`n`t`n    public static function scopeMonthlyCount($query`, $start`, $end`, $dateField)`n    {`n        return`n            $query->whereBetween($dateField`, [$start`, $end])`n            ->selectRaw(""YEAR("" . $dateField . "") as year`,`n        MONTH("" . $dateField . "") as month`,`n        count(*) as total"")`n            ->groupBy('year'`, 'month')`n            ->orderBy(""year"")`n            ->orderBy(""month"")`n            ->get()`;`n    }`n`t`n    public static function scopeWeeklyCount($query`, $start`, $end`, $dateField)`n    {`n        return  $query->whereBetween($dateField`, [$start`, $end])`n            ->selectRaw(""`n        WEEK("" . $dateField . "") as week`,`n        YEAR("" . $dateField . "") as year`,`n        count(*) as total"")`n            ->groupBy('week'`, 'year')`n            ->orderBy(""week"")`n            ->get()`;`n    }`n`t`n`t/**`n     * Get the task users for the user.`n     */`n    public function taskUsers()`n    {`n        return $this->hasMany(TaskUser`:`:class`, 'task_id'`, 'id')`;`n    }`n`n    public function comments()`n    {`n        return $this->hasMany(TaskComment`:`:class`, 'task_id'`, 'id')`;`n    }`n`n    public function activity()`n    {`n        return $this->hasMany(Activity`:`:class`, 'subject_id'`, 'id')->where('subject_type'`, 'App\Models\Task')->orderByDesc('created_at')`;`n    }`n`n    public function activities()`n    {`n        $activities = collect()`;`n        $checklists = $this->checkLists()`;`n        foreach ($checklists as $checklist) {`n            foreach ($checklist as $check) {`n                $activities->push($check)`;`n            }`n        }`n`n        $comments = $this->comments()`;`n        foreach ($comments as $comment) {`n            foreach ($comment as $chk) {`n                $activities->push($chk)`;`n            }`n        }`n        foreach ($this->activity() as $act) {`n            $activities->push($act)`;`n        }`n`n        return $activities`;`n    }`n`t`n`t"
	arr["comments"] := "`    public function case()`n    {`n        return $this->belongsTo(CaseModel`:`:class`,'task_id'`,'id')`;`n    }`n`n    public function activity()`n    {`n        return $this->hasMany(Activity`:`:class`, 'subject_id'`, 'id')->where('subject_type'`,'App\Models\Comment')->orderByDesc('created_at')`;`n    }`n`n"
	arr["task_users"] := "`    public function activity()`n    {`n        return $this->hasMany(Activity`:`:class`,""subject_id""`,""id"")->orderByDesc('created_at')`;`n    }`n`n"
	arr["teams"] := "`    public function users()`n    {`n        return $this->hasMany(User`:`:class)`;`n    }`n"
	
	return arr[table_name_plural]
}


model_properties( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	
	if( InStr(data_type, "varchar") || InStr(data_type, "char") )
		t := "` * @property string $? value1 ?`n"
	else if( InStr(data_type, "bigint") || InStr(data_type, "int"))
		t := "` * @property integer $? value1 ?`n"
	else if( InStr(data_type, "enum") )
		t := "` * @property enum $? value1 ?`n"
	else
		t := "` * @property " data_type " $? value1 ?`n"
	
	return t
}


model_dvFields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	if ( RegExMatch(field_name, "_dv$") ){
		field := RegExReplace(field_name, "_dv$", "")
		t := "`        '" field "'`,`n"
	} else {
		t := ""
	}
	
	return t
}


model_ActivitylogOptions_fields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	arr := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	if( HasVal(arr, field_name) )
		return ""
	
	;~ if( related_table_singular )
		return "'? value1 ?'`, "
}


model_ActivitylogOptions(){
	global table_name_singular
	
	if( !isActivityLoggableTables() )
		return ""
	
	arr := {}
	arr["attachment"] := "'name',"
	arr["communication"] := "'from_organisation_id', 'from_individual_id', 'channel_id', 'reference_number', 'title', 'content', 'recieved_date', 'recieved_by'"
	arr["case"] := "'ref_id', 'title', 'purpose', 'action', 'organisation_id', 'team_id', 'from_organisation_id', 'from_individual_id', 'channel_id', 'priority_id', 'recieved_date', 'deadline', 'handler_id', 'status_id',"
	arr["task"] := "'ref_id', 'organisation_id', 'parent_id', 'sensitivity_id', 'priority_id', 'team_id', 'channel_id', 'thread_id', 'message_id', 'start_date', 'deadline', 'note', 'status_id', 'title',"
	
	if( arr[table_name_singular] )
		fields := arr[table_name_singular]
	else
		fields := runSubScaffold( "model_ActivitylogOptions_fields")
	
	return "`n`n    public function getActivitylogOptions()`: LogOptions`n    {`n        return LogOptions`:`:defaults()`n            ->logOnly([`n                " fields "`n            ])`n            ->logOnlyDirty()`;`n    }`n"
}


model_fillable( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	arr := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	if( HasVal(arr, field_name) )
		return ""
	
	return "`        '? value1 ?'`,`n"
}


model(){
	global
	model_a( table_name_singular, table_name_plural, reverse, primary_key, fields )
}
	
model_a(table_name_singular = 1, table_name_plural = 2, reverse = 0, primary_key = "id", fields=""){
	includes := model_includes()
	properties := runSubScaffold( "model_properties", 1)
	inheritance := model_inheritance()
	activitylogOptions := model_ActivitylogOptions()
	tableName := tableName( table_name_plural )
	casts := runSubScaffold( "model_casts")
	appends := runSubScaffold( "model_appends")
	validationRules := runSubScaffold( "model_validationRules")
	nullable := runSubScaffold( "model_nullable")
	dvFields := runSubScaffold( "model_dvFields")
	
	set_created_by := fields["created_by"] ? "`n            $model->created_by = optional(CauserResolver`:`:resolve())->id`;" : ""
	set_created_at := fields["created_at"] ? "`n            $model->created_at = now()`;" : ""
	set_updated_by := fields["updated_by"] ? "`n            $model->updated_by = optional(CauserResolver`:`:resolve())->id`;" : ""
	set_updated_at := fields["updated_at"] ? "`n            $model->updated_at = now()`;" : ""
	
	name_field := "`        return $this->" name_field() "`;`n"
	fillable := runSubScaffold( "model_fillable")
	keys := scaffoldFields("`            '? value1 ?'`,`n")
	dateGettersAndSetters := runSubScaffold( "model_dateGettersAndSetters")
	relations := runSubScaffold( "model_relations", 1)
	opposite_relations := opposite_relations(table_name_plural)
	
	customModelName := scaffoldModel( "? valueCC1 ?" )
	
	if( customModelName(table_name_singular) )
		customModelName := customModelName(table_name_singular)
	
	;~ customModelName := scaffoldModel( customModelName )
	file =C:\xampp\htdocs\gemen-reporting-module\app\Models\%customModelName%.php
	
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %includes%, " includes "
		StringReplace, content, content, %properties%, " properties "
		StringReplace, content, content, %inheritance%, " inheritance "
		StringReplace, content, content, %appends%, " appends "
		StringReplace, content, content, %casts%, " casts "
		StringReplace, content, content, %validationRules%, " validationRules "
		StringReplace, content, content, %nullable%, " nullable "
		StringReplace, content, content, %name_field%, " name_field "
		StringReplace, content, content, %fillable%, " fillable "
		StringReplace, content, content, %keys%, " keys "
		StringReplace, content, content, %dateGettersAndSetters%, " dateGettersAndSetters "
		StringReplace, content, content, %relations%, " relations "
	}else{
		t := "<?php`nnamespace App\Models`;`n`n" includes "`n/**`n * Class ? valueAT1 ?`n * @package App\Models\ModelBase`n *`n" properties " */`nclass ? valueCC1 ? extends " inheritance  activitylogOptions "`n`n    /**`n     * The table associated with the model.`n     *`n     * @var string`n     */`n    protected $table = '" tableName "'`;`n`n    /**`n     * The primary key for the model.`n     *`n     * @var string`n     */`n    protected $primaryKey = '" primary_key "'`;`n`n    /**`n     * Indicates if the IDs are auto-incrementing.`n     *`n     * @var bool`n     */`n    public $incrementing = true`;`n`n    /**`n     * Indicates if the model should be timestamped.`n     *`n     * @var bool`n     */`n    public $timestamps = true`;`n`n`n    const STATUSES = [`n        'success' => 'Success'`,`n        'failed' => 'Failed'`,`n        'processing' => 'Processing'`,`n    ]`;`n`n    protected $guarded = []`;`n    protected $casts = [`n" casts "    ]`;`n    protected $appends = [`n" appends "    ]`;`n`n    protected function rules($prefix = 'editing.')`n    {`n        return [`n" validationRules "        ]`;`n    }`n`n    public $nullable = [`n" nullable "    ]`;`n`n    public $localizedFields = [`n" dvFields "    ]`;`n`n    /**`n     * This is model Observer which helps to do the same actions automatically when you creating or updating models`n     *`n     * @var array`n     */`n    protected static function boot()`n    {`n        parent`:`:boot()`;`n        static`:`:creating(function ($model) {" set_created_by " " set_created_at "`n        })`;`n        static`:`:updating(function ($model) {" set_updated_by " " set_updated_at "`n        })`;`n    }`n`n    public function getSingularAttribute()`n    {`n        return '? valueL1 ?'`;`n    }`n`n    public function getName()`n    {`n" name_field "    }`n`n    /**`n     * The attributes that are mass assignable.`n     *`n     * @var array<int`, string>`n     */`n    protected $fillable = [`n" fillable "   ]`;`n`n    // /**`n    //  * The attributes that should be hidden.`n    //  *`n    //  * @var array<string`, string>`n    //  */`n    // protected $hidden = [`n    // ]`;`n`n    /**`n     * @return string[]`n     */`n    public static function keys()`: array`n    {`n        return [`n" keys "        ]`;`n    }`n`n" dateGettersAndSetters "`n`n" relations "`n`n" opposite_relations "}`n"

		StringReplace, t, t, ? valueCC1 ?, % customModelName, All
		content := scaffoldModel( t )
	}
		
	fileWrite( content, file )
}
	
yii_searchModel(){
	global
	yii_searchModel_a( table_name_singular, table_name_plural, reverse, primary_key, fields )
}
	
yii_searchModel_a(table_name_singular = 1, table_name_plural = 2, reverse = 0, primary_key = "id", fields=""){
	;~ includes := yii_model_includes()
	;~ properties := runSubScaffold( "model_properties", 1)
	;~ inheritance := model_inheritance()
	;~ activitylogOptions := model_ActivitylogOptions()
	;~ tableName := tableName( table_name_plural )
	;~ casts := runSubScaffold( "model_casts")
	;~ appends := runSubScaffold( "model_appends")
	validationRules := runSubScaffold( "yii_searchModel_validationRules")
	filters := runSubScaffold( "yii_searchModel_filters")
	;~ nullable := runSubScaffold( "model_nullable")
	;~ dvFields := runSubScaffold( "model_dvFields")
	
	;~ set_created_by := fields["created_by"] ? "`n            $model->created_by = optional(CauserResolver`:`:resolve())->id`;" : ""
	;~ set_created_at := fields["created_at"] ? "`n            $model->created_at = now()`;" : ""
	;~ set_updated_by := fields["updated_by"] ? "`n            $model->updated_by = optional(CauserResolver`:`:resolve())->id`;" : ""
	;~ set_updated_at := fields["updated_at"] ? "`n            $model->updated_at = now()`;" : ""
	
	;~ name_field := "`        return $this->" name_field() "`;`n"
	;~ fillable := runSubScaffold( "model_fillable")
	;~ keys := scaffoldFields("`            '? value1 ?'`,`n")
	;~ dateGettersAndSetters := runSubScaffold( "model_dateGettersAndSetters")
	;~ relations := runSubScaffold( "model_relations", 1)
	;~ opposite_relations := opposite_relations(table_name_plural)
	
	customModelName := scaffoldModel( "? valueCC1 ?" )
	
	if( customModelName(table_name_singular) )
		customModelName := customModelName(table_name_singular)
	
	;~ customModelName := scaffoldModel( customModelName )
	file =C:\xampp\htdocs\gemen-reporting-module\models\%customModelName%Search.php
	
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %includes%, " includes "
		StringReplace, content, content, %properties%, " properties "
		StringReplace, content, content, %inheritance%, " inheritance "
		StringReplace, content, content, %appends%, " appends "
		StringReplace, content, content, %casts%, " casts "
		StringReplace, content, content, %validationRules%, " validationRules "
		StringReplace, content, content, %nullable%, " nullable "
		StringReplace, content, content, %name_field%, " name_field "
		StringReplace, content, content, %fillable%, " fillable "
		StringReplace, content, content, %keys%, " keys "
		StringReplace, content, content, %dateGettersAndSetters%, " dateGettersAndSetters "
		StringReplace, content, content, %relations%, " relations "
	}else{
		t := "<?php`n`nnamespace app\models`;`n`nuse Yii`;`nuse yii\base\Model`;`nuse yii\data\ActiveDataProvider`;`nuse app\models\? valueCC1 ?`;`n`n/**`n * ? valueCC1 ?Search represents the model behind the search form about ``common\models\? valueCC1 ?``.`n */`nclass ? valueCC1 ?Search extends ? valueCC1 ?`n{`n    /**`n     * @inheritdoc`n     */`n    public function rules()`n    {`n        return [`n" validationRules "        ]`;`n    }`n`n    /**`n     * @inheritdoc`n     */`n    public function scenarios()`n    {`n        // bypass scenarios() implementation in the parent class`n        return Model`:`:scenarios()`;`n    }`n`n    /**`n     * Creates data provider instance with search query applied`n     *`n     * @param array $params`n     *`n     * @return ActiveDataProvider`n     */`n    public function search($params)`n    {`n        $query = ? valueCC1 ?`:`:find()`;`n`n        $dataProvider = new ActiveDataProvider([`n            'query' => $query`,`n        ])`;`n`n        if (!($this->load($params) && $this->validate())) {`n            return $dataProvider`;`n        }`n`n        $query->andFilterWhere([`n" filters "        ])`;`n`n        // $query->andFilterWhere(['like'`, 'title'`, $this->title])`n        //     ->andFilterWhere(['like'`, 'description'`, $this->description])`;`n`n        return $dataProvider`;`n    }`n}`n"

		StringReplace, t, t, ? valueCC1 ?, % customModelName, All
		content := scaffoldModel( t )
	}
		
	fileWrite( content, file )
}


yii_model_attributeLabels( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	
	without_id := RegExReplace(field_name, "_id$", "")
	
	;~ if( InStr(data_type, "varchar") || InStr(data_type, "char") )
		t := "`            '? value1 ?' => '? valueAT91 ?'`,`n"
		
	t := replaceMarker(without_id, t, 91)
	
	return t
}


to_clip_two(){
	global
	to_clip_two_a( table_name_singular, table_name_plural, reverse, primary_key, fields )
}
	
to_clip_two_a(table_name_singular = 1, table_name_plural = 2, reverse = 0, primary_key = "id", fields=""){
	global clip_two
	
		t := "<template>`n    <Modal `:title=""$t('? valueSH1 ?')"" ref=""? valueC1 ?Modal"">`n`n`n        <div class=""mx-auto px-4 mt-4 font-robotoiyyu"">`n`n            <label class=""rtl`:text-right rtl`:text-lg text-gray-600 text-sm font-normal"">`n                {{$t('remarks')}}`n            </label>`n            <textarea v-model=""remarks"" rows=""2""  class=""w-full border p-2 rounded-md"">`n`n            </textarea>`n`n            <div class=""w-full mt-5  flex "">`n                <primaryButton @click=""? valueC1 ?"" `:name=""$t('send')"" />`n            </div>`n`n        </div>`n    </Modal>`n</template>`n`n<script setup>`nimport Modal from '@/components/Modal.vue'`;`nimport primaryButton from '@/components/buttons/primary.vue'`;`nimport { useDocument } from '@/stores/gemsStore/document'`;`nimport { ref } from 'vue'`;`nimport { storeToRefs } from 'pinia'`;`nimport { useAppStore } from '@/stores/index'`nimport { showToast } from '../../../utils/helpers'`;`nimport { useI18n } from 'vue-i18n'`;`nimport { useToast } from ""primevue/usetoast""`;`n`nconst toast = useToast()`;`nconst documentStore = useDocument()`nconst store = useAppStore()`nconst { document } = storeToRefs(documentStore)`nconst { t } = useI18n()`n`nconst remarks = ref(null)`nconst props = defineProps(['documentId'])`n`nconst ? valueC1 ?Modal = ref(null)`n`nconst open = () => {`n    ? valueC1 ?Modal.value.openModal()`n}`n`n`nconst close = () => {`n    ? valueC1 ?Modal.value.closeModal()`n}`n`ndefineExpose({ open`, close })`n`nconst ? valueC1 ? = () => {`n    documentStore.? valueC1 ?(props.documentId`, {remarks`: remarks.value}).then(() => {`n        documentStore.getDocument(props.documentId)`n        showToast(toast`, t('successfully-processed-for-correction')`, t(""successfully-processed-for-correction"")`, 'success')`n    }).catch((error) => {`n        showToast(toast`, t(""error"")`, t('failed-to-send-correction')`, 'error')`n    })`n}`n`n`n`n`n`n</script>`n"

	clip_two := scaffoldModel( t )
}
	
yii_model(){
	global
	yii_model_a( table_name_singular, table_name_plural, reverse, primary_key, fields )
}
	
yii_model_a(table_name_singular = 1, table_name_plural = 2, reverse = 0, primary_key = "id", fields=""){
	global clip_two
	includes := yii_model_includes()
	properties := runSubScaffold( "model_properties", 1)
	;~ inheritance := model_inheritance()
	;~ activitylogOptions := model_ActivitylogOptions()
	tableName := tableName( table_name_plural )
	;~ casts := runSubScaffold( "model_casts")
	;~ appends := runSubScaffold( "model_appends")
	validationRules := runSubScaffold( "yii_model_validationRules")
	attributeLabels := runSubScaffold( "yii_model_attributeLabels")
	;~ nullable := runSubScaffold( "model_nullable")
	;~ dvFields := runSubScaffold( "model_dvFields")
	
	;~ set_created_by := fields["created_by"] ? "`n            $model->created_by = optional(CauserResolver`:`:resolve())->id`;" : ""
	;~ set_created_at := fields["created_at"] ? "`n            $model->created_at = now()`;" : ""
	;~ set_updated_by := fields["updated_by"] ? "`n            $model->updated_by = optional(CauserResolver`:`:resolve())->id`;" : ""
	;~ set_updated_at := fields["updated_at"] ? "`n            $model->updated_at = now()`;" : ""
	
	name_field := "`        return $this->" name_field() "`;`n"
	;~ fillable := runSubScaffold( "model_fillable")
	;~ keys := scaffoldFields("`            '? value1 ?'`,`n")
	;~ dateGettersAndSetters := runSubScaffold( "model_dateGettersAndSetters")
	relations := runSubScaffold( "yii_model_relations", 1)
	opposite_relations := opposite_relations(table_name_plural)
	
	customModelName := scaffoldModel( "? valueCC1 ?" )
	
	if( customModelName(table_name_singular) )
		customModelName := customModelName(table_name_singular)
	
	;~ customModelName := scaffoldModel( customModelName )
	file =C:\xampp\htdocs\gemen-reporting-module\models\%customModelName%.php
	
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %includes%, " includes "
		StringReplace, content, content, %properties%, " properties "
		StringReplace, content, content, %inheritance%, " inheritance "
		StringReplace, content, content, %appends%, " appends "
		StringReplace, content, content, %casts%, " casts "
		StringReplace, content, content, %validationRules%, " validationRules "
		StringReplace, content, content, %nullable%, " nullable "
		StringReplace, content, content, %name_field%, " name_field "
		StringReplace, content, content, %fillable%, " fillable "
		StringReplace, content, content, %keys%, " keys "
		StringReplace, content, content, %dateGettersAndSetters%, " dateGettersAndSetters "
		StringReplace, content, content, %relations%, " relations "
	}else{
		t := "<?php`n`nnamespace app\models`;`n`n" includes "`n`n/**`n * ? valueCC1 ? model`n *`n" properties " */`nclass ? valueCC1 ? extends ActiveRecord`n{`n    const STATUS_DELETED = 0`;`n    const STATUS_INACTIVE = 9`;`n    const STATUS_ACTIVE = 10`;`n`n`n    /**`n     * {@inheritdoc}`n     */`n    public static function tableName()`n    {`n        return '{{`%? valueS2 ?}}'`;`n    }`n`n    /**`n     * {@inheritdoc}`n     */`n    public function behaviors()`n    {`n        return [`n            TimestampBehavior`:`:class`,`n        ]`;`n    }`n`n    /**`n     * @inheritdoc`n     */`n    public function rules()`n    {`n        return [`n" validationRules "        ]`;`n    }`n`n    /**`n     * @inheritdoc`n     */`n    public function attributeLabels()`n    {`n        return [`n" attributeLabels "        ]`;`n    }`n`t`n" relations "`n`n" opposite_relations "`t`n`n}`n"

		StringReplace, t, t, ? valueCC1 ?, % customModelName, All
		content := scaffoldModel( t )
	}
	
	clip_two := content
		
	;~ fileWrite( content, file )
}
	
factory_definitions( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	arr := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	if( HasVal(arr, field_name) )
		return ""
	
	if(related_table_singular != "" ){
		t := "`            '? value1 ?' => fn () => ? valueCC11 ?Factory`:`:new()->create()->id`,`n"
		without_id := StrReplace(field_name, "_id", "")
		t := replaceMarker(without_id, t, 91)
	}else
		t := "`            '? value1 ?' => $this->faker->name()`,`n"
	
	return t
}

factory(){
	global
	factory_a( table_name_singular, table_name_plural, reverse )
}
	
factory_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	definitions := runSubScaffold( "factory_definitions")
	;~ definitions := scaffoldFields("`            '? value1 ?' => $this->faker->name()`,`n")
	
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %definitions%, " definitions "
	}else
		content := scaffoldModel("<?php`n`nnamespace Database\Factories`;`n`nuse Illuminate\Database\Eloquent\Factories\Factory`;`nuse Illuminate\Support\Str`;`n`n/**`n * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\? valueCC1 ?>`n */`nclass ? valueCC1 ?Factory extends Factory`n{`n    /**`n     * Define the model's default state.`n     *`n     * @return array<string`, mixed>`n     */`n    public function definition()`n    {`n        return [`n" definitions "`n        ]`;`n    }`n`n    // /**`n    //  * `n    //  *`n    //  * @return static`n    //  */`n    // public function unverified()`n    // {`n    //     return $this->state(function (array $attributes) {`n    //         return [`n    //             'email_verified_at' => null`,`n    //         ]`;`n    //     })`;`n    // }`n}`n")
	
	name := scaffoldModel("? valueCC1 ?Factory")
	
	file =C:\xampp\htdocs\gems-ws-api\database\factories\%name%.php
	fileWrite( content, file )
}

Seeder_attributes( field_name, data_type, nullability, related_table_singular, related_table_plural ){
	ignoreArr := {"created_by": 1, "updated_by": 1, "created_at": 1, "updated_at": 1, "deleted_at": 1}

	if( ignoreArr[field_name] )
		return ""
	else
		return "`                '? value1 ?' => 'test'`,`n"
}

seeder(){
	global
	seeder_a( table_name_singular, table_name_plural, reverse )
}
	
seeder_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	
	attributes := runSubScaffold( "Seeder_attributes")
	
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %attributes%, " attributes "
	}else
		content := scaffoldModel("<?php`n`nnamespace Database\Seeders`;`n`nuse Illuminate\Database\Console\Seeds\WithoutModelEvents`;`nuse Illuminate\Database\Seeder`;`nuse Illuminate\Support\Facades\DB`;`nuse Illuminate\Support\Str`;`n`nclass ? valueCC1 ?Seeder extends Seeder`n{`n    /**`n     * Run the database seeds.`n     *`n     * @return void`n     */`n    public function run()`n    {`n        DB`:`:table('? valueS2 ?')->insert([`n            [`n" attributes "`n            ]`,`n        ])`;`n    }`n}`n")
	
	name := scaffoldModel("? valueCC1 ?Seeder")
	file =C:\xampp\htdocs\gems-ws-api\database\seeders\%name%.php
	
	fileWrite( content, file )
}
	
updateDatabaseSeeder(){
	global
	updateDatabaseSeeder_a( table_name_singular, table_name_plural, reverse )
}
	
updateDatabaseSeeder_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	seeder := scaffoldModel("`            // ? valueCC1 ?Seeder`:`:class`,`n")
	
	file =C:\xampp\htdocs\gems-ws-api\database\seeders\DatabaseSeeder.php
	FileRead, content, %file%
	StringReplace, content, content, `        ])`;, %seeder%`        ])`;
	
	fileWrite( content, file )
}
	
yii_IndexView_fields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	;~ arr := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	;~ if( HasVal(arr, field_name) )
		;~ return ""
	
	;~ required := "nullable|"`
	;~ if( InStr(nullability, "No") )
		;~ required := "required|"
	
	;~ numeric := ""
	;~ if( InStr(data_type, "int(") and !related_table_singular )
		;~ numeric := "numeric|"
	
	;~ if(data_type = "datetime" or data_type = "timestamp" or data_type = "date" )
		;~ t := "`            '? value1 ?' => '" required "'`,`n"
	;~ else
		t := "`            '? value1 ?'`,`n"
	
	return t
}

apiController_validationRules( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	arr := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	if( HasVal(arr, field_name) )
		return ""
	
	required := "nullable|"`
	if( InStr(nullability, "No") )
		required := "required|"
	
	numeric := ""
	if( InStr(data_type, "int(") and !related_table_singular )
		numeric := "numeric|"
	
	if(data_type = "datetime" or data_type = "timestamp" or data_type = "date" )
		t := "`            '? value1 ?' => '" required "'`,`n"
	else
		t := "`            '? value1 ?' => '" required numeric "'`,`n"
	
	return t
}

customModelName(table_name_singular){
	global
	
	customModelName := { "case": "CaseModel" }
	return customModelName[table_name_singular]
}


gemsApi_apiController_allowedIncludes( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	arr := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	if( HasVal(arr, field_name) )
		return ""
	
	if( related_table_singular )
		t := "'? valueC12 ?'`, "
	
	return t
}


gemsApi_apiController_allowedFilters( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	blacklist := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	if( HasVal(blacklist, field_name) )
		return ""
	
	if( InStr(data_type, "varchar(") )
		t := "            // AllowedFilter`:`:partial('? value1 ?')`,`n"
	
	return t
}


gemsApi_apiController(){
	global
	gemsApi_apiController_a( table_name_singular, table_name_plural, reverse )
}
	
gemsApi_apiController_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	validationRules := runSubScaffold( "apiController_validationRules")
	allowedIncludes := runSubScaffold( "gemsApi_apiController_allowedIncludes")
	allowedFilters := runSubScaffold( "gemsApi_apiController_allowedFilters")
	
	t := "<?php`n`nnamespace App\Http\Controllers`;`n`nuse App\Http\Controllers\Controller`;`nuse App\Http\Resources\? valueCC1 ?Resource`;`nuse App\Models\? valueCC1 ?`;`nuse Symfony\Component\HttpFoundation\Response`;`nuse Illuminate\Http\Request`;`nuse Illuminate\Support\Facades\Validator`;`nuse App\Repositories\? valueCC91 ?Repository`;`nuse Spatie\QueryBuilder\AllowedFilter`;`nuse Spatie\QueryBuilder\QueryBuilder`;`n`nclass ? valueCC91 ?Controller extends Controller`n{`n    /**`n     * Display a listing of the resource.`n     * https`://gems.te.egov.mv/api/? valueSH2 ??page=1&filter[priority_id]=2000&orderBy=-id`n     *`n     * @return \Illuminate\Contracts\View\View`n     */`n    public function index(Request $request)`n    {`n        // $this->authorize('viewAny'`, ? valueCC1 ?`:`:class)`;`n`n        $? valueS2 ? = ? valueCC1 ?`:`:query()`;`n`n        $allowedFilters = [`n            AllowedFilter`:`:exact('id')`,`n" allowedFilters "            'created_at'`,`n            'updated_at'`,`n        ]`;`n`n        $allowedSorts = ['id'`, 'created_at'`, 'updated_at']`;`n`n        $allowedIncludes = [" allowedIncludes "]`;`n`n        $query = QueryBuilder`:`:for($? valueS2 ?)`n            ->allowedFields((new ? valueCC1 ?())->keys())`n            ->allowedIncludes($allowedIncludes)`n            ->allowedFilters($allowedFilters)`n            ->allowedSorts($allowedSorts)`;`n`n        return ? valueCC1 ?Resource`:`:collection($query->paginate())`;`n    }`n`n    protected function rules()`n    {`n        return [`n" validationRules "        ]`;`n    }`n`n    /**`n     * Show the form for creating a new resource.`n     *`n     * @return \Illuminate\Contracts\View\View`n     */`n    // public function create()`n    // {`n    //     $item = new ? valueCC1 ?()`;`n    //     $item->_token = csrf_token()`;`n    //     $item->_uri = ""/? valueS1 ?""`;`n    //     return view(""? valueS1 ?.edit""`, compact('item'))`;`n    // }`n`n    /**`n     * Store a newly created resource in storage.`n     *`n     * @param Request $request`n     * @return \Illuminate\Routing\Redirector`n     */`n    public function store(Request $request)`n    {`n        $validator = Validator`:`:make($request->all()`, $this->rules())`;`n        if ($validator->fails()) {`n            return response()->json([`n                    'errors' => $validator->errors()`,`n                ]`, Response`:`:HTTP_BAD_REQUEST)`;`n        }`n`n        $? valueS1 ? = new ? valueCC1 ?`;`n        $? valueS1 ?->fill($request->validate($this->rules()))`;`n        $? valueS1 ?->save()`;`n        `n        $? valueS1 ?->load('senderOrg'`, 'senderTeam'`, 'senderIndiv'`, 'createdByOrg'`, 'createdByTeam')`;`n`n        return response()->json([`n                'data' => new ? valueCC1 ?Resource($? valueS1 ?)`,`n            ]`, Response`:`:HTTP_CREATED)`;`n    }`n`n    /**`n     * Display the specified resource.`n     *`n     * @param int $id`n     * @return \Illuminate\Contracts\View\View`n     */`n    public function show($id)`n    {`n        $? valueS1 ? = ? valueCC1 ?`:`:query()->findOrFail($id)`;`n        $? valueS1 ?->load('senderOrg'`, 'senderTeam'`, 'senderIndiv'`, 'createdByOrg'`, 'createdByTeam'`, '? valueS1 ?Type')`;`n        return response()->json([`n                'data' => new ? valueCC1 ?Resource($? valueS1 ?)`,`n            ]`, Response`:`:HTTP_OK)`;`n    }`n`n    /**`n     * Show the form for editing the specified resource.`n     *`n     * @param int $id`n     * @return \Illuminate\Contracts\View\View`n     */`n    // public function edit($id)`n    // {`n    //     $item = ? valueCC1 ?`:`:query()->findOrFail($id)`;`n    //     $item->_token = csrf_token()`;`n    //     $item->_method = 'PATCH'`;`n    //     $item->_uri = ""/? valueS1 ?/$item->id""`;`n    //     return view(""? valueS1 ?.edit""`, compact('item'))`;`n    // }`n`n    /**`n     * Update the specified resource in storage.`n     *`n     * @param int $id`n     * @param Request $request`n     * @return \Illuminate\Routing\Redirector`n     */`n    public function update(? valueCC1 ? $? valueS1 ?`, Request $request)`n    {`n        $validator = Validator`:`:make($request->all()`, $this->rules())`;`n        if ($validator->fails()) {`n            return response()->json([`n                    'errors' => $validator->errors()`,`n                ]`, Response`:`:HTTP_BAD_REQUEST)`;`n        }`n`n        $? valueS1 ?->update($request->validate($this->rules()))`;`n`n        $? valueS1 ?->load('senderOrg'`, 'senderTeam'`, 'senderIndiv'`, 'createdByOrg'`, 'createdByTeam')`;`n`n        return response()->json([`n                'data' => new ? valueCC1 ?Resource($? valueS1 ?)`,`n            ]`, Response`:`:HTTP_OK)`;`n    }`n`n    /**`n     * Remove the specified resource from storage.`n     *`n     * @param int $id`n     * @return \Illuminate\Routing\Redirector`n     */`n    public function destroy($id)`n    {`n        ? valueCC1 ?`:`:destroy($id)`;`n        return redirect(""/? valueS1 ?"")`;`n    }`n}`n"
	
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( table_name_singular, t, 91)
	
	content := scaffoldModel(t)
	
	name := scaffoldModel("? valueCC1 ?Controller")
	file =C:\xampp\htdocs\gems-ws-api\app\Http\Controllers\%name%.php
	
	fileWrite( content, file )
}
	
ws_gemsAPI_apiController(){
	global
	ws_gemsAPI_apiController_a( table_name_singular, table_name_plural, reverse )
}
	
ws_gemsAPI_apiController_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	;~ validationRules := runSubScaffold( "apiController_validationRules")
	allowedIncludes := runSubScaffold( "gemsApi_apiController_allowedIncludes")
	allowedFilters := runSubScaffold( "gemsApi_apiController_allowedFilters")
	
	t := "<?php`n`nnamespace App\Http\Controllers`;`n`nuse App\Http\Controllers\Controller`;`nuse App\Http\Resources\? valueCC1 ?Resource`;`nuse App\Models\? valueCC1 ?`;`nuse Illuminate\Http\Request`;`nuse Illuminate\Http\Response`;`nuse Illuminate\Support\Facades\Validator`;`nuse App\Repositories\? valueCC1 ?Repository`;`nuse Spatie\QueryBuilder\AllowedFilter`;`nuse Spatie\QueryBuilder\QueryBuilder`;`nuse App\Http\Requests\Store? valueCC1 ?Request`;`nuse App\Http\Requests\Update? valueCC1 ?Request`;`nuse Illuminate\Http\Resources\Json\AnonymousResourceCollection`;`n`nclass ? valueCC1 ?Controller extends Controller`n{`n`n    /**`n     * @OA\Get(`n     *     path=""/? valueS2 ?""`,`n     *`n     *     @OA\Response(`n     *         response=""200""`,`n     *         description=""The data""`n     *     )`n     * )`n     */`n    public function index()`: AnonymousResourceCollection`n    {`n        $allowedFilters = [`n            AllowedFilter`:`:exact('id')`,`n" allowedFilters "            'created_at'`,`n            'updated_at'`,`n        ]`;`n`n        $allowedSorts = ['id'`, 'created_at'`, 'updated_at']`;`n`n        $allowedIncludes = [" allowedIncludes "]`;`n`n        $? valueS2 ? = QueryBuilder`:`:for(? valueCC1 ?`:`:class)`n            ->allowedFields((new ? valueCC1 ?())->keys())`n            ->allowedIncludes($allowedIncludes)`n            ->allowedFilters($allowedFilters)`n            ->allowedSorts($allowedSorts)`n            ->jsonPaginate()`;`n        return ? valueCC1 ?Resource`:`:collection($? valueS2 ?)`;`n    }`n`n    public function show($id)`: ? valueCC1 ?Resource`n    {`n        $? valueS1 ? = QueryBuilder`:`:for(? valueCC1 ?`:`:class)->findOrFail($id)`;`n        $? valueS1 ?->load(" allowedIncludes ")`;`n`n        return new ? valueCC1 ?Resource($? valueS1 ?)`;`n    }`n`n    public function store(Store? valueCC1 ?Request $request)`: ? valueCC1 ?Resource`n    {`n        $? valueS1 ? = QueryBuilder`:`:for(? valueCC1 ?`:`:class)->create(array_merge($request->validated()`, ['is_verified' => false]))`;`n`n        return new ? valueCC1 ?Resource($? valueS1 ?)`;`n    }`n`n    public function update(Update? valueCC1 ?Request $request`, $id)`: ? valueCC1 ?Resource`n    {`n        $? valueS1 ? = QueryBuilder`:`:for(? valueCC1 ?`:`:class)->findOrFail($id)`;`n        $? valueS1 ?->fill($request->validated())`;`n        $? valueS1 ?->save()`;`n`n        return new ? valueCC1 ?Resource($? valueS1 ?)`;`n    }`n`n    public function destroy($id)`n    {`n        $? valueS1 ? = QueryBuilder`:`:for(? valueCC1 ?`:`:class)->findOrFail($id)`;`n        $? valueS1 ?->delete()`;`n`n        return response(content`: null`, status`: Response`:`:HTTP_NO_CONTENT)`;`n    }`n`n    public function current(Request $request)`n    {`n        return (new ? valueCC1 ?Resource($request->currentTenant()))->response()->setStatusCode(Response`:`:HTTP_OK)`;`n    }`n}`n"
	
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( table_name_singular, t, 91)
	
	content := scaffoldModel(t)
	
	name := scaffoldModel("? valueCC1 ?Controller")
	file =C:\xampp\htdocs\gems-ws-api\app\Http\Controllers\%name%.php
	
	fileWrite( content, file )
}
	
yii_IndexView(){
	global
	yii_IndexView_a( table_name_singular, table_name_plural, reverse )
}
	
yii_IndexView_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	fields := runSubScaffold( "yii_IndexView_fields")
	
	t := "<?php`n`nuse yii\helpers\Html`;`nuse yii\grid\GridView`;`nuse yii\helpers\Url`;`n`n/* @var $this yii\web\View */`n/* @var $searchModel app\models\? valueCC1 ?Search */`n/* @var $dataProvider yii\data\ActiveDataProvider */`n`n$this->title = '? valueAT2 ?'`;`n$this->params['breadcrumbs'][] = $this->title`;`n?>`n<div class=""? valueS1 ?-index"">`n`n    <h1><?= Html`:`:encode($this->title) ?></h1>`n    <?php // echo $this->render('_search'`, ['model' => $searchModel])`; ?>`n`n    <p>`n        <?= Html`:`:a('Create ? valueAT1 ?'`, ['create']`, ['class' => 'btn btn-success']) ?>`n    </p>`n`n    <?= GridView`:`:widget([`n        'dataProvider' => $dataProvider`,`n        'filterModel' => $searchModel`,`n        'columns' => [`n" fields "            // '? value1 ?`:ntext'`,`n            // [`n            //     'attribute' => '? value1 ?'`,`n            //     'value' => function ($model) {`n            //         return empty($model->? value1 ?) ? '-' `: $model->? value12 ?->title`;`n            //     }`,`n            // ]`,`n            [`n                'class' => 'yii\grid\ActionColumn'`,`n                'template' => '{view} {update} {images} {delete}'`,`n                'buttons' => [`n                    'images' => function ($url`, $model`, $key) {`n                         return Html`:`:a('<span class=""glyphicon glyphicon glyphicon-picture"" aria-label=""Image""></span>'`, Url`:`:to(['image/index'`, 'id' => $model->" primary_key() "]))`;`n                    }`n                ]`,`n            ]`,`n        ]`,`n    ])`; ?>`n`n</div>`n"
	
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( table_name_singular, t, 91)
	
	content := scaffoldModel(t)
	
	name := scaffoldModel("? valueSH1 ?")
	FileCreateDir, C:\xampp\htdocs\gemen-reporting-module\views\%name%
	
	file =C:\xampp\htdocs\gemen-reporting-module\views\%name%\index.php
	
	fileWrite( content, file )
}
	
vue_button(){
	global
	vue_button_a( table_name_singular, table_name_plural, reverse )
}
	
vue_button_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	;~ fields := runSubScaffold( "yii_IndexView_fields")
	
	t := "<template>`n    <button type=""button"" @click=""$emit('? valueC1 ?Modal')"" data-tooltip-target=""tooltip-archive"" class=""flex flex-row"">`n        <div x-data=""{ show`: false }"" at_mouseenter=""show = true"" at_mouseleave=""show = false"" class=""relative"">`n            <div class=""flex hover`:bg-slate-200 rounded-full w-8 h-8 items-center justify-center"">`n                <tickCircle />`n`n            </div>`n            <div x-show=""show"" class=""absolute transform text-white text-sm rounded py-1 px-2 bg-slate-900 whitespace-nowrap z-[1000] rtl`:iyyu-normal`n-bottom-10 left-1/2 -translate-x-1/2`n"" style=""display`: none`;"">`n                $t('? valueSH1 ?')`n            </div>`n        </div>`n`n    </button>`n`n</template>`n`n`n<script setup>`n    import {`n        useDocument`n    } from '@/stores/gemsStore/document'`;`n    import {`n        ref`n    } from 'vue'`;`n    import {`n        storeToRefs`n    } from 'pinia'`;`n    import {`n        useAppStore`n    } from '@/stores/index'`n    import {`n        showToast`n    } from '@/utils/helpers'`;`n    import {`n        useI18n`n    } from 'vue-i18n'`;`n    import {`n        useToast`n    } from ""primevue/usetoast""`;`n    import tickCircle from '@/components/icons/tick-circle.vue'`;`n`n    const toast = useToast()`;`n    const documentStore = useDocument()`n    const store = useAppStore()`n    const {`n        document`n    } = storeToRefs(documentStore)`n    const {`n        t`n    } = useI18n()`n`n    const props = defineProps(['documentId'])`n`n</script>`n"
	
	;~ if( customModelName(table_name_singular) )
		;~ StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	;~ t := replaceMarker( table_name_singular, t, 91)
	
	content := scaffoldModel(t)
	
	name := scaffoldModel("? valueSH1 ?")
	FileCreateDir, C:\xampp\htdocs\gems-ws-app\resources\js\src\views\documents\components\list\detail\topbar\%name%
	
	file =C:\xampp\htdocs\gems-ws-app\resources\js\src\views\documents\components\list\detail\topbar\%name%\button.vue
	
	fileWrite( content, file )
}
	
vue_modal(){
	global
	vue_modal_a( table_name_singular, table_name_plural, reverse )
}
	
vue_modal_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	;~ fields := runSubScaffold( "yii_IndexView_fields")
	
	t := "<template>`n    <Modal `:title=""$t('hold-thread-for-policy-decision')"" ref=""? valueC1 ?Modal"">`n        <div class=""mx-auto px-4 mt-4 font-robotoiyyu"">`n`n            <label class=""rtl`:text-right rtl`:text-lg text-gray-600 text-sm font-normal pb-5"">`n                <em>{{ $t('are-you-sure-you-want-to-change-the-state-to-? valueSH1 ?') }}</em>`n            </label>`n            `n            <label class=""rtl`:text-right rtl`:text-lg text-gray-600 text-sm font-normal"">`n                {{ $t('remarks') }}`n            </label>`n            <textarea v-model=""remarks"" rows=""2"" class=""w-full border p-2 rounded-md"">`n`n            </textarea>`n`n            <div class=""w-full mt-5  flex "">`n                <primaryButton @click=""? valueC1 ?"" `:name=""$t('? valueSH1 ?')"" />`n            </div>`n`n        </div>`n    </Modal>`n`n</template>`n`n`n<script setup>`n    import Modal from '@/components/Modal.vue'`;`n    import primaryButton from '@/components/buttons/primary.vue'`;`n    import {`n        useDocument`n    } from '@/stores/gemsStore/document'`;`n    import {`n        ref`n    } from 'vue'`;`n    import {`n        storeToRefs`n    } from 'pinia'`;`n    import {`n        useAppStore`n    } from '@/stores/index'`n    import {`n        showToast`n    } from '@/utils/helpers'`;`n    import {`n        useI18n`n    } from 'vue-i18n'`;`n    import {`n        useToast`n    } from ""primevue/usetoast""`;`n`n    const toast = useToast()`;`n    const documentStore = useDocument()`n    const store = useAppStore()`n    const {`n        document`n    } = storeToRefs(documentStore)`n    const {`n        t`n    } = useI18n()`n`n    const remarks = ref(null)`n    const props = defineProps(['documentId'])`n`n    const ? valueC1 ?Modal = ref(null)`n`n    const open = () => {`n        ? valueC1 ?Modal.value.openModal()`n    }`n`n`n    const close = () => {`n        ? valueC1 ?Modal.value.closeModal()`n    }`n`n    defineExpose({`n        open`,`n        close`n    })`n`n    const ? valueC1 ? = () => {`n        documentStore.? valueC1 ?(props.documentId`, {`n            remarks`: remarks.value`n        }).then(() => {`n            documentStore.getDocument(props.documentId)`n            showToast(toast`, t('successfully-policy-held')`, t(""successfully-? valueSH1 ?ed"")`, 'success')`n        }).catch((error) => {`n            showToast(toast`, t(""error"")`, t('failed-to-? valueSH1 ?')`, 'error')`n        })`n    }`n`n</script>`n"
	
	;~ if( customModelName(table_name_singular) )
		;~ StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	;~ t := replaceMarker( table_name_singular, t, 91)
	
	content := scaffoldModel(t)
	
	name := scaffoldModel("? valueSH1 ?")
	FileCreateDir, C:\xampp\htdocs\gems-ws-app\resources\js\src\views\documents\components\list\detail\topbar\%name%
	
	file =C:\xampp\htdocs\gems-ws-app\resources\js\src\views\documents\components\list\detail\topbar\%name%\modal.vue
	
	fileWrite( content, file )
}
	
vue_topbar_component(){
	global
	vue_topbar_component_a( table_name_singular, table_name_plural, reverse )
}
	
vue_topbar_component_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	;~ fields := runSubScaffold( "yii_IndexView_fields")
	
	t := "<template>`n    <buttonComponent @? valueC1 ?Modal=""modalRef.open()"" />`n    <modal ref=""modalRef"" />`n</template>`n`n`n<script setup>`n    import buttonComponent from '@/views/documents/components/list/detail/topbar/? valueSH1 ?/button.vue'`;`n    import modal from '@/views/documents/components/list/detail/topbar/? valueSH1 ?/modal.vue'`;`n    import primaryButton from '@/components/buttons/primary.vue'`;`n    import {`n        useDocument`n    } from '@/stores/gemsStore/document'`;`n    import {`n        ref`n    } from 'vue'`;`n    import {`n        storeToRefs`n    } from 'pinia'`;`n    import {`n        useAppStore`n    } from '@/stores/index'`n    import {`n        showToast`n    } from '@/utils/helpers'`;`n    import {`n        useI18n`n    } from 'vue-i18n'`;`n    import {`n        useToast`n    } from ""primevue/usetoast""`;`n    import tickCircle from '@/components/icons/tick-circle.vue'`;`n`n    const toast = useToast()`;`n    const documentStore = useDocument()`n    const store = useAppStore()`n    const {`n        document`n    } = storeToRefs(documentStore)`n    const {`n        t`n    } = useI18n()`n`n    const modalRef = ref(null)`n    const props = defineProps(['documentId'])`n`n`n</script>`n"
	
	;~ if( customModelName(table_name_singular) )
		;~ StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	;~ t := replaceMarker( table_name_singular, t, 91)
	
	content := scaffoldModel(t)
	
	name := scaffoldModel("? valueSH1 ?")
	;~ FileCreateDir, C:\xampp\htdocs\gems-ws-app\resources\js\src\views\documents\components\list\detail\topbar\%name%
	
	file =C:\xampp\htdocs\gems-ws-app\resources\js\src\views\documents\components\list\detail\topbar\%name%.vue
	
	fileWrite( content, file )
}
	
yii_Controller(){
	global
	yii_Controller_a( table_name_singular, table_name_plural, reverse )
}
	
yii_Controller_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	validationRules := runSubScaffold( "apiController_validationRules")
	
	t := "<?php`n`nnamespace app\controllers`;`n`nuse Yii`;`nuse app\models\? valueCC1 ?`;`nuse app\models\? valueCC1 ?Search`;`nuse yii\web\Controller`;`nuse yii\web\NotFoundHttpException`;`nuse yii\filters\VerbFilter`;`n`n/**`n * ? valueCC1 ?Controller implements the CRUD actions for ? valueCC1 ? model.`n */`nclass ? valueCC1 ?Controller extends Controller`n{`n    public function behaviors()`n    {`n        return [`n            'verbs' => [`n                'class' => VerbFilter`:`:className()`,`n                'actions' => [`n                    'delete' => ['post']`,`n                ]`,`n            ]`,`n        ]`;`n    }`n`n    /**`n     * Lists all ? valueCC1 ? models.`n     * @return mixed`n     */`n    public function actionIndex()`n    {`n        $searchModel = new ? valueCC1 ?Search()`;`n        $dataProvider = $searchModel->search(Yii`:`:$app->request->queryParams)`;`n`n        return $this->render('index'`, [`n            'searchModel' => $searchModel`,`n            'dataProvider' => $dataProvider`,`n        ])`;`n    }`n`n    /**`n     * Displays a single ? valueCC1 ? model.`n     * @param integer $id`n     * @return mixed`n     */`n    public function actionView($id)`n    {`n        return $this->render('view'`, [`n            'model' => $this->findModel($id)`,`n        ])`;`n    }`n`n    /**`n     * Creates a new ? valueCC1 ? model.`n     * If creation is successful`, the browser will be redirected to the 'view' page.`n     * @return mixed`n     */`n    public function actionCreate()`n    {`n        $categories = Category`:`:find()->all()`;`n        $model = new ? valueCC1 ?()`;`n`n        if ($model->load(Yii`:`:$app->request->post()) && $model->save()) {`n            return $this->redirect(['view'`, 'id' => $model->id])`;`n        } else {`n            return $this->render('create'`, [`n                'model' => $model`,`n                'categories' => $categories`,`n            ])`;`n        }`n    }`n`n    /**`n     * Updates an existing ? valueCC1 ? model.`n     * If update is successful`, the browser will be redirected to the 'view' page.`n     * @param integer $id`n     * @return mixed`n     */`n    public function actionUpdate($id)`n    {`n        $categories = Category`:`:find()->all()`;`n        $model = $this->findModel($id)`;`n`n        if ($model->load(Yii`:`:$app->request->post()) && $model->save()) {`n            return $this->redirect(['view'`, 'id' => $model->id])`;`n        } else {`n            return $this->render('update'`, [`n                'model' => $model`,`n                'categories' => $categories`,`n            ])`;`n        }`n    }`n`n    /**`n     * Deletes an existing ? valueCC1 ? model.`n     * If deletion is successful`, the browser will be redirected to the 'index' page.`n     * @param integer $id`n     * @return mixed`n     */`n    public function actionDelete($id)`n    {`n        $this->findModel($id)->delete()`;`n`n        return $this->redirect(['index'])`;`n    }`n`n    /**`n     * Finds the ? valueCC1 ? model based on its primary key value.`n     * If the model is not found`, a 404 HTTP exception will be thrown.`n     * @param integer $id`n     * @return ? valueCC1 ? the loaded model`n     * @throws NotFoundHttpException if the model cannot be found`n     */`n    protected function findModel($id)`n    {`n        if (($model = ? valueCC1 ?`:`:findOne($id)) !== null) {`n            return $model`;`n        } else {`n            throw new NotFoundHttpException('The requested page does not exist.')`;`n        }`n    }`n}`n"
	
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( table_name_singular, t, 91)
	
	content := scaffoldModel(t)
	
	name := scaffoldModel("? valueCC1 ?Controller")
	file =C:\xampp\htdocs\gemen-reporting-module\controllers\%name%.php
	
	fileWrite( content, file )
}
	
apiController(){
	global
	apiController_a( table_name_singular, table_name_plural, reverse )
}
	
apiController_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	validationRules := runSubScaffold( "apiController_validationRules")
	
	t := "<?php`n`nnamespace App\Http\Controllers\Documents`;`n`nuse App\Http\Controllers\Controller`;`nuse App\Models\? valueCC1 ?`;`nuse Symfony\Component\HttpFoundation\Response`;`nuse Illuminate\Http\Request`;`nuse Illuminate\Support\Facades\Validator`;`nuse App\Repositories\? valueCC91 ?Repository`;`n`nclass ? valueCC91 ?Controller extends Controller`n{`n    /** @var ? valueCC91 ?Repository $? valueS1 ?Repository*/`n    private $? valueS1 ?Repository`;`n`n    protected $routePath = '? valueS1 ?'`;`n    protected $viewPath = '? valueS1 ?'`;`n`n    public function __construct(? valueCC91 ?Repository $? valueS1 ?Repo)`n    {`n        $this->? valueS1 ?Repository = $? valueS1 ?Repo`;`n    }`n`n    /**`n     * Display a listing of the resource.`n     * https`://? valueS1 ?.te.egov.mv/api/? valueSH2 ??page=1&filter[priority_id]=2000&orderBy=-id`n     *`n     * @return \Illuminate\Contracts\View\View`n     */`n    public function index(Request $request)`n    {`n        $filters = $request->get('filter'`, array())`;`n        $orderBy = $request->get('orderBy'`, null)`;`n        $? valueS2 ? = $this->? valueS1 ?Repository->paginate(10`, ['*']`, $filters`, $orderBy)`;`n`n        return response()->json([`n                'data' => $? valueS2 ?`,`n            ]`, Response`:`:HTTP_OK)`;`n    }`n`n    protected function rules()`n    {`n        return [`n" validationRules "        ]`;`n    }`n`n    /**`n     * Show the form for creating a new resource.`n     *`n     * @return \Illuminate\Contracts\View\View`n     */`n    // public function create()`n    // {`n    //     $item = new ? valueCC1 ?()`;`n    //     $item->_token = csrf_token()`;`n    //     $item->_uri = ""/? valueS1 ?""`;`n    //     return view(""? valueS1 ?.edit""`, compact('item'))`;`n    // }`n`n    /**`n     * Store a newly created resource in storage.`n     *`n     * @param Request $request`n     * @return \Illuminate\Routing\Redirector`n     */`n    public function store(Request $request)`n    {`n        $validator = Validator`:`:make($request->all()`, $this->rules())`;`n        if ($validator->fails()) {`n            return response()->json([`n                    'data' => $validator->errors()`,`n                ]`, Response`:`:HTTP_BAD_REQUEST)`;`n        }`n`n        $item = new ? valueCC1 ?`;`n`n        $item->fill($request->validate($this->rules()))`;`n        $item->save()`;`n        return response()->json([`n                'data' => $item`,`n            ]`, Response`:`:HTTP_CREATED)`;`n    }`n`n    /**`n     * Display the specified resource.`n     *`n     * @param int $id`n     * @return \Illuminate\Contracts\View\View`n     */`n    public function show($id)`n    {`n        $? valueS1 ? = ? valueCC1 ?`:`:query()->findOrFail($id)`;`n        return view(""? valueS1 ?.show""`, compact('? valueS1 ?'))`;`n    }`n`n    /**`n     * Show the form for editing the specified resource.`n     *`n     * @param int $id`n     * @return \Illuminate\Contracts\View\View`n     */`n    // public function edit($id)`n    // {`n    //     $item = ? valueCC1 ?`:`:query()->findOrFail($id)`;`n    //     $item->_token = csrf_token()`;`n    //     $item->_method = 'PATCH'`;`n    //     $item->_uri = ""/? valueS1 ?/$item->id""`;`n    //     return view(""? valueS1 ?.edit""`, compact('item'))`;`n    // }`n`n    /**`n     * Update the specified resource in storage.`n     *`n     * @param int $id`n     * @param Request $request`n     * @return \Illuminate\Routing\Redirector`n     */`n    public function update(? valueCC1 ? $? valueS1 ?`, Request $request)`n    {`n        $validator = Validator`:`:make($request->all()`, $this->rules())`;`n        if ($validator->fails()) {`n            return response()->json([`n                    'data' => $validator->errors()`,`n                ]`, Response`:`:HTTP_BAD_REQUEST)`;`n        }`n`n        $? valueS1 ?->update($request->validate($this->rules()))`;`n        return response()->json([`n                'data' => $? valueS1 ?`,`n            ]`, Response`:`:HTTP_OK)`;`n    }`n`n    /**`n     * Remove the specified resource from storage.`n     *`n     * @param int $id`n     * @return \Illuminate\Routing\Redirector`n     */`n    // public function destroy($id)`n    // {`n    //     ? valueCC1 ?`:`:destroy($id)`;`n    //     return redirect(""/? valueS1 ?"")`;`n    // }`n}`n"
	
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( table_name_singular, t, 91)
	
	content := scaffoldModel(t)
	
	name := scaffoldModel("? valueCC1 ?Controller")
	file =C:\xampp\htdocs\gems-ws-api\app\Http\Controllers\%name%.php
	
	fileWrite( content, file )
}
	
repository(){
	global
	repository_a( table_name_singular, table_name_plural, reverse )
}
	
repository_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	fields := scaffoldFields("        '? valueS1 ?',`n")
	
	t := "<?php`n`nnamespace App\Repositories`;`n`nuse App\Models\? valueCC1 ?`;`nuse App\Repositories\BaseRepository`;`n`nclass ? valueCC91 ?Repository extends BaseRepository`n{`n    protected $fieldSearchable = [`n" fields "    ]`;`n`n    public function getFieldsSearchable()`: array`n    {`n        return $this->fieldSearchable`;`n    }`n`n    public function model()`: string`n    {`n        return ? valueCC1 ?`:`:class`;`n    }`n}`n  "
	
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( table_name_singular, t, 91)
	
	content := scaffoldModel(t)
	
	name := scaffoldModel("? valueCC1 ?Repository")
	file =C:\xampp\htdocs\gems-ws-api\app\Repositories\%name%.php
	
	fileWrite( content, file )
}


resource_OASchema( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	;~ blacklist := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	;~ if( HasVal(blacklist, field_name) )
		;~ return ""
	
	if( related_table_singular )
		t := "` *     @OA\Property(property=""? value1 ?""`, type=""integer"")`,`n` *     @OA\Property(property=""? valueS12 ?""`, ref=""#/components/schemas/? valueCC11 ?Resource"")`,`n"
	else if( InStr(data_type, "bigint(") )
		t := "` *     @OA\Property(property=""? value1 ?""`, type=""integer"")`,`n"
	else if( InStr(data_type, "timestamp") )
		t := "` *     @OA\Property(property=""? value1 ?""`, type=""string""`, format=""date-time"")`,`n"
	else if( InStr(data_type, "date") )
		t := "` *     @OA\Property(property=""? value1 ?""`, type=""string""`, format=""date"")`,`n"
	else
		t := "` *     @OA\Property(property=""? value1 ?""`, type=""string"")`,`n"
	
	return t
}


resource_toArray( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	;~ blacklist := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	;~ if( HasVal(blacklist, field_name) )
		;~ return ""
	
	if( related_table_singular )
		t := "`            '? value1 ?' => $this?->? value1 ?`,`n`            '? valueS12 ?' => $this?->relationLoaded('? valueC12 ?') ? new ? valueCC11 ?Resource($this->? valueC12 ?) `: null`,`n"
		;~ t := "`            '? value1 ?' => $this?->? value1 ?`,`n`            '? valueS12 ?' => new ? valueCC11 ?Resource($this->whenLoaded('? valueC12 ?'))`,`n"
	else if( InStr(data_type, "timestamp") )
		t := "`            '? value1 ?' => $this?->? value1 ??->toDateTimeString()`,`n"
	else
		t := "`            '? value1 ?' => $this?->? value1 ?`,`n"
	
	return t
}


resource(){
	global
	resource_a( table_name_singular, table_name_plural, reverse )
}
	
resource_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	OASchema := runSubScaffold( "resource_OASchema", 1)
	toArray := runSubScaffold( "resource_toArray", 1)
	
	t := "<?php`n`nnamespace App\Http\Resources`;`n`nuse Illuminate\Http\Request`;`nuse Illuminate\Http\Resources\Json\JsonResource`;`n`n/**`n * @OA\Schema(`n *     schema=""? valueCC1 ?Resource""`,`n *`n" OASchema " * )`n */`nclass ? valueCC1 ?Resource extends JsonResource`n{`n    /**`n     * Transform the resource into an array.`n     *`n     * @return array<string`, mixed>`n     */`n    public function toArray(Request $request)`: array`n    {`n        return [`n" toArray "        ]`;`n    }`n}`n"
	
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( table_name_singular, t, 91)
	
	content := scaffoldModel(t)
	
	name := scaffoldModel("? valueCC1 ?Resource")
	file =C:\xampp\htdocs\gems-ws-api\app\Http\Resources\%name%.php
	
	fileWrite( content, file )
}

childListTest(){
	global
	childListTest_a( table_name_singular, table_name_plural, reverse )
}
	
childListTest_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	;~ fields := scaffoldFields("        '? valueS1 ?',`n")
	
	t := "<?php`n`nnamespace Tests\Feature`;`n`nuse Livewire`;`nuse Tests\TestCase`;`nuse App\Models\User`;`nuse App\Models\? valueCC1 ?`;`nuse Mockery\MockInterface`;`nuse App\Http\Livewire\? valueCC91 ?\ChildList? valueCC2 ?`;`nuse App\Http\Livewire\? valueCC91 ?\Show? valueCC91 ?`;`nuse App\Http\Livewire\? valueCC91 ?\Manage? valueCC91 ?`;`nuse Illuminate\Foundation\Testing\RefreshDatabase`;`nuse App\Enum\PriorityEnum`;`n`n`nclass ChildList? valueCC2 ?Test extends TestCase`n{`n    use RefreshDatabase`;`n`n`n    /**`n     * Indicates whether the default seeder should run before each test.`n     *`n     * @var bool`n     */`n    protected $seed = true`;`n`n`n    /**`n    */`n    function test_can_list_? valueS2 ?()`n    {`n        $this->actingAs(User`:`:find(1))`;`n`n        // $this->actingAs(User`:`:factory()->create())`;`n`n        // $this->partialMock(ChildList? valueCC2 ?`:`:class`, function(MockInterface $mock) {`n        //     $mock->shouldReceive('authorize')->andReturn(true)`;`n        // })`;`n`n        $component = Livewire`:`:test(ChildList? valueCC2 ?`:`:class)`;`n`n        $component->assertStatus(200)`;`n    }`n`n`n    /**`n    */`n    function test_can_create_? valueS1 ?_from_list_view()`n    {`n        $this->actingAs(User`:`:find(1))`;`n`n        Livewire`:`:test(ChildList? valueCC2 ?`:`:class)`n            ->set([`n                'editing.title' => ""Foo""`,`n                'editing.origin_id' => 2`,`n                'editing.priority_id' => PriorityEnum`:`:medium()->value`,`n                'editing.recieved_date_for_editing' => ""2022-10-10 09`:14`:36""`,`n                'editing.deadline_for_editing' => ""2022-10-17 09`:14`:36""`,`n            ])`n            ->call('save')`;`n`n        $this->assertTrue(? valueCC1 ?`:`:whereTitle('Foo')->exists())`;`n    }`n`n    /**`n    */`n    function test_can_edit_? valueS1 ?_from_list_view()`n    {`n        $this->actingAs(User`:`:find(1))`;`n`n        Livewire`:`:test(ChildList? valueCC2 ?`:`:class)`n            ->call('edit'`, 1)`n            ->set([`n                'editing.title' => ""Foo""`,`n                'editing.origin_id' => 2`,`n                'editing.priority_id' => PriorityEnum`:`:medium()->value`,`n                'editing.recieved_date_for_editing' => ""2022-10-10 09`:14`:36""`,`n                'editing.deadline_for_editing' => ""2022-10-17 09`:14`:36""`,`n            ])`n            ->call('save')`;`n`n        $this->assertTrue(? valueCC1 ?`:`:whereTitle('Foo')->exists())`;`n    }`n`n`n}`n"
	
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( table_name_singular, t, 91)
	
	content := scaffoldModel(t)
	
	name := scaffoldModel("ChildList? valueCC2 ?Test")
	directory := scaffoldModel("? valueCC1 ?")
	FileCreateDir, C:\xampp\htdocs\gems-ws-api\tests\Feature\Livewire\%directory%
	
	file =C:\xampp\htdocs\gems-ws-api\tests\Feature\Livewire\%directory%\%name%.php
	fileWrite( content, file )
}
	
listTest(){
	global
	listTest_a( table_name_singular, table_name_plural, reverse )
}
	
listTest_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	;~ fields := scaffoldFields("        '? valueS1 ?',`n")
	
	t := "<?php`n`nnamespace Tests\Feature`;`n`nuse Livewire`;`nuse Tests\TestCase`;`nuse App\Models\User`;`nuse App\Models\? valueCC1 ?`;`nuse Mockery\MockInterface`;`nuse App\Http\Livewire\? valueCC91 ?\List? valueCC2 ?`;`nuse App\Http\Livewire\? valueCC91 ?\Show? valueCC91 ?`;`nuse App\Http\Livewire\? valueCC91 ?\Manage? valueCC91 ?`;`nuse Illuminate\Foundation\Testing\RefreshDatabase`;`nuse App\Enum\PriorityEnum`;`n`n`nclass List? valueCC2 ?Test extends TestCase`n{`n    use RefreshDatabase`;`n`n`n    /**`n     * Indicates whether the default seeder should run before each test.`n     *`n     * @var bool`n     */`n    protected $seed = true`;`n`n`n    /**`n    */`n    function test_can_list_? valueS2 ?()`n    {`n        $this->actingAs(User`:`:find(1))`;`n`n        // $this->actingAs(User`:`:factory()->create())`;`n`n        // $this->partialMock(List? valueCC2 ?`:`:class`, function(MockInterface $mock) {`n        //     $mock->shouldReceive('authorize')->andReturn(true)`;`n        // })`;`n`n        $component = Livewire`:`:test(List? valueCC2 ?`:`:class)`;`n`n        $component->assertStatus(200)`;`n    }`n`n`n    /**`n    */`n    function test_can_create_? valueS1 ?_from_list_view()`n    {`n        $this->actingAs(User`:`:find(1))`;`n`n        Livewire`:`:test(List? valueCC2 ?`:`:class)`n            ->set([`n                'editing.title' => ""Foo""`,`n                'editing.origin_id' => 2`,`n                'editing.priority_id' => PriorityEnum`:`:medium()->value`,`n                'editing.recieved_date_for_editing' => ""2022-10-10 09`:14`:36""`,`n                'editing.deadline_for_editing' => ""2022-10-17 09`:14`:36""`,`n            ])`n            ->call('save')`;`n`n        $this->assertTrue(? valueCC1 ?`:`:whereTitle('Foo')->exists())`;`n    }`n`n    /**`n    */`n    function test_can_edit_? valueS1 ?_from_list_view()`n    {`n        $this->actingAs(User`:`:find(1))`;`n`n        Livewire`:`:test(List? valueCC2 ?`:`:class)`n            ->call('edit'`, 1)`n            ->set([`n                'editing.title' => ""Foo""`,`n                'editing.origin_id' => 2`,`n                'editing.priority_id' => PriorityEnum`:`:medium()->value`,`n                'editing.recieved_date_for_editing' => ""2022-10-10 09`:14`:36""`,`n                'editing.deadline_for_editing' => ""2022-10-17 09`:14`:36""`,`n            ])`n            ->call('save')`;`n`n        $this->assertTrue(? valueCC1 ?`:`:whereTitle('Foo')->exists())`;`n    }`n`n`n}`n"
	
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( table_name_singular, t, 91)
	
	content := scaffoldModel(t)
	
	name := scaffoldModel("List? valueCC2 ?Test")
	directory := scaffoldModel("? valueCC1 ?")
	file =C:\xampp\htdocs\gems-ws-api\tests\Feature\Livewire\%directory%\%name%.php
	
	fileWrite( content, file )
}
	
manageTest(){
	global
	manageTest_a( table_name_singular, table_name_plural, reverse )
}
	
manageTest_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	;~ fields := scaffoldFields("        '? valueS1 ?',`n")
	
	t := "<?php`n`nnamespace Tests\Feature`;`n`nuse Livewire`;`nuse Tests\TestCase`;`nuse App\Models\User`;`nuse App\Models\? valueCC1 ?`;`nuse Mockery\MockInterface`;`nuse App\Http\Livewire\? valueCC91 ?\List? valueCC91 ?s`;`nuse App\Http\Livewire\? valueCC91 ?\Show? valueCC91 ?`;`nuse App\Http\Livewire\? valueCC91 ?\Manage? valueCC91 ?`;`nuse Illuminate\Foundation\Testing\RefreshDatabase`;`nuse App\Enum\PriorityEnum`;`n`n`nclass Manage? valueCC91 ?Test extends TestCase`n{`n    use RefreshDatabase`;`n`n`n    /**`n     * Indicates whether the default seeder should run before each test.`n     *`n     * @var bool`n     */`n    protected $seed = true`;`n`n`n    /**`n    */`n    function test_can_create_? valueS1 ?_from_create_view()`n    {`n        $this->actingAs(User`:`:find(1))`;`n`n        Livewire`:`:test(Manage? valueCC91 ?`:`:class)`n            ->set([`n                'editing.title' => ""Foo""`,`n                'editing.origin_id' => 2`,`n                'editing.priority_id' => PriorityEnum`:`:medium()->value`,`n                'editing.recieved_date_for_editing' => ""2022-10-10 09`:14`:36""`,`n                'editing.deadline_for_editing' => ""2022-10-17 09`:14`:36""`,`n            ])`n            ->call('save')`;`n`n        $this->assertTrue(? valueCC1 ?`:`:whereTitle('Foo')->exists())`;`n    }`n`n`n    /**`n    */`n    function test_can_edit_? valueS1 ?_from_manage_view()`n    {`n        $this->actingAs(User`:`:find(1))`;`n`n        Livewire`:`:test(Manage? valueCC91 ?`:`:class`, ['? valueS1 ?' => ? valueCC1 ?`:`:find(1)])`n            ->set([`n                'editing.title' => ""Foo""`,`n                'editing.origin_id' => 2`,`n                'editing.priority_id' => PriorityEnum`:`:medium()->value`,`n                'editing.recieved_date_for_editing' => ""2022-10-10 09`:14`:36""`,`n                'editing.deadline_for_editing' => ""2022-10-17 09`:14`:36""`,`n            ])`n            ->call('save')`;`n`n        $this->assertTrue(? valueCC1 ?`:`:whereTitle('Foo')->exists())`;`n    }`n}`n"
	
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( table_name_singular, t, 91)
	
	content := scaffoldModel(t)
	
	name := scaffoldModel("Manage? valueCC1 ?Test")
	directory := scaffoldModel("? valueCC1 ?")
	file =C:\xampp\htdocs\gems-ws-api\tests\Feature\Livewire\%directory%\%name%.php
	
	fileWrite( content, file )
}



;~ apiTest_list( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	
	;~ arr := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	;~ if( HasVal(arr, field_name) )
		;~ return ""
	
	;~ if(table_name_plural = "case_users" and field_name = "task_user_type_id")
		;~ t := ""
	;~ else if( InStr(nullability, "Yes") )
		;~ t := "`        '? value1 ?' => ''`,`n"
	;~ else
		;~ t := ""
	
	;~ return t
;~ }


apiTest_list_fields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	;~ name := scaffoldModel("? valueS1 ?")
	
	;~ blacklist := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	;~ if( HasVal(blacklist, field_name) )
		;~ return ""
	
	if( related_table_singular )
		t := "`                        '? valueS12 ?'`,`n"
	;~ else if( InStr(data_type, "timestamp") )
		;~ t := "`                        '? value1 ?'`,`n"
	else
		t := "`                        '? value1 ?'`,`n"
	
	return t
}


apiTest_list_includes( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	arr := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	if( HasVal(arr, field_name) )
		return ""
	
	if( related_table_singular )
		t := "? valueC12 ?`,"
	
	return t
}


apiTest_list(){
	;~ nullable := runSubScaffold( "apiTest_list")
	fields := runSubScaffold( "apiTest_list_fields", 1)
	fields := RegExReplace(fields, "`n$", "")
	;~ fields := scaffoldFields("`                        '? value1 ?'`,`n")
	includes := runSubScaffold( "apiTest_list_includes")
	includes := RegExReplace(includes, "`,$", "")
	
	t := "`    /**`n     * can list ? valueS2 ?`n     *`n     * @test`n     *`n     */`n    public function can_get_list_of_? valueS2 ?()`: void`n    {`n        ? valueCC1 ?`:`:factory(7)->create()`;`n        $user = User`:`:factory()->create()`;`n        $this->actingAs($user)->havingPermission('? valueS2 ?.list')`;`n        $response = $this->getJson('/? valueS2 ??page[size]=2&page[number]=2&'.`n            'include=" includes "')`;`n        $response->assertOk()->assertJson([`n            'meta' => [`n                'total' => 8`,`n                'per_page' => 2`,`n                'current_page' => 2`,`n            ]`,`n        ])->assertJsonStructure([`n                'data' => [`n                    [`n" fields "`n                    ]`,`n                ]`,`n            ])`;`n        $this->assertCount(2`, $response->json('data'))`;`n    }"
	
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( table_name_singular, t, 91)
	
	return scaffoldModel(t)
}


apiTest_view_data( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	;~ blacklist := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	;~ if( HasVal(blacklist, field_name) )
		;~ return ""
	
	if( related_table_singular )
		;~ t := "`                '? value1 ?' => $" name "->? value1 ?`,`n                '? valueS12 ?' => (new \App\Http\Resources\? valueCC11 ?Resource($" name "?->? valueC12 ?))->toArray(request())`,`n"
		t := "`                '? value1 ?' => $" name "->? value1 ?`,`n`                '? valueS12 ?' => $" name "->? valueS1 ?`n                    ? (new \App\Http\Resources\? valueCC11 ?Resource($" name "?->? valueC12 ?))->toArray(request()) `: null`,`n"
	else if( InStr(data_type, "timestamp") )
		t := "`                '? value1 ?' => $" name "->? value1 ??->toDateTimeString()`,`n"
	else
		t := "`                '? value1 ?' => $" name "->? value1 ?`,`n"
	
	return t
}

	
apiTest_view(){
	;~ nullable := runSubScaffold( "apiTest_list")
	data := runSubScaffold( "apiTest_view_data", 1)
	;~ fields := scaffoldFields("`                        '? value1 ?'`,`n")
	
	t := "`    /**`n     * can view ? valueS1 ?`n     *`n     * @test`n     *`n     */`n    public function can_view_? valueS1 ?()`: void`n    {`n        $? valueS1 ? = ? valueCC1 ?`:`:factory()->create()`;`n        $user = User`:`:factory()->create()`;`n        $this->actingAs($user)->havingPermission('? valueS2 ?.show')`;`n        $response = $this->getJson('/? valueS2 ?/'.$? valueS1 ?->id)`;`n        $response->assertOk()->assertJson([`n            'data' => [`n" data "`n            ]`,`n        ])`;`n    }`n"
	
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( table_name_singular, t, 91)
	
	return scaffoldModel(t)
}
	
	
apiTest_store_request( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	;~ blacklist := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	;~ if( HasVal(blacklist, field_name) )
		;~ return ""
	
	;~ if( related_table_singular )
		;~ t := "`                '? value1 ?' => $" name "->? value1 ?`,`n                '? valueS12 ?' => (new \App\Http\Resources\? valueCC11 ?Resource($" name "?->? valueC12 ?))->toArray(request())`,`n"
		;~ t := "`                '? value1 ?' => $" name "->? value1 ?`,`n`                '? valueS12 ?' => $" name "->? valueS1 ?`n                    ? (new \App\Http\Resources\? valueCC11 ?Resource($" name "?->? valueC12 ?))->toArray(request()) `: null`,`n"
	;~ else if( InStr(data_type, "timestamp") )
		;~ t := "`                '? value1 ?' => $" name "->? value1 ??->toDateTimeString()`,`n"
	;~ else
		t := "`            '? value1 ?' => $" name "->? value1 ?`,`n"
	
	return t
}

	
apiTest_store(){
	;~ nullable := runSubScaffold( "apiTest_list")
	data := runSubScaffold( "apiTest_store_request", 0)
	;~ fields := scaffoldFields("`                        '? value1 ?'`,`n")
	
	t := "`     /**`n     * can store an ? valueS1 ?.`n     *`n     * @test`n     * @group now`n     */`n    public function can_store_? valueS1 ?()`: void`n    {`n        $? valueS1 ? = ? valueCC1 ?`:`:factory()->make()`;`n        $user = User`:`:factory()->create()`;`n        $this->actingAs($user)->havingPermission('? valueS2 ?.store')`;`n        $response = $this->postJson('/? valueS2 ?'`, [`n" data "`n        ])`;`n`n        $response->assertCreated()->assertJson([`n            'data' => [`n                '? valueS1 ?_type' => [`n                    'id' => $? valueS1 ?->? valueS1 ?Type->id`,`n                    'name' => $? valueS1 ?->? valueS1 ?Type->name_en`,`n                    'name_dhivehi' => $? valueS1 ?->? valueS1 ?Type->name_dv`,`n                    'active_at' => Date`:`:dateTimeFormat($? valueS1 ?->? valueS1 ?Type->active_from)`,`n                    'active_to' => Date`:`:dateTimeFormat($? valueS1 ?->? valueS1 ?Type->active_to)`,`n                    'created_at' => Date`:`:dateTimeFormat($? valueS1 ?->? valueS1 ?Type->created_at)`,`n                    'updated_at' => Date`:`:dateTimeFormat($? valueS1 ?->? valueS1 ?Type->updated_at)`,`n                ]`,`n                'registration_number' => $? valueS1 ?->registration_number`,`n                'moft_sap_number' => $? valueS1 ?->moft_sap_number`,`n                'code' => $? valueS1 ?->code_en`,`n                'code_dhivehi' => $? valueS1 ?->code_dv`,`n                'name' => $? valueS1 ?->name_en`,`n                'name_dhivehi' => $? valueS1 ?->name_dv`,`n                'origin_country' => [`n                    'id' => $? valueS1 ?->country->id`,`n                    'name' => $? valueS1 ?->country->name_en`,`n                    'name_dhivehi' => $? valueS1 ?->country->name_dv`,`n                    'nationality' => $? valueS1 ?->country->nationality_en`,`n                    'nationality_dhivehi' => $? valueS1 ?->country->nationality_dv`,`n                    'dialing_code' => $? valueS1 ?->country->dialing_code`,`n                    'active_at' => Date`:`:dateTimeFormat($? valueS1 ?->country->active_from)`,`n                    'active_to' => Date`:`:dateTimeFormat($? valueS1 ?->country->active_to)`,`n                    'created_at' => Date`:`:dateTimeFormat($? valueS1 ?->country->created_at)`,`n                    'updated_at' => Date`:`:dateTimeFormat($? valueS1 ?->country->updated_at)`,`n                ]`,`n                'active_at' => Date`:`:dateTimeFormat($? valueS1 ?->active_from)`,`n                'active_to' => null`,`n            ]`,`n        ])`;`n        $this->assertDatabaseHas('? valueS2 ?'`, [`n            'id' => $response->json('data.id')`,`n            '? valueS1 ?_type_id' => $? valueS1 ?->? valueS1 ?Type->id`,`n            'registration_number' => $? valueS1 ?->registration_number`,`n            'moft_sap_number' => $? valueS1 ?->moft_sap_number`,`n            'code_en' => $? valueS1 ?->code_en`,`n            'code_dv' => $? valueS1 ?->code_dv`,`n            'name_en' => $? valueS1 ?->name_en`,`n            'name_dv' => $? valueS1 ?->name_dv`,`n            'origin_country_id' => $? valueS1 ?->country->id`,`n            'active_from' => Date`:`:dateTimeFormat($? valueS1 ?->active_from)`,`n            'active_to' => null`,`n        ])`;`n    }`n"
	
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( table_name_singular, t, 91)
	
	return scaffoldModel(t)
}
	
	
apiTest(){
	global
	apiTest_a( table_name_singular, table_name_plural, reverse )
}
	
apiTest_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	apiTest_list := apiTest_list()
	apiTest_view := apiTest_view()
	apiTest_store := apiTest_store()
	;~ fields := scaffoldFields("        '? valueS1 ?',`n")
	
	t := "<?php`n`nnamespace Tests\Feature`;`n`nuse App\Models\? valueCC1 ?`;`nuse App\Models\User`;`nuse App\Support\Date`;`nuse Illuminate\Foundation\Testing\DatabaseTransactions`;`nuse Illuminate\Foundation\Testing\WithFaker`;`nuse Tests\TestCase`;`n`n/**`n * @group ? valueS1 ?`n */`nclass ? valueCC1 ?Test extends TestCase`n{`n    use DatabaseTransactions`, withFaker`;`n`n" apiTest_list "`n`n" apiTest_view "`n    `n" apiTest_store "`n`n    /**`n     * can update an ? valueS1 ?.`n     *`n     * @test`n     */`n    public function can_update_? valueS1 ?()`: void`n    {`n        $? valueS1 ? = ? valueCC1 ?`:`:factory()->create(['active_to' => null])`;`n        $new? valueCC1 ? = ? valueCC1 ?`:`:factory()->make()`;`n        $user = User`:`:factory()->create()`;`n        $this->actingAs($user)`;`n        $response = $this->putJson('/? valueS2 ?/'.$? valueS1 ?->id`, [`n            '? valueS1 ?_type_id' => $new? valueCC1 ?->? valueS1 ?Type->id`,`n            'registration_number' => $new? valueCC1 ?->registration_number`,`n            'moft_sap_number' => $new? valueCC1 ?->moft_sap_number`,`n            'code' => $new? valueCC1 ?->code_en`,`n            'code_dhivehi' => $new? valueCC1 ?->code_dv`,`n            'name' => $new? valueCC1 ?->name_en`,`n            'name_dhivehi' => $new? valueCC1 ?->name_dv`,`n            'origin_country_id' => $new? valueCC1 ?->country->id`,`n            'active_at' => Date`:`:dateTimeFormat($new? valueCC1 ?->active_from)`,`n        ])`;`n`n        $response->assertOk()->assertJson([`n            'data' => [`n                '? valueS1 ?_type' => [`n                    'id' => $new? valueCC1 ?->? valueS1 ?Type->id`,`n                    'name' => $new? valueCC1 ?->? valueS1 ?Type->name_en`,`n                    'name_dhivehi' => $new? valueCC1 ?->? valueS1 ?Type->name_dv`,`n                    'active_at' => Date`:`:dateTimeFormat($new? valueCC1 ?->? valueS1 ?Type->active_from)`,`n                    'active_to' => Date`:`:dateTimeFormat($new? valueCC1 ?->? valueS1 ?Type->active_to)`,`n                    'created_at' => Date`:`:dateTimeFormat($new? valueCC1 ?->? valueS1 ?Type->created_at)`,`n                    'updated_at' => Date`:`:dateTimeFormat($new? valueCC1 ?->? valueS1 ?Type->updated_at)`,`n                ]`,`n                'registration_number' => $new? valueCC1 ?->registration_number`,`n                'moft_sap_number' => $new? valueCC1 ?->moft_sap_number`,`n                'code' => $new? valueCC1 ?->code_en`,`n                'code_dhivehi' => $new? valueCC1 ?->code_dv`,`n                'name' => $new? valueCC1 ?->name_en`,`n                'name_dhivehi' => $new? valueCC1 ?->name_dv`,`n                'origin_country' => [`n                    'id' => $new? valueCC1 ?->country->id`,`n                    'name' => $new? valueCC1 ?->country->name_en`,`n                    'name_dhivehi' => $new? valueCC1 ?->country->name_dv`,`n                    'nationality' => $new? valueCC1 ?->country->nationality_en`,`n                    'nationality_dhivehi' => $new? valueCC1 ?->country->nationality_dv`,`n                    'dialing_code' => $new? valueCC1 ?->country->dialing_code`,`n                    'active_at' => Date`:`:dateTimeFormat($new? valueCC1 ?->country->active_from)`,`n                    'active_to' => Date`:`:dateTimeFormat($new? valueCC1 ?->country->active_to)`,`n                    'created_at' => Date`:`:dateTimeFormat($new? valueCC1 ?->country->created_at)`,`n                    'updated_at' => Date`:`:dateTimeFormat($new? valueCC1 ?->country->updated_at)`,`n                ]`,`n                'active_at' => Date`:`:dateTimeFormat($new? valueCC1 ?->active_from)`,`n                'active_to' => null`,`n            ]`,`n        ])`;`n        $this->assertDatabaseHas('? valueS2 ?'`, [`n            'id' => $response->json('data.id')`,`n            '? valueS1 ?_type_id' => $new? valueCC1 ?->? valueS1 ?Type->id`,`n            'registration_number' => $new? valueCC1 ?->registration_number`,`n            'moft_sap_number' => $new? valueCC1 ?->moft_sap_number`,`n            'code_en' => $new? valueCC1 ?->code_en`,`n            'code_dv' => $new? valueCC1 ?->code_dv`,`n            'name_en' => $new? valueCC1 ?->name_en`,`n            'name_dv' => $new? valueCC1 ?->name_dv`,`n            'origin_country_id' => $new? valueCC1 ?->country->id`,`n            'active_from' => Date`:`:dateTimeFormat($new? valueCC1 ?->active_from)`,`n            'active_to' => null`,`n        ])`;`n    }`n`n    /**`n     * can delete a ? valueS1 ?.`n     *`n     * @test`n     */`n    public function can_delete_? valueS1 ?()`: void`n    {`n        $? valueS1 ? = ? valueCC1 ?`:`:factory()->create()`;`n        $user = User`:`:factory()->create()`;`n        $this->actingAs($user)`;`n        $response = $this->deleteJson('/? valueS2 ?/'.$? valueS1 ?->id)`;`n        $response->assertNoContent()`;`n        $this->assertDatabaseMissing('? valueS2 ?'`, ['id' => $? valueS1 ?->id])`;`n    }`n`n    /**`n     * can view current tenant ? valueS1 ?`n     *`n     * @test`n     */`n    public function can_view_current_tenant_? valueS1 ?()`: void`n    {`n        ? valueCC1 ?`:`:factory()->active()->create()`;`n        $currentTenant = ? valueCC1 ?`:`:factory()->active()->create()`;`n        $user = User`:`:factory()->create()`;`n        $this->actingAs($user)`;`n        $response = $this->setTenant($currentTenant)->getJson('/current-tenant-? valueS1 ?')`;`n        $response->assertOk()->assertJson([`n            'data' => [`n                'id' => $currentTenant->id`,`n                '? valueS1 ?_type' => [`n                    'id' => $currentTenant->? valueS1 ?Type->id`,`n                    'name' => $currentTenant->? valueS1 ?Type->name_en`,`n                    'name_dhivehi' => $currentTenant->? valueS1 ?Type->name_dv`,`n                    'active_at' => Date`:`:dateTimeFormat($currentTenant->? valueS1 ?Type->active_from)`,`n                    'active_to' => Date`:`:dateTimeFormat($currentTenant->? valueS1 ?Type->active_to)`,`n                    'created_at' => Date`:`:dateTimeFormat($currentTenant->? valueS1 ?Type->created_at)`,`n                    'updated_at' => Date`:`:dateTimeFormat($currentTenant->? valueS1 ?Type->updated_at)`,`n                ]`,`n                'registration_number' => $currentTenant->registration_number`,`n                'moft_sap_number' => $currentTenant->moft_sap_number`,`n                'code' => $currentTenant->code_en`,`n                'code_dhivehi' => $currentTenant->code_dv`,`n                'name' => $currentTenant->name_en`,`n                'name_dhivehi' => $currentTenant->name_dv`,`n                'origin_country' => [`n                    'id' => $currentTenant->country->id`,`n                    'name' => $currentTenant->country->name_en`,`n                    'name_dhivehi' => $currentTenant->country->name_dv`,`n                    'nationality' => $currentTenant->country->nationality_en`,`n                    'nationality_dhivehi' => $currentTenant->country->nationality_dv`,`n                    'dialing_code' => $currentTenant->country->dialing_code`,`n                    'active_at' => Date`:`:dateTimeFormat($currentTenant->country->active_from)`,`n                    'active_to' => Date`:`:dateTimeFormat($currentTenant->country->active_to)`,`n                    'created_at' => Date`:`:dateTimeFormat($currentTenant->country->created_at)`,`n                    'updated_at' => Date`:`:dateTimeFormat($currentTenant->country->updated_at)`,`n                ]`,`n                'active_at' => Date`:`:dateTimeFormat($currentTenant->active_from)`,`n                'active_to' => Date`:`:dateTimeFormat($currentTenant->active_to)`,`n                'created_at' => Date`:`:dateTimeFormat($currentTenant->created_at)`,`n                'updated_at' => Date`:`:dateTimeFormat($currentTenant->updated_at)`,`n            ]`,`n        ])`;`n    }`n}`n"
	
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( table_name_singular, t, 91)
	
	content := scaffoldModel(t)
	
	name := scaffoldModel("? valueCC1 ?Test")
	directory := scaffoldModel("? valueCC1 ?")
	file =C:\xampp\htdocs\gems-ws-api\tests\Feature\%name%.php
	
	fileWrite( content, file )
}
	
showTest(){
	global
	showTest_a( table_name_singular, table_name_plural, reverse )
}
	
showTest_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	;~ fields := scaffoldFields("        '? valueS1 ?',`n")
	
	t := "<?php`n`nnamespace Tests\Feature`;`n`nuse Livewire`;`nuse Tests\TestCase`;`nuse App\Models\User`;`nuse App\Models\? valueCC1 ?`;`nuse Mockery\MockInterface`;`nuse App\Http\Livewire\? valueCC91 ?\List? valueCC91 ?s`;`nuse App\Http\Livewire\? valueCC91 ?\Show? valueCC91 ?`;`nuse App\Http\Livewire\? valueCC91 ?\Manage? valueCC91 ?`;`nuse Illuminate\Foundation\Testing\RefreshDatabase`;`nuse App\Enum\PriorityEnum`;`n`n`nclass Show? valueCC91 ?Test extends TestCase`n{`n    use RefreshDatabase`;`n`n`n    /**`n     * Indicates whether the default seeder should run before each test.`n     *`n     * @var bool`n     */`n    protected $seed = true`;`n`n`n    /**`n    */`n    function test_can_view_? valueS1 ?()`n    {`n        $this->actingAs(User`:`:find(1))`;`n`n        $response = $this->get('/? valueS2 ?/1')`;`n`n        $response->assertStatus(200)`;`n    }`n`n`n    /**`n    */`n    function test_can_delete_? valueS1 ?()`n    {`n        $this->actingAs(User`:`:find(1))`;`n`n        Livewire`:`:test(Show? valueCC91 ?`:`:class`, ['? valueS1 ?' => ? valueCC1 ?`:`:find(1)])`n            ->call('delete'`, 1)`;`n`n        $this->assertTrue(!? valueCC1 ?`:`:find(1))`;`n    }`n`n}`n"
	
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( table_name_singular, t, 91)
	
	content := scaffoldModel(t)
	
	name := scaffoldModel("Show? valueCC1 ?Test")
	directory := scaffoldModel("? valueCC1 ?")
	file =C:\xampp\htdocs\gems-ws-api\tests\Feature\Livewire\%directory%\%name%.php
	
	fileWrite( content, file )
}
	
policy(){
	global
	policy_a( table_name_singular, table_name_plural, reverse )
}
	
policy_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	;~ fields := scaffoldFields("        '? valueS1 ?',`n")
	
	t := "<?php`n`nnamespace App\Policies`;`n`nuse App\Models\? valueCC1 ?`;`nuse App\Models\User`;`nuse Illuminate\Auth\Access\HandlesAuthorization`;`nuse App\Enum\PermissionsEnum`;`n`nclass ? valueCC91 ?Policy`n{`n    use HandlesAuthorization`;`n`n/**`n     * Determine whether the user can view any models.`n     *`n     * @param  \App\Models\User  $user`n     * @return \Illuminate\Auth\Access\Response|bool`n     */`n    public function viewAny(User $user)`n    {`n        return hasPermission(PermissionsEnum`:`:? valueS1 ?_view_any())`;`n    }`n`n    /**`n     * Determine whether the user can view the model.`n     *`n     * @param  \App\Models\User  $user`n     * @param  \App\Models\? valueCC1 ?  $? valueS1 ?`n     * @return \Illuminate\Auth\Access\Response|bool`n     */`n    public function view(User $user`, ? valueCC1 ? $? valueS1 ?)`n    {`n        return hasPermission(PermissionsEnum`:`:? valueS1 ?_view()`, $? valueS1 ?->team_id)`;`n    }`n`n    /**`n     * Determine whether the user can create models.`n     *`n     * @param  \App\Models\User  $user`n     * @return \Illuminate\Auth\Access\Response|bool`n     */`n    public function create(User $user)`n    {`n        return hasPermission(PermissionsEnum`:`:? valueS1 ?_create())`;`n    }`n`n    /**`n     * Determine whether the user can update the model.`n     *`n     * @param  \App\Models\User  $user`n     * @param  \App\Models\? valueCC1 ?  $? valueS1 ?`n     * @return \Illuminate\Auth\Access\Response|bool`n     */`n    public function update(User $user`, ? valueCC1 ? $? valueS1 ?)`n    {`n        return hasPermission(PermissionsEnum`:`:? valueS1 ?_update()`, $? valueS1 ?->team_id)`;`n    }`n`n    /**`n     * Determine whether the user can delete the model.`n     *`n     * @param  \App\Models\User  $user`n     * @param  \App\Models\? valueCC1 ?  $? valueS1 ?`n     * @return \Illuminate\Auth\Access\Response|bool`n     */`n    public function delete(User $user`, ? valueCC1 ? $? valueS1 ?)`n    {`n        return hasPermission(PermissionsEnum`:`:? valueS1 ?_delete()`, $? valueS1 ?->team_id)`;`n    }`n`n    /**`n     * Determine whether the user can restore the model.`n     *`n     * @param  \App\Models\User  $user`n     * @param  \App\Models\? valueCC1 ?  $? valueS1 ?`n     * @return \Illuminate\Auth\Access\Response|bool`n     */`n    public function restore(User $user`, ? valueCC1 ? $? valueS1 ?)`n    {`n        return false`;`n    }`n`n    /**`n     * Determine whether the user can permanently delete the model.`n     *`n     * @param  \App\Models\User  $user`n     * @param  \App\Models\? valueCC1 ?  $? valueS1 ?`n     * @return \Illuminate\Auth\Access\Response|bool`n     */`n    public function forceDelete(User $user`, ? valueCC1 ? $? valueS1 ?)`n    {`n        return false`;`n    }`n}`n"
	
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( table_name_singular, t, 91)
	
	content := scaffoldModel(t)
	
	name := scaffoldModel("? valueCC1 ?Policy")
	file =C:\xampp\htdocs\gems-ws-api\app\Policies\%name%.php
	
	fileWrite( content, file )
}
	
scaffold_ListController_relations( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	skip := {"created_by": 1, "updated_by": 1}
	
	if(related_table_singular != "" and !skip[field_name] )
		t := "`            '? valueS1 ?'`,`n"
	else 
		t := ""

	return t
}

;~ load_fields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	
	;~ fields[field_name] := {"field_name": field_name, "nullability": nullability, "related_table_singular": related_table_singular, "related_table_plural": related_table_plural, "column_number": column_number, "column_number": column_number, "column_number": column_number}
	
;~ }

load_fields(){
	global DB_Fields, primary_key
	
	s := scaffoldModel("? valueS1 ?")
	p := scaffoldModel("? valueS2 ?")
	clipList := DB_Fields
	clipList := primary_key_row() "`n" clipList
	fields := {}
	
	StringSplit, clipList, clipList, `n, `r
	output=
	
	Loop %clipList0%
	{
		field := clipList%A_Index%
		StringSplit, field, field, `t
		
		fieldName := p "." field1
		
		related := {}
		related["case_users.task_id"] := "case"
		related["case_users.individual_id"] := "user"
		related["case_users.task_user_type_id"] := "case_user_type"
		related["communications.task_id"] := "case"
		related["tasks.parent_id"] := "case"
		related["task_users.individual_id"] := "user"
		
		relatedOnly := {}
		relatedOnly["communications.recieved_by"] := "user"
		relatedOnly["cases.handler_id"] := "user"
		
		without_id := StrReplace(field1, "_id", "")
		function_name := without_id
		related_table_singular := field4
		related_table_plural := field5
		
		if(related[fieldName]){
			function_name := related[fieldName]
			related_table_singular := related[fieldName]
			related_table_plural := toPlural( related[fieldName] )
		}
		
		if(relatedOnly[fieldName]){
			related_table_singular := relatedOnly[fieldName]
			related_table_plural := toPlural( related[fieldName] )
		}
		
		if( field1 = "created_by" or field1 = "updated_by" ){
			related_table_singular := "user"
		}
		
		fields[field1] := {"field_name": field1, "data_type": field2, "nullability": field3, "related_table_singular": related_table_singular, "related_table_plural": related_table_plural, "related_primary_key": field6, "column_number": A_Index, "table_name_singular": s, "table_name_plural": p, "function_name_singular": function_name, "function_name_plural": toPlural( function_name ) }
		
		;~ fields[field1]["related_table_plural"] := toPlural( related[fieldName] )
		fields[field1]["model_name"] := modelName(fields[field1]["table_name_singular"])
		fields[field1]["related_model_name"] := modelName(fields[field1]["related_table_singular"])
	}
	
	return fields
}

modelName(table){
	customModelName := customModelName(table_name_singular)

	if(customModelName)
		return customModelName
	else 
		return runScaffold( "? valueCC1 ?", table)
}

name_field(){
	global
	
	if( fields["name"] )
		return "name"
	if( fields["name_english"] )
		return "name_english"
	else if( fields["title"] )
		return "title"
	else if( fields["subject"] )
		return "subject"
	else if( fields["full_name"] )
		return "full_name"
	else if( fields["organisation_name_english"] )
		return "organisation_name_english"
	else if( table_name_singular = "case_user") 
		return "user->name"
	else 
		return primary_key
	
	return ""
}

listController_dropdownsOnEdit( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	skip := {"created_by": 1, "updated_by": 1}
	
	if(related_table_singular != "" and !skip[field_name] )
		t := "`            $this->emit(""? valueS1 ?Updated""`, [`n                'name' => '? valueS1 ?'`,`n                'value' => $this->editing->? valueS1 ?`,`n            ])`;`n            `n"

	return t
}

listController(){
	global
	listController_a( table_name_singular, table_name_plural, reverse )
}
	
listController_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	relations := runSubScaffold( "scaffold_ListController_relations")
	dropdownsOnEdit := runSubScaffold( "listController_dropdownsOnEdit")
	name_field := name_field()
	
	directory := scaffoldModel("? valueCC1 ?")
	name := scaffoldModel("? valueCC2 ?")
	file =C:\xampp\htdocs\gems-ws-api\app\Http\Livewire\%directory%\List%name%.php

	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %relations%, " relations "
	}else{
		t := "<?php`n`nnamespace App\Http\Livewire\? valueCC91 ?`;`n`nuse Livewire\Component`;`nuse App\Models\? valueCC1 ?`;`nuse Illuminate\Support\Carbon`;`nuse App\Http\Livewire\DataTable\WithSorting`;`nuse App\Http\Livewire\DataTable\WithCachedRows`;`nuse App\Http\Livewire\DataTable\WithBulkActions`;`nuse App\Http\Livewire\DataTable\WithPerPagePagination`;`nuse Illuminate\Foundation\Auth\Access\AuthorizesRequests`;`n`nclass List? valueCC2 ? extends Component`n{`n    use WithPerPagePagination`, WithSorting`, WithBulkActions`, WithCachedRows`, AuthorizesRequests`;`n`n    public $showDeleteModal = false`;`n    public $showEditModal = false`;`n    public $showAdvanced = false`;`n    public $filters = [`n        'search' => ''`,`n        'status' => ''`,`n        'amount-min' => null`,`n        'amount-max' => null`,`n        'created_at-min' => null`,`n        'created_at-max' => null`,`n    ]`;`n    public ? valueCC1 ? $editing`;`n`n    protected $queryString = ['sorts']`;`n`n    protected $listeners = ['refresh? valueCC2 ?' => '$refresh']`;`n`n    protected function rules()`n    {`n        return ? valueCC1 ?`:`:rules()`;`n    }`n`n    public function mount() { $this->editing = $this->makeBlank? valueCC1 ?()`; }`n    public function updatedFilters() { $this->resetPage()`; }`n`n    public function exportSelected()`n    {`n        return response()->streamDownload(function () {`n            echo $this->selectedRowsQuery->toCsv()`;`n        }`, '? valueS2 ?.csv')`;`n    }`n`n    public function deleteSelected()`n    {`n        $this->authorize('delete'`, $this->editing)`;`n`n        $deleteCount = $this->selectedRowsQuery->count()`;`n`n        $this->selectedRowsQuery->delete()`;`n`n        $this->showDeleteModal = false`;`n`n        $this->notify('You\'ve deleted '.$deleteCount.' ? valueL2 ?')`;`n    }`n`n    public function makeBlank? valueCC1 ?()`n    {`n        return ? valueCC1 ?`:`:make(['date' => now()`, 'status' => 'success'])`;`n    }`n`n    public function toggleShowAdvanced()`n    {`n        $this->useCachedRows()`;`n`n        $this->showAdvanced = ! $this->showAdvanced`;`n    }`n`n    public function create()`n    {`n        $this->useCachedRows()`;`n`n        if ($this->editing->getKey()){`n            $this->editing = $this->makeBlank? valueCC1 ?()`;`n            $this->updateComponentValues()`;`n        }`n`n        $this->showEditModal = true`;`n    }`n`n    public function edit(? valueCC1 ? $? valueS1 ?)`n    {`n        $this->useCachedRows()`;`n`n        if ($this->editing->isNot($? valueS1 ?)){`n            $this->editing = $? valueS1 ?`;`n            $this->updateComponentValues()`;`n        }`n`n        $this->showEditModal = true`;`n    }`n`n    protected function updateComponentValues()`n    {`n" dropdownsOnEdit "`n    }`n`n    public function save()`n    {`n        nullableToNull($this->editing)`;`n        $this->validate()`;`n`n        if (!$this->editing->getKey()){`n            $this->authorize('create'`, $this->editing)`;`n        }else{`n            $this->authorize('update'`, $this->editing)`;`n        }`n`n        activityLog($this->editing)`;`n        $this->editing->save()`;`n`n        $this->showEditModal = false`;`n    }`n`n    public function resetFilters() { $this->reset('filters')`; }`n`n    public function getRowsQueryProperty()`n    {`n        $query = ? valueCC1 ?`:`:query()`n            ->when($this->filters['status']`, fn($query`, $status) => $query->where('status'`, $status))`n            ->when($this->filters['amount-min']`, fn($query`, $amount) => $query->where('amount'`, '>='`, $amount))`n            ->when($this->filters['amount-max']`, fn($query`, $amount) => $query->where('amount'`, '<='`, $amount))`n            ->when($this->filters['created_at-min']`, fn($query`, $created_at) => $query->where('created_at'`, '>='`, Carbon`:`:createFromFormat('d/m/Y'`, $created_at)))`n            ->when($this->filters['created_at-max']`, fn($query`, $created_at) => $query->where('created_at'`, '<='`, Carbon`:`:createFromFormat('d/m/Y'`, $created_at)))`n            ->when($this->filters['search']`, fn($query`, $search) => $query->where('name'`, 'like'`, '`%'.$search.'`%'))`;`n`n        return $this->applySorting($query)`;`n    }`n`n    public function getRowsProperty()`n    {`n        return $this->cache(function () {`n            return $this->applyPagination($this->rowsQuery)`;`n        })`;`n    }`n`n    public function render()`n    {`n        $this->authorize('viewAny'`, $this->editing)`;`n`n        return view('livewire.? valueSH1 ?.list-? valueSH2 ?'`, [`n            '? valueS2 ?' => $this->rows`,`n        ])`;`n    }`n`n    public function getListeners()`n    {`n        return collect([`n" relations "        ])->mapWithKeys(function ($key) {`n                return [""{$key}Updated"" => 'updateDependingValue']`;`n            })`n            ->toArray()`;`n    }`n`n    public function updateDependingValue($data)`n    {`n        $name = $data['name']`;`n        $value = $data['value']`;`n`n        $this->editing->{$name} = $value`;`n    }`n`n}`n"
		
		if( customModelName(table_name_singular) )
			StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
		
		t := replaceMarker( table_name_singular, t, 91)
		
		content := scaffoldModel( t )
	}
	
	FileCreateDir, C:\xampp\htdocs\gems-ws-api\app\Http\Livewire\%directory%
	
	fileWrite( content, file )
}

viya_listController(){
	global
	viya_listController_a( table_name_singular, table_name_plural, reverse )
}
	
viya_listController_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	;~ relations := runSubScaffold( "scaffold_ListController_relations")
	;~ dropdownsOnEdit := runSubScaffold( "listController_dropdownsOnEdit")
	name_field := name_field()
	
	;~ directory := scaffoldModel("? valueCC1 ?")
	directory := scaffoldDirectory("? valueCC1 ?")
	viewDirectory := scaffoldDirectory("? valueSH1 ?")
	name := scaffoldModel("? valueCC1 ?")
	file =C:\xampp\htdocs\viyaFSM\app\Livewire\%directory%\%name%.php

	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %relations%, " relations "
	}else{
		t := "<?php`n`nnamespace App\Livewire\" directory "`;`n`nuse App\Helpers\CommonFunctions`;`nuse App\Helpers\ListHelpers`;`nuse Livewire\Component`;`n`nclass ? valueCC1 ? extends Component`n{`n`n`n  public function mount()`n  {`n  }`n`n  public function render()`n  {`n    return view('livewire." viewDirectory ".? valueSH1 ?')`;`n  }`n`n}`n"
		
		if( customModelName(table_name_singular) )
			StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
		
		t := replaceMarker( table_name_singular, t, 91)
		
		content := scaffoldModel( t )
	}
	
	FileCreateDir, C:\xampp\htdocs\viyaFSM\app\Livewire\%directory%
	
	fileWrite( content, file )
}

searchQuery(table_name_singular){
	arr := []
	arr["case_user"] := "$query->whereHas('user'`, function (Builder $query) use ($search) {`n                    $query->where('name'`, 'like'`, '`%'.$search.'`%')`;`n                })"
	
	if(arr[table_name_singular])
		return arr[table_name_singular]
	
	name_field := name_field()
	return "$query->where('" name_field "'`, 'like'`, '`%'.$search.'`%')"
}
	
childListController(){
	global
	childListController_a( table_name_singular, table_name_plural, reverse )
}
	
childListController_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	dropdownsOnEdit := runSubScaffold( "listController_dropdownsOnEdit")
	relations := runSubScaffold( "scaffold_ListController_relations")
	name_field := name_field()
	searchQuery := searchQuery(table_name_singular)
	
	directory := scaffoldModel("? valueCC1 ?")
	name := scaffoldModel("? valueCC2 ?")
	file =C:\xampp\htdocs\gems-ws-api\app\Http\Livewire\%directory%\ChildList%name%.php

	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %relations%, " relations "
	}else{
		t := "<?php`n`nnamespace App\Http\Livewire\? valueCC91 ?`;`n`nuse Livewire\Component`;`nuse App\Models\? valueCC1 ?`;`nuse Illuminate\Support\Carbon`;`nuse App\Http\Livewire\DataTable\WithSorting`;`nuse App\Http\Livewire\DataTable\WithCachedRows`;`nuse App\Http\Livewire\DataTable\WithBulkActions`;`nuse App\Http\Livewire\DataTable\WithPerPagePagination`;`nuse Illuminate\Database\Eloquent\Builder`;`nuse Illuminate\Foundation\Auth\Access\AuthorizesRequests`;`n`nclass ChildList? valueCC2 ? extends Component`n{`n    use WithPerPagePagination`, WithSorting`, WithBulkActions`, WithCachedRows`, AuthorizesRequests`;`n`n    public $showDeleteModal = false`;`n    public $showEditModal = false`;`n    public $showAdvanced = false`;`n    public $filters = [`n        'search' => ''`,`n        'status' => ''`,`n        'amount-min' => null`,`n        'amount-max' => null`,`n        'created_at-min' => null`,`n        'created_at-max' => null`,`n    ]`;`n    public ? valueCC1 ? $editing`;`n`n    protected $queryString = ['sorts']`;`n`n    protected $listeners = ['refresh? valueCC2 ?' => '$refresh']`;`n`n    public $dependsOn`;`n`n    public function mount($dependsOn = [])`n    {`n        $this->editing = $this->makeBlank? valueCC91 ?()`;`n        $this->dependsOn = $dependsOn`;`n        $this->editing->? valueS1 ?_id = $dependsOn`;`n    }`n`n    protected function rules()`n    {`n        return ? valueCC1 ?`:`:rules()`;`n    }`n`n    public function updatedFilters() { $this->resetPage()`; }`n`n    public function exportSelected()`n    {`n        return response()->streamDownload(function () {`n            echo $this->selectedRowsQuery->toCsv()`;`n        }`, '? valueS2 ?.csv')`;`n    }`n`n    public function deleteSelected()`n    {`n        $this->authorize('delete'`, $this->editing)`;`n`n        $deleteCount = $this->selectedRowsQuery->count()`;`n`n        $this->selectedRowsQuery->delete()`;`n`n        $this->showDeleteModal = false`;`n`n        $this->notify('You\'ve deleted '.$deleteCount.' ? valueL2 ?')`;`n    }`n`n    public function makeBlank? valueCC91 ?()`n    {`n        return ? valueCC1 ?`:`:make(['date' => now()`, 'status' => 'success'])`;`n    }`n`n    public function toggleShowAdvanced()`n    {`n        $this->useCachedRows()`;`n`n        $this->showAdvanced = ! $this->showAdvanced`;`n    }`n`n    public function create()`n    {`n        $this->useCachedRows()`;`n`n        if ($this->editing->getKey()){`n            $this->editing = $this->makeBlank? valueCC1 ?()`;`n            $this->updateComponentValues()`;`n        }`n`n        $this->emit(""? valueC1 ?_childList_edit_modalUpdated""`, [`n            'name' => 'create_modal'`,`n            'value' => 'show'`,`n        ])`;`n    }`n`n    public function edit(? valueCC1 ? $? valueS1 ?)`n    {`n        $this->useCachedRows()`;`n`n        if ($this->editing->isNot($? valueS1 ?)){`n            $this->editing = $? valueS1 ?`;`n            $this->updateComponentValues()`;`n        }`n`n        $this->emit(""? valueC1 ?_childList_edit_modalUpdated""`, [`n            'name' => 'edit_modal'`,`n            'value' => 'show'`,`n        ])`;`n    }`n`n    protected function updateComponentValues()`n    {`n" dropdownsOnEdit "`n    }`n`n    public function save()`n    {`n        nullableToNull($this->editing)`;`n        $this->validate()`;`n`n        if (!$this->editing->getKey()){`n            $this->authorize('create'`, $this->editing)`;`n        }else{`n            $this->authorize('update'`, $this->editing)`;`n        }`n`n        activityLog($this->editing)`;`n        $this->editing->save()`;`n`n        $this->showEditModal = false`;`n    }`n`n    public function resetFilters() { $this->reset('filters')`; }`n`n    public function getRowsQueryProperty()`n    {`n        $query = ? valueCC1 ?`:`:query()`n            ->where? valueCC91 ?Id($this->dependsOn)`n            ->when($this->filters['status']`, fn($query`, $status) => $query->where('status'`, $status))`n            ->when($this->filters['amount-min']`, fn($query`, $amount) => $query->where('amount'`, '>='`, $amount))`n            ->when($this->filters['amount-max']`, fn($query`, $amount) => $query->where('amount'`, '<='`, $amount))`n            ->when($this->filters['created_at-min']`, fn($query`, $created_at) => $query->where('created_at'`, '>='`, Carbon`:`:createFromFormat('d/m/Y'`, $created_at)))`n            ->when($this->filters['created_at-max']`, fn($query`, $created_at) => $query->where('created_at'`, '<='`, Carbon`:`:createFromFormat('d/m/Y'`, $created_at)))`n            ->when($this->filters['search']`, fn($query`, $search) => " searchQuery ")`;`n`n        return $this->applySorting($query)`;`n    }`n`n    public function getRowsProperty()`n    {`n        return $this->cache(function () {`n            return $this->applyPagination($this->rowsQuery)`;`n        })`;`n    }`n`n    public function render()`n    {`n        $this->authorize('viewAny'`, $this->editing)`;`n`n        return view('livewire.? valueSH1 ?.child-list-? valueSH2 ?'`, [`n            '? valueS2 ?' => $this->rows`,`n        ])`;`n    }`n`n    public function getListeners()`n    {`n        return collect([`n" relations "        ])->mapWithKeys(function ($key) {`n                return [""{$key}Updated"" => 'updateDependingValue']`;`n            })`n            ->toArray()`;`n    }`n`n    public function updateDependingValue($data)`n    {`n        $name = $data['name']`;`n        $value = $data['value']`;`n`n        $this->editing->{$name} = $value`;`n    }`n`n    public function delete($id)`n    {`n`t`t$? valueS1 ? = ? valueCC91 ?`:`:find($id)`;`n`t`t$this->authorize('delete'`, $? valueS1 ?)`;`n`t`t$? valueS1 ?->delete()`;`n        session()->flash('message'`, '? valueAT1 ? deleted successfully.')`;`n        $this->showEditModal = false`;`n    }`n}`n"
		
		if( customModelName(table_name_singular) )
			StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
		
		t := replaceMarker( scaffoldModel("? valueCC1 ?"), t, 91)
		
		content := scaffoldModel( t )
	}
	
	FileCreateDir, C:\xampp\htdocs\gems-ws-api\app\Http\Livewire\%directory%
	
	
	fileWrite( content, file )
}
	
childListModalController(){
	global
	childListModalController_a( table_name_singular, table_name_plural, reverse )
}
	
childListModalController_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	dropdownsOnEdit := runSubScaffold( "listController_dropdownsOnEdit")
	relations := runSubScaffold( "scaffold_ListController_relations")
	name_field := name_field()
	searchQuery := searchQuery(table_name_singular)
	
	directory := scaffoldModel("? valueCC1 ?")
	name := scaffoldModel("? valueCC2 ?")
	file =C:\xampp\htdocs\gems-ws-api\app\Http\Livewire\%directory%\ChildListModal%name%.php

	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %relations%, " relations "
	}else{
		t := "<?php`n`nnamespace App\Http\Livewire\? valueCC91 ?`;`n`nuse Livewire\Component`;`nuse App\Models\? valueCC1 ?`;`nuse Illuminate\Support\Carbon`;`nuse App\Http\Livewire\DataTable\WithSorting`;`nuse App\Http\Livewire\DataTable\WithCachedRows`;`nuse App\Http\Livewire\DataTable\WithBulkActions`;`nuse App\Http\Livewire\DataTable\WithPerPagePagination`;`nuse Illuminate\Database\Eloquent\Builder`;`nuse Illuminate\Foundation\Auth\Access\AuthorizesRequests`;`n`nclass ChildListModal? valueCC2 ? extends Component`n{`n    use WithPerPagePagination`, WithSorting`, WithBulkActions`, WithCachedRows`, AuthorizesRequests`;`n`n    public $showDeleteModal = false`;`n    public $showEditModal = false`;`n    public $showAdvanced = false`;`n    public $filters = [`n        'search' => ''`,`n        'status' => ''`,`n        'amount-min' => null`,`n        'amount-max' => null`,`n        'created_at-min' => null`,`n        'created_at-max' => null`,`n    ]`;`n    public ? valueCC1 ? $editing`;`n`n    protected $queryString = ['sorts']`;`n`n    protected $listeners = ['refresh? valueCC2 ?' => '$refresh']`;`n`n    public $dependsOn`;`n`n    public function mount($dependsOn = [])`n    {`n        $this->editing = $this->makeBlank? valueCC91 ?()`;`n        $this->dependsOn = $dependsOn`;`n        $this->editing->? valueS1 ?_id = $dependsOn`;`n    }`n`n    protected function rules()`n    {`n        return ? valueCC1 ?`:`:rules()`;`n    }`n`n    public function updatedFilters() { $this->resetPage()`; }`n`n    public function exportSelected()`n    {`n        return response()->streamDownload(function () {`n            echo $this->selectedRowsQuery->toCsv()`;`n        }`, '? valueS2 ?.csv')`;`n    }`n`n    public function deleteSelected()`n    {`n        $this->authorize('delete'`, $this->editing)`;`n`n        $deleteCount = $this->selectedRowsQuery->count()`;`n`n        $this->selectedRowsQuery->delete()`;`n`n        $this->showDeleteModal = false`;`n`n        $this->notify('You\'ve deleted '.$deleteCount.' ? valueL2 ?')`;`n    }`n`n    public function makeBlank? valueCC91 ?()`n    {`n        return ? valueCC1 ?`:`:make(['date' => now()`, 'status' => 'success'])`;`n    }`n`n    public function toggleShowAdvanced()`n    {`n        $this->useCachedRows()`;`n`n        $this->showAdvanced = ! $this->showAdvanced`;`n    }`n`n    public function create()`n    {`n        $this->useCachedRows()`;`n`n        if ($this->editing->getKey()){`n            $this->editing = $this->makeBlank? valueCC1 ?()`;`n            $this->updateComponentValues()`;`n        }`n`n        $this->showEditModal = true`;`n    }`n`n    public function edit(? valueCC1 ? $? valueS1 ?)`n    {`n        $this->useCachedRows()`;`n`n        if ($this->editing->isNot($? valueS1 ?)){`n            $this->editing = $? valueS1 ?`;`n            $this->updateComponentValues()`;`n        }`n`n        $this->showEditModal = true`;`n    }`n`n    protected function updateComponentValues()`n    {`n" dropdownsOnEdit "`n    }`n`n    public function save()`n    {`n        nullableToNull($this->editing)`;`n        $this->validate()`;`n`n        if (!$this->editing->getKey()){`n            $this->authorize('create'`, $this->editing)`;`n        }else{`n            $this->authorize('update'`, $this->editing)`;`n        }`n`n        activityLog($this->editing)`;`n        $this->editing->save()`;`n`n        $this->showEditModal = false`;`n    }`n`n    public function resetFilters() { $this->reset('filters')`; }`n`n    public function getRowsQueryProperty()`n    {`n        $query = ? valueCC1 ?`:`:query()`n            ->where? valueCC91 ?Id($this->dependsOn)`n            ->when($this->filters['status']`, fn($query`, $status) => $query->where('status'`, $status))`n            ->when($this->filters['amount-min']`, fn($query`, $amount) => $query->where('amount'`, '>='`, $amount))`n            ->when($this->filters['amount-max']`, fn($query`, $amount) => $query->where('amount'`, '<='`, $amount))`n            ->when($this->filters['created_at-min']`, fn($query`, $created_at) => $query->where('created_at'`, '>='`, Carbon`:`:createFromFormat('d/m/Y'`, $created_at)))`n            ->when($this->filters['created_at-max']`, fn($query`, $created_at) => $query->where('created_at'`, '<='`, Carbon`:`:createFromFormat('d/m/Y'`, $created_at)))`n            ->when($this->filters['search']`, fn($query`, $search) => " searchQuery ")`;`n`n        return $this->applySorting($query)`;`n    }`n`n    public function getRowsProperty()`n    {`n        return $this->cache(function () {`n            return $this->applyPagination($this->rowsQuery)`;`n        })`;`n    }`n`n    public function render()`n    {`n        $this->authorize('viewAny'`, $this->editing)`;`n`n        return view('livewire.? valueSH1 ?.child-list-modal-? valueSH2 ?'`, [`n            '? valueS2 ?' => $this->rows`,`n        ])`;`n    }`n`n    public function getListeners()`n    {`n        return collect([`n" relations "            '? valueC1 ?_childList_edit_modal'`n        ])->mapWithKeys(function ($key) {`n                return [""{$key}Updated"" => 'updateDependingValue']`;`n            })`n            ->toArray()`;`n    }`n`n    public function updateDependingValue($data)`n    {`n        $this->useCachedRows()`;`n`t`t`n`t`t$name = $data['name']`;`n        $value = $data['value']`;`n`t`t`n        if($name == 'create_modal'){`n            if($value == 'show'){`n                $old_task_id = $this->editing->task_id`;`n`n                if ($this->editing->getKey()){`n                    $this->editing = $this->makeBlank? valueCC91 ?()`;`n                    $this->editing->task_id = $old_task_id`;`n                    $this->updateComponentValues()`;`n                }`n            }`n        } else if($name == 'edit_modal'){`n            if($value == 'show'){`n                $? valueS1 ? = ? valueCC91 ?`:`:find(1)`;`n                if ($this->editing->isNot($? valueS1 ?)){`n                    $this->editing = $? valueS1 ?`;`n                    $this->updateComponentValues()`;`n                }`n            }`n        }`n`n        if($name == 'create_modal' || $name == 'edit_modal'){`n            if($value == 'show'){`n                $this->showEditModal = true`;`n            }`n        }else`n            $this->editing->{$name} = $value`;`n    }`n`n    public function delete($id)`n    {`n`t`t$? valueS1 ? = ? valueCC91 ?`:`:find($id)`;`n`t`t$this->authorize('delete'`, $? valueS1 ?)`;`n`t`t$? valueS1 ?->delete()`;`n        session()->flash('message'`, '? valueAT1 ? deleted successfully.')`;`n        $this->showEditModal = false`;`n    }`n`n}`n"
		
		if( customModelName(table_name_singular) )
			StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
		
		t := replaceMarker( scaffoldModel("? valueCC1 ?"), t, 91)
		
		content := scaffoldModel( t )
	}
	
	FileCreateDir, C:\xampp\htdocs\gems-ws-api\app\Http\Livewire\%directory%
	
	
	fileWrite( content, file )
}
	
enum(){
	global
	enum_a( table_name_singular, table_name_plural, reverse )
}
	
enum_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	name := scaffoldModel("? valueCC2 ?")
	file =C:\xampp\htdocs\gems-ws-api\app\Enum\%name%Enum.php
	
	data := "`tEdit`tCopy`tDelete`t1`tcase assigned`tNULL`tNULL`n`tEdit`tCopy`tDelete`t2`ttask assigned`tNULL`tNULL"
	data := RegExReplace(data, "`n$", "")
		
	comments := runScaffold("` * @method static self ? valueS6 ?()`n", data)
	values := runScaffold("`            '? valueS6 ?' => ? value5 ?`,`n", data)
	labels := runScaffold("`            '? valueS6 ?' => '? valueAT6 ?'`,`n", data)

	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		;~ StringReplace, content, content, %relations%, " relations "
	}else{
		t := "<?php`nnamespace App\Enum`;`n`nuse \Spatie\Enum\Enum`;`n`n/**`n" comments "`n */`nclass ? valueCC2 ?Enum extends Enum`n{`n    protected static function values()`: array`n    {`n        return [`n" values "`n        ]`;`n    }`n`n    protected static function labels()`: array`n    {`n        return [`n" labels "`n        ]`;`n    }`n}`n"
	
		;~ t := "<?php`nnamespace App\Enum`;`n`nuse \Spatie\Enum\Enum`;`n`n/**`n * @method static self ? valueS2 ?()`n */`nclass ? valueCC2 ?Enum extends Enum`n{`n    protected static function values()`: array`n    {`n        return [`n            '? valueS2 ?' => ? value1 ?`,`n        ]`;`n    }`n`n    protected static function labels()`: array`n    {`n        return [`n            '? valueS2 ?' => '? valueAT2 ?'`,`n        ]`;`n    }`n}"
		
		content := scaffoldModel( t )
	}
	
	fileWrite( content, file )
}
	
manageController(){
	global
	manageController_a( table_name_singular, table_name_plural, reverse )
}
	
manageController_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	relations := runSubScaffold( "scaffold_ListController_relations")
	
	t := "<?php`n`nnamespace App\Http\Livewire\? valueCC91 ?`;`n`nuse Livewire\Component`;`nuse App\Models\? valueCC1 ?`;`nuse Illuminate\Foundation\Auth\Access\AuthorizesRequests`;`n`nclass Manage? valueCC91 ? extends Component`n{`n    use AuthorizesRequests`;`n`n    public ? valueCC1 ? $? valueC1 ?`;`n    public ? valueCC1 ? $editing`;`n    public $isEditing = false`;`n`n    protected function rules()`n    {`n        return ? valueCC1 ?`:`:rules()`;`n    }`n`n    public function mount($? valueC1 ? = null)`n    {`n        if ($? valueC1 ?) {`n            $this->editing = $? valueC1 ?`;`n            $this->isEditing = true`;`n        } else {`n            $this->editing = ? valueCC1 ?`:`:make()`;`n        }`n    }`n`n    public function render()`n    {`n        $this->authorize( $this->editing->getKey() ? 'update' `: 'create'`, $this->editing)`;`n`n        return view('livewire.? valueSH1 ?.manage-? valueSH1 ?')`;`n    }`n`n    public function save()`n    {`n        $this->authorize( $this->editing->getKey() ? 'update' `: 'create'`, $this->editing)`;`n`n        $this->validate()`;`n`n        activityLog($this->editing)`;`n        $this->editing->save()`;`n        return redirect()->route('? valueSH2 ?.show'`, $this->editing['id'])`;`n    }`n`n    public function getListeners()`n    {`n        return collect([`n" relations "        ])->mapWithKeys(function ($key) {`n                return [""{$key}Updated"" => 'updateDependingValue']`;`n            })`n            ->toArray()`;`n    }`n`n    public function updateDependingValue($data)`n    {`n        $name = $data['name']`;`n        $value = $data['value']`;`n`n        $this->editing->{$name} = $value`;`n    }`n}`n`n"
	
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( scaffoldModel("? valueCC1 ?"), t, 91)
	
	content := scaffoldModel( t )
	
	name := scaffoldModel("? valueCC1 ?\Manage? valueCC1 ?")
	file =C:\xampp\htdocs\gems-ws-api\app\Http\Livewire\%name%.php
	
	fileWrite( content, file )
}
	
showController(){
	global
	showController_a( table_name_singular, table_name_plural, reverse )
}
	
showController_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	t := "<?php`n`nnamespace App\Http\Livewire\? valueCC91 ?`;`n`nuse Livewire\Component`;`nuse App\Models\? valueCC1 ?`;`nuse Illuminate\Foundation\Auth\Access\AuthorizesRequests`;`n`nclass Show? valueCC91 ? extends Component`n{`n    use AuthorizesRequests`;`n`n    public ? valueCC1 ? $? valueC1 ?`;`n`n    public function render()`n    {`n        $this->authorize('view'`, $this->? valueC1 ?)`;`n`n        return view('livewire.? valueSH1 ?.show-? valueSH1 ?'`, [`n            '? valueS1 ?' => $this->? valueC1 ? ])`;`n    }`n`n    public function delete($id)`n    {`n        $this->authorize('delete'`, $this->? valueC1 ?)`;`n`n        $this->? valueC1 ?->delete()`;`n        session()->flash('message'`, '? valueAT1 ? deleted successfully.')`;`n        return redirect()->route('? valueSH1 ?s')`;`n    }`n}`n"
	
	name := scaffoldModel("? valueS1 ?")
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( scaffoldModel("? valueCC1 ?"), t, 91)
	
	content := scaffoldModel( t )
	
	name := scaffoldModel("? valueCC1 ?\Show? valueCC1 ?")
	file =C:\xampp\htdocs\gems-ws-api\app\Http\Livewire\%name%.php
	
	fileWrite( content, file )
}

Select_filter() {
	name := scaffoldModel("? valueS1 ?")
	
	if(name = "team" )
		t := "`        $teams = []`;`n        $organisationId = $this->getDependingValue('organisation_id')`;`n`n        if ($this->hasDependency('organisation_id') && $organisationId != null) {`n            if(!empty($searchTerm))`n                $teams = Team`:`:where('name'`, 'like'`, '`%' . $searchTerm . '`%')->where('organisation_id'`, $organisationId)->get()`;`n            else`n                $teams = Team`:`:where('organisation_id'`, $organisationId)->get()`;`n        }`n"
	else{
		t := "`        if(!empty($searchTerm))`n            $? valueS2 ? = ? valueCC1 ?`:`:where('name'`, 'like'`, '`%' . $searchTerm . '`%')->get()`;`n        else`n            $? valueS2 ? = ? valueCC1 ?`:`:get()`;`n"
		scaffoldModel( t )
	}
	
	return t
}

selectController(){
	global
	selectController_a( table_name_singular, table_name_plural, reverse )
}
	
selectController_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	filter := Select_filter()
	name_field := name_field()
	primary_key := primary_key()
	
	name := scaffoldModel("? valueCC1 ?\Select? valueCC1 ?")
	file =C:\xampp\htdocs\gems-ws-api\app\Http\Livewire\%name%.php
	
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %filter%, " filter ", All
		StringReplace, content, content, %name_field%, " name_field ", All
		StringReplace, content, content, %primary_key%, " primary_key ", All
	}else{
		t := "<?php`nnamespace App\Http\Livewire\? valueCC91 ?`;`n`nuse Livewire\Component`;`nuse App\Models\? valueCC1 ?`;`nuse App\Http\Livewire\LivewireSelect\LivewireSelect`;`nuse Illuminate\Support\Collection`;`n`nclass Select? valueCC91 ? extends LivewireSelect`n{`n    public function options($searchTerm = null) `: Collection`n    {`n        if(!empty($searchTerm))`n            $? valueS2 ? = ? valueCC1 ?`:`:where('" name_field "'`, 'like'`, '`%' . $searchTerm . '`%')->limit(20)`n`t`t`t`t->orWhere('" name_field "_dv'`, 'like'`, '`%' . $searchTerm . '`%')`n`t`t`t`t->get()`;`n        else`n            $? valueS2 ? = ? valueCC1 ?`:`:limit(20)->get()`;`n`n        $list = []`;`n        foreach ($? valueS2 ? as $key => $? valueS1 ?) {`n            $list[] = [`n                'value' => $? valueS1 ?->" primary_key "`,`n                'description' => $? valueS1 ?->" name_field "`,`n            ]`;`n        }`n`n        return collect($list)`;`n    }`n`n    public function selectedOption($searchTerm = null) `: Collection`n    {`n        $? valueS1 ? = ? valueCC1 ?`:`:find($searchTerm)`;`n`n        $list = [`n            'value' => $? valueS1 ? ? $? valueS1 ?->" primary_key " `: ''`,`n            'description' => $? valueS1 ? ? $? valueS1 ?->" name_field " `: ''`,`n        ]`;`n`n        return collect($list)`;`n    }`n}`n"
		
		name := scaffoldModel("? valueS1 ?")
		if( customModelName(table_name_singular) )
			StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
		
		t := replaceMarker( scaffoldModel("? valueS1 ?"), t, 91)
		
		content := scaffoldModel( t )
	}
		
	fileWrite( content, file )
}

selectArrayController(){
	global
	selectArrayController_a( table_name_singular, table_name_plural, reverse )
}
	
selectArrayController_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	name_field := name_field()
	primary_key := primary_key()
	
	name := scaffoldModel("? valueCC1 ?\Select? valueCC1 ?")
	file =C:\xampp\htdocs\gems-ws-api\app\Http\Livewire\%name%.php
	
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %filter%, " filter ", All
		StringReplace, content, content, %name_field%, " name_field ", All
		StringReplace, content, content, %primary_key%, " primary_key ", All
	}else{
		t := "<?php`nnamespace App\Http\Livewire\? valueCC1 ?`;`n`nuse Livewire\Component`;`nuse App\Models\? valueCC1 ?`;`nuse App\Http\Livewire\LivewireSelect\LivewireSelect`;`nuse Illuminate\Support\Collection`;`n`nclass Select? valueCC1 ? extends LivewireSelect`n{`n    public $channels = [`n        ? value1 ? => [`n            'value' => ? value1 ?`,`n            'description' => '? value2 ?'`,`n            'description_dv' => '? value3 ?'`,`n        ]`,`n    ]`;`n`n    public function options($searchTerm = null) `: Collection`n    {`n        $list = []`;`n        foreach ($this->? valueS2 ? as $key => $? valueS1 ?) {`n            $name = app()->getLocale() == 'dv' ? $? valueS1 ?['description_dv'] `: $? valueS1 ?['description']`;`n            if( str_contains($name`, $searchTerm) ){`n                $list[] = [`n                    'value' => $? valueS1 ?['value']`,`n                    'description' => $name`,`n                ]`;`n            }`n        }`n`n        return collect($list)`;`n    }`n`n    public function selectedOption($searchTerm = null) `: Collection`n    {`n        $? valueS1 ? = $this->? valueS2 ?[$searchTerm]`;`n`n        $list = [`n            'value' => $? valueS1 ? ? $? valueS1 ?['value'] `: ''`,`n            'description' => $? valueS1 ? ? (app()->getLocale() == 'dv' ? $? valueS1 ?['description_dv'] `: $? valueS1 ?['description']) `: ''`,`n        ]`;`n`n        return collect($list)`;`n    }`n}`n"
		
		name := scaffoldModel("? valueS1 ?")
		if( customModelName(table_name_singular) )
			StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
		
		t := replaceMarker( scaffoldModel("? valueS1 ?"), t, 91)
		
		content := scaffoldModel( t )
	}
		
	fileWrite( content, file )
}

scaffold_LiveWireImportController_rules( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	if( InStr(field3, "No") )
		t := "`        'fieldColumnMap.? valueS1 ?' => 'required'`,`n"
	else
		t := ""

	return t
}

scaffold_LiveWireImportController_createFields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	if(field2 = "datetime" or field2 = "timestamp" )
		t := "`                        ""? valueS1 ?"" =>  $row['? valueS1 ?'] ?  Carbon`:`:createFromFormat('d/m/Y H`:i'`, $row['? valueS1 ?'])->format('Y-m-d H:i:s') `: null`,`n"
	else
		t := "`                        ""? value1 ?"" => $row['? value1 ?']`,`n"

	return t
}

scaffold_LiveWireImportController_guesses( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	if(field2 = "datetime" or field2 = "timestamp" )
		t := "`            '? valueS1 ?' => ['? valueS1 ?_for_editing'`, '? valueS1 ?'`, 'alternateName']`,`n"
	else
		t := "`            '? valueS1 ?' => ['? valueS1 ?'`, 'alternateName']`,`n"

	return t
}

importController(){
	global
	importController_a( table_name_singular, table_name_plural, reverse )
}
	
importController_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	fieldColumnMap := scaffoldFields("`        '? valueS1 ?' => ''`,`n", 0)
	rules := runSubScaffold( "scaffold_LiveWireImportController_rules")
	customAttributes := scaffoldFields("`        'fieldColumnMap.? valueS1 ?' => '? valueS1 ?'`,`n", 0)
	createFields := runSubScaffold( "scaffold_LiveWireImportController_createFields")
	guesses := runSubScaffold( "scaffold_LiveWireImportController_guesses")
	
	name := scaffoldModel("? valueCC1 ?\Import? valueCC2 ?")
	file =C:\xampp\htdocs\gems-ws-api\app\Http\Livewire\%name%.php
	
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %fieldColumnMap%, " fieldColumnMap "
		StringReplace, content, content, %rules%, " rules "
		StringReplace, content, content, %customAttributes%, " customAttributes "
		StringReplace, content, content, %createFields%, " createFields "
		StringReplace, content, content, %guesses%, " guesses "
	}else{
		t := "<?php`n`nnamespace App\Http\Livewire\? valueCC91 ?`;`n`nuse Carbon\Carbon`;`nuse App\Csv`;`nuse Validator`;`nuse Livewire\Component`;`nuse App\Models\? valueCC1 ?`;`nuse Livewire\WithFileUploads`;`nuse Illuminate\Support\Str`;`nuse Maatwebsite\Excel\Facades\Excel`;`nuse App\Imports\? valueCC2 ?Import`;`nuse Illuminate\Foundation\Auth\Access\AuthorizesRequests`;`n`nclass Import? valueCC2 ? extends Component`n{`n    use WithFileUploads`, AuthorizesRequests`;`n`n    public $showModal = false`;`n    public $showFields = false`;`n    public $upload`;`n    public $columns`;`n    public $fieldColumnMap = [`n" fieldColumnMap "    ]`;`n`n    protected $rules = [`n    ]`;`n`n    protected $customAttributes = [`n" customAttributes "    ]`;`n`n    public function render()`n    {`n        $this->authorize('create'`, ? valueCC1 ?`:`:class)`;`n        return view('livewire.? valueSH1 ?.import-? valueSH2 ?')`;`n    }`n`n    public function updatingUpload($value)`n    {`n        Validator`:`:make(`n            ['upload' => $value]`,`n            ['upload' => 'required|mimes`:xlsx`,csv']`,`n        )->validate()`;`n    }`n`n    public function updatedUpload()`n    {`n        if( $this->upload && $this->upload->getMimeType() == ""application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"" ){`n            Excel`:`:import(new ? valueCC2 ?Import`, $this->upload)`;`n            $this->reset()`;`n`n            $this->emit('refresh? valueCC2 ?')`;`n`n            $this->notify('Imported ? valueS2 ?!')`;`n        }else{`n            $this->columns = Csv`:`:from($this->upload)->columns()`;`n`n`n            $this->guessWhichColumnsMapToWhichFields()`;`n        }`n    }`n`n    public function import()`n    {`n        $this->authorize('create'`, ? valueCC1 ?`:`:class)`;`n        $this->validate()`;`n`n        $importCount = 0`;`n`n        Csv`:`:from($this->upload)`n            ->eachRow(function ($row) use (&$importCount) {`n                foreach (\App\Models\? valueCC1 ?`:`:nullable() as $key => $column) {`n                    $row[$key] = $row[$key] ? $row[$key] `: null`;`n                }`n`n                $row = $this->extractFieldsFromRow($row)`;`n`n                $? valueC1 ? = ? valueCC1 ?`:`:create(`n                    [`n" createFields "                    ]`n                )`;`n`n                activity()`n                ->performedOn($? valueC1 ?)`n                ->causedBy(auth()->user())`n                ->log('created ? valueL1 ?')`;`n`n                $importCount++`;`n            })`;`n`n        $this->reset()`;`n`n        $this->emit('refresh? valueCC2 ?')`;`n`n        $this->notify('Imported '.$importCount.' ? valueS2 ?!')`;`n    }`n`n    public function extractFieldsFromRow($row)`n    {`n        $attributes = collect($this->fieldColumnMap)`n            ->filter()`n            ->mapWithKeys(function($heading`, $field) use ($row) {`n                return [$field => $row[$heading]]`;`n            })`n            ->toArray()`;`n`n        return $attributes + ['created_at' => now()]`;`n    }`n`n    public function guessWhichColumnsMapToWhichFields()`n    {`n        $guesses = [`n" guesses "        ]`;`n`n        foreach ($this->columns as $column) {`n            $match = collect($guesses)->search(fn($options) => in_array(strtolower($column)`, $options))`;`n`n            if ($match) $this->fieldColumnMap[$match] = $column`;`n        }`n    }`n}`n"
		
		if( customModelName(table_name_singular) )
			StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
		
		singular := scaffoldModel("? valueS1 ?")
		t := replaceMarker( singular, t, 91)
		
		content := scaffoldModel( t )
	}
	
	directory := scaffoldModel("? valueCC1 ?")
	FileCreateDir, C:\xampp\htdocs\gems-ws-api\app\Http\Livewire\%directory%
		
	fileWrite( content, file )
}

importModel_fields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	if(data_type = "datetime" or data_type = "timestamp" )
		t := "`           '? valueS1 ?'     => $row[" A_Index "] ? \PhpOffice\PhpSpreadsheet\Shared\Date`:`:excelToDateTimeObject($row[" A_Index "]) `: null`,`n"
	else
		t := "`           '? valueS1 ?'     => $row[" A_Index "]`,`n"

	return t
}

importModel(){
	global
	importModel_a( table_name_singular, table_name_plural, reverse )
}
	
importModel_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	fields := runSubScaffold( "importModel_fields", 1)
	
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %fields%, " fields "
	}else
		content := scaffoldModel("<?php`n`nnamespace App\Imports`;`n`nuse Carbon\Carbon`;`nuse App\Models\? valueCC1 ?`;`nuse Illuminate\Support\Facades\Hash`;`nuse Maatwebsite\Excel\Concerns\ToModel`;`nuse PhpOffice\PhpSpreadsheet\Shared\Date`;`n`nclass ? valueCC2 ?Import implements ToModel`n{`n    /**`n     * @param array $row`n     *`n     * @return ? valueCC1 ?|null`n     */`n    public function model(array $row)`n    {`n        if($row[12] == ""last_activity_date"")`n            return null`;`n        `n        return new ? valueCC1 ?([`n" fields "        ])`;`n    }`n}")
	
	name := scaffoldModel("? valueCC2 ?Import")
	file =C:\xampp\htdocs\gems-ws-api\app\Imports\%name%.php
	
	fileWrite( content, file )
}
	
scaffoldTableFields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15, child = 0){
	name := scaffoldModel("? valueS1 ?")
	plural := scaffoldModel("? valueSH2 ?")
	
	fieldsArr := table_fields( table_name_singular )
	
	if( ! child )
		on_click := " x-on`:click=""location.href = '{{ route('" plural ".show'`, $" name "['" primary_key "']) }}'"""

	;~ if( field_name = name_field() ){
	if( column_number = arrayLength ){
		if( child ){
			actions := scaffoldModel("`                        <x-table.cell>`n                            <x-button.link class=""bg-white text-secondary m-5 mb-0"">`n                                <div class=""flex space-x-2 items-center"">`n                                    <svg xmlns=""http`://www.w3.org/2000/svg"" `:class=""{'rotate-180'`: open{{ $loop->index }}`, 'rotate-0'`: !open{{ $loop->index }}}"" class=""inline w-6 h-6 mt-1 ml-1 transition-transform duration-200 transform md`:-mt-1 inline-block w-5 h-5 rotate-180"" fill=""none"" viewBox=""0 0 24 24"" stroke=""currentColor"" stroke-width=""1.5"">`n                                        <path stroke-linecap=""round"" stroke-linejoin=""round"" d=""M19 9l-7 7-7-7""></path>`n                                      </svg>`n                                    <span></span>`n                                </div>`n                            </x-button.link>`n                        </x-table.cell>`n`n")
		}else{
			actions := scaffoldModel("	                        <x-table.cell>`n                            <a href=""{{ route('? valueSH9 ?.show'`, $? valueS8 ?['" primary_key "']) }}"">`n                                <span href=""#"" class=""inline-flex space-x-2 truncate text-sm leading-5"">`n                                <x-button.link class=""bg-white text-secondary m-5 mb-0"">`n                                    <div class=""flex space-x-2 items-center"">`n                                        <x-icon.eye/>`n                                        <span></span>`n                                    </div>`n                                </x-button.link>`n                            </a>`n                            <x-button.link class=""bg-white text-secondary m-5 mb-0"" wire`:click=""edit({{ $? valueS1 ?['" primary_key "'] }})"" >`n                                <div class=""flex space-x-2 items-center"">`n                                    <x-icon.pencil/>`n                                    <span></span>`n                                </div>`n                            </x-button.link>`n                        </x-table.cell>`n                        `n")
		}
	}

	if(related_table_singular != "") { ; if relation is there
		t := "`                        <x-table.cell" on_click ">`n                            <span href=""#"" class=""inline-flex space-x-2 truncate text-sm leading-5"">`n                                {{ $" name "->? valueC91 ? ? $" name "->? valueC91 ?->getName() `: '' }}`n                            </span>`n                        </x-table.cell>`n`n" actions
		without_id := StrReplace(field_name, "_id", "")
		t := replaceMarker(without_id, t, 91)
	}else if(data_type = "datetime" or data_type = "timestamp" )
		t := "`                        <x-table.cell" on_click ">`n                            {{ getDateForHumans($" name "->? valueS1 ?) }}`n                        </x-table.cell>`n`n" actions
	else 
		t := "`                        <x-table.cell" on_click ">`n                            <span href=""#"" class=""inline-flex space-x-2 truncate text-sm leading-5"">`n                                {{ $" name "->? valueS1 ? }}`n                            </span>`n                        </x-table.cell>`n`n" actions
	
	return t
}

scaffoldFormFields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15, hidden = 0 ){
	name := scaffoldModel("? valueS1 ?")
	
	arr := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	if( HasVal(arr, field_name) )
		return ""
	
	; check if "an" or "a" should be used
	aOrAn := "a"
	vowels := ["a", "e", "i", "o", "u"]
	firstCharacter := SubStr(related_table_singular, 1, 1)
	if( HasVal(vowels, firstCharacter) )
		aOrAn := "an"
	
	required := ""
	if( InStr(nullability, "No") )
		required := ":required=""true"" "
	
	dependancyArr := {"team_id": "'organisation_id', "}
	dependancy := dependancyArr[field_name]
	
	if(hidden)
		hidden := "hidden "
	
	if(related_table_singular != ""){
		t := "`                    <div class=""" hidden "w-full md`:w-1/2 px-3 mb-6 md`:mb-0"">`n                        <x-input.group for=""? valueS1 ?"" label=""? valueAT91 ?"" " required " `:error=""$errors->first('editing.? valueS1 ?')"">`n                            <livewire`:? valueSH4 ?.select-? valueSH4 ?`n                              name=""? valueS1 ?""`n                              `:value=""$editing->? valueS1 ?""`n                              placeholder=""Choose " aOrAn " ? valueL4 ?""`n                              `:depends-on=""['? valueS1 ?'`, " dependancy "]""`n                              `:searchable=""true""`n                            />`n                        </x-input.group>`n                    </div>`n`n"
		without_id := RegExReplace(field_name, "_id$", "")
		t := replaceMarker(without_id, t, 91)
	}else if(data_type = "datetime" or data_type = "timestamp" or data_type = "date" )
		t := "`                    <div class=""w-full md`:w-1/2 px-3 mb-6 md`:mb-0"">`n                        <x-input.group for=""? valueS1 ?_for_editing"" label=""? valueAT1 ?""  " required " `:error=""$errors->first('editing.? valueS1 ?_for_editing')"">`n                            <x-input.date wire`:model=""editing.? valueS1 ?_for_editing"" id=""? valueS1 ?_for_editing"" />`n                        </x-input.group>`n                    </div>`n`n"
	else if(data_type = "int")
		t := "`                <x-input.group for=""? valueS1 ?"" label=""? valueAT1 ?""  " required " `:error=""$errors->first('editing.? valueS1 ?')"">`n                    <x-input.money wire`:model=""editing.? valueS1 ?"" id=""? valueS1 ?"" />`n                </x-input.group>`n`n"
	else if(data_type = "longtext")
		t := "`                    <div class=""w-full md`:w-1/2 px-3 mb-6 md`:mb-0"">`n                        <x-input.group for=""? valueS1 ?"" label=""? valueAT1 ?""  " required " `:error=""$errors->first('editing.? valueS1 ?')"">`n                            <x-input.textarea wire`:model=""editing.? valueS1 ?"" id=""? valueS1 ?"" placeholder=""? valueAT1 ?"" />`n                        </x-input.group>`n                    </div>`n`n"
	else
		t := "`                    <div class=""w-full md`:w-1/2 px-3 mb-6 md`:mb-0"">`n                        <x-input.group for=""? valueS1 ?"" label=""? valueAT1 ?""  " required " `:error=""$errors->first('editing.? valueS1 ?')"">`n                            <x-input.text wire`:model=""editing.? valueS1 ?"" id=""? valueS1 ?"" placeholder=""? valueAT1 ?"" />`n                        </x-input.group>`n                    </div>`n`n"
	return t
}

childListView_FormFields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	hiddenArr := {"communication_case_id" : 1}
	hidden := hiddenArr[table_name_singular "_" field_name]
	return scaffoldFormFields( field_name, data_type, nullability, related_table_singular, related_table_plural, column_number, table_name_singular, table_name_plural, primary_key, hidden)
}

table_fields( table_name_singular ){
	fieldsArr := table_fields_specific( table_name_singular )
	
	if(fieldsArr)
		return fieldsArr
	
	fieldsArr := ["scaffold_blacklist", "deleted_at"]
	
	return fieldsArr
}

table_fields_specific( table_name_singular ){
	global specificFieldsArr
	
	specificFieldsArr()
	
	return specificFieldsArr[ table_name_singular ]
}

columnLabel(table_name_singular, field_name){
	arr := []
	arr["communication_from_organisation_id"] := "FROM"
	arr["communication_case_item_type_id"] := "TYPE"
	arr["communication_recieved_date"] := "RECIEVED"
	
	if(arr[table_name_singular "_" field_name])
		return arr[table_name_singular "_" field_name]
	else
		return ""
	
}

scaffoldTableHeaders( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	;~ if( field_name = name_field() )
	if( column_number = arrayLength )
		actions := "`                    <x-table.heading />`n"

	t := "`                    <x-table.heading sortable multi-column wire`:click=""sortBy('? valueS1 ?')"" `:direction=""$sorts['? valueS1 ?'] ?? null"" class="""">? valueAT91 ?</x-table.heading>`n" actions
	
	columnLabel := columnLabel(table_name_singular, field_name)
	if(!columnLabel){
		columnLabel := field_name
		if( related_table_singular )
			columnLabel := RegExReplace(field_name, "_id$", "")
	}
	t := replaceMarker(columnLabel, t, 91)
	return t
}

runSubScaffold( functionName, withID = 0, fieldsArr = "", blacklist = 0, reverse = 0 ){
	global DB_Fields, fields, primary_key
	
	s := scaffoldModel("? valueS1 ?")
	p := scaffoldModel("? valueS2 ?")
	clipList := DB_Fields
	if(withID)
		clipList := primary_key_row() "`n" clipList
	
	StringSplit, clipList, clipList, `n, `r
	output=
	
	if(!fieldsArr){
		fieldsArr := []
		
		Loop %clipList0%
		{
			field := clipList%A_Index%
			StringSplit, field, field, `t
			;~ order_prefix := 1000 + A_Index
			fieldsArr.Push( field1 )
		}
	}
	
	if(blacklist or HasVal(fieldsArr, "scaffold_blacklist")){
		fieldsArrNew := []
		
		Loop %clipList0%
		{
			field := clipList%A_Index%
			StringSplit, field, field, `t
			;~ order_prefix := 1000 + A_Index
			if(!HasVal(fieldsArr, field1))
				fieldsArrNew.Push( field1 )
		}
		
		fieldsArr := fieldsArrNew
	}
	
	
	For key, value in fieldsArr {
		field := fields[ value ]
		
		if( !withID and field["field_name"] = primary_key )
			continue
		
		t := %functionName%( field["field_name"], field["data_type"], field["nullability"], field["related_table_singular"], field["related_table_plural"], field["related_primary_key"], key, field["table_name_singular"], field["table_name_plural"], field["model_name"], field["related_model_name"], field["function_name_singular"], field["function_name_plural"], primary_key, fieldsArr.Length() )
		
		if( !reverse ){
			t := replaceMarker(field["field_name"], t, 1)
			t := replaceMarker(field["data_type"], t, 2)
			t := replaceMarker(field["nullability"], t, 3)
			t := replaceMarker(field["related_table_singular"], t, 4)
			t := replaceMarker(field["related_table_plural"], t, 5)
			t := replaceMarker(field["related_primary_key"], t, 6)
			t := replaceMarker(field["column_number"], t, 7)
			t := replaceMarker(field["table_name_singular"], t, 8)
			t := replaceMarker(field["table_name_plural"], t, 9)
			t := replaceMarker(field["model_name"], t, 10)
			t := replaceMarker(field["related_model_name"], t, 11)
			t := replaceMarker(field["function_name_singular"], t, 12)
			t := replaceMarker(field["function_name_plural"], t, 13)
		}
		output := output t
	}
	
	return output
}
	
listView(){
	global
	listView_a( table_name_singular, table_name_plural, reverse, primary_key, fields )
}
	
listView_a(table_name_singular = 1, table_name_plural = 2, reverse = 0, primary_key = "id", fields=""){
	fieldsArr := ShowView_fieldsArr( table_name_singular )
	table_fieldsArr := table_fields( table_name_singular )
	
	table_headers := runSubScaffold( "scaffoldTableHeaders", 1, table_fieldsArr)
	table_rows := runSubScaffold( "scaffoldTableFields", 1, table_fieldsArr)
	form_fields := runSubScaffold( "scaffoldFormFields", 0 )

	directory := scaffoldModel("? valueSH1 ?")
	name := scaffoldModel("? valueSH2 ?")
	file =C:\xampp\htdocs\gems-ws-api\resources\views\livewire\%directory%\list-%name%.blade.php
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %table_headers%, " table_headers "
		StringReplace, content, content, %table_rows%, " table_rows "
		StringReplace, content, content, %form_fields%, " form_fields "
	}else{
	
		content := scaffoldModel("<div class=""pt-16 mx-auto px-2 sm`:px-4 md`:px-8"">`n    {{-- Breadcrumbs --}}`n    <div class=""pt-2"">`n        <div class=""text-sm mb-2"">`n            <a class=""text-blue-600"" href=""{{ route('home') }}"">`n                Home`n            </a>`n            >`n            <a class=""text-blue-600"" href=""{{ route('? valueSH2 ?') }}"">`n                ? valueAT2 ?`n            </a>`n        </div>`n    </div>`n`n    <h1 class=""text-2xl font-semibold text-gray-900"">? valueAT2 ?</h1>`n`n    <div class=""py-4 space-y-4"">`n        <!-- Top Bar -->`n        <div class=""flex justify-between"">`n            <div class=""w-2/4 flex space-x-4"">`n                <x-input.text wire`:model=""filters.search"" placeholder=""Search ? valueAT2 ?..."" />`n`n                <x-button.link wire`:click=""toggleShowAdvanced"">@if ($showAdvanced) Hide @endif Advanced...</x-button.link>`n            </div>`n`n            <div class=""space-x-2 flex items-center"">`n                @if ($showAdvanced)`n                <div class=""sm`:grid sm`:grid-cols-3 sm`:gap-4 sm`:items-start  sm`:border-gray-200 "">`n                    <label for=""perPage"" class=""block text-sm font-medium leading-5 text-gray-700 sm`:mt-px sm`:pt-2"">`n                        Per Page`n                    </label>`n`n                    <div class=""mt-1 sm`:mt-0 sm`:col-span-2"">`n                        <div class=""flex"">`n                            <select class=""form-select block w-full pl-3 pr-10 py-2 text-base leading-6 border-gray-300 focus`:outline-none focus`:shadow-outline-blue focus`:border-blue-300 sm`:text-sm sm`:leading-5"" wire`:model=""perPage"" id=""perPage"">`n                                <option value=""10"">10</option>`n                                <option value=""25"">25</option>`n                                <option value=""50"">50</option>`n                            </select>`n                        </div>`n                    </div>`n                </div>`n`n`n                <x-dropdown label=""Bulk Actions"">`n                    <x-dropdown.item type=""button"" wire`:click=""exportSelected"" class=""flex items-center space-x-2"">`n                        <x-icon.download class=""text-cool-gray-400""/> <span>Export</span>`n                    </x-dropdown.item>`n`n                    <x-dropdown.item type=""button"" wire`:click=""$toggle('showDeleteModal')"" class=""flex items-center space-x-2"">`n                        <x-icon.trash class=""text-cool-gray-400""/> <span>Delete</span>`n                    </x-dropdown.item>`n                </x-dropdown>`n`n                <livewire`:? valueSH1 ?.import-? valueSH2 ? />`n                @endif`n`n                <x-button.primary wire`:click=""create""><x-icon.plus/> New</x-button.primary>`n            </div>`n        </div>`n`n        <!-- Advanced Search -->`n        <div>`n            @if ($showAdvanced)`n            <div class=""bg-cool-gray-200 p-4 rounded shadow-inner flex relative"">`n                <?php /* <div class=""w-1/2 pr-2 space-y-4"">`n                    <x-input.group inline for=""filter-status"" label=""Status"">`n                        <x-input.select wire`:model=""filters.status"" id=""filter-status"">`n                            <option value="""" disabled>Select Status...</option>`n`n                            @foreach (App\Models\? valueCC1 ?`:`:STATUSES as $value => $label)`n                            <option value=""{{ $value }}"">{{ $label }}</option>`n                            @endforeach`n                        </x-input.select>`n                    </x-input.group>`n`n                    <x-input.group inline for=""filter-amount-min"" label=""Minimum Amount"">`n                        <x-input.money wire`:model.lazy=""filters.amount-min"" id=""filter-amount-min"" />`n                    </x-input.group>`n`n                    <x-input.group inline for=""filter-amount-max"" label=""Maximum Amount"">`n                        <x-input.money wire`:model.lazy=""filters.amount-max"" id=""filter-amount-max"" />`n                    </x-input.group>`n                </div> */ ?>`n`n                <div class=""w-1/2 pl-2 space-y-4"">`n                    <x-input.group inline for=""filter-created_at-min"" label=""Minimum Date"">`n                        <x-input.date wire`:model=""filters.created_at-min"" id=""filter-created_at-min"" placeholder=""MM/DD/YYYY"" />`n                    </x-input.group>`n`n                    <x-input.group inline for=""filter-created_at-max"" label=""Maximum Date"">`n                        <x-input.date wire`:model=""filters.created_at-max"" id=""filter-created_at-max"" placeholder=""MM/DD/YYYY"" />`n                    </x-input.group>`n`n                    <x-button.link wire`:click=""resetFilters"" class=""absolute right-0 bottom-0 p-4"">Reset Filters</x-button.link>`n                </div>`n            </div>`n            @endif`n        </div>`n`n        <!-- ? valueAT2 ? Table -->`n        <div class=""flex-col space-y-4 backdrop-blur-lg`n        [ bg-gradient-to-b from-white/60 to-white/30 ]`n        [ border-[1px] border-solid border-white border-opacity-30 ]`n        [ shadow-lg ]"">`n            <x-table>`n                <x-slot name=""head"">`n                    <x-table.heading class=""pr-0 w-8"">`n                        <x-input.checkbox wire`:model=""selectPage"" />`n                    </x-table.heading>`n" table_headers "                </x-slot>`n`n                <x-slot name=""body"">`n                    @if ($selectPage)`n                    <x-table.row class=""bg-cool-gray-200"" wire`:key=""row-message"">`n                        <x-table.cell colspan=""6"">`n                            @unless ($selectAll)`n                            <div>`n                                <span>You have selected <strong>{{ $? valueS2 ?->count() }}</strong> ? valueS2 ?`, do you want to select all <strong>{{ $? valueS2 ?->total() }}</strong>?</span>`n                                <x-button.link wire`:click=""selectAll"" class=""ml-1 text-blue-600"">Select All</x-button.link>`n                            </div>`n                            @else`n                            <span>You are currently selecting all <strong>{{ $? valueS2 ?->total() }}</strong> ? valueS2 ?.</span>`n                            @endif`n                        </x-table.cell>`n                    </x-table.row>`n                    @endif`n`n                    @forelse ($? valueS2 ? as $? valueS1 ?)`n                    <x-table.row wire`:loading.class.delay=""opacity-50"" wire`:key=""row-{{ $? valueS1 ?->" primary_key " }}"" class=""cursor-pointer"">`n                        <x-table.cell class=""pr-0"">`n                            <x-input.checkbox wire`:model=""selected"" value=""{{ $? valueS1 ?->" primary_key " }}"" />`n                        </x-table.cell>`n`n" table_rows "                    </x-table.row>`n                    @empty`n                    <x-table.row>`n                        <x-table.cell colspan=""11"">`n                            <div class=""flex justify-center items-center space-x-2"">`n                                <x-icon.inbox class=""h-8 w-8 text-cool-gray-400"" />`n                                <span class=""font-medium py-8 text-cool-gray-400 text-xl"">No ? valueAT2 ? found...</span>`n                            </div>`n                        </x-table.cell>`n                    </x-table.row>`n                    @endforelse`n                </x-slot>`n            </x-table>`n`n            {!! pagination( $? valueS2 ? ) !!}`n        </div>`n    </div>`n`n    <!-- Delete ? valueAT2 ? Modal -->`n    <form wire`:submit.prevent=""deleteSelected"">`n        <x-modal.confirmation wire`:model.defer=""showDeleteModal"">`n            <x-slot name=""title"">Delete ? valueAT1 ?</x-slot>`n`n            <x-slot name=""content"">`n                <div class=""py-8 text-cool-gray-700"">Are you sure you? This action is irreversible.</div>`n            </x-slot>`n`n            <x-slot name=""footer"">`n                <x-button.secondary wire`:click=""$set('showDeleteModal'`, false)"">Cancel</x-button.secondary>`n`n                <x-button.primary type=""submit"">Delete</x-button.primary>`n            </x-slot>`n        </x-modal.confirmation>`n    </form>`n`n    <!-- Save ? valueAT1 ? Modal -->`n    <form wire`:submit.prevent=""save"">`n        <x-modal.dialog wire`:model.defer=""showEditModal"" `:maxWidth=""'5xl'"">`n            <x-slot name=""title"">{{ $editing['" primary_key "'] ? 'Edit' `: 'Create' }} ? valueAT1 ?</x-slot>`n`n            <x-slot name=""content"">`n                <div class=""flex flex-wrap -mx-3 mb-6"">`n" form_fields "`n                </div>`n`n                <div class=""text-right"">`n                    <x-button.secondary wire`:click=""$set('showEditModal'`, false)"">Cancel</x-button.secondary>`n`n                    <x-button.primary type=""submit"">Save</x-button.primary>`n`n                </div>`n            </x-slot>`n        </x-modal.dialog>`n    </form>`n</div>`n")
	}
	
	FileCreateDir, C:\xampp\htdocs\viyaFSM\resources\views\livewire\%directory%
	
	fileWrite( content, file )
}

viya_listView(){
	global
	viya_listView_a( table_name_singular, table_name_plural, reverse, primary_key, fields )
}
	
viya_listView_a(table_name_singular = 1, table_name_plural = 2, reverse = 0, primary_key = "id", fields=""){
	;~ fieldsArr := ShowView_fieldsArr( table_name_singular )
	;~ table_fieldsArr := table_fields( table_name_singular )
	
	;~ table_headers := runSubScaffold( "scaffoldTableHeaders", 1, table_fieldsArr)
	;~ table_rows := runSubScaffold( "scaffoldTableFields", 1, table_fieldsArr)
	;~ form_fields := runSubScaffold( "scaffoldFormFields", 0 )

	directory := scaffoldDirectory("? valueSH1 ?")
	
	name := scaffoldModel("? valueSH1 ?")
	file =C:\xampp\htdocs\viyaFSM\resources\views\livewire\%directory%\%name%.blade.php
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %table_headers%, " table_headers "
		StringReplace, content, content, %table_rows%, " table_rows "
		StringReplace, content, content, %form_fields%, " form_fields "
	}else{
	
		content := scaffoldModel("@section('title'`, '? valueAT1 ? - Purchase Order')`n@section('sub-title'`, '')`n`n`n<div class=""panel-body"">`n  <div class=""row"">`n    <div class=""col-md-6"">`n      <div class=""form-group"">`n        <label for=""cboFund"" class=""label-sm"">Fund Centre`:</label>`n        <select name=""cboFund"" id=""cboFund"" type=""dropdown-toggle"" class=""form-control"" wire`:model.live=""selectedFund"">`n          {{-- onchange=""fundChange()""> --}}`n          @foreach($funds as $fund)`n            <option value=""{{ $fund->fundid }}"">{{ $fund->fundcode }}</option>`n          @endforeach`n        </select>`n`n        <span id=""RequiredFieldValidator4"" class="" errmsg   "" style=""visibility`:hidden`;"">Required!</span>`n        <div>Selected fund`: {{ $selectedFund }}</div>`n      </div>`n    </div>`n    <div class=""col-md-3"">`n      <div class=""form-group "">`n      </div>`n    </div>`n    <div class=""col-md-3"">`n      <div class=""form-group "">`n        <label for=""txtReqNo"" class=""label-sm"">Purchase Order No`:</label>`n        <input name=""txtReqNo"" type=""text"" readonly=""readonly"" id=""txtReqNo"" class="" form-control "">`n      </div>`n    </div>`n  </div>`n`n`n</div>`n")
	}
	
	FileCreateDir, C:\xampp\htdocs\viyaFSM\resources\views\livewire\%directory%
	
	fileWrite( content, file )
}

listView_filters(){
	global
	listView_filters_a( table_name_singular, table_name_plural, reverse, primary_key, fields )
}
	
listView_filters_a(table_name_singular = 1, table_name_plural = 2, reverse = 0, primary_key = "id", fields=""){
	fieldsArr := ShowView_fieldsArr( table_name_singular )
	table_fieldsArr := table_fields( table_name_singular )
	
	table_headers := runSubScaffold( "scaffoldTableHeaders", 1, table_fieldsArr)
	table_rows := runSubScaffold( "scaffoldTableFields", 1, table_fieldsArr)
	form_fields := runSubScaffold( "scaffoldFormFields", 0 )

	directory := scaffoldModel("? valueSH1 ?")
	name := scaffoldModel("? valueSH2 ?")
	file =C:\xampp\htdocs\viyaFSM\resources\views\livewire\%directory%\list-%name%.blade.php
	
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %table_headers%, " table_headers "
		StringReplace, content, content, %table_rows%, " table_rows "
		StringReplace, content, content, %form_fields%, " form_fields "
	}else{
	
		content := scaffoldModel("<div class=""pt-16 mx-auto px-2 sm`:px-4 md`:px-8"">`n    {{-- Breadcrumbs --}}`n    <div class=""pt-2"">`n        <div class=""text-sm mb-2"">`n            <a class=""text-blue-600"" href=""{{ route('home') }}"">`n                Home`n            </a>`n            >`n            <a class=""text-blue-600"" href=""{{ route('? valueSH2 ?') }}"">`n                ? valueAT2 ?`n            </a>`n        </div>`n    </div>`n`n    <h1 class=""text-2xl font-semibold text-gray-900"">? valueAT2 ?</h1>`n`n    <div class=""py-4 space-y-4"">`n        <!-- Top Bar -->`n        <div class=""flex justify-between"">`n            <div class=""w-2/4 flex space-x-4"">`n                <x-input.text wire`:model=""filters.search"" placeholder=""Search ? valueAT2 ?..."" />`n`n                <x-button.link wire`:click=""toggleShowAdvanced"">@if ($showAdvanced) Hide @endif Advanced...</x-button.link>`n            </div>`n`n            <div class=""space-x-2 flex items-center"">`n                @if ($showAdvanced)`n                <div class=""sm`:grid sm`:grid-cols-3 sm`:gap-4 sm`:items-start  sm`:border-gray-200 "">`n                    <label for=""perPage"" class=""block text-sm font-medium leading-5 text-gray-700 sm`:mt-px sm`:pt-2"">`n                        Per Page`n                    </label>`n`n                    <div class=""mt-1 sm`:mt-0 sm`:col-span-2"">`n                        <div class=""flex"">`n                            <select class=""form-select block w-full pl-3 pr-10 py-2 text-base leading-6 border-gray-300 focus`:outline-none focus`:shadow-outline-blue focus`:border-blue-300 sm`:text-sm sm`:leading-5"" wire`:model=""perPage"" id=""perPage"">`n                                <option value=""10"">10</option>`n                                <option value=""25"">25</option>`n                                <option value=""50"">50</option>`n                            </select>`n                        </div>`n                    </div>`n                </div>`n`n`n                <x-dropdown label=""Bulk Actions"">`n                    <x-dropdown.item type=""button"" wire`:click=""exportSelected"" class=""flex items-center space-x-2"">`n                        <x-icon.download class=""text-cool-gray-400""/> <span>Export</span>`n                    </x-dropdown.item>`n`n                    <x-dropdown.item type=""button"" wire`:click=""$toggle('showDeleteModal')"" class=""flex items-center space-x-2"">`n                        <x-icon.trash class=""text-cool-gray-400""/> <span>Delete</span>`n                    </x-dropdown.item>`n                </x-dropdown>`n`n                <livewire`:? valueSH1 ?.import-? valueSH2 ? />`n                @endif`n`n                <x-button.primary wire`:click=""create""><x-icon.plus/> New</x-button.primary>`n            </div>`n        </div>`n`n        <!-- Advanced Search -->`n        <div>`n            @if ($showAdvanced)`n            <div class=""bg-cool-gray-200 p-4 rounded shadow-inner flex relative"">`n                <?php /* <div class=""w-1/2 pr-2 space-y-4"">`n                    <x-input.group inline for=""filter-status"" label=""Status"">`n                        <x-input.select wire`:model=""filters.status"" id=""filter-status"">`n                            <option value="""" disabled>Select Status...</option>`n`n                            @foreach (App\Models\? valueCC1 ?`:`:STATUSES as $value => $label)`n                            <option value=""{{ $value }}"">{{ $label }}</option>`n                            @endforeach`n                        </x-input.select>`n                    </x-input.group>`n`n                    <x-input.group inline for=""filter-amount-min"" label=""Minimum Amount"">`n                        <x-input.money wire`:model.lazy=""filters.amount-min"" id=""filter-amount-min"" />`n                    </x-input.group>`n`n                    <x-input.group inline for=""filter-amount-max"" label=""Maximum Amount"">`n                        <x-input.money wire`:model.lazy=""filters.amount-max"" id=""filter-amount-max"" />`n                    </x-input.group>`n                </div> */ ?>`n`n                <div class=""w-1/2 pl-2 space-y-4"">`n                    <x-input.group inline for=""filter-created_at-min"" label=""Minimum Date"">`n                        <x-input.date wire`:model=""filters.created_at-min"" id=""filter-created_at-min"" placeholder=""MM/DD/YYYY"" />`n                    </x-input.group>`n`n                    <x-input.group inline for=""filter-created_at-max"" label=""Maximum Date"">`n                        <x-input.date wire`:model=""filters.created_at-max"" id=""filter-created_at-max"" placeholder=""MM/DD/YYYY"" />`n                    </x-input.group>`n`n                    <x-button.link wire`:click=""resetFilters"" class=""absolute right-0 bottom-0 p-4"">Reset Filters</x-button.link>`n                </div>`n            </div>`n            @endif`n        </div>`n`n        <!-- ? valueAT2 ? Table -->`n        <div class=""flex-col space-y-4 backdrop-blur-lg`n        [ bg-gradient-to-b from-white/60 to-white/30 ]`n        [ border-[1px] border-solid border-white border-opacity-30 ]`n        [ shadow-lg ]"">`n            <x-table>`n                <x-slot name=""head"">`n                    <x-table.heading class=""pr-0 w-8"">`n                        <x-input.checkbox wire`:model=""selectPage"" />`n                    </x-table.heading>`n" table_headers "                </x-slot>`n`n                <x-slot name=""body"">`n                    @if ($selectPage)`n                    <x-table.row class=""bg-cool-gray-200"" wire`:key=""row-message"">`n                        <x-table.cell colspan=""6"">`n                            @unless ($selectAll)`n                            <div>`n                                <span>You have selected <strong>{{ $? valueS2 ?->count() }}</strong> ? valueS2 ?`, do you want to select all <strong>{{ $? valueS2 ?->total() }}</strong>?</span>`n                                <x-button.link wire`:click=""selectAll"" class=""ml-1 text-blue-600"">Select All</x-button.link>`n                            </div>`n                            @else`n                            <span>You are currently selecting all <strong>{{ $? valueS2 ?->total() }}</strong> ? valueS2 ?.</span>`n                            @endif`n                        </x-table.cell>`n                    </x-table.row>`n                    @endif`n`n                    @forelse ($? valueS2 ? as $? valueS1 ?)`n                    <x-table.row wire`:loading.class.delay=""opacity-50"" wire`:key=""row-{{ $? valueS1 ?->" primary_key " }}"" class=""cursor-pointer"">`n                        <x-table.cell class=""pr-0"">`n                            <x-input.checkbox wire`:model=""selected"" value=""{{ $? valueS1 ?->" primary_key " }}"" />`n                        </x-table.cell>`n`n" table_rows "                    </x-table.row>`n                    @empty`n                    <x-table.row>`n                        <x-table.cell colspan=""11"">`n                            <div class=""flex justify-center items-center space-x-2"">`n                                <x-icon.inbox class=""h-8 w-8 text-cool-gray-400"" />`n                                <span class=""font-medium py-8 text-cool-gray-400 text-xl"">No ? valueAT2 ? found...</span>`n                            </div>`n                        </x-table.cell>`n                    </x-table.row>`n                    @endforelse`n                </x-slot>`n            </x-table>`n`n            {!! pagination( $? valueS2 ? ) !!}`n        </div>`n    </div>`n`n    <!-- Delete ? valueAT2 ? Modal -->`n    <form wire`:submit.prevent=""deleteSelected"">`n        <x-modal.confirmation wire`:model.defer=""showDeleteModal"">`n            <x-slot name=""title"">Delete ? valueAT1 ?</x-slot>`n`n            <x-slot name=""content"">`n                <div class=""py-8 text-cool-gray-700"">Are you sure you? This action is irreversible.</div>`n            </x-slot>`n`n            <x-slot name=""footer"">`n                <x-button.secondary wire`:click=""$set('showDeleteModal'`, false)"">Cancel</x-button.secondary>`n`n                <x-button.primary type=""submit"">Delete</x-button.primary>`n            </x-slot>`n        </x-modal.confirmation>`n    </form>`n`n    <!-- Save ? valueAT1 ? Modal -->`n    <form wire`:submit.prevent=""save"">`n        <x-modal.dialog wire`:model.defer=""showEditModal"" `:maxWidth=""'5xl'"">`n            <x-slot name=""title"">{{ $editing['" primary_key "'] ? 'Edit' `: 'Create' }} ? valueAT1 ?</x-slot>`n`n            <x-slot name=""content"">`n                <div class=""flex flex-wrap -mx-3 mb-6"">`n" form_fields "`n                </div>`n`n                <div class=""text-right"">`n                    <x-button.secondary wire`:click=""$set('showEditModal'`, false)"">Cancel</x-button.secondary>`n`n                    <x-button.primary type=""submit"">Save</x-button.primary>`n`n                </div>`n            </x-slot>`n        </x-modal.dialog>`n    </form>`n</div>`n")
	}
	
	FileCreateDir, C:\xampp\htdocs\gems-ws-api\resources\views\livewire\%directory%
	
	fileWrite( content, file )
}

ChildListView_specificFieldsArr(table_name_singular){
	global specificFieldsArr
	specificFieldsArr["communication"] := ["from_organisation_id", "case_item_type_id", "recieved_date", "title"]
	;~ specificFieldsArr["case_user"] := ["user_id"]
	specificFieldsArr["task"] := ["title", "assigned_user_id", "progress", "deadline"]
	return specificFieldsArr[table_name_singular]
}

ChildListView_ShowView_fieldsArr(table_name_singular){
	fieldsArr := {}
	fieldsArr["communication"] := ["from_organisation_id", "title", "content", "recieved_date"]
	return fieldsArr[ table_name_singular ]
}

childListView_TableFields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	return scaffoldTableFields( field_name, data_type, nullability, related_table_singular, related_table_plural, related_primary_key, column_number, table_name_singular, table_name_plural, primary_key, arrayLength, 1)
}

childListView_heading( table_name_singular ){
	arr := []
	arr["communication"] := "Communications / Attachments"
	arr["case_user"] := "People with Access"
	
	output := "? valueAT2 ?"
	if(arr[table_name_singular])
		output := arr[table_name_singular]
	return output
}

childListView(reverse = 0){
	global
	childListView_a( table_name_singular, table_name_plural, reverse )
}
	
childListView_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	tableFields := ChildListView_specificFieldsArr( table_name_singular )
	
	heading := childListView_heading( table_name_singular )
	
	table_headers := runSubScaffold( "scaffoldTableHeaders", 1, tableFields)
	table_rows := runSubScaffold( "childListView_TableFields", 1, tableFields)
	form_fields := runSubScaffold( "childListView_FormFields")

	directory := scaffoldModel("? valueSH1 ?")
	name := scaffoldModel("? valueSH2 ?")
	file =C:\xampp\htdocs\gems-ws-api\resources\views\livewire\%directory%\child-list-%name%.blade.php
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %heading%, " heading "
		StringReplace, content, content, %table_headers%, " table_headers "
		StringReplace, content, content, %table_rows%, " table_rows "
		StringReplace, content, content, %form_fields%, " form_fields "
	}else{
	
		content := scaffoldModel("<div class=""mt-10 w-full"">`n`n    <div class=""pb-0 bg-white p-5 rounded-t-lg"">`n        <!-- Top Bar -->`n        <div class=""flex justify-between"">`n            <h1 class=""text-lg font-semibold text-gray-900"">" heading "</h1>`n`n            <div class=""flex justify-end space-x-4"">`n                <div class=""w-2/4 flex space-x-4 pb-1"">`n                    <x-input.text wire`:model=""filters.search"" placeholder=""Search..."" />`n`n                    {{-- <x-button.link wire`:click=""toggleShowAdvanced"">@if ($showAdvanced) Hide @endif Advanced...</x-button.link> --}}`n                </div>`n`n                <div class=""space-x-2 flex items-center"">`n                    @if ($showAdvanced)`n                    <x-input.group borderless paddingless for=""perPage"" label=""Per Page"">`n                        <x-input.select wire`:model=""perPage"" id=""perPage"">`n                            <option value=""10"">10</option>`n                            <option value=""25"">25</option>`n                            <option value=""50"">50</option>`n                        </x-input.select>`n                    </x-input.group>`n`n                    <x-dropdown label=""Bulk Actions"">`n                        <x-dropdown.item type=""button"" wire`:click=""exportSelected"" class=""flex items-center space-x-2"">`n                            <x-icon.download class=""text-cool-gray-400""/> <span>Export</span>`n                        </x-dropdown.item>`n`n                        <x-dropdown.item type=""button"" wire`:click=""$toggle('showDeleteModal')"" class=""flex items-center space-x-2"">`n                            <x-icon.trash class=""text-cool-gray-400""/> <span>Delete</span>`n                        </x-dropdown.item>`n                    </x-dropdown>`n`n                    <livewire`:? valueSH1 ?.import-? valueSH2 ? />`n                    @endif`n`n                    <x-button.primary wire`:click=""create"" class=""px-2""><x-icon.plus/></x-button.primary>`n                </div>`n            </div>`n`n        </div>`n`n        <!-- Advanced Search -->`n        <div>`n            @if ($showAdvanced)`n            <div class=""bg-cool-gray-200 p-4 rounded shadow-inner flex relative"">`n                <?php /* <div class=""w-1/2 pr-2 space-y-4"">`n                    <x-input.group inline for=""filter-status"" label=""Status"">`n                        <x-input.select wire`:model=""filters.status"" id=""filter-status"">`n                            <option value="""" disabled>Select Status...</option>`n`n                            @foreach (App\Models\? valueCC1 ?`:`:STATUSES as $value => $label)`n                            <option value=""{{ $value }}"">{{ $label }}</option>`n                            @endforeach`n                        </x-input.select>`n                    </x-input.group>`n`n                    <x-input.group inline for=""filter-amount-min"" label=""Minimum Amount"">`n                        <x-input.money wire`:model.lazy=""filters.amount-min"" id=""filter-amount-min"" />`n                    </x-input.group>`n`n                    <x-input.group inline for=""filter-amount-max"" label=""Maximum Amount"">`n                        <x-input.money wire`:model.lazy=""filters.amount-max"" id=""filter-amount-max"" />`n                    </x-input.group>`n                </div> */ ?>`n`n                <div class=""w-1/2 pl-2 space-y-4"">`n                    <x-input.group inline for=""filter-created_at-min"" label=""Minimum Date"">`n                        <x-input.date wire`:model=""filters.created_at-min"" id=""filter-created_at-min"" placeholder=""MM/DD/YYYY"" />`n                    </x-input.group>`n`n                    <x-input.group inline for=""filter-created_at-max"" label=""Maximum Date"">`n                        <x-input.date wire`:model=""filters.created_at-max"" id=""filter-created_at-max"" placeholder=""MM/DD/YYYY"" />`n                    </x-input.group>`n`n                    <x-button.link wire`:click=""resetFilters"" class=""absolute right-0 bottom-0 p-4"">Reset Filters</x-button.link>`n                </div>`n            </div>`n            @endif`n        </div>`n    </div>`n`n    <!-- ? valueAT2 ? Table -->`n    <div class=""flex-col space-y-4 backdrop-blur-lg`n            [ bg-white ]`n            [ border-[1px] border-solid border-white border-opacity-30 ]`n            [ shadow-md ] rounded-b-lg"" x-data=""{ @for ($i=0`; $i<count($? valueS2 ?)+1`; $i++) open{{ $i }}`: false`, @endfor }"">`n        <x-table>`n            <x-slot name=""head"">`n                <x-table.heading class=""pr-0 w-8"">`n                    <x-input.checkbox wire`:model=""selectPage"" />`n                </x-table.heading>`n" table_headers "                    <x-table.heading />`n            </x-slot>`n`n            <x-slot name=""body"">`n                @if ($selectPage)`n                <x-table.row class=""bg-cool-gray-200"" wire`:key=""row-message"">`n                    <x-table.cell colspan=""6"">`n                        @unless ($selectAll)`n                        <div>`n                            <span>You have selected <strong>{{ $? valueS2 ?->count() }}</strong> ? valueS2 ?`, do you want to select all <strong>{{ $? valueS2 ?->total() }}</strong>?</span>`n                            <x-button.link wire`:click=""selectAll"" class=""ml-1 text-blue-600"">Select All</x-button.link>`n                        </div>`n                        @else`n                        <span>You are currently selecting all <strong>{{ $? valueS2 ?->total() }}</strong> ? valueS2 ?.</span>`n                        @endif`n                    </x-table.cell>`n                </x-table.row>`n                @endif`n`n                @forelse ($? valueS2 ? as $? valueS1 ?)`n                    <x-table.row class=""bg-white"" wire`:loading.class.delay=""opacity-50"" wire`:key=""row-{{ $? valueS1 ?->id }}"" x-on`:click=""open{{ $loop->index }} = !open{{ $loop->index }}"" class=""cursor-pointer"">`n                        <x-table.cell class=""pr-0"">`n                            <x-input.checkbox wire`:model=""selected"" value=""{{ $? valueS1 ?->id }}"" />`n                        </x-table.cell>`n`n" table_rows "                    </x-table.row>`n                    <tr x-show=""open{{ $loop->index }}"">`n                        <td class="""" colspan=""8"">`n                            <div x-transition`:enter=""transition ease-out duration-100""`n                            x-transition`:enter-start=""transform opacity-0 scale-95"" x-transition`:enter-end=""transform opacity-100 scale-100""`n                            x-transition`:leave=""transition ease-in duration-75"" x-transition`:leave-start=""transform opacity-100 scale-100""`n                            x-transition`:leave-end=""transform opacity-0 scale-95"">`n`n                                <div class=""bg-white inline-block min-w-full overflow-hidden px-13 pt-10 rounded-lg shadow"">`n                                    <div class=""flex flex-wrap -mx-3 mb-10 float-right"">`n                                        <a href=""{{ route('? valueSH2 ?.show'`, $? valueS1 ?['id']) }}"">`n                                            <x-button.link class=""bg-transparent text-secondary m-5 mb-0"">`n                                                <div class=""flex space-x-2 items-center"">`n                                                    <x-icon.eye/>`n                                                    <span></span>`n                                                </div>`n                                            </x-button.link>`n                                        </a>`n                                        <x-button.link class=""bg-transparent text-secondary m-5 mb-0"" wire`:click=""edit({{ $? valueS1 ?['id'] }})"" >`n                                            <div class=""flex space-x-2 items-center"">`n                                                <x-icon.pencil/>`n                                                <span></span>`n                                            </div>`n                                        </x-button.link>`n                                    </div>`n                                    <div class=""flex flex-wrap -mx-3 mb-6 "">`n                                        <div class=""md`:w-full px-3 mb-6"">`n                                            <span class=""font-bold"">{{ $? valueS1 ?->title }}</span>`n                                        </div>`n`n                                        <div class=""md`:w-full px-3 mb-6 inline-flex space-x-2 text-sm leading-5"">`n                                            {{ $? valueS1 ?->content }}`n                                        </div>`n                                    </div>`n                                </div>`n                            </div>`n                        </td>`n                    </tr>`n                @empty`n                    <x-table.row>`n                        <x-table.cell colspan=""11"">`n                            <div class=""flex justify-center items-center space-x-2"">`n                                <x-icon.inbox class=""h-8 w-8 text-cool-gray-400"" />`n                                <span class=""font-medium py-8 text-cool-gray-400 text-xl"">No ? valueAT2 ? found...</span>`n                            </div>`n                        </x-table.cell>`n                    </x-table.row>`n                @endforelse`n            </x-slot>`n        </x-table>`n`n        {!! pagination( $? valueS2 ? ) !!}`n    </div>`n`n    <!-- Delete ? valueAT2 ? Modal -->`n    <form wire`:submit.prevent=""deleteSelected"">`n        <x-modal.confirmation wire`:model.defer=""showDeleteModal"">`n            <x-slot name=""title"">Delete ? valueAT1 ?</x-slot>`n`n            <x-slot name=""content"">`n                <div class=""py-8 text-cool-gray-700"">Are you sure you? This action is irreversible.</div>`n            </x-slot>`n`n            <x-slot name=""footer"">`n                <x-button.secondary wire`:click=""$set('showDeleteModal'`, false)"">Cancel</x-button.secondary>`n`n                <x-button.primary type=""submit"">Delete</x-button.primary>`n            </x-slot>`n        </x-modal.confirmation>`n    </form>`n`n    <!-- Save ? valueAT1 ? Modal -->`n    <form wire`:submit.prevent=""save"">`n        <x-modal.dialog wire`:model.defer=""showEditModal"" `:maxWidth=""'5xl'"">`n            <x-slot name=""title"">{{ $editing['id'] ? 'Edit' `: 'Create' }} ? valueAT1 ?</x-slot>`n`n            <x-slot name=""content"">`n                <div class=""flex flex-wrap -mx-3 mb-6"">`n" form_fields "                </div>`n            </x-slot>`n`n            <x-slot name=""footer"">`n                <x-button.secondary wire`:click=""$set('showEditModal'`, false)"">Cancel</x-button.secondary>`n`n                <x-button.primary type=""submit"">Save</x-button.primary>`n            </x-slot>`n        </x-modal.dialog>`n    </form>`n`n</div>`n")
	}
	
	FileCreateDir, C:\xampp\htdocs\gems-ws-api\resources\views\livewire\%directory%
	
	
	fileWrite( content, file )
}

childListCompactView(reverse = 0){
	global
	childListCompactView_a( table_name_singular, table_name_plural, reverse )
}
	
childListCompactView_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	tableFields := ChildListView_specificFieldsArr( table_name_singular )
	
	heading := childListView_heading( table_name_singular )
	
	table_headers := runSubScaffold( "scaffoldTableHeaders", 1, tableFields)
	table_rows := runSubScaffold( "childListView_TableFields", 1, tableFields)
	form_fields := runSubScaffold( "childListView_FormFields")

	directory := scaffoldModel("? valueSH1 ?")
	name := scaffoldModel("? valueSH2 ?")
	file =C:\xampp\htdocs\gems-ws-api\resources\views\livewire\%directory%\child-list-%name%.blade.php
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %heading%, " heading "
		StringReplace, content, content, %table_headers%, " table_headers "
		StringReplace, content, content, %table_rows%, " table_rows "
		StringReplace, content, content, %form_fields%, " form_fields "
	}else{
	
		content := scaffoldModel("<div class=""w-full py-2"">`n`n    <div class=""pb-0 bg-white rounded-t-lg"">`n        <!-- Top Bar -->`n        <div class=""flex justify-between"">`n            <h1 class=""text-gray-900 text-sm "">Tags</h1>`n`n            <div class=""flex justify-end space-x-4"">`n                {{-- <div class=""w-2/4 flex space-x-4 pb-1"">`n                    <x-input.text wire`:model=""filters.search"" placeholder=""Search..."" />`n`n                    <x-button.link wire`:click=""toggleShowAdvanced"">@if ($showAdvanced) Hide @endif Advanced...</x-button.link>`n                </div>`n`n                <div class=""space-x-2 flex items-center"">`n                    @if ($showAdvanced)`n                    <x-input.group borderless paddingless for=""perPage"" label=""Per Page"">`n                        <x-input.select wire`:model=""perPage"" id=""perPage"">`n                            <option value=""10"">10</option>`n                            <option value=""25"">25</option>`n                            <option value=""50"">50</option>`n                        </x-input.select>`n                    </x-input.group>`n`n                    <x-dropdown label=""Bulk Actions"">`n                        <x-dropdown.item type=""button"" wire`:click=""exportSelected"" class=""flex items-center space-x-2"">`n                            <x-icon.download class=""text-cool-gray-400""/> <span>Export</span>`n                        </x-dropdown.item>`n`n                        <x-dropdown.item type=""button"" wire`:click=""$toggle('showDeleteModal')"" class=""flex items-center space-x-2"">`n                            <x-icon.trash class=""text-cool-gray-400""/> <span>Delete</span>`n                        </x-dropdown.item>`n                    </x-dropdown>`n`n                    <livewire`:? valueSH1 ?.import-? valueSH2 ? />`n                    @endif`n`n                    <x-button.primary wire`:click=""create"" class=""px-2""><x-icon.plus/></x-button.primary>`n                </div> --}}`n            </div>`n`n        </div>`n`n    </div>`n`n    <!-- ? valueAT2 ? Table -->`n    <div class="""">`n        <span href=""#"" class=""inline-flex space-x-2 truncate text-sm leading-5"">`n            <div class=""flex items-center space-x-1 ng-star-inserted"">`n                @forelse ($? valueS2 ? as $? valueS1 ?)`n                    @php`n                        $color = $? valueS1 ?->tag ? colorForName($? valueS1 ?->tag->getName()) `: 'gray'`;`n                    @endphp`n                    <div wire`:click=""edit({{ $? valueS1 ?['id'] }})"" class=""flex flex-0 items-center justify-center h-8 rounded-md ring-offset-1 ring-bg-card ring-offset-transparent bg-{{ $color }}-100 text-{{ $color }}-800 ng-star-inserted cursor-pointer px-2"">`n                        <div class=""text-md font-semibold"" title=""{{ $? valueS1 ?->tag ? $? valueS1 ?->tag->getName() `: '' }}"">`n                            {{ $? valueS1 ?->tag->getName() }}`n                        </div>`n                    </div>`n                @empty`n                @endforelse`n                <div wire`:click=""create"" class=""flex flex-0 items-center justify-center w-8 h-8 rounded-md ring-offset-1 ring-bg-card ring-offset-transparent ng-star-inserted bg-blue-100 text-blue-800 cursor-pointer"">`n                    <div class=""text-md font-semibold"">`n                        +`n                    </div>`n                </div>`n                <div class=""hidden bg-red-100 text-red-800 bg-orange-100 text-orange-800 bg-amber-100 text-amber-800 bg-yellow-100 text-yellow-800 bg-lime-100 text-lime-800 bg-green-100 text-green-800 bg-emerald-100 text-emerald-800 bg-teal-100 text-teal-800 bg-cyan-100 text-cyan-800 bg-sky-100 text-sky-800 bg-blue-100 text-blue-800 bg-indigo-100 text-indigo-800 bg-violet-100 text-violet-800 bg-purple-100 text-purple-800 bg-fuchsia-100 text-fuchsia-800 bg-pink-100 text-pink-800 bg-rose-100 text-rose-800`n                bg-red-200 text-red-500 bg-orange-200 text-orange-500 bg-amber-200 text-amber-500 bg-yellow-200 text-yellow-500 bg-lime-200 text-lime-500 bg-green-200 text-green-500 bg-emerald-200 text-emerald-500 bg-teal-200 text-teal-500 bg-cyan-200 text-cyan-500 bg-sky-200 text-sky-500 bg-blue-200 text-blue-500 bg-indigo-200 text-indigo-500 bg-violet-200 text-violet-500 bg-purple-200 text-purple-500 bg-fuchsia-200 text-fuchsia-500 bg-pink-200 text-pink-500 bg-rose-200 text-rose-500""></div>`n            </div>`n        </span>`n    </div>`n</div>`n`n@push('styles')`n<link rel=""stylesheet"" href=""https`://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css"">`n@endpush`n`n@push('scripts')`n<script src=""https`://cdn.jsdelivr.net/npm/sweetalert2@10""></script>`n<script src=""https`://cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js""></script>`n<script type=""text/javascript"">`n    document.addEventListener('DOMContentLoaded'`, function () {`n`n        @this.on('triggerDelete'`, ? valueS1 ?Id => {`n            Swal.fire({`n                title`: 'Are You Sure?'`,`n                text`: 'Tag will be detached!'`,`n                type`: ""warning""`,`n                showCancelButton`: true`,`n                confirmButtonColor`: '#d33'`,`n                cancelButtonColor`: '#3085d6'`,`n                confirmButtonText`: 'Detach!'`n            }).then((result) => {`n                if (result.value) {`n                    @this.call('delete'`,? valueS1 ?Id)`n                } else {`n                    console.log(""Canceled"")`;`n                }`n            })`;`n        })`;`n    })`n</script>`n@endpush`n")
	}
	
	FileCreateDir, C:\xampp\htdocs\gems-ws-api\resources\views\livewire\%directory%
	
	
	fileWrite( content, file )
}

childListModalView(reverse = 0){
	global
	childListModalView_a( table_name_singular, table_name_plural, reverse )
}
	
childListModalView_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	tableFields := ChildListView_specificFieldsArr( table_name_singular )
	
	heading := childListView_heading( table_name_singular )
	
	table_headers := runSubScaffold( "scaffoldTableHeaders", 1, tableFields)
	table_rows := runSubScaffold( "childListView_TableFields", 1, tableFields)
	form_fields := runSubScaffold( "childListView_FormFields")

	directory := scaffoldModel("? valueSH1 ?")
	name := scaffoldModel("? valueSH2 ?")
	file =C:\xampp\htdocs\gems-ws-api\resources\views\livewire\%directory%\child-list-modal-%name%.blade.php
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %heading%, " heading "
		StringReplace, content, content, %table_headers%, " table_headers "
		StringReplace, content, content, %table_rows%, " table_rows "
		StringReplace, content, content, %form_fields%, " form_fields "
	}else{
	
		content := scaffoldModel("<div class=""w-full py-2"">`n    <!-- Delete ? valueAT2 ? Modal -->`n    <form wire`:submit.prevent=""deleteSelected"">`n        <x-modal.confirmation wire`:model.defer=""showDeleteModal"">`n            <x-slot name=""title"">{{ __('Delete ? valueAT1 ?') }}</x-slot>`n`n            <x-slot name=""content"">`n                <div class=""py-8 text-cool-gray-700"">{{ __('Are you sure you? This action is irreversible') }}.</div>`n            </x-slot>`n`n            <x-slot name=""footer"">`n                <x-button.secondary wire`:click=""$set('showDeleteModal'`, false)"">{{ __('Cancel') }}</x-button.secondary>`n`n                <x-button.primary type=""submit"">{{ __('Delete') }}</x-button.primary>`n            </x-slot>`n        </x-modal.confirmation>`n    </form>`n`n    <!-- Save ? valueAT1 ? Modal -->`n    <form wire`:submit.prevent=""save"">`n        <x-modal.dialog wire`:model.defer=""showEditModal"" `:maxWidth=""'5xl'"">`n            <x-slot name=""title"">{{ $editing['id'] ? __('Edit ? valueAT1 ?') `: '' }} </x-slot>`n`n            <x-slot name=""content"">`n                @if ($editing['id'])`n                    <div x-data=""{ @for ($i=0`; $i<count($? valueS2 ?)+1`; $i++) open{{ $i }}`: false`, @endfor }"">`n                        <x-table>`n                            <x-slot name=""head"">`n                                <x-table.heading sortable multi-column wire`:click=""sortBy('tag_id')"" `:direction=""$sorts['tag_id'] ?? null"" class="""">{{ __('Tag') }}</x-table.heading>`n                                <x-table.heading />`n                            </x-slot>`n`n                            <x-slot name=""body"">`n                                @forelse ($? valueS2 ? as $? valueS1 ?)`n                                    <x-table.row class="""" wire`:loading.class.delay=""opacity-50"" wire`:key=""row-{{ $? valueS1 ?->id }}"" x-on`:click=""open{{ $loop->index }} = !open{{ $loop->index }}"">`n                                        <x-table.cell>`n                                            <span href=""#"" class=""inline-flex space-x-2 truncate text-sm leading-5"">`n                                                {{ $? valueS1 ?->tag ? $? valueS1 ?->tag->getName() `: '' }}`n                                            </span>`n                                        </x-table.cell>`n`n                                        <x-table.cell>`n                                            <x-button.link class=""text-secondary m-2"" wire`:click=""$emit('triggerDelete'`,{{ $? valueS1 ?['id'] }})"" >`n                                                <div class=""flex space-x-2 items-center"">`n                                                    <x-icon.trash/>`n                                                    <span></span>`n                                                </div>`n                                            </x-button.link>`n                                        </x-table.cell>`n                                    </x-table.row>`n                                @empty`n                                    <x-table.row>`n                                        <x-table.cell colspan=""11"">`n                                            <div class=""flex justify-center items-center space-x-2"">`n                                                <x-icon.inbox class=""h-8 w-8 text-cool-gray-400"" />`n                                                <span class=""font-medium py-8 text-cool-gray-400 text-xl"">{{ __('No Tags found') }}...</span>`n                                            </div>`n                                        </x-table.cell>`n                                    </x-table.row>`n                                @endforelse`n                            </x-slot>`n                        </x-table>`n`n                        {!! pagination( $? valueS2 ? ) !!}`n                    </div>`n                @else`n`t`t`t`t`t<div class=""flex flex-wrap -mx-3 mb-6"">`n                        <div class=""0w-full md`:w-1/2 px-3 mb-6 md`:mb-0"">`n                            <div class=""rtl`:iyyu-normal text-lg font-bold"">`n                                {{ __('Attach ? valueAT1 ?') }}`n                            </div>`n                        </div>`n`n" form_fields "`n                        <div class=""0w-full md`:w-1/2 px-3 mb-6 md`:mb-0 pt-10"">`n                            <x-button.primary type=""submit"">{{ __('Save') }}</x-button.primary>`n                        </div>`n`n                    </div>`n                @endif`n            </x-slot>`n`n            <x-slot name=""footer"">`n                <x-button.secondary wire`:click=""$set('showEditModal'`, false)"">{{ __('Cancel') }}</x-button.secondary>`n            </x-slot>`n        </x-modal.dialog>`n    </form>`n`n</div>`n`n@push('styles')`n<link rel=""stylesheet"" href=""https`://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css"">`n@endpush`n`n@push('scripts')`n<script src=""https`://cdn.jsdelivr.net/npm/sweetalert2@10""></script>`n<script src=""https`://cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js""></script>`n<script type=""text/javascript"">`n    document.addEventListener('DOMContentLoaded'`, function () {`n`n        @this.on('triggerDelete'`, ? valueS1 ?Id => {`n            Swal.fire({`n                title`: '{{ __(""Are You Sure?"") }}'`,`n                text`: '{{ __(""Tag will be detached"") }}!'`,`n                type`: ""warning""`,`n                showCancelButton`: true`,`n                confirmButtonColor`: '#d33'`,`n                cancelButtonColor`: '#3085d6'`,`n                cancelButtonText`: '{{ __(""Cancel"") }}!'`,`n                confirmButtonText`: '{{ __(""Detach"") }}!'`n            }).then((result) => {`n                if (result.value) {`n                    @this.call('delete'`,? valueS1 ?Id)`n                } else {`n                    console.log(""Canceled"")`;`n                }`n            })`;`n        })`;`n    })`n</script>`n@endpush`n")
	}
	
	FileCreateDir, C:\xampp\htdocs\gems-ws-api\resources\views\livewire\%directory%
	
	
	fileWrite( content, file )
}

ManageView_fields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	arr := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	if( HasVal(arr, field_name) )
		return ""
	
	name := scaffoldModel("? valueS1 ?")
	
	; check if "an" or "a" should be used
	aOrAn := "a"
	vowels := ["a", "e", "i", "o", "u"]
	firstCharacter := SubStr(field_name, 1, 1)
	if( HasVal(vowels, firstCharacter) )
		aOrAn := "an"
	
	if(related_table_singular != ""){
		t := "`                    <div class=""w-full md`:w-1/2 px-3 mb-6 md`:mb-0"">`n                        <x-input.group for=""? valueS1 ?"" label=""? valueAT91 ?"" `:error=""$errors->first('editing.? valueS1 ?')"">`n                            <livewire`:? valueSH4 ?.select-? valueSH4 ?`n                              name=""? valueS4 ?""`n                              placeholder=""Choose " aOrAn " ? valueL4 ?""`n                              `:searchable=""true""`n                            />`n                        </x-input.group>`n                    </div>`n`n"
		without_id := StrReplace(field1, "_id", "")
		t := replaceMarker(without_id, t, 91)
	}else if(data_type = "datetime" or data_type = "timestamp" or data_type = "date" )
		t := "`                    <div class=""w-full md`:w-1/2 px-3 mb-6 md`:mb-0"">`n                        <x-input.group for=""? valueS1 ?_for_editing"" label=""? valueAT1 ?"" `:error=""$errors->first('editing.? valueS1 ?_for_editing')"">`n                            <x-input.date wire`:model=""editing.? valueS1 ?_for_editing"" id=""? valueS1 ?_for_editing"" />`n                        </x-input.group>`n                    </div>`n`n"
	else if(data_type = "int")
		t := "`                <x-input.group for=""? valueS1 ?"" label=""? valueAT1 ?"" `:error=""$errors->first('editing.? valueS1 ?')"">`n                    <x-input.money wire`:model=""editing.? valueS1 ?"" id=""? valueS1 ?"" />`n                </x-input.group>`n`n"
	else
		t := "`                    <div class=""w-full md`:w-1/2 px-3 mb-6 md`:mb-0"">`n                        <x-input.group for=""? valueS1 ?"" label=""? valueAT1 ?"" `:error=""$errors->first('editing.? valueS1 ?')"">`n                            <x-input.text wire`:model=""editing.? valueS1 ?"" id=""? valueS1 ?"" placeholder=""? valueAT1 ?"" />`n                        </x-input.group>`n                    </div>`n`n"

	return t
}

fileWrite( content, file){
	FileDelete, %file%
	FileAppend, %content%, %file%
}

manageView(){
	global
	manageView_a( table_name_singular, table_name_plural, reverse )
}
	
manageView_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	fieldsArr := ShowView_fieldsArr( table_name_singular )
	
	form_fields := runSubScaffold( "scaffoldFormFields", 0, fieldsArr )

	name := scaffoldModel("? valueSH1 ?\manage-? valueSH1 ?")
	file =C:\xampp\htdocs\gems-ws-api\resources\views\livewire\%name%.blade.php
	
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %form_fields%, " form_fields "
	}else
		content := scaffoldModel("<x-slot name=""header"">`n    <h2 class=""font-semibold text-xl text-gray-800 leading-tight"">`n        {{ __('? valueAT2 ?') }}`n    </h2>`n</x-slot>`n<div class=""max-w-7xl mx-auto px-4 sm`:px-6 lg`:px-8 pt-20 pb-10 "">`n    {{-- Breadcrumbs --}}`n    <div class="""">`n        <div class=""text-sm mb-2"">`n            <a class=""text-blue-600"" href=""{{ route('home') }}"">`n                Home`n            </a>`n            >`n            <a class=""text-blue-600"" href=""{{ route('? valueSH2 ?') }}"">`n                ? valueAT2 ?`n            </a>`n            >`n            <a class=""text-blue-600"" href=""{{ $editing['id'] ? route('? valueSH2 ?.show'`, $editing['id']) `: '#' }}"">`n                {{ $editing->id }}`n            </a>`n        </div>`n    </div>`n`n    @if (session()->has('message'))`n        <div id=""alert"" class=""text-white px-6 py-4 border-0 rounded relative mb-4 bg-green-500"">`n            <span class=""inline-block align-middle mr-8"">`n                {{ session('message') }}`n            </span>`n            <button class=""absolute bg-transparent text-2xl font-semibold leading-none right-0 top-0 mt-4 mr-6 outline-none focus`:outline-none"" onclick=""document.getElementById('alert').remove()`;"">`n                <span>?</span>`n            </button>`n        </div>`n    @endif`n`n`n    <div class=""w-full align-center"">`n        <div class=""float-left"">`n            <h1 class=""font-semibold leading-tight text-2xl mt-4 mb-2 mx-6 text-gray-900"">`n                <a href=""{{ route('? valueSH2 ?') }}"">`n                    ? valueAT1 ?`n                </a>`n                / {{ $editing['id'] ? 'Edit' `: 'Create' }}`:`n                <a href=""{{ $editing['id'] ? route('? valueSH2 ?.show'`, $editing['id']) `: route('? valueSH2 ?') }}"">`n                    {{ $editing->getName() }}`n                </a>`n            </h1>`n        </div>`n        <div class=""float-left"">`n        </div>`n    </div>`n`n    <div class=""`n    [ bg-white ]`n    [ border-[1px] border-solid border-white border-opacity-30 ]`n    [ shadow-lg ] shadow rounded-lg "">`n        <div class=""inline-block min-w-full overflow-hidden"">`n            <form>`n                <div class=""px-4 pt-5 pb-4 sm`:p-6 sm`:pb-4"">`n                    <div class=""flex flex-wrap -mx-3 mb-6"">`n" form_fields "                    </div>`n                </div>`n                <div class=""px-4 py-3 sm`:px-6 sm`:flex sm`:flex-row-reverse"">`n                <span class=""flex w-full sm`:ml-3 sm`:w-auto"">`n                    <button wire`:click.prevent=""save()"" type=""button"" class=""inline-flex bg-blue-500 hover`:bg-blue-700 text-white font-bold py-2 px-4 rounded"">Save</button>`n                </span>`n                </div>`n            </form>`n        </div>`n    </div>`n</div>`n`n@push('styles')`n<link rel=""stylesheet"" href=""https`://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css"">`n@endpush`n`n@push('scripts')`n<script src=""https`://cdn.jsdelivr.net/npm/sweetalert2@10""></script>`n<script src=""https`://cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js""></script>`n<script type=""text/javascript"">`n    document.addEventListener('DOMContentLoaded'`, function () {`n`n    })`n</script>`n@endpush`n")
	
	fileWrite( content, file )
}

ShowView_Fields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	arr := ["deleted_at"]

	if( HasVal(arr, field1) )
		return ""
	
	name := scaffoldModel("? valueS1 ?")
	plural := scaffoldModel("? valueSH2 ?")
	
	if(related_table_singular != "") ; if relation is there
	{
		t := "`                <div class=""md`:w-1/3 px-3 mb-6 text-ellipsis"">`n                    <label class=""block text-gray-700 text-xs"">`n                        ? valueAT91 ?`:`n                    </label>`n                    <label class=""block text-gray-700 text-sm mb-2 text-sm leading-5 font-medium"">`n                        <a href=""{{ $" name "['? valueS1 ?'] ? route('? valueSH5 ?.show'`, $" name "['? valueS1 ?']) `: '' }}"">`n                            <span class=""{{ isset($" name "->? valueC91 ?->color) ? ""bg-"".$" name "->? valueC91 ?->color.""-100 text-"".$" name "->? valueC91 ?->color.""-800 px-2.5"" `: """" }} text-xs font-medium inline-flex items-center py-0.5 rounded mr-2 dark`:bg-gray-700 dark`:text-gray-300"">`n                                @if(isset($" name "->? valueC91 ?->icon) && $" name "->? valueC91 ?->icon)`n                                    <x-dynamic-component `:component=""'icon.'.$" name "->? valueC91 ?->icon""  class='mr-1 w-3 h-3 text-slate-600' strokeWidth='1' />`n                                @endif`n                                {{ $" name "->? valueC91 ? ? $" name "->? valueC91 ?->getName() `: """" }}`n                            </span>`n                        </a>`n                    </label>`n                </div>`n`n"
		without_id := StrReplace(field_name, "_id", "")
		t := replaceMarker(without_id, t, 91)
	}else if(data_type = "datetime" or data_type = "timestamp" or data_type = "date" )
		t := "`                <div class=""md`:w-1/3 px-3 mb-6 text-ellipsis"">`n                    <label class=""block text-gray-700 text-xs"">`n                        ? valueAT1 ?`:`n                    </label>`n                    <label class=""block text-gray-700 text-sm mb-2 text-sm leading-5 font-medium"">`n                        {{ getDateForHumans($" name "->? valueS1 ?) }}`n                    </label>`n                </div>`n`n"
	else if(data_type = "longtext")
		t := "`                <div class=""md`:w-1/3 px-3 mb-6 text-ellipsis"">`n                    <label class=""block text-gray-700 text-xs"">`n                        ? valueAT1 ?`:`n                    </label>`n                    <label x-data=""{ isCollapsed`: true }"" class=""block text-gray-700 text-sm mb-2 text-sm leading-5 font-medium"">`n                        <span class=""inline-flex space-x-2"" `:class=""{'line-clamp-none'`: !isCollapsed`, 'line-clamp-3'`: isCollapsed}"">`n                            {{ $" name "->? valueS1 ? }}`n                        </span>`n                        <button`n                                @click=""isCollapsed = !isCollapsed""`n                                x-text=""isCollapsed ? 'Show more' `: 'Show less'""></button>`n                    </label>`n                </div>`n`n"
	else 
		t := "`                <div class=""md`:w-1/3 px-3 mb-6 text-ellipsis"">`n                    <label class=""block text-gray-700 text-xs"">`n                        ? valueAT1 ?`:`n                    </label>`n                    <label x-data=""{ isCollapsed`: true }"" class=""block text-gray-700 text-sm mb-2 text-sm leading-5 font-medium"">`n                        {{ $" name "->? valueS1 ? }}`n                    </label>`n                </div>`n`n"

	return t
}

ShowView_subList( table_name_singular = 1, table_name_plural = 2 ){
	arr := {"case": "`                <livewire`:case-item.child-list-case-items`n                `:depends-on=""$case->id""`n                />`n`n                <livewire`:task.child-list-tasks`n                `:depends-on=""$case->id""`n                />`n`n        </div>`n    </div>`n    <div class=""md`:w-1/3 px-3 mb-6 inline-flex space-x-2 text-sm leading-5"">`n        <livewire`:case-user.child-list-case-users`n        `:depends-on=""$case->id""`n        />`n`n    </div>`n"}
	return "{{-- sub list here --}}`n" arr[table_name_singular]
}

ShowView_before( table_name_singular = 1, table_name_plural = 2 ){
	arr := {"case": "<div class=""flex flex-wrap -mx-3 mb-6 "">`n    <div class=""md`:w-2/3 px-3 mb-6"">`n        <div class=""mx-auto px-4 sm`:px-6 lg`:px-8"">`n"}
	
	if( arr[table_name_singular] )
		return arr[table_name_singular]
	
	return "<div class=""pt-20 max-w-7xl mx-auto px-4 sm`:px-6 lg`:px-8"">`n"
}

ShowView_fieldsArr(table_name_singular){
	return table_fields( table_name_singular )
}

ShowView_fieldsMoreArr(table_name_singular){
	arr := []
	arr["case"] := ["organisation_id", "team_id", "from_individual_id", "created_by", "updated_by", "created_at", "updated_at"]
	
	return arr[table_name_singular]
}

showView(){
	global
	showView_a( table_name_singular, table_name_plural, reverse, primary_key, fields )
}
	
showView_a(table_name_singular = 1, table_name_plural = 2, reverse = 0, primary_key = "id", fields=""){
	fieldsArr := ShowView_fieldsArr( table_name_singular )
	
	before := ShowView_before( table_name_singular, table_name_plural )
	form_fields := runSubScaffold( "ShowView_Fields", 1, fieldsArr )
	
	;~ fieldsArr.Push("scaffold_blacklist")
	fieldsMoreArr := ShowView_fieldsMoreArr( table_name_singular )
	form_fields_more := fieldsMoreArr = "" ? "" : runSubScaffold( "ShowView_Fields", 1, fieldsMoreArr )
	sub_list := ShowView_subList( table_name_singular, table_name_plural )

	name := scaffoldModel("? valueSH1 ?\show-? valueSH1 ?")
	file =C:\xampp\htdocs\gems-ws-api\resources\views\livewire\%name%.blade.php
	
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %before%, " before "
		StringReplace, content, content, %form_fields%, " form_fields "
		StringReplace, content, content, %sub_list%, " sub_list "
	}else
		content := scaffoldModel("" before "    {{-- Breadcrumbs --}}`n    <div class="""">`n        <div class=""text-sm mb-2"">`n            <a class=""text-blue-600"" href=""{{ route('home') }}"">`n                Home`n            </a>`n            >`n            <a class=""text-blue-600"" href=""{{ route('? valueSH2 ?') }}"">`n                ? valueAT2 ?`n            </a>`n            >`n            {{ $? valueS1 ?->id }}`n        </div>`n    </div>`n`n    @if (session()->has('message'))`n        <div id=""alert"" class=""text-white px-6 py-4 border-0 rounded relative mb-4 bg-green-500"">`n            <span class=""inline-block align-middle mr-8"">`n                {{ session('message') }}`n            </span>`n            <button class=""absolute bg-transparent text-2xl font-semibold leading-none right-0 top-0 mt-4 mr-6 outline-none focus`:outline-none"" onclick=""document.getElementById('alert').remove()`;"">`n                <span>x</span>`n            </button>`n        </div>`n    @endif`n`n    <div class=""w-full align-center"">`n        <div class=""float-left"">`n            <h1 class=""font-semibold leading-tight text-2xl mt-4 mb-2 px-5 text-gray-900"">`n                <a href=""{{ route('? valueSH2 ?') }}"">`n                    ? valueAT1 ?`:`n                </a>`n                {{ $? valueS1 ?->getName() }}</h1>`n        </div>`n        <div class=""float-right"">`n            <a href=""{{ route('? valueSH2 ?.edit'`, $? valueS1 ?['" primary_key "']) }}"">`n                <x-button.link class=""text-secondary m-5 mb-0"" >`n                    <div class=""flex space-x-2 items-center"">`n                        <x-icon.pencil/>`n                        <span></span>`n                    </div>`n                </x-button.link>`n            </a>`n            <x-button.link class=""text-secondary m-5 mb-0"" wire`:click=""$emit('triggerDelete'`,{{ $? valueS1 ?['id'] }})"" >`n                <div class=""flex space-x-2 items-center"">`n                    <x-icon.trash/>`n                    <span></span>`n                </div>`n            </x-button.link>`n        </div>`n    </div>`n`n    <div class=""`n    [ bg-white ]`n    [ border-[1px] border-solid border-white border-opacity-30 ]`n    [ shadow-lg ] shadow rounded-lg "">`n        <div x-data=""{ open`: false }"" class=""inline-block min-w-full overflow-hidden px-5"">`n            <div class=""flex flex-wrap -mx-3 mb-10"">`n            </div>`n            <div class=""flex flex-wrap -mx-3"">`n" form_fields "            </div>`n            <div x-show=""open"" class=""flex flex-wrap -mx-3"">`n" form_fields_more "            </div>`n            <div class=""flex justify-center ..."">`n                <x-button.link x-on`:click=""open = !open"" class=""bg-white text-secondary mb-0 place-items-center"">`n                    <div class=""flex space-x-2 items-center"">`n                        <svg xmlns=""http`://www.w3.org/2000/svg"" `:class=""{'rotate-180'`: open`, 'rotate-0'`: !open}"" class=""inline w-6 h-6 mt-1 ml-1 transition-transform duration-200 transform md`:-mt-1 inline-block w-5 h-5 rotate-180"" fill=""none"" viewBox=""0 0 24 24"" stroke=""currentColor"" stroke-width=""1.5"">`n                            <path stroke-linecap=""round"" stroke-linejoin=""round"" d=""M19 9l-7 7-7-7""></path>`n                          </svg>`n                        <span></span>`n                    </div>`n                </x-button.link>`n            </div>`n        </div>`n    </div>`n`n" sub_list "`n</div>`n`n@push('styles')`n<link rel=""stylesheet"" href=""https`://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css"">`n@endpush`n`n@push('scripts')`n<script src=""https`://cdn.jsdelivr.net/npm/sweetalert2@10""></script>`n<script src=""https`://cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js""></script>`n<script type=""text/javascript"">`n    document.addEventListener('DOMContentLoaded'`, function () {`n`n        @this.on('triggerDelete'`, ? valueS1 ?Id => {`n            Swal.fire({`n                title`: 'Are You Sure?'`,`n                text`: '? valueAT1 ? record will be deleted!'`,`n                type`: ""warning""`,`n                showCancelButton`: true`,`n                confirmButtonColor`: '#d33'`,`n                cancelButtonColor`: '#3085d6'`,`n                confirmButtonText`: 'Delete!'`n            }).then((result) => {`n                if (result.value) {`n                    @this.call('delete'`,? valueS1 ?Id)`n                } else {`n                    console.log(""Canceled"")`;`n                }`n            })`;`n        })`;`n    })`n</script>`n@endpush`n")
		
	fileWrite( content, file )
}

ImportView_form_fields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, model_name = 10, related_model_name = 11, function_name_singular = 12, function_name_plural = 13, primary_key = 14, arrayLength = 15 ){
	name := scaffoldModel("? valueS1 ?")
	
	if(field2 = "datetime" or field2 = "timestamp")
		t := "`                    <x-input.group for=""? valueS1 ?"" label=""? valueAT1 ?"">`n                        <x-input.select wire`:model=""fieldColumnMap.? valueS1 ?_for_editing"" id=""? valueS1 ?"">`n                            <option value="""" disabled>Select Column...</option>`n                            @foreach ($columns as $column)`n                                <option>{{ $column }}</option>`n                            @endforeach`n                        </x-input.select>`n                    </x-input.group>`n                    `n"
	else
		t := "`                    <x-input.group for=""? valueS1 ?"" label=""? valueAT1 ?"" `:error=""$errors->first('fieldColumnMap.? valueS1 ?')"">`n                        <x-input.select wire`:model=""fieldColumnMap.? valueS1 ?"" id=""? valueS1 ?"">`n                            <option value="""" disabled>Select Column...</option>`n                            @foreach ($columns as $column)`n                                <option>{{ $column }}</option>`n                            @endforeach`n                        </x-input.select>`n                    </x-input.group>`n`n"

	return t
}

importView(){
	global
	importView_a( table_name_singular, table_name_plural, reverse )
}
	
importView_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	name := scaffoldModel("? valueS1 ?")
	form_fields := runSubScaffold( "ImportView_form_fields")

	
	name := scaffoldModel("? valueSH1 ?\import-? valueSH2 ?")
	file =C:\xampp\htdocs\gems-ws-api\resources\views\livewire\%name%.blade.php
	
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %form_fields%, " form_fields "
	}else{
		content := scaffoldModel("<div>`n    <x-button.secondary wire`:click=""$toggle('showModal')"" class=""flex items-center space-x-2""><x-icon.upload class=""text-cool-gray-500""/> <span>Import</span></x-button.secondary>`n`n    <form wire`:submit.prevent=""import"">`n        <x-modal.dialog wire`:model=""showModal"">`n            <x-slot name=""title"">Import ? valueAT2 ?</x-slot>`n`n            <x-slot name=""content"">`n                @unless ($upload)`n                <div class=""py-12 flex flex-col items-center justify-center "">`n                    <div class=""flex items-center space-x-2 text-xl"">`n                        <x-icon.upload class=""text-cool-gray-400 h-8 w-8"" />`n                        <x-input.file-upload wire`:model=""upload"" id=""upload""><span class=""text-cool-gray-500 font-bold"">CSV or Excel File</span></x-input.file-upload>`n                    </div>`n                    @error('upload') <div class=""mt-3 text-red-500 text-sm"">{{ $message }}</div> @enderror`n                </div>`n                @else`n                <div>`n" form_fields "                </div>`n                @endif`n            </x-slot>`n`n            <x-slot name=""footer"">`n                <x-button.secondary wire`:click=""$set('showModal'`, false)"">Cancel</x-button.secondary>`n`n                <x-button.primary type=""submit"">Import</x-button.primary>`n            </x-slot>`n        </x-modal.dialog>`n    </form>`n</div>`n")
	}
	
	directory := scaffoldModel("? valueSH1 ?")
	FileCreateDir, C:\xampp\htdocs\gems-ws-api\resources\views\livewire\%directory%

	fileWrite( content, file )
}

updateRoutesFile(){
	global
	updateRoutesFile_a( table_name_singular, table_name_plural, reverse )
}
	
updateRoutesFile_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	route := scaffoldModel("`    Route`:`:group(['prefix' => '? valueSH2 ?']`, function () {`n        Route`:`:get('/'`, App\Http\Livewire\? valueCC1 ?\List? valueCC2 ?`:`:class)->name('? valueSH2 ?')`;`n        Route`:`:get('/create'`, App\Http\Livewire\? valueCC1 ?\Manage? valueCC1 ?`:`:class)->name('? valueSH2 ?.create')`;`n        Route`:`:get('/{? valueC1 ?}/edit'`, App\Http\Livewire\? valueCC1 ?\Manage? valueCC1 ?`:`:class)->name('? valueSH2 ?.edit')`;`n        Route`:`:get('/{? valueC1 ?}'`, App\Http\Livewire\? valueCC1 ?\Show? valueCC1 ?`:`:class)->name('? valueSH2 ?.show')`;`n    })`;`n`n")
	
	file =C:\xampp\htdocs\gems-ws-api\routes\web.php
	FileRead, content, %file%
	StringReplace, content, content, `}); // group end, %route%`}); // group end
	
	fileWrite( content, file )
}
	
updateApiRoutes(){
	global
	updateApiRoutes_a( table_name_singular, table_name_plural, reverse )
}
	
updateApiRoutes_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	include := scaffoldModel("use App\Http\Controllers\? valueCC1 ?Controller`;`n")
	
	route := scaffoldModel("`    Route`:`:get('/? valueS2 ?'`, [? valueCC1 ?Controller`:`:class`, 'index'])->name('? valueS2 ?.list')`;`n    Route`:`:get('/? valueS2 ?/{id}'`, [? valueCC1 ?Controller`:`:class`, 'show'])->name('? valueS2 ?.show')`;`n    Route`:`:post('/? valueS2 ?'`, [? valueCC1 ?Controller`:`:class`, 'store'])->name('? valueS2 ?.store')`;`n    Route`:`:put('/? valueS2 ?/{id}'`, [? valueCC1 ?Controller`:`:class`, 'update'])->name('? valueS2 ?.update')`;`n    Route`:`:delete('/? valueS2 ?/{id}'`, [? valueCC1 ?Controller`:`:class`, 'destroy'])->name('? valueS2 ?.destroy')`;`n")
	
	file =C:\xampp\htdocs\gems-ws-api\routes\api.php
	FileRead, content, %file%
	
	StringReplace, content, content, `r, , All
	StringReplace, content, content, <?php`n, <?php`n%include%
	StringReplace, content, content, // add API routes here, %route%    // add API routes here
	
	fileWrite( content, file )
}
	
viya_updateRoutes(){
	global
	viya_updateRoutes_a( table_name_singular, table_name_plural, reverse )
}
	
viya_updateRoutes_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	directory := scaffoldDirectory("? valueCC1 ?")
	include := scaffoldModel("use App\Livewire\" directory "\? valueCC1 ?`;`n")
	
	route := scaffoldModel("`  Route`:`:get('/? valueSH1 ?'`, ? valueCC1 ?`:`:class)`;`n")
	
	file =C:\xampp\htdocs\viyaFSM\routes\web.php
	FileRead, content, %file%
	
	StringReplace, content, content, `r, , All
	StringReplace, content, content, // add includes here, %include%// add includes here
	StringReplace, content, content, // add routes here, %route%// add routes here
	
	fileWrite( content, file )
}
	
updatePermissions(){
	global
	updatePermissions_a( table_name_singular, table_name_plural, reverse )
}
	
updatePermissions_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	permissions := scaffoldModel("`            // ? valueS1 ?`n            [`n                'name' => '? valueS1 ?.view_any'`,`n            ]`,`n            [`n                'name' => '? valueS1 ?.create'`,`n            ]`,`n            [`n                'name' => '? valueS1 ?.view'`,`n            ]`,`n            [`n                'name' => '? valueS1 ?.update'`,`n            ]`,`n            [`n                'name' => '? valueS1 ?.delete'`,`n            ]`,`n`n")
	
	file =C:\xampp\htdocs\gems-ws-api\database\seeders\PermissionSeeder.php
	FileRead, content, %file%
	StringReplace, content, content, `            // add new permissions here, %permissions%`            // add new permissions here
	
	fileWrite( content, file )
}
	
updateSidebar(){
	global
	updateSidebar_a( table_name_singular, table_name_plural, reverse )
}
	
updateSidebar_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	;~ item := scaffoldModel("`    '? valueAT2 ?' => [`n        'name' => '? valueAT2 ?'`,`n        'route' => '? valueSH2 ?'`,`n        'icon' => 'clipboard-list'`,`n    ]`,`n")
	
	;~ file := "C:\xampp\htdocs\gems-ws-api\resources\views\layouts\app.blade.php"
	;~ FileRead, content, %file%
	;~ StringReplace, content, content, `r,
	;~ StringReplace, content, content, `    // add new menu items here, %item%`    // add new menu items here, All
	
	item := scaffoldModel("`                    <a href=""{{ route('? valueSH2 ?') }}"" class=""block px-4 py-2 mt-2 text-sm font-semibold bg-transparent rounded-lg dark-mode`:bg-transparent dark-mode`:hover`:bg-gray-600 dark-mode`:focus`:bg-gray-600 dark-mode`:focus`:text-white dark-mode`:hover`:text-white dark-mode`:text-gray-200 md`:mt-0 hover`:text-gray-900 focus`:text-gray-900 hover`:bg-gray-200 focus`:bg-gray-200 focus`:outline-none focus`:shadow-outline"">? valueAT2 ?</a>`n")
	
	file := "C:\xampp\htdocs\gems-ws-api\resources\views\layouts\sidebar\desktop.blade.php"
	FileRead, content, %file%
	StringReplace, content, content, `r,
	StringReplace, content, content, `                    <!-- Insert new menu items here -->, %item%`                    <!-- Insert new menu items here -->, All
	
	fileWrite( content, file )
}

primary_key(){
	global primary_key
	
	return primary_key
}
	
primary_key_row(){
	global primary_key_row
	
	return primary_key_row
}
	
mergeDataTypesAndRelationships(dataTypes, relations){
	global primary_key, primary_key_row, table_name_plural
	StringSplit, dataTypes, dataTypes, `n, `r
	StringSplit, relations, relations, `n, `r
	fields =
	
	Loop %dataTypes0%
	{
		dataType := dataTypes%A_Index%
		StringSplit, dataType, dataType, `t
		field := dataType
		
		relationFound := 0
		
		Loop %relations0%
		{
			relation := relations%A_Index%
			StringSplit, relation, relation, `t
			
			if(dataType1 = relation1){
				relationFound := 1
				
				singular := toSingular(relation2)
				;~ StringSplit, rows, singularAndPlural, `n
				;~ Loop %rows0%
				;~ {
					;~ row := rows%A_Index%
					;~ StringSplit, col, row, `t
					
					;~ if(relation2 = col2){
						;~ singular := col1
						;~ break
					;~ }
				;~ }
				
				field := field "`t" singular "`t" relation2 "`t" relation3
				break
			}
		}
		
		if(!relationFound)
			field := field "`t" "`t" "`t"
		
		if(dataType1 = primary_key){
			primary_key_row := field
			setGlobal("dbCache_primaryKey_" table_name_plural, primary_key_row)
		}else{
			fields := fields field
		
			if(A_Index != dataTypes0)
				fields := fields "`n"
		}
	}

	;~ Clipboard := dataTypes "`n" Clipboard
	return fields
}


getDataTypesByHttp(){
	global found_DB_table, location, primary_key, table_name_plural
	
	if(!cache)
		cache := []
	
	found_DB_table := 0
	
	name := tableName( scaffoldModel("? valueS2 ?") )
	
	if(!cache[name] and name and name != "s"){
		if(location = "ncit_laptop")
			UrlDownloadToFile http://localhost/phpmyadmin/tbl_structure.php?db=ecouncil_ecouncil_r2&table=%name%, %A_ScriptDir%\table_info.html
		else
			UrlDownloadToFile http://localhost/phpmyadmin/index.php?route=/table/structure&db=ecouncil_ecouncil_r2&table=%name%, %A_ScriptDir%\table_info.html
		
		FileRead, table_info, %A_ScriptDir%\table_info.html
		cache[name] := table_info
	}else
		table_info := cache[name]
	
	table_info := RegExReplace(table_info, "\s+", " ")
	table_info_replaced := RegExReplace(table_info, ".*tablestructure(.*)fieldsForm_checkall.*", "$1")
	if(table_info != table_info_replaced){
		found_DB_table := 1
		table_info := table_info_replaced
		StringReplace, table_info, table_info, <tr, % chr(255), All
		StringSplit, row, table_info, % chr(255)

		table_info=
		
		Loop %row0%
		{
			if(A_Index >= 3 ){
				StringReplace, row%A_Index%, row%A_Index%, <td, % chr(255), All
				StringSplit, column, row%A_Index%, % chr(255)

				name := RegExReplace(column3, ").*for=""checkbox_row_.{1,2}"">[ ](\S*)[ ]*.*", "$1")
				dataType := RegExReplace(column4, ").*lang=""en"">[ ](\S*)[ ]*.*", "$1")
				nullable := RegExReplace(column7, ").*>(\S*)</td>", "$1")
				
				if( InStr( column3, "title=""Primary""") ){
					primary_key := name
				}
				
				table_info := table_info name "`t" dataType "`t" nullable
				if(A_Index != row0)
					table_info := table_info "`n"
			}
		}
	}else
		return ""
	
	return table_info
}
	
getRelationsByHttp(){
	global
	static cache
	
	if(!cache)
		cache := []
	
	;~ name := scaffoldModel("? valueS2 ?")
	name := tableName( scaffoldModel("? valueS2 ?") )
	
	if(!cache[name] and name and name != "s"){
		if(location = "ncit_laptop")
			UrlDownloadToFile http://localhost/phpmyadmin/tbl_relation.php?db=ecouncil_ecouncil_r2&table=%name%, %A_ScriptDir%\table_info.html
		else
			UrlDownloadToFile http://localhost/phpmyadmin/index.php?route=/table/relation&db=ecouncil_ecouncil_r2&table=%name%&ajax_request=true&ajax_page_request=true, %A_ScriptDir%\table_info.html
		
		FileRead, table_info, %A_ScriptDir%\table_info.html
		cache[name] := table_info
	}else
		table_info := cache[name]
	
	table_info := RegExReplace(table_info, "\\""", """")
	table_info := RegExReplace(table_info, "\\n", " ")
	table_info := RegExReplace(table_info, "\s+", " ")
	table_info := RegExReplace(table_info, ".*Foreign key constraints(.*)id=""ir_div"".*", "$1")
	StringReplace, table_info, table_info, <tr, % chr(255), All
	StringSplit, row, table_info, % chr(255)

	table_info=
	
	Loop %row0%
	{
		if(A_Index >= 4 and A_Index <= row0 - 2){
			StringReplace, row%A_Index%, row%A_Index%, <td, % chr(255), All
			StringSplit, column, row%A_Index%, % chr(255)

			name := RegExReplace(column4, ").*selected=""selected"">[ ](\S*)[ ]*.*", "$1")
			relatedTable := RegExReplace(column6, ").*selected=""selected"">[ ](\S*)[ ]*.*", "$1")
			primaryKey := RegExReplace(column7, ").*selected=""selected"">[ ](\S*)[ ]*.*", "$1")
			table_info := table_info name "`t" relatedTable "`t" primaryKey "`n"
		}
	}
	
	return table_info
}
	
fieldsFromDB(){
	global clipList, scaffold_template, DB_Fields, modelName, clipList_A_Index
	
	clipList_bkp := clipList
	
	clipList_A_Index := 1
	modelName := Clipboard
	
	;~ clipList := "`t1`tid Primary`tbigint(20)`t`tUNSIGNED`tNo`tNone`t`tAUTO_INCREMENT`tChange Change`tDrop Drop`t`nMore More`n`t2`tcase_id`tvarchar(250)`tutf8mb4_unicode_ci`t`tNo`tNone`t`t`tChange Change`tDrop Drop`t`nMore More`n`t3`tuser_organisation_id Index`tbigint(20)`t`tUNSIGNED`tNo`tNone`t`t`tChange Change`tDrop Drop`t`nMore More`n`t4`tfrom_user_organisation_id Index`tbigint(20)`t`tUNSIGNED`tNo`tNone`t`t`tChange Change`tDrop Drop`t`nMore More`n`t5`torigin`tbigint(20)`t`tUNSIGNED`tNo`tNone`t`t`tChange Change`tDrop Drop`t`nMore More`n`t6`tpriority`tbigint(20)`t`tUNSIGNED`tNo`tNone`t`t`tChange Change`tDrop Drop`t`nMore More`n`t7`trecieved_date`tdatetime`t`t`tYes`tNULL`t`t`tChange Change`tDrop Drop`t`nMore More`n`t8`tdeadline`tdatetime`t`t`tYes`tNULL`t`t`tChange Change`tDrop Drop`t`nMore More`n`t9`tassigned_user_id Index`tbigint(20)`t`tUNSIGNED`tYes`tNULL`t`t`tChange Change`tDrop Drop`t`nMore More`n`t10`tstatus`tbigint(20)`t`tUNSIGNED`tNo`tNone`t`t`tChange Change`tDrop Drop`t`nMore More`n`t11`tcreated_by Index`tbigint(20)`t`tUNSIGNED`tYes`tNULL`t`t`tChange Change`tDrop Drop`t`nMore More`n`t12`tupdated_by Index`tbigint(20)`t`tUNSIGNED`tYes`tNULL`t`t`tChange Change`tDrop Drop`t`nMore More`n`t13`toperation_log_id Index`tbigint(20)`t`tUNSIGNED`tYes`tNULL`t`t`tChange Change`tDrop Drop`t`nMore More`n`t14`tcreated_at`ttimestamp`t`t`tYes`tNULL`t`t`tChange Change`tDrop Drop`t`nMore More`n`t15`tupdated_at`ttimestamp`t`t`tYes`tNULL`t`t`tChange Change`tDrop Drop`t`nMore More`n`t16`tdeleted_at`ttimestamp`t`t`tYes`tNULL`t`t`tChange Change`tDrop Drop`t`nMore More`n"
	
	;~ modelName =Drop Drop`t`ncases_assigned_user_id_foreign`nON DELETE`nRESTRICT`nON UPDATE`nRESTRICT`n`nassigned_user_id`n+ Add column`t`ncase_manager`n`nusers`n`nid`nDrop Drop`t`ncases_created_by_foreign`nON DELETE`nRESTRICT`nON UPDATE`nRESTRICT`n`ncreated_by`n+ Add column`t`ncase_manager`n`nusers`n`nid`nDrop Drop`t`ncases_from_user_organisation_id_foreign`nON DELETE`nRESTRICT`nON UPDATE`nRESTRICT`n`nfrom_user_organisation_id`n+ Add column`t`ncase_manager`n`nusers`n`nid`nDrop Drop`t`ncases_operation_log_id_foreign`nON DELETE`nRESTRICT`nON UPDATE`nRESTRICT`n`noperation_log_id`n+ Add column`t`ncase_manager`n`noperation_logs`n`nid`nDrop Drop`t`ncases_updated_by_foreign`nON DELETE`nRESTRICT`nON UPDATE`nRESTRICT`n`nupdated_by`n+ Add column`t`ncase_manager`n`nusers`n`nid`nDrop Drop`t`ncases_user_organisation_id_foreign`nON DELETE`nRESTRICT`nON UPDATE`nRESTRICT`n`nuser_organisation_id`n+ Add column`t`ncase_manager`n`nuser_organisations`n`nid
	
	
	StringReplace, clipList, clipList, `r, , All
	StringReplace, clipList, clipList, More More`n, , All
	StringReplace, clipList, clipList, ` Primary, , All
	StringReplace, clipList, clipList, ` Index, , All
	
	scaffold_template := "? value3 ?`t? value4 ?`n"
	ClipLoad()
	Clipboard=
	printUsingScaffold( "MA", 1, -1)
	dataTypes := Clipboard

	clipList_A_Index := 1
	clipList := modelName
	scaffold_template := "? value9 ?`t? value14 ?`n"
	ClipLoad()
	Clipboard=
	printUsingScaffold( "M", 16, 16)
	relations := Clipboard
	
	Clipboard := mergeDataTypesAndRelationships(dataTypes, relations)
	
	clipList := clipList_bkp
	
	return Clipboard
}

toSingular( name ){
	global pluralToSingular
	
	if( pluralToSingular[name] )
		return pluralToSingular[name]
	
	if( RegExMatch(name, ".*ies$") )
		return RegExReplace(name, "(.*)ies$", "$1y")
	else if( RegExMatch(name, ".*s$") )
		return RegExReplace(name, "(.*)s$", "$1")
	else
		return name
}

toPlural( name ){
	global singularToPlural
	
	if( singularToPlural[name] )
		return singularToPlural[name]
	
	if( RegExMatch(name, ".*y$") )
		return RegExReplace(name, "(.*)y$", "$1") "ies"
	else
		return name "s"
}

specificFieldsArr(){
	global specificFieldsArr
	
	specificFieldsArr := []
	
	;~ specificFieldsArr["case"] := ["case_id", "title", "from_organisation_id", "origin_id", "priority_id", "recieved_date", "deadline", "handler_id", "status_id"]
	specificFieldsArr["birth_record"] := ["foolhuma_form_number", "gender_type_id", "date_of_birth", "time_of_birth"]
}

processCamelCase( name ){
	name := putSpacesInCamelCase(name)
	StringReplace, name, name, _, %A_Space%, All
	StringReplace, name, name, -, %A_Space%, All
	name := RegExReplace(name, "\W+", " ")
	return snakeCase( name )
}

getGlobal(variableName){
	global
	
	t := %variableName%
	;~ u := %t%
	
	return t
}

setGlobal(variableName, value){
	global
	
	%variableName% := value
}

pixelMatch(color1 , color2)
{
	;~ SetFormat, IntegerFast, hex
	r1 := (color1 >> 16) & 0xFF
	g1 := (color1 >> 8) & 0xFF
	b1 := (color1) & 0xFF
	
	r2 := (color2 >> 16) & 0xFF
	g2 := (color2 >> 8) & 0xFF
	b2 := (color2) & 0xFF
	
	if(Abs(r1 - r2) > 10)
		return 0

	if(Abs(g1 - g2) > 10)
		return 0

	if(Abs(b1 - b2) > 10)
		return 0

	return 1
}

sendTelegramMessage(message){
	;~ message := uri_encode(message)
	;~ UrlDownloadToFile https://api.telegram.org/bot487001546:AAFzzCHokflhF9aSzK5mdXe-6Cat6L50WAA/sendMessage?chat_id=@playmvpro&text=%message%, %A_ScriptDir%\telegram.html
}


waitPixel(x1, y1, x2, y2, color1, not_true = 0, duration = 100, x3 = -1, y3 = -1, color2 = "0", stopOnFail = 1){
	global botStatus
	;~ 139, 265, "0x00A6FF", 0, 20, 1293, 264, "0x00A6FF"
			loop {
				loopIterations := 1
				if(x1 != "-1"){
					Click %x1%, %y1%
					loopIterations := 15
				}
				
				
				Loop %loopIterations% {
					botStatus := 1
					PixelGetColor, color, %x2%, %y2% ; 0x00A6FF ; wait for button to load
					if((pixelMatch(color1, color) or color = 0x00A6FF or color = 0x00A8FF or color = 0x00AAFF or color = 0x00B6FF or color = 0x1997F4 or (color = "0xBA7412") or color = color1 or color = color1 or color = color1 or color = color1 or color = color1 or color = color1) and not_true = 0)
						return 1 
						;~ 0xF7C418
					
					if( (!pixelMatch(color1, color)) and not_true = 1)
						return 1
					
					else if(x3 != -1){
						PixelGetColor, color, %x3%, %y3% ; 0x00A6FF ; wait for button to load
						;~ if(((color2 = color or 0x00A8FF = color or 0x00A6FF = color or 0x00AAFF = color)) and not_true = 0)
						if((( pixelMatch(color2, color) or color = 0xB97510 or color = 0xB97610 or color = 0xB97710 or color = 0xB87510 or color = 0xBA7510 or color = 0xBA7710 or color = 0xB67510 or color = 0xB87711 or color = 0x009CE2 or color = color2 or color = color2 or color = color2 or color = color2 or color = color2 or color = color2)) and not_true = 0)
							return 2
						
						PixelGetColor, color, 179, 382 ; 0x00BAFF ; wait for button to load
						if(color = 0x00BAFF or color = 0x00BAFF)
							return 3
					}
					Sleep 100
				}
				
				;~ if(x1 = "-1")
					;~ Sleep 100
					
				if(A_Index > duration){
					PixelGetColor, color, 797, 693
					if(color = "0xFFC300"){
						Click 797, 693 ;network reconnect
						Sleep 5000
					}	
					
					requireWinActive(blueName " ahk_exe Bluestacks.exe")
					
					if( WinExist( "Debugging] ahk_class SciTEWindow") ){
						PixelGetColor, color, %x2%, %y2% ; 0x00A6FF ; wait for button to load
						Clipboard := color
						MouseMove, %x2%, %y2%
						myTT("fail 2")
					}
					
					if(stopOnFail)
						SoundBeep
					;~ Sleep 1000
					;~ SoundBeep
					;~ Sleep 1000
					;~ SoundBeep
					;~ Sleep 1000
					;~ myTT("fail 2")
					sendTelegramMessage("could not find matching pixel")
					if(stopOnFail) {
						color := color
						myTT("x2: " x2)
						myTT("y2: " y2)
						myTT("color1: " color1)
					}
					return 0
				}
			}
}


saveCodeAndRefreshChrome(){
	
	if( WinActive("ahk_exe Code.exe") or WinActive("ahk_exe sublime_text.exe") ){
		Send ^s
		Sleep 100
		if( WinExist("Visualize Data with a Treemap Diagram - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe") ) {
			if( requireWinActive("Visualize Data with a Treemap Diagram - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe") ){
				Click 78, 34
				Sleep 100
				Send {F5}
			}
		} else if( requireWinActive("ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe") ) {
			Click 78, 34
			Sleep 100
			Send {F5}
		}
	}
	else if( WinActive("ahk_class SciTEWindow ahk_exe SciTE.exe") ) {
		Send ^s
		Sleep 1000
		Reload
	}
	else if( WinActive(".ipynb - Colab") ) {
		Send ^{Enter}
	}
	else {
		Send ^s
	}
}

insertPlaceholder(){
	Send ? value1 ?{Left 2}+{Left}
}

decodeLinesAndTabsWrapper(){
	global suspendTT, TT_duration
	
	TT_duration = 1000
	suspendTT = 1
	
	;~ Send ^a
	
	waitClipboard()
	
	StringReplace, Clipboard, Clipboard, `r, , All	
	
	; decodeLinesAndTabs
	content := decodeLinesAndTabs(Clipboard)
	StringReplace, content, content, `"`", `", All	
	Clipboard := content
	
	;~ Send ^v

	suspendTT = 0
	TT_duration = 4000

}

change_scaffold_output_mode(){
	global scaffold_output_mode, scaffold_single, scaffold_columns_g
	scaffold_output_mode := !scaffold_output_mode
	if( scaffold_output_mode )
		MyTT("Output mode")
	else
		MyTT("Input mode")
	
	if( scaffold_output_mode )
		;~ if( scaffold_single )
			scaffoldSingle( scaffold_columns_g )
		;~ else
			;~ scaffoldMergeAll( scaffold_columns_g )

}

scaffoldSingle(nColumns = -1, defaultTemplate = 1, encodeAsSingleElement = 0, forcePaste = 0) {
	global scaffold_output_mode, suspendTT, TT_duration, scaffold_template, scaffold_single, scaffold_row_g
	
	scaffold_single = 1
	
	scaffold_template_bkp := scaffold_template
	
	if( defaultTemplate and !InStr(scaffold_template, "? value"))
		scaffold_template=? value1 ?

	suspendTT = 1
	TT_duration = 1000
	if( !scaffold_output_mode ) {
		oldClipboard := Clipboard
		t := waitClipboard(1, 0, encodeAsSingleElement, 0)
		if(t="")
			t:=oldClipboard
		inputValue := t
		mergeClipboard(0, 0, 0, t)
		suspendTT = 0
		myTT(inputValue)
	}else{
		suspendTT = 0
		clipBkp := Clipboard
		printUsingScaffold( "M", 1, nColumns)
		if( forcePaste or scaffold_output_mode ) {
			;~ scaffold_row_g := Trim(scaffold_row_g)
			if(!scaffold_row_g and scaffold_row_g!="0") {
				scaffold_row_g := clipBkp
				waitSetClipboard(clipBkp)
			}
			
			;~ if( RegExMatch(scaffold_row_g, "\W") ){
				;~ Clipboard := ""
				;~ Sleep 10
				
				StringReplace, clipBkp, clipBkp, `r, , All
				if(clipBkp != scaffold_row_g)
					waitSetClipboard(scaffold_row_g)
				;~ Clipboard := scaffold_row_g
				;~ waitClipboard(0)
				Send ^v
			;~ }else {
				;~ SendInput {Raw}%scaffold_row_g%
			;~ }
			;~ Clipboard := scaffold_row_g
		} else {
			; clipList is empty so switching to input mode
			TT_duration = 1000
			scaffold_template := scaffold_template_bkp
			scaffoldSingle( nColumns, defaultTemplate, encodeAsSingleElement )
		}
	}
	TT_duration = 1000
	
	scaffold_template := scaffold_template_bkp
}

scaffoldMergeAll(nColumns = -1, defaultTemplate = 1){
	global suspendTT, TT_duration, scaffold_template
	
	TT_duration = 1000
	suspendTT = 1
	
	scaffold_template_bkp := scaffold_template
	
	if( defaultTemplate and !InStr(scaffold_template, "? value"))
		scaffold_template=`  ? value1 ?`: ? value2 ?`;`r`n
	
	suspendTT = 0
	myTT("load as single-tab-plural if using unscaffolded template")
	printUsingScaffold( "MA", 1, nColumns) ; merge all
	myTT(Clipboard)
	
	scaffold_template := scaffold_template_bkp
			
			
	suspendTT = 0
	TT_duration = 4000

}

scaffoldClipboard(){
	printUsingScaffold( "C", 1, -1)
}

listOfFields(){
	Clipboard := scaffoldFields("""? value1 ?""`, ", 1)
}

bulkScaffolding(){
	;~ bulkArr := ["users", "cases", "organisations", "organisation_types", "countries", "teams", "statuses", "channels", "priorities", "communications", "case_item_types", "gender_types", "tasks", "case_users", "case_user_types", "individuals", "role", "permission", "role_permission", "user_role", "audits", "activity_log", "sensitivities", "tags", "checklists", "comments", "task_tags", "task_users", "id_types", "addresses", "attachments", "notifications", "notification_types", "data_source_types", "members", "atolls", "islands"]
	bulkArr := ["tags", "document-types", "field-types", "documents", "team-accesses", "recipients", "doc-tags", "related-docs", "files", "versions", "tags", "document-types"]
	;~ bulkArr := ["tags", "checklists", "comments", "task_tags", "task_users"]
	
	for k, v in bulkArr {
		singular := snakeCase(v)
	
		;~ init_DB_Fields(0, 0) ; without cache
		init_DB_Fields(0) ; with cache
		scaffoldFiles()
	}
	
	;~ for k, v in bulkArr {
		;~ singular := snakeCase(v)
	
		;~ init_DB_Fields(0, 0)
	;~ }
}

surroundSelectionByQuotes(){
	;~ global
	old_Clipboard := Clipboard
	Clipboard := """ " Clipboard " """
	Send ^v
	Sleep 200
	Clipboard := old_Clipboard
}

convertCodeToTemplate(){
	global
	
	;unscaffold
	waitClipboard()
	
	content := Clipboard
	
	if(singular){
		init_DB_Fields()
		StringCaseSense, On
		
		cases =CC`tAT`tS`tSH`tC`tL`tU`tT
		StringSplit, cases, cases, `t
		
		iterations := [2, 1]
		
		;~ name := scaffoldModel("? valueCC1 ?")
		;~ content := StrReplace(content, name, "? valueCC91 ?")
		
		;~ name := scaffoldModel("? valueCC91 ?Model")
		;~ content := StrReplace(content, name, "? valueCC1 ?")
		
		for k, v in iterations {
			outer_index := v
			
			Loop %cases0% {
				name := scaffoldModel("? value" cases%A_Index% outer_index " ?")
				content := StrReplace(content, name, "? value" cases%A_Index% outer_index " ?")
			}
			
		}
		
		content := StrReplace(content, table_name_singular, "? value" 1 " ?")
		content := StrReplace(content, table_name_plural, "? value" 2 " ?")

		StringCaseSense, Off
	}
	
	clip_two := content
	scaffold_template := content
	
	StringReplace, content, content, `r, , All
	StringReplace, content, content, `", `"`", All
	
	content := RegExReplace(content, """( \w+ )""", "$1")
	content := encodeLinesAndTabs(content)
	Clipboard := content
	return scaffold_template
}

	; params
	; L = use last line
	; M = merge to clipboard
	; S = skip line
	; A = all lines
	; C = from Clipboard
	printUsingScaffold( params = "", nRows = 1, nColumns = -1, next = 1, defaultTemplate = 1 ){
		global
		local row
		
		useLastLine := InStr(params, "L")
		mergeToClipboard := InStr(params, "M")
		skipLine := InStr(params, "S")
		allLines := InStr(params, "A")
		fromClipboard := InStr(params, "C")
		
		StringSplit, clipList, clipList, `n, `r
		if(allLines){
			;~ clipList_A_Index = 0
			nRows := clipList0 - clipList_A_Index + 1
			if(nColumns != -1)
				nRows := nRows / nColumns
		}
		
		if(useLastLine){
			clipList_A_Index := clipList0
		}
		

		switch++
		
		if( defaultTemplate and !InStr(scaffold_template, "? value"))
			scaffold_template=? value1 ?
		
		if(fromClipboard){
			waitClipboard()
			temp := Clipboard
			StringReplace, temp, temp, % "`            return ", , All
			StringReplace, temp, temp, % "`;", , All
			StringReplace, temp, temp, % "`n", , All
			StringReplace, temp, temp, % "`r", , All
			temp := Trim(temp)
			row := replaceMarker(temp)
		}else{
			Loop % nRows
			{
				thisRow := fetchRow(nColumns, 1, next)
				row .= thisRow
			}
		}
		
		if(skipLine)
			return

		StringReplace, row, row, % chr(254), `t, All
		StringReplace, row, row, % chr(255), `n, All

		;~ if(!mergeToClipboard)
			;~ Clipboard=
			
		StringReplace, row, row, </b><br>&nbsp;&nbsp;&nbsp;, `t, All
		StringReplace, row, row, <br><b>, `n, All
		StringReplace, row, row, <b>, , All
		
		if(!next)
			myTT(scaffold_row_g)
		scaffold_row_g := row
		
		;~ waitSetClipboard(row)
		
		;~ StringSplit, clipList, clipList, `n, `r
		StringReplace, clipBkp, Clipboard, `r, , All
		if(clipBkp != row)
		;~ if(clipList0 > 1)
		;~ if(Clipboard != row)
			Clipboard := row
			;~ Clipboard .= row
		
		if(next)
			myTT(scaffold_row_g)
		
		
		if(!mergeToClipboard){
			Sleep 100
			;~ Send !d
			;~ Send ^v{Enter}
			;~ Send ^{Left}
			;~ Send ^+{Right}
			;~ Send ^a
			;~ Send ^v
			;~ Sleep 100
			
			;~ run, % Clipboard
			
			
			
			;~ Send ^a
			;~ Sleep 100
			;~ Send {BackSpace}
			;~ Sleep 100
			;~ Send {Home}
			;~ Send ^v
			;~ Sleep 100
			
			
			
			
			;~ SendInput {Raw}%Clipboard%
			;~ Sleep 100
			;~ Send {tab}
			;~ Sleep 100
		}
		return row
	}
	

durationPassed(label){
	static lastTime
	static lastLabel
	
	time := A_Min*1000*60 + A_Sec*1000 + A_MSec
	if(lastTime){
		diff := time - lastTime
		myTT(lastLabel ": " diff)
	}
	lastTime := time
	lastLabel := label
}


archivedScaffolds(){
		;~ gemsApi_apiController()
	
		;~ apiController()
		;~ repository()
		;~ resource()
		;~ updateApiRoutes()
	
		
		
		;~ childListTest()
		;~ listTest()
		;~ manageTest()
		;~ showTest()
		
		
		;~ policy()
		;~ updatePermissions()
		
	
		;~ enum()
		
		;~ childListController()
		;~ childListModalController()
		;~ childListView()
		;~ childListCompactView()
		;~ childListModalView()
		

		;~ factory()
		
		;~ seeder()
		;~ updateDatabaseSeeder()
		
		;~ model()
		;~ importModel()
		
		;~ importController()
		;~ listController()
		;~ manageController()
		;~ selectController()
		;~ showController()
		
		;~ selectArrayController()

		;~ importView()
		;~ listView()
		;~ listView_filters()
		;~ manageView()
		;~ showView()
		
		;~ updateRoutesFile()
		;~ updateSidebar()
		
		
		
		
		
		
		
		
		
		
		
		;~ gemsApi_apiController()
		;~ ws_gemsAPI_apiController_a()
	
		;~ resource()
		;~ updateApiRoutes()
	
		;~ apiTest()

		;~ factory()
		
		;~ seeder()
		;~ updateDatabaseSeeder()
		
		;~ model()
		
		
		
		;~ viya_listController()
		;~ viya_listView()
		
		;~ viya_updateRoutes()
		
		
		
		
		;~ yii_model()
		;~ yii_searchModel()
		;~ yii_Controller()
		
		;~ yii_IndexView()


}

scaffoldDirectory(template, skip = 0){
	directoryName := directoryName()
	
	if( skip )
		return template
	
	return runScaffold( template, directoryName)
}


directoryName(){
	return "Purchase Order"
}


currentTableName(overwrite=0){
	global singular
	
	;~ singular := ""
	if(!singular or overwrite)
		singular := "error_logs"
}


scaffoldFiles(){
	global singular, reverse, table_name_plural, found_DB_table, DB_Fields
	
	;~ reverse := 1
			
	myTT(singular)
	if( false && !DB_Fields )
		myTT("DB table not found")
	else{
		;~ archivedScaffolds()
	
		;~ model()

		
		;~ vue_button()
		;~ vue_modal()
		
		;~ vue_topbar_component()
		
		
		;~ to_clip_two()
		
		if(reverse)
			myTT("reverse")
		else
			myTT("scaffold done")
	}
}

#if (Stack="15am") ; scaffolding mode
	; d + b :: display shortcut list
	
	; d + r :: ^+n new folder
	; g + r :: toggle easy typing
	; g + t :: send time
	; g + Space :: ^+o VSCode search function
	; r + Space :: git revert (VSCode)
	; f + Space :: ^p VSCode go to file
	; x + x :: down
	; s + a :: VSCode - focus source control
	; g + h :: ffmpeg concat video files
	; s + d :: !- VSCode Go Back
	; v + v :: go to bookmark or inspect element in chrome
	; v + f :: toggle bookmark
	; d + w :: github to google colabs
	; d + e :: none mode
	; f + s :: Page Down
	; f + a :: End
	; f + q :: ^+t Reopen closed tab
	; f + w :: ^g Go to line
	; f + e :: ^n New
	; w + w :: F5 Refresh / Run
	; f + t :: ^t new tab
	; d + g :: peek prev tab
	; t + t :: focus VSCode terminal
	; s + s :: ^s save
	; a + a :: Escape
	; e + e :: Up
	
	; e + Space :: scaffold mode
	; f + f :: insert placeholder
	; d + d :: set scaffold template
	; s + s :: copy as separate elements
	; a + a :: scaffold merge all
	`::	scaffoldSingle( scaffold_columns_g, 1, 1 ) ; scaffold single
	
	; v + Space :: scaffold clipboard
	; d + p :: set scaffold_columns_g
	; d + h :: copy words as seperate elements
	
	; s + e :: search_term
	; s + r :: replacement
	; f + g :: smart replace
	
	; s + c :: code to template
	; s + v :: template to code
	
	
	; e + r :: file explorer
	; e + f :: chrome
	; e + d :: VSCode
	; e + s :: scite
	; e + a :: git kraken
	
	; c + c :: ^/ comment
	; r + r :: ^h replace
	; g + g :: ^f find
	; l + l :: ; semicolon
	; f + f :: Enter
	; s + g :: ^y redo
	; s + f :: ^z undo
	; d + s :: ^x cut
	; d + Space :: ^a select all
	; d + c :: ^c copy
	; d + . :: share code to social media
	; d + , :: pixel dev wait pixel
	; d + n :: reload vue file
	; d + f :: peek previous window
	; f + , :: focus VSCode Editor
	; +f + b :: focus VSCode terminal2
	
	; f + p :: HTML tag expander
	; d + o :: Arrow function
	; i + i :: Send accent
	; d + d :: console log

	; c + v :: kebab-case
	; c + s :: snake_case
	; c + f :: lower case
	; c + d :: UPPER CASE
	; c + i :: CapitalCamelCase
	; c + j :: camelCase
	; c + h :: All Title Case
	; c + a :: Title case
	; c + k :: CAPITAL_SNAKE_CASE
	; c + r :: dot.case
	
	; d + v :: ^v paste
	; f + r :: TTS characters to SoleAsia
	; c + o :: previous scaffold
	; f + n :: Ctrl + Enter

	; f + c :: go to reference
	; f + v :: go to prev reference
	
	; f + u :: surround selection by quotes
	
	
	
	; f + j :: Left
	
	`;:: toggleBetweenHotkeyAndTyping()

	F1:: handleF1() ; free code camp submit or go to reference

	
	; d + u :: decode lines and tabs wrapper
	;~ ~^q:: repeatCommandInVscode() ;repeat command in vscode
	;~ ^+!`:: bulkScaffolding() ; bulk
	;~ ^!`:: listOfFields() ; list of fields
	
registerModifiers(key){
	if( key = " ")
		key := "Space"
    Hotkey If, (Stack="15am")
    Hotkey $%key%, handleModifiers
    Hotkey $+%key%, handleModifiers	
    Hotkey $%key% Up, handleModifiers	
    Hotkey $+%key% Up, handleModifiers	
    Hotkey If,
}


#if (Stack="15am" and wPressed_g) ; scaffolding mode + w
	w:: ; w + w :: F5 Refresh / Run
		if( allowDoubleW_g ) {
			allowDoubleW_g = 0
			resetModifiers()
			Send {F5}
		}
		return
		
	Space:: ; w + Space :: 

		
#if (Stack="15am" and ePressed_g) ; scaffolding mode + e
	e:: ; e + e :: Up
		if( allowDoubleE_g ) {
			allowDoubleE_g = 0
			resetModifiers()
			Send {Up}
		}
		return
		
	r:: ; e + r :: file explorer
		resetModifiers()
		WinActivate, ahk_class CabinetWClass ahk_exe explorer.exe
		return

	f:: ; e + f :: chrome
		resetModifiers()
		WinActivate, ahk_exe chrome.exe
		;~ WinActivate, ahk_class CabinetWClass ahk_exe explorer.exe
		return

	d:: ; e + d :: VSCode
		resetModifiers()
		WinActivate, ahk_exe Code.exe
		return

	s:: ; e + s :: scite
		resetModifiers()
		WinActivate, ahk_exe SciTE.exe
		;~ WinActivate, ahk_exe WINWORD.EXE
		return

	a:: ; e + a :: git kraken
		resetModifiers()
		WinActivate, ahk_exe gitkraken.exe
		;~ WinActivate, RStudio ahk_class Chrome_WidgetWin_1 ahk_exe rstudio.exe
		return
		
	Space:: ; e + Space :: scaffold mode
		resetModifiers()
		scaffold_mode_g = 1
		myTT("scaffold_mode_g: " scaffold_mode_g)
		;~ scaffold_output_mode = 0
		;~ scaffoldSingle( scaffold_columns_g )
		return


#if (Stack="15am" and rPressed_g) ; scaffolding mode + r
	r:: ; r + r :: ^h replace
		if( allowDoubleR_g ) {
			allowDoubleR_g = 0
			resetModifiers()
			Send ^h
		}
		return
		
	Space:: ; r + Space :: git revert (VSCode)
		resetModifiers()
		Send ^k
		Send ^r
		return

#if (Stack="15am" and tPressed_g) ; scaffolding mode + t
	t:: ; t + t :: focus VSCode terminal
		if( allowDoubleT_g ) {
			allowDoubleT_g = 0
			resetModifiers()
			click 860, 999
			Sleep 100
			Send ^c
			Sleep 100
			Send {Up}
			Sleep 100
			Send {Enter}
			Sleep 100
			Send {Up}
			Sleep 100
			Send {Enter}
		}
		return


#if (Stack="15am" and iPressed_g) ; scaffolding mode + i
	i:: ; i + i :: Send accent
		if( allowDoubleI_g ) {
			allowDoubleI_g = 0
			resetModifiers()
			Send ``
		}
		return


#if (Stack="15am" and aPressed_g) ; scaffolding mode + a
	a:: ; a + a :: Send Escape
		if( allowDoubleA_g ) {
			allowDoubleA_g = 0
			resetModifiers()
			if(scaffold_mode_g) {
				Send ^z
				scaffoldMergeAll( scaffold_columns_g )
				waitSetClipboard(scaffold_row_g)
			} else
				Send {Esc}
		}
		return
		
#if (Stack="15am" and sPressed_g) ; scaffolding mode + s, 
	e:: ; s + e :: set smart_replace_search_term_g
		resetModifiers()
		waitClipboard()
		smart_replace_search_term_g := Clipboard
		return

	r:: ; s + r :: set smart_replace_replacement_g
		resetModifiers()
		waitClipboard()
		smart_replace_replacement_g := Clipboard
		return

	i:: ; s + i :: +Page Up
		resetModifiers()
		Send {Shift Down}{PGUP}{Shift Up}
		return

	j:: ; s + j :: ^+Left
		resetModifiers()
		Send {Ctrl Down}{Shift Down}{Left}{Shift Up}{Ctrl Up}
		return
	
	k:: ; s + k :: +Page Down
		resetModifiers()
		Send {Shift Down}{PGDN}{Shift Up}
		return
	
	l:: ; s + l :: ^+Right
		resetModifiers()
		Send {Ctrl Down}{Shift Down}{Right}{Shift Up}{Ctrl Up}
		return
	
	a:: ; s + a :: VSCode - focus source control
		resetModifiers()
		Send {Ctrl Down}{Alt Down}so{Alt Up}{Ctrl Up}
		return
	
	s:: ; s + s :: ^s save
		handleDoubleS()
		return
	
	d:: ; s + d :: !- VSCode Go Back
		resetModifiers()
		Send !-
		return
	
	f:: ; s + f :: ^z undo
		resetModifiers()
		Send ^z
		return
	
	g:: ; s + g :: ^y redo
		resetModifiers()
		Send ^y
		return
	
	c:: ; s + c :: code to template
		resetModifiers()
		singular := smart_replace_search_term_g
		init_DB_Fields()
		convertCodeToTemplate()
		return
	
	v:: ; s + v :: template to code
		resetModifiers()
		singular := smart_replace_replacement_g
		init_DB_Fields()
		waitClipboard()
		content := scaffoldModel( Clipboard )
		waitSetClipboard(content)
		Send ^v
		return
	
		
#if (Stack="15am" and dPressed_g and fPressed_g) ; scaffolding mode + f + d
	i:: ; f + d + i :: ^+Home
		Send {Ctrl Down}{Shift Down}{Home}{Shift Up}{Ctrl Up}
		resetModifiers()
		return
	
	j:: ; f + d + j :: +Home
		Send {Shift Down}{Home}{Shift Up}
		resetModifiers()
		return
	
	k:: ; f + d + k :: ^+End
		Send {Ctrl Down}{Shift Down}{End}{Shift Up}{Ctrl Up}
		resetModifiers()
		return
	
	l:: ; f + d + l :: +End
		Send {Shift Down}{End}{Shift Up}
		resetModifiers()
		return
		
#if (Stack="15am" and dPressed_g) ; scaffolding mode + d
		
	w:: ; d + w :: github to google colabs
		resetModifiers()
		waitClipboard()
		StringReplace, Clipboard, Clipboard, https://github.com/, https://colab.research.google.com/github/
		Send ^v
		return
		
	e:: ; d + e :: none mode
		resetModifiers()
		Stack:="11n"
		Manager()
		myTT("None mode")
		return
		
	r:: ; d + r :: ^+n new folder
		resetModifiers()
		Send ^+n
		return
		
	u:: ; d + u :: decode lines and tabs wrapper
		decodeLinesAndTabsWrapper()
		resetModifiers()
		return

	i:: ; d + i :: +Up
		Send {Shift Down}{Up}{Shift Up}
		resetModifiers()
		return
	
	o Up:: ; d + o :: Arrow function
		resetModifiers()
		Clipboard := "(d, i) => {}"
		Sleep 100
		Send ^v
	o:: return

	p:: ; d + p :: set scaffold_columns_g
		waitClipboard()
		scaffold_columns_g := Clipboard
		resetModifiers()
		return

	s:: ; d + s :: ^x cut
		resetModifiers()
		copy()
		Send {Del}
		return
		
	d:: ; d + d :: console log
		handleDoubleD()
		return

	^f::
	f:: ; d + f :: peek previous window
		resetModifiers()
		goToPreviousWindow2()
		return

	^g::
	g:: ; d + g :: peek prev tab
		resetModifiers()
		peekPrevTab()
		return

	h:: ; d + h :: copy words as seperate elements
		copyWordsAsSeperateElements()
		return
	
	j:: ; d + j :: +Left
		Send {Shift Down}{Left}{Shift Up}
		resetModifiers()
		return
	
	k:: ; d + k :: +Down
		Send {Shift Down}{Down}{Shift Up}
		resetModifiers()
		return
	
	l:: ; d + l :: +Right
		Send {Shift Down}{Right}{Shift Up}
		resetModifiers()
		return
	
	c:: ; d + c :: ^c copy
		copy()
		return
		
	v:: ; d + v :: ^v paste
		resetModifiers()
		scaffold_output_mode := 1
		scaffoldSingle( scaffold_columns_g, 1, 0, 1 )
		return
		
	b:: ; d + b :: display shortcut list
		resetModifiers()
		displayShortcutList()
		return
	
	n:: ; d + n :: reload vue file
		resetModifiers()
		reloadVueFile()
	,:: ; d + , :: pixel dev wait pixel
		pixelDevWaitPixel()
		resetModifiers()
		return
	
	.:: ; d + . :: share code to social media
		shareCodeToSocialMedia()
		return
		return
	
	Space:: ; d + Space :: ^a select all
		resetModifiers()
		Send ^a
		;~ copy()
		return	
		
#if (Stack="15am" and fPressed_g) ; scaffolding mode + f
	
	q:: ; f + q :: ^+t Reopen closed tab
		resetModifiers()
		Send ^+t
		return
	
	w:: ; f + w :: ^g Go to line
		resetModifiers()
		Send ^g
		return
	
	e:: ; f + e :: ^n New
		resetModifiers()
		Send ^n
		return
	
	r:: ; f + r :: TTS characters to SoleAsia
		resetModifiers()
		ttsCharactersToSoleasia()
		return

	t:: ; f + t :: ^t new tab
		resetModifiers()
		Send ^t
		return

	u:: ; f + u :: surround selection by quotes
		surroundSelectionByQuotes()
		resetModifiers()
		return

	i:: ; f + i :: Up
		Send {Up}
		resetModifiers()
		return
	
	p:: ; f + p :: HTML tag expander
		resetModifiers()
		htmlTagExpander()
		return
	
	a:: ; f + a :: End
		resetModifiers()
		Send {End}
		return
	
	s:: ; f + s :: Page Down
		resetModifiers()
		Send {PGDN}
		return
	
	f:: ; f + f :: Enter
		if( allowDoubleF_g ) {
			allowDoubleF_g = 0
			resetModifiers()
			if(scaffold_mode_g)
				insertPlaceholder()
			else
				Send {Enter}
		}
		return
	
	g:: ; f + g :: smart replace
		resetModifiers()
		scaffold_template_bkp := scaffold_template
		singular := smart_replace_search_term_g
		init_DB_Fields()
		template := convertCodeToTemplate()
		
		singular := smart_replace_replacement_g
		init_DB_Fields()
		content := scaffoldModel( template )
		waitSetClipboard(content)
		Send ^v
		scaffold_template := scaffold_template_bkp
		return
	
	h:: ; f + h ::
	
	j:: ; f + j :: Left
		Send {Left}
		resetModifiers()
		return
	
	k:: ; f + k :: Down
		Send {Down}
		resetModifiers()
		return
	
	l:: ; f + l :: Right
		Send {Right}
		resetModifiers()
		return

	c:: ; f + c :: go to reference
		resetModifiers()
		goToReference()
		return
	
	v:: ; f + v :: go to prev reference
		resetModifiers()
		goToPrevReference()
		return
	
	n:: ; f + n :: Ctrl + Enter
		resetModifiers()
		Send {Ctrl Down}{Enter}{Ctrl Up}
		Sleep 200
		Send {Ctrl Down}{Enter}{Ctrl Up}
		Sleep 200
		Send {Ctrl Down}{Enter}{Ctrl Up}
		Sleep 200
		Send {Ctrl Down}{Enter}{Ctrl Up}
		Sleep 200
		Send {Ctrl Down}{Enter}{Ctrl Up}
		Sleep 200
		Send {Ctrl Down}{Enter}{Ctrl Up}
		return
	
	m:: ; f + m :

	,:: ; f + , :: focus VSCode Editor
		Click 596, 72
		resetModifiers()
		return
	
	.:: ; f + . ::
		
	Space:: ; f + Space :: ^p VSCode go to file
		resetModifiers()
		Send ^p
		return

	;~ +i:: ; f + i :: +Up
		;~ Send {Shift Down}{Up}{Shift Up}
		;~ resetModifiers()
		;~ return

	;~ +j:: ; f + j :: +Left
		;~ Send {Shift Down}{Left}{Shift Up}
		;~ resetModifiers()
		;~ return

	;~ +k:: ; f + k :: +Down
		;~ Send {Shift Down}{Down}{Shift Up}
		;~ resetModifiers()
		;~ return
	
	;~ +l:: ; f + l :: +Right
		;~ Send {Shift Down}{Right}{Shift Up}
		;~ resetModifiers()
		;~ return
		
	;~ +,:: ; f + k :: +Down
		;~ Send {Shift Down}{Down}{Shift Up}
		;~ resetModifiers()
		;~ return
		
	+b:: ; +f + b :: focus VSCode terminal2
		click 1435, 1011
		resetModifiers()
		return


#if (Stack="15am" and gPressed_g) ; scaffolding mode + g
	r:: ; g + r :: toggle easy typing
		resetModifiers()
		if(easy_typing_g)
			easy_typing_g = 0
		else
			easy_typing_g = 1
		myTT("easy typing: " easy_typing_g)
		return
		
	t:: ; g + t :: send time
		resetModifiers()
		sendDatetime()
		return
		
	i:: ; g + i :: Page Up
		resetModifiers()
		Send {PGUP}
		return
		
	g:: ; g + g :: ^f find
		if( allowDoubleG_g ) {
			allowDoubleG_g = 0
			resetModifiers()
			Send ^f
		}
		return
	
	h:: ; g + h :: ffmpeg concat video files
		resetModifiers()
		ffmpegConcatVideoFiles()
		return
	
	j:: ; g + j :: Home
		resetModifiers()
		Send {Home}
		return
	
	k:: ; g + k :: Page Down
		resetModifiers()
		Send {PGDN}
		return
	
	l:: ; g + l :: End
		resetModifiers()
		Send {End}
		return
	
	Space:: ; g + Space :: ^+o VSCode search function
		resetModifiers()
		Send ^+o
		Sleep 100
		Send :
		return


;~ #if (Stack="15am" and jPressed_g) ; scaffolding mode + j
	;~ j:: ; j + j :: square brackets
		;~ if( allowDoubleJ_g ) {
			;~ allowDoubleJ_g = 0
			;~ resetModifiers()
			;~ Send [
		;~ }
		;~ return


;~ #if (Stack="15am" and kPressed_g) ; scaffolding mode + k
	;~ k:: ; k + k :: curly brackets
		;~ if( allowDoubleK_g ) {
			;~ allowDoubleK_g = 0
			;~ resetModifiers()
			;~ t := "{"
			;~ SendInput {Raw}%t%
		;~ }
		;~ return


#if (Stack="15am" and lPressed_g) ; scaffolding mode + l
	l:: ; l + l :: ; semicolon
		if( allowDoubleL_g ) {
			allowDoubleL_g = 0
			resetModifiers()
			Send `;
		}
		return


#if (Stack="15am" and xPressed_g) ; scaffolding mode + x
	x:: ; x + x :: down
		if( allowDoubleX_g ) {
			allowDoubleX_g = 0
			resetModifiers()
			Send {Down}
		}
		return
		

#if (Stack="15am" and cPressed_g) ; scaffolding mode + c
	v:: ; c + v :: kebab-case
		resetModifiers()
		snakeCaseWithHyphen()
		Send ^v
		return
	
	i:: ; c + i :: CapitalCamelCase
		resetModifiers()
		capitalCamelCase()
		Send ^v
		return
	
	s:: ; c + s :: snake_case
		resetModifiers()
		snakeCase()
		Send ^v
		return
		
	d:: ; c + d :: UPPER CASE
		resetModifiers()
		capitalCase()
		Send ^v
		return
	
	o:: ; c + o :: previous scaffold
		resetModifiers()
		printUsingScaffold( "", 1, -1, 0) ; previous
		return
	
	f:: ; c + f :: lower case
		resetModifiers()
		lowerCase()
		Send ^v
		return
	
	h:: ; c + h :: All Title Case
		resetModifiers()
		allTitleCase()
		Send ^v
		return
	
	j:: ; c + j :: camelCase
		resetModifiers()
		camelCase()
		Send ^v
		return
	
	k:: ; c + k :: CAPITAL_SNAKE_CASE
		resetModifiers()
		capitalSnakeCase()
		Send ^v
		return
		
	c:: ; c + c :: ^/ comment
		if( allowDoubleC_g ) {
			allowDoubleC_g = 0
			resetModifiers()
			IfWinActive, ahk_exe SciTE.exe
				Send ^q
			else
				Send ^/
		}
		return
	
	a:: ; c + a :: Title case
		resetModifiers()
		titleCase()
		Send ^v
		return
	
	r:: ; c + r :: dot.case
		resetModifiers()
		dotCase()
		Send ^v
		return
		
#if (Stack="15am" and vPressed_g) ; scaffolding mode + v
	v:: ; v + v :: go to bookmark or inspect element in chrome
		if( allowDoubleV_g ) {
			allowDoubleV_g = 0
			resetModifiers()
			IfWinActive, ahk_exe SciTE.exe
				Send {F2}
			else if(WinActive("ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe"))
				Send ^+c
			else
				Send ^!l
		}
		return
		
	f:: ; v + f :: toggle bookmark
		resetModifiers()
		IfWinActive, ahk_exe SciTE.exe
			Send ^{F2}
		else
			Send ^!k
		return
		
	Space:: ; v + Space :: scaffold clipboard
		resetModifiers()
		waitClipboard()
		runScaffold( scaffold_template, Clipboard)
		Send ^v
		return
		

#if (Stack="15ak") ; Go to reference 
	`:: goToReference()
	
	goToPrevReference(){
		global
		if(pop_twice)
			recentFunctions.Remove( recentFunctions.Length() )
		goToReference( recentFunctions[ recentFunctions.Length() ] )
		if( recentFunctions.Length() > 1 )
			recentFunctions.Remove( recentFunctions.Length() )
	}
	
	goToReference(target = ""){
		global
		
		Clipboard=
		waitClipboard()
		
		;~ ; replace efaas callback
		if( InStr(Clipboard, "https://workspace.localhost/auth/callback") ){
			StringReplace, Clipboard, Clipboard, "https`://workspace.localhost/auth/callback", "http`://gems-ws-app.test/auth/callback", all
			omitcredentials="credentials"`: "omit"
			StringReplace, Clipboard, Clipboard, %omitcredentials%, , all
			Send ^v
			Sleep 500
			
			Send !d
			Send http://gems-ws-app.test/
			Send {Enter}
			return
		}
		if( InStr(Clipboard, "https://gems.localhost/case/auth/callback") ){
			StringReplace, Clipboard, Clipboard, "https`://gems.localhost/case/auth/callback", "http`://case.localhost/auth/callback", all
			omitcredentials="credentials"`: "omit"
			StringReplace, Clipboard, Clipboard, %omitcredentials%, , all
			Send ^v
			Sleep 500
			
			Send !d
			Send http://case.localhost/auth/login?EFAAS-DISABLE=1
			Send {Enter}
			return
		}
		if( InStr(Clipboard, "https://gems.localhost/case/auth/callback") ){
			StringReplace, Clipboard, Clipboard, "https`://gems.localhost/case/auth/callback", "http`://gemen-reporting.test/oauth/callback", all
			omitcredentials="credentials"`: "omit"
			StringReplace, Clipboard, Clipboard, %omitcredentials%, , all
			Send ^v
			Sleep 500
			
			Send !d
			Send http://gemen-reporting.test
			Send {Enter}
			return
		}
		if( InStr(Clipboard, "https://gems.localhost/case/auth/callback") ){
			StringReplace, Clipboard, Clipboard, "https`://gems.localhost/case/auth/callback", "http`://ecouncil.test/ecouncil/index.php", all
			omitcredentials="credentials"`: "omit"
			StringReplace, Clipboard, Clipboard, %omitcredentials%, , all
			Send ^v
			Sleep 500
			
			Send !d
			Send http://ecouncil.test/ecouncil/index.php/site/logout
			Send {Enter}
			return
		}
			
		; if browser is open
		if(WinActive("ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe")){
			if(Clipboard != ""){
				t:= RegExReplace(Clipboard, "s).*name: ""([^""]*).*serverMemo.*", "$1")
				action:= RegExReplace(Clipboard, "s).*method: ""([^""]*).*", "$1")
				if( action = Clipboard)
					action=render
				
				;~ StringReplace, t, t, -, , All 
				;~ StringReplace, t, t, ., %A_Space%, All 
				
				model := allTitleCase(t)
				;~ action := "List"
				
				WinActivate, ahk_exe Code.exe
				WinWaitActive, ahk_exe Code.exe, , 2
				if( WinActive("ahk_exe sublime_text.exe") or WinActive("ahk_exe Code.exe") ){
					model := capitalCamelCase(model)
					load_singularToPlural()
					Send ^p
					Sleep 200
					Send % model
					Clipboard := model
					Sleep 1000
					Send {Enter}
					Sleep 200
					Send ^p
					Sleep 200
					Send % "@:" action
					Sleep 200
					Send {Enter}
					Clipboard := action
				}
				MyTT(t)
				return
			}
			
			
			Send !d
			waitClipboard()
			
			t := Clipboard
			if(InStr(t, "http://localhost/SIS.Web") or InStr(t, "http://localhost/makudionline") or InStr(t, "http://localhost/eHealth")){
				t:= RegExReplace(t, "s)^.*http://localhost/SIS.Web/", "$1")
				t:= RegExReplace(t, "s)^.*http://localhost/makudionline/", "$1")
				t:= RegExReplace(t, "s)^.*http://localhost/eHealth/", "$1")

				if(requireWinActive("ahk_exe devenv.exe")){
					StringReplace, t, t, ~, , All
					StringReplace, t, t, /, \, All
					t := RegExReplace(t, "^\\", "")
					StringSplit, t, t, ?
					Clipboard:= t1
					Send ^n
					Sleep 100 
					Send ^v
				}
			}else{
				if( InStr(t, "http://case.localhost") or InStr(t, "https://case.te.egov.mv/") or InStr(t, "http://gemen-online.test/") or InStr(t, "http://recordsmv.ddns.net/") or InStr(t, "http://case-manager.localhost") or InStr(t, "https://casemanager.localhost") or InStr(t, "http://localhost:3000") ){
					StringReplace, t, t, http://case.localhost/
					StringReplace, t, t, https://case.te.egov.mv/
					StringReplace, t, t, http://gemen-online.test/
					StringReplace, t, t, http://recordsmv.ddns.net/
					StringReplace, t, t, http://case-manager.localhost/
					StringReplace, t, t, https://casemanager.localhost/
					StringReplace, t, t, http://localhost:3000/
					model := RegExReplace(t, "s)^([a-z\-]+).*", "$1")
					createRoute := RegExReplace(t, "s)^([a-z\-]+)/([a-z\-]+)$", "1")
					showRoute := RegExReplace(t, "s)^([a-z\-]+)/(\d+)$", "1")
					editRoute := RegExReplace(t, "s)^([a-z\-]+)/(\d+)/([a-z\-]+)$", "1")
					
						if(showRoute = "1")
							action := "Show"
						else if(createRoute = "1")
							action := "Manage"
						else if(editRoute = "1")
							action := "Manage"
						else
							action := "List"
						
						WinActivate, ahk_exe Code.exe
						WinWaitActive, ahk_exe Code.exe, , 2
						if( WinActive("ahk_exe sublime_text.exe") or WinActive("ahk_exe Code.exe") ){
							model := snakeCase(model)
							load_singularToPlural()
							Send ^p
							Sleep 200
							Send % capitalCamelCase( toSingular( model ) ) "/" action " http"
							Clipboard := capitalCamelCase( toSingular( model ) ) "/" action " http"
							Sleep 500
							Send {Enter}
							Sleep 200
							Send ^p
							Sleep 200
							Send % "@:render"
							Sleep 200
							Send {Enter}
							;~ Clipboard := "render"
						}
				}else{
					t:= RegExReplace(t, "s)^.*index.php/", "$1")

					WinActivate, ahk_exe Code.exe
					WinWaitActive, ahk_exe Code.exe, , 2
					if( WinActive("ahk_exe sublime_text.exe") or WinActive("ahk_exe Code.exe") ){
						StringSplit, t, t, ?
						StringSplit, t1, t1, /
						Send ^p
						Sleep 200
						Send % t11 "Controller"
						Sleep 500
						Send {Enter}
						
						Sleep 200
						Send ^+o
						Sleep 200
						Send % "action" t12
						Sleep 200
						Send {Enter}
						Clipboard := t12
					}
				}
			}
		}else if(WinActive("ahk_exe SciTE.exe")){
			Send ^f
			Sleep 100
		
			old_Clipboard := Clipboard
			
			if(target){
				pop_twice := 0
				output := target
			}else{
				pop_twice := 1
				waitClipboard()
				recentFunctions.Insert(Clipboard)
				output := Clipboard
			}
			Sleep 100
			Clipboard := "^\s*" output "(.*)\s*{$"
			Sleep 100
			Send ^v
			Sleep 100
			Send !e
			Sleep 100
			Send !f
			Sleep 100
			Send !e
			Sleep 100

			Send {Esc}
			Clipboard := old_Clipboard
		}else{
			; if IDE is open
			Send {Left}{Right}
			Send +{Home}
			
			waitClipboard()
			StringReplace, clipboard, clipboard, <x-, , All
			StringSplit, clipboard,clipboard, >:'`"%A_Space%()`,;
			t1:=clipboard%clipboard0%
			len1 := StrLen(t1) + 1
			
			Send {Ctrl Up}
			Sleep 100
			Send {Right}
			Sleep 100
			Send {Ctrl Up}
			Sleep 100
			Send +{End}
			waitClipboard()
			StringSplit, clipboard,clipboard, >:'`"%A_Space%()`,;

			len2 := StrLen(clipboard1) + len1 - 1
			ref := t1 clipboard1
			
			; select the reference
			;~ Send {Left %len1%}+{Right %len2%}
			
			if(! WinActive("ahk_exe sublime_text.exe") and ! WinActive("ahk_exe Code.exe") and ! WinActive("ahk_exe Cursor.exe")){
			;~ if(location="NCIT"){
				StringReplace, ref, ref, ~, , All
				StringReplace, ref, ref, /, \, All
				ref := RegExReplace(ref, "^\\", "")
				Clipboard:= ref
				Send ^n
			}else {
				StringReplace, ref, ref, ., \, All
			
				ref := RegExReplace(ref, "^@mailapp/", "resources/js/src/apps/mail/")
				ref := RegExReplace(ref, "^@utils/", "resources/js/src/utils/")
				ref := RegExReplace(ref, "^@assets/", "resources/js/src/assets/")
				ref := RegExReplace(ref, "^@stores/", "resources/js/src/stores/")
				ref := RegExReplace(ref, "^@adminapp/", "resources/js/src/apps/admin/")
				ref := RegExReplace(ref, "^@mailapp/", "resources/js/src/apps/mail/")
				ref := RegExReplace(ref, "^@caseapp/", "resources/js/src/apps/case/")
				ref := RegExReplace(ref, "^@taskapp/", "resources/js/src/apps/task/")
				ref := RegExReplace(ref, "^@hrmsapp/", "resources/js/src/apps/hrms/")
				ref := RegExReplace(ref, "^@components/", "resources/js/src/components/")
				ref := RegExReplace(ref, "^@layouts/", "resources/js/src/components/layouts/")
				ref := RegExReplace(ref, "^@icons/", "resources/js/src/components/icons/")
				ref := RegExReplace(ref, "^@types/", "resources/js/src/types/")
				
				ref := RegExReplace(ref, "\\vue$", ".vue")
				ref := RegExReplace(ref, "\\ts$", ".ts")
				ref := RegExReplace(ref, "\\js$", ".js")
				
				ref := RegExReplace(ref, "@", "")
				;~ StringReplace, ref, ref, \vue, .vue, All
				Clipboard:= ref
				Send ^p
			}
			Sleep 100
			;~ Clipboard := "e(" Clipboard ")"
			Send ^v
		}
		return
	}

#if (Stack="15ae") ; fetchRow
	`:: fetchRow()
	
	fetchRow(nColumns=-1, fillTemplate = 0, next = 1, isRecursiveRun = 0){
		global
		
		if(! next){
			value0 -= 2
			clipList_A_Index -= 2
		}
		
		if(clipCells0 = "" or clipCells0 = 0)
			ClipLoad()
		
		if(nColumns = -1)
			nColumns := clipCells0
		else if(nColumns = 0)
			nColumns := clipList0 - clipList_A_Index + 1
		
		t := scaffold_template
		
		if(nColumns = "" or nColumns = 0)
			nColumns=1
		
		loop %nColumns%
		{
			result := fetchValue(0, 0, 1)
			if(result.status = "fail"){
				if(!isRecursiveRun){
					return fetchRow(nColumns, fillTemplate, next, 1)
				}
				return ""
			}
			
			if(fillTemplate){
				t := replaceMarker(result.value, t, A_Index)
			}
		}
		
		value0++
		StringReplace, t, t, ? value0 ?, % value0, All
		
		return t
	}
	
	replaceMarker( replacement = "qpmz_default_never_used_by_anyone", hayStack = "qpmz_default_never_used_by_anyone", index = 1 ){
		global scaffold_template
		
		if(replacement = "qpmz_default_never_used_by_anyone")
			replacement := Clipboard
		if(hayStack = "qpmz_default_never_used_by_anyone")
			hayStack := scaffold_template

		value%index% := replacement
		valueC%index% := camelCase(value%index%)
		valueCC%index% := capitalCamelCase(value%index%)
		valueS%index% := snakeCase(value%index%)
		valueSH%index% := snakecasewithhyphen(value%index%)
		valueU%index% := capitalCase(value%index%)
		valueAT%index% := allTitleCase(value%index%)
		valueT%index% := titleCase(value%index%)
		valueL%index% := lowerCase(value%index%)
		valueCS%index% := capitalSnakeCase(value%index%)
		
		StringReplace, hayStack, hayStack, ? value%index% ?, % value%index%, All
		StringReplace, hayStack, hayStack, ? valueC%index% ?, % valueC%index%, All
		StringReplace, hayStack, hayStack, ? valueCC%index% ?, % valueCC%index%, All
		StringReplace, hayStack, hayStack, ? valueS%index% ?, % valueS%index%, All
		StringReplace, hayStack, hayStack, ? valueSH%index% ?, % valueSH%index%, All
		StringReplace, hayStack, hayStack, ? valueU%index% ?, % valueU%index%, All
		StringReplace, hayStack, hayStack, ? valueAT%index% ?, % valueAT%index%, All
		StringReplace, hayStack, hayStack, ? valueT%index% ?, % valueT%index%, All
		StringReplace, hayStack, hayStack, ? valueL%index% ?, % valueL%index%, All
		StringReplace, hayStack, hayStack, ? valueCS%index% ?, % valueCS%index%, All
		
		return hayStack
	}

#if (Stack="15ad") ; Get First 50000 characters
	`::
		Click 114, 248
		Sleep 1000
		Send {Tab 2}
		Sleep 300
		Clipboard := SubStr(clipList, 1, 50000) " Hammadh End of document Hammadh End of document"
		clipList := SubStr(clipList, 50001)
		Send ^v
		myTT("clip loaded")
		MouseMove 1807, 288
	return

	;~ requireWinActive(win, exe = "", timeout = 2, winExclude = ""){
		;~ if(exe != ""){
			;~ IfWinNotExist, % win, , % winExclude
				;~ run, % exe
			
			;~ WinWait, % win, , % timeout, % winExclude
		;~ }
		
		;~ Loop % timeout {
			;~ WinActivate, % win, , % winExclude
			;~ WinWaitActive, % win, , % 1, % winExclude
			;~ IfWinActive, % win, , % winExclude
				;~ return 1
		;~ }
		;~ return 0
	;~ }
	
#if (Stack="15ac") ; Toogle Hide Window
	+`::
		WinGet, HideWindow, ID, A
		myTT("Window Selected")
	return

	`::
		if HideWindowToggle=1
		{
			HideWindowToggle=0
			WinHide, ahk_id %HideWindow%
		}
		else
		{
			HideWindowToggle=1
			WinShow, ahk_id %HideWindow%
		}
	return

#if (Stack="15u") ; replace blank lines
	`:: 
		;~ waitClipboard()
		;~ StringReplace, clipboard, clipboard, &, `n, All
	;~ return
		Clipboard=
		waitClipboard()
		Clipboard := replaceBlankLines(0, Clipboard)
		;~ mergeClipboard(0)
		;~ Stack:="15am"
		;~ Manager()

	return
	
	replaceBlankLines(paste = 1, input=""){
		
		input := RegExReplace(input, "s)\R+", "`r`n")
		if(paste)
			Send ^v
		return input
	}

#if (Stack="15t") ; make/undo file or folder read-only system hidden 
	`::
		; make/undo file or folder read-only system hidden
		waitClipboard()
		StringSplit, clipboard, clipboard, `n,`r
		loop %clipboard0%
		{
			FileSetAttrib, ^RSH, % Clipboard%A_Index%, 1
		}
	return
	
#if (Stack="15s") ; needle in haystack finder
	`::
		;~ StringReplace, needle, needle, `t, `n
		;~ StringReplace, haystack, haystack, `t, `n
		StringSplit, needle, needle, `n, `r
		StringSplit, haystack, haystack, `n, `r
		output=
		AutoTrim, Off
		
		
		loop %needle0% {
			;~ if(Mod(A_Index, 2) != 1)
				;~ continue
			
			outIndex:=A_Index
			;~ outIndex1:=A_Index + 1
			;~ tempN1 := needle%A_Index%
			;~ tempN2 := needle%outIndex1%
			
			;~ tempN := tempN1 "`t" tempN2
			
			StringSplit, tempN, needle%outIndex%, `t
			loop %haystack0% {
				;~ if(Mod(A_Index, 3) != 1)
					;~ continue
				
				StringSplit, tempH, haystack%A_Index%, `t
				
				;~ outIndex1:=A_Index + 1
				;~ outIndex2:=A_Index + 2
				;~ tempH1 := haystack%A_Index%
				;~ tempH2 := haystack%outIndex1%
				;~ tempH3 := haystack%outIndex2%
				;~ tempH := tempH1 "`t" tempH2 "`t" tempH3
					
				;~ test1:=RegExReplace(tempN1 tempN4,"[^a-zA-Z0-9]","")
				;~ test2:=RegExReplace(tempH1 tempH4,"[^a-zA-Z0-9]","")
				
				t1 := capitalCase(Trim(tempN1))
				t2 := capitalCase(Trim(tempH3))
				
				;~ if( capitalCase(Trim(tempN1)) = capitalCase(Trim(tempH3)) )
				;~ if( capitalCase(Trim(tempN6)) = capitalCase(Trim(tempH2)) and capitalCase(Trim(tempN32)) = capitalCase(Trim(tempH4)) )
				if( capitalCase(Trim(tempN28)) = capitalCase(Trim(tempH4)) and capitalCase(Trim(tempN34)) = capitalCase(Trim(tempH3)) )
				{
					output:= output needle%outIndex% "`t" haystack%A_Index% "`t1`n"
					break
				}else if(a_index=haystack0)
					output:= output needle%outIndex% "`tnot found`n"
			}
		}
		Clipboard:=output

		MyTT("Clipboard", 1)
		;~ AutoTrim, On
	return

	F9::
		needle := waitClipboard()
		MyTT("needle")
	return

	F10::
		
		haystack := waitClipboard()
		MyTT("haystack")
	return

#if (Stack="15q") ; send clipboard
	`:: SendInput {Raw}%Clipboard%
	
#if (Stack="15aj") ; CAPITAL CASE
	`:: 
		capitalCase()
		Send ^v
	return

	capitalcase(source = "qpmz_default_never_used_by_anyone"){
		return genericWordCaseFormatter(source, " ", 3, 3)
	}

#if (Stack="15ai") ; All Title Case
	`:: 
		allTitleCase()
		Send ^v
	return

	alltitlecase(source = "qpmz_default_never_used_by_anyone"){
		return genericWordCaseFormatter(source, " ", 2, 2)
	}

#if (Stack="15ah") ; Title case
	`:: 
		titleCase()
		Send ^v
	return

	titlecase(source = "qpmz_default_never_used_by_anyone"){
		return genericWordCaseFormatter(source, " ", 2, 1)
	}

#if (Stack="15ag") ; lower case
	`:: 
		;~ Send ^a
		;~ Sleep 100
		;~ Send ^c
		;~ waitClipboard(0)
		;~ t := Clipboard





		;~ StringReplace, t, t, 192.168.1.1, 10.241.3.108, All
		
		
		
		
		
		;~ Clipboard := t
		;~ Sleep 100
		;~ Send ^v
	;~ return

		lowerCase()
		Send ^v
	return

	lowerCase(source = "qpmz_default_never_used_by_anyone"){
		return genericWordCaseFormatter(source, " ", 1, 1)
	}

#if (Stack="11v") ;  snake-case-with-hyphen
	`::
		snakeCaseWithHyphen()
		Send ^v
	return

	snakeCaseWithHyphen(source = "qpmz_default_never_used_by_anyone"){
		return genericWordCaseFormatter(source, "-", 1, 1)
	}

#if (Stack="15x") ; snake_case
	`:: 
		snakeCase()
		Send ^v
	return

	snakeCase(source = "qpmz_default_never_used_by_anyone"){
		return genericWordCaseFormatter(source, "_", 1, 1)
	}

	capitalSnakeCase(source = "qpmz_default_never_used_by_anyone"){
		return genericWordCaseFormatter(source, "_", 3, 3)
	}

#if (Stack="15w") ; CapitalCamelCase
	`:: 
		capitalCamelCase()
		Send ^v
	return

	capitalCamelCase(source = "qpmz_default_never_used_by_anyone"){
		return genericWordCaseFormatter(source, "", 2, 2)
	}

	dotCase(source = "qpmz_default_never_used_by_anyone"){
		return genericWordCaseFormatter(source, ".", 1, 1)
	}

#if (Stack="15p") ; camelCase
	`::
		;~ Send ^a
		;~ Sleep 100
		;~ Send ^c
		;~ waitClipboard(0)
		;~ source := Clipboard
		;~ StringSplit, source, source, `n, `r
		
		;~ Clipboard=
		;~ clip_two=
		
		;~ loop %source0%
		;~ {
			;~ if(A_Index < 5){
				;~ Clipboard:= Clipboard source%A_Index% "`r`n"
				;~ clip_two:= clip_two source%A_Index% "`r`n"
			;~ }else if(A_Index < 300)
				;~ Clipboard:= Clipboard source%A_Index% "`r`n"
			;~ else
				;~ clip_two:= clip_two source%A_Index% "`r`n"
		;~ }
	
	;~ return
	
	
		camelCase()
		Send ^v
	return

	camelCase(source = "qpmz_default_never_used_by_anyone"){
		return genericWordCaseFormatter(source, "", 1, 2)
	}
	
	putSpacesInCamelCase( name ){
		Loop, Parse, name
		{
			if A_LoopField is lower
				case := "L"
			else 
				case := "U"
			
			if(case != currentCase and case = "U" and currentCase != ""){
				output := output " "
			}
			
			currentCase := case
			output := output A_LoopField
		}
		
		return output
	}

	genericWordCaseFormatter(source = "qpmz_default_never_used_by_anyone", replaceWith:="", firstWordFormat = 1, otherWordsFormat = 1){
		if(source = "qpmz_default_never_used_by_anyone"){
			waitClipboard()
			source := Clipboard
			replaceClipboard=1
		}
		
		source := putSpacesInCamelCase(source)
		
		StringReplace, source, source, _, %A_Space%, All
		StringReplace, source, source, -, %A_Space%, All
		StringReplace, source, source, ., %A_Space%, All
		StringReplace, source, source, %A_Space%%A_Space%, %A_Space%, All
		source := RegExReplace(source, "\W+", " ")
		source := Trim(source)
		
		StringSplit, source, source, %A_Space%
		tempz=
		loop %source0%
		{
			if(A_Index = 1)	
				if(firstWordFormat = 1)
					StringLower, tempx, source%A_Index%
				else if(firstWordFormat = 2)
					StringUpper, tempx, source%A_Index%, T
				else if(firstWordFormat = 3)
					StringUpper, tempx, source%A_Index%
				else
					tempx := source%A_Index%
			else
				if(otherWordsFormat = 1)
					StringLower, tempx, source%A_Index%
				else if(otherWordsFormat = 2)
					StringUpper, tempx, source%A_Index%, T
				else if(otherWordsFormat = 3)
					StringUpper, tempx, source%A_Index%
				else
					tempx := source%A_Index%
			
			if(A_Index = 1)	
				tempz:= tempz tempx
			else
				tempz:= tempz replaceWith tempx
		}
		
		if(replaceClipboard=1)
			Clipboard := tempz
		
		return tempz
	}

#if (Stack="15b") ; Add Property
	`::	
	; Safari
	TT_showing:=0
	if(step == 1){
		loop 10
		{
			showTT=1
			gosub, fetchValue
			if(clipboard="Write here")
				clipboard=
			
			if(A_Index!=2 and A_Index!=5)
				Send {Home}^a{BackSpace 30}

			if(A_Index=1 or A_Index=100)
			{
				showTT=0
			}	
			else if(A_Index=2)
			{
				showTT=0	
				;~ SendInput {Raw}cenie
				;~ sleep 2000
				Send {Tab}
			}
			else if(A_Index=3)
			{
				SendInput {Raw}%Clipboard%
				propertyName:=Clipboard
				sleep 200
				Send {Tab}
			}
			else if(A_Index=5)
			{
				SearchAddress:= Clipboard ", Maldives"
				showTT=0
				;~ Send Maldives
				;~ Send {Enter}
				;~ Send {Enter}
				sleep 100
				Send {Tab}
				;~ SendInput {Raw}%Clipboard%
				sleep 100
				Send {Tab}
			}
			else if(A_Index=6)
			{
				SearchAddress:= Clipboard ", " SearchAddress
				SendInput {Raw}%Clipboard%
				sleep 200
				Send {Tab}
				;~ SendInput {Raw}%propertyName%, %SearchAddress%
				;~ sleep 200
				;~ Send {Tab}
			}
			else if(A_Index=7)
			{
				StringReplace, t, Clipboard, % "Maldives Islands, Maldives", % "Maldives", All
				t := propertyName ", " t
				SendInput {Raw}%t%
				sleep 200
				Send {Tab}
				;~ SendInput {Raw}%propertyName%, %SearchAddress%
				;~ sleep 200
				;~ Send {Tab}
			}
			else if(A_Index=9)
			{
				SendInput {Raw}+960 3337996
				sleep 200
				Send {Tab}
				SendInput info@soleasia.com
				sleep 200
				Send {Tab}
				Send info@soleasia.com
				sleep 200
				Send {Tab}
				SendInput {Raw}%Clipboard%
				sleep 200
				Send {Tab}
			}
			else if(A_Index=10)
			{
				;~ Send {Tab}{Space}{Tab}{Space}{Tab 2} ; Green tax $3 and TGST
				Send {Tab} ; No tax for bhutan
				showTT=0
				Send 20
				sleep 200
				Send {Tab}
				Send 0
			}
			else
			{
				SendInput {Raw}%Clipboard%
				sleep 200
				Send {Tab}
			}
			
			if(showTT)
				myTT(Clipboard)

			
			sleep 200
			;~ Send ^vClick 976, 461
		}
	} else if(step == 2){
		
		loop 10
		{
			showTT=1
			gosub, fetchValue
			;~ StringReplace, clipboard, clipboard, `n, <br/>`n, All
			;~ StringReplace, clipboard, clipboard, `r, , All
			if(clipboard="Write here")
				clipboard=
			

			Send {Home}^a{BackSpace 30}

			if(A_Index=99)
			{
				showTT=0
			}
			else if(A_Index=4)
			{
				Send {Enter}
				Sleep 100
				Send {Tab}
			}
			
			if(clipboard!=""){
				StringReplace, Clipboard, Clipboard, % chr(255), , All
				StringReplace, Clipboard, Clipboard, % chr(254), , All
				StringReplace, Clipboard, Clipboard, % chr(253), , All
				temp:=Clipboard
				StringReplace, temp, temp, % "<button type=""button"" class=""c-btn c-btn--primary""><i class=""ficon ficon-14 ficon-chat""></i>ASK THE PROPERTY</button>", % "", All
				  WinClip.Clear()
				  WinClip.SetHTML( "<div style='color: rgb(78, 78, 78); font-family: mallory, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;'>" temp "</div>")
				sleep 200
				Send ^v
				sleep 200
			}
			Send {Tab}
			
			;~ if(showTT)
				;~ myTT(Clipboard)

			
			sleep 200
			;~ Send ^vClick 976, 461
		}
		;~ Send +{Tab 10}
	} else if(step == 3){
		StringSplit, clipboard, clipboard, `n, `r
	
		Loop %clipboard0% {
			Clipboard:=Clipboard%A_Index%
			
			;~ ;SendInput {Raw}%temp%
			Send ^v
			Sleep 200
			Send {Enter}
			Sleep 200
		}
		
		;~ Sleep 100
		;~ Send ^a^c
	} else{
		Send ^{Home}{Down 6}+{Down}{BackSpace}{Up}{Home}{BackSpace 2}{Space}{Up}{Home}+{End}{BackSpace 2}{Home}{BackSpace 2}{Space}

		Send ^{Home}+{End}^b
		Send {Down}{Home}{Right 10}+{End}^b
		Send {Down}{Home}{Right 11}+{End}^b{End}{Enter}
		Send {Down}{Home}{Right 21}+{End}^b{End}{Enter}
		Send {Down}{Home}+{End}^b
	}
	step++
return


	; Property
	TT_showing:=0
	if(step == 1){
		loop 10
		{
			showTT=1
			gosub, fetchValue
			if(clipboard="Write here")
				clipboard=
			
			Send {Home}^a{BackSpace 30}

			if(A_Index=1 or A_Index=100)
			{
				showTT=0
			}	
			else if(A_Index=2)
			{
				showTT=0	
				SendInput {Raw}sole
				sleep 2000
				Send {Tab}
			}
			else if(A_Index=3)
			{
				SendInput {Raw}%Clipboard%
				propertyName:=Clipboard
				sleep 200
				Send {Tab}
			}
			else if(A_Index=5)
			{
				SearchAddress:= Clipboard ", Maldives"
				showTT=0
				Send Maldives
				Send {Enter}
				Send {Enter}
				sleep 2000
				Send {Tab}
				SendInput {Raw}%Clipboard%
				sleep 2000
				Send {Tab}
			}
			else if(A_Index=6)
			{
				SearchAddress:= Clipboard ", " SearchAddress
				SendInput {Raw}%Clipboard%
				sleep 200
				Send {Tab}
				;~ SendInput {Raw}%propertyName%, %SearchAddress%
				;~ sleep 200
				;~ Send {Tab}
			}
			else if(A_Index=9)
			{
				SendInput +960 3337996
				sleep 200
				Send {Tab}
				SendInput info@soleasia.com
				sleep 200
				Send {Tab}
				Send info@soleasia.com
				sleep 200
				Send {Tab}
				SendInput {Raw}%Clipboard%
				sleep 200
				Send {Tab}
			}
			else if(A_Index=10)
			{
				Send {Space}{Tab 2}{Space}{Tab 2}
				showTT=0
				Send 20
				sleep 200
				Send {Tab}
				Send 2
			}
			else
			{
				SendInput {Raw}%Clipboard%
				sleep 200
				Send {Tab}
			}
			
			if(showTT)
				myTT(Clipboard)

			
			sleep 200
			;~ Send ^vClick 976, 461
		}
	} else if(step == 2){
		
		loop 10
		{
			showTT=1
			gosub, fetchValue
			;~ StringReplace, clipboard, clipboard, `n, <br/>`n, All
			;~ StringReplace, clipboard, clipboard, `r, , All
			if(clipboard="Write here")
				clipboard=
			

			Send {Home}^a{BackSpace 30}

			if(A_Index=99)
			{
				showTT=0
			}
			else if(A_Index=4)
			{
				Send {Enter}
				Sleep 100
				Send {Tab}
			}
			
			if(clipboard!=""){
				temp:=Clipboard
				  WinClip.Clear()
				  WinClip.SetHTML( "<div style='color: rgb(78, 78, 78); font-family: mallory, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;'>" temp "</div>")
				sleep 200
				Send ^v
				sleep 200
			}
			Send {Tab}
			
			;~ if(showTT)
				;~ myTT(Clipboard)

			
			sleep 200
			;~ Send ^vClick 976, 461
		}
		;~ Send +{Tab 10}
	} else if(step == 3){
		StringSplit, clipboard, clipboard, `n, `r
	
		Loop %clipboard0% {
			Clipboard:=Clipboard%A_Index%
			
			;~ ;SendInput {Raw}%temp%
			Send ^v
			Sleep 200
			Send {Enter}
			Sleep 200
		}
		
		;~ Sleep 100
		;~ Send ^a^c
	} else{
		Send ^{Home}{Down 6}+{Down}{BackSpace}{Up}{Home}{BackSpace 2}{Space}{Up}{Home}+{End}{BackSpace 2}{Home}{BackSpace 2}{Space}

		Send ^{Home}+{End}^b
		Send {Down}{Home}{Right 10}+{End}^b
		Send {Down}{Home}{Right 11}+{End}^b{End}{Enter}
		Send {Down}{Home}{Right 21}+{End}^b{End}{Enter}
		Send {Down}{Home}+{End}^b
	}
	step++
return


#if (Stack="15c") ; Add Room
	`::
	; Room
	TT_showing:=0
	MouseMove 615, 307
	Click 2
	Sleep 100
	
	loop 9
	{
		showTT=1
		gosub, fetchValue
		
		Send {Home}^a{BackSpace 30}

		if(A_Index=99 or A_Index=100)
		{
			showTT=0
		}
		else if(A_Index=1)
		{
			Send {Tab}
			Clipboard := Trim(Clipboard)
			SendInput {Raw}%Clipboard%
			Send {Tab}
		}
		else if(A_Index=2)
		{
			SendInput {Raw}%Clipboard%
			Send {Tab}
		}
		else if(A_Index=3)
		{
			StringReplace, Clipboard, Clipboard, % " or ", $, All
			StringSplit, Clipboard, Clipboard, $
			Clipboard := Clipboard1
			StringReplace, Clipboard, Clipboard, % " and ", #, All
			StringReplace, Clipboard, Clipboard, % " & ", #, All
			StringSplit, Clipboard, Clipboard, #
			nBeds := SubStr(Clipboard1, 1, 1)
			bedType := SubStr(Clipboard1, 3)
			SendInput {Raw}%nBeds%
			Send {Tab}
			
			Send {Home}^a{BackSpace 30}
			SendInput {Raw}%bedType%
			Send {Tab}
			
			if(!InStr("`n`nBunk bed`nBunk beds`nDouble Bed`nDouble Beds`nInter Connected Bed`nInter Connected Beds`nKing bed`nKing beds`nQueen bed`nQueen beds`nSemi double bed`nSemi double beds`nSingle Bed`nSingle Beds`nSofa Bed`nSofa Beds`nSunflower bed`nSunflower beds`nSuper king bed`nSuper king beds`nTwin bed`nTwin beds`nfuton`nfutons`n", "`n" bedType "`n"))
				MsgBox New Bed Type
			
			if(clipboard0 >= 2){
				Sleep 100
				Send {Enter}
				Sleep 100
				Send {Tab}
				Sleep 100
				nBeds := SubStr(Clipboard2, 1, 1)
				bedType := SubStr(Clipboard2, 3)
				SendInput {Raw}%nBeds%
				Send {Tab}
				
				Send {Home}^a{BackSpace 30}
				SendInput {Raw}%bedType%
				Send {Tab}
				
				if(!InStr("`n`nBunk bed`nBunk beds`nDouble Bed`nDouble Beds`nInter Connected Bed`nInter Connected Beds`nKing bed`nKing beds`nQueen bed`nQueen beds`nSemi double bed`nSemi double beds`nSingle Bed`nSingle Beds`nSofa Bed`nSofa Beds`nSunflower bed`nSunflower beds`nSuper king bed`nSuper king beds`nTwin bed`nTwin beds`nfuton`nfutons`n", "`n" bedType "`n"))
					MsgBox New Bed Type
			}
			if(clipboard0 >= 3){
				Sleep 100
				Send +{Tab 3}
				Sleep 100
				Send {Enter}
				Sleep 100
				Send {Tab 4}
				Sleep 100
				nBeds := SubStr(Clipboard3, 1, 1)
				bedType := SubStr(Clipboard3, 3)
				SendInput {Raw}%nBeds%
				Send {Tab}
				
				Send {Home}^a{BackSpace 30}
				SendInput {Raw}%bedType%
				Send {Tab}
				
				if(!InStr("`n`nBunk bed`nBunk beds`nDouble Bed`nDouble Beds`nInter Connected Bed`nInter Connected Beds`nKing bed`nKing beds`nQueen bed`nQueen beds`nSemi double bed`nSemi double beds`nSingle Bed`nSingle Beds`nSofa Bed`nSofa Beds`nSunflower bed`nSunflower beds`nSuper king bed`nSuper king beds`nTwin bed`nTwin beds`nfuton`nfutons`n", "`n" bedType "`n"))
					MsgBox New Bed Type
			}
			
			if(clipboard0 >= 4){
				MsgBox More than 3 bed types
			}
			
				

			Send {Tab}
		}
		else if(A_Index=4)
		{
			SendInput {Raw}%Clipboard%
			Send {Tab}
		}
		else if(A_Index=5)
		{
			SendInput {Raw}%Clipboard%
			Send {Tab 2}
		}
		else if(A_Index=6)
		{
			if(InStr(Clipboard,"Breakfast") AND InStr(Clipboard,"Lunch") AND InStr(Clipboard,"Dinner") AND InStr(Clipboard,"Beverages"))
				Send {Right 3}{Tab}
			else if(InStr(Clipboard,"All Inclusive"))
				Send {Right 3}{Tab}
			else if(InStr(Clipboard,"Breakfast") AND InStr(Clipboard,"Lunch") AND InStr(Clipboard,"Dinner"))
				Send {Right 1}{Tab}
			else if(InStr(Clipboard,"Breakfast") AND InStr(Clipboard,"Lunch"))
				Send {Space}{Tab}
			else if(InStr(Clipboard,"Breakfast") AND InStr(Clipboard,"Dinner"))
				Send {Space}{Tab}
			else if(InStr(Clipboard,"Breakfast"))
				Send {Right 2}{Tab}
			
			Send {Tab}
		}
		else if(A_Index=7)
		{
			;~ StringReplace, clipboard, clipboard, %A_Space%sq.m., , All
			SendInput {Raw}%Clipboard%
			;~ Send {Tab}
			Send {Tab 2}
		}
		else if(A_Index=8)
		{
			if(Clipboard="Beach view")
				Send {space}
			Send {Tab}

			if(Clipboard="City view")
				Send {space}
			Send {Tab}

			if(Clipboard="Courtyard view")
				Send {space}
			Send {Tab}

			if(Clipboard="Garden view")
				Send {space}
			Send {Tab}
			
			if(Clipboard="Harbor view")
				Send {space}
			Send {Tab}
			
			if(Clipboard="Lagoon view")
				Send {space}
			Send {Tab}
			
			if(Clipboard="Lake view")
				Send {space}
			Send {Tab}
			
			if(Clipboard="Mountain view")
				Send {space}
			Send {Tab}
			
			if(Clipboard="Nature view")
				Send {space}
			Send {Tab}
			
			if(Clipboard="Ocean view")
				Send {space}
			Send {Tab}

			if(Clipboard="Park view")
				Send {space}
			Send {Tab}

			if(Clipboard="Partial ocean view")
				Send {space}
			Send {Tab}

			if(Clipboard="Partial sea view")
				Send {space}
			Send {Tab}

			if(Clipboard="Pool view")
				Send {space}
			Send {Tab}

			if(Clipboard="River view")
				Send {space}
			Send {Tab}

			if(Clipboard="Sea view")
				Send {space}
			Send {Tab}

			if(Clipboard="Street view")
				Send {space}
			Send {Tab}
			
			if(!InStr("`n`nCity view`nStreet view`nPool view`nOcean view`nMountain view`nNature view`nLagoon view`nLake view`nBeach view`nSea view`nGarden View`nHarbor view`nCourtyard view`nPartial ocean view`nPartial sea view`nPark view`nRiver view`n", "`n" Clipboard "`n"))
				MsgBox New view

			;~ Send {Tab 49}
		}
		else if(A_Index=9)
		{
			;~ Send {tab 2}{End}{PGUP 2}
			Send {tab 2}
			Sleep 100
			Send {End}
			StringReplace, clipboard, clipboard, `,, , All
			StringReplace, clipboard, clipboard, $, , All
			StringReplace, clipboard, clipboard, %A_Space%, , All
			Sleep 500
			Click 668, 835
			Sleep 100
			Send ^a^v
			;~ SendInput {Raw}%Clipboard%
			;~ Send {Tab}
		}
		else
		{
			SendInput {Raw}%Clipboard%
			sleep 200
			Send {Tab}
		}
		
		if(showTT)
			myTT(Clipboard)

		
		sleep 200
	}
	return

#if (Stack="15d") ; tick property amenitites
	`:: tickPropertyAmenitites()
	
	tickPropertyAmenitites(){
		clipboard=`n%clipboard%`n
		StringReplace, clipboard, clipboard, `r, , All
		
		amenityReplace("Vending machine", "Vending Machine")
		amenityReplace("Free Wi-Fi in all rooms", "Free Wifi")
		amenityReplace("Free Wi-Fi in all rooms!", "Free Wifi")
		amenityReplace("Internet access " Chr(8211) " wireless", "Free Wifi")
		amenityReplace("Car park (on site, free)", "Car park")
		amenityReplace("Private beach", "Private Beach")
		amenityReplace("Diving", "Dive school")
		amenityReplace("Room service [24-hour]", "Room service 24-hour")
		amenityReplace("Currency exchange", "Currency Exchange")
		amenityReplace("Smoking area", "Smoking Area")
		amenityReplace("Gift/souvenir shop", "Gift / Souvenir Shop")
		amenityReplace("Safety deposit boxes", "Safe Deposit Boxes (Reception)")
		amenityReplace("Babysitting service", "Baby sitting service	")
		amenityReplace("Pets allowed", "Pets Allowed")
		amenityReplace("Front desk [24-hour]", "24-hour front desk")
		amenityReplace("Security [24-hour]", "24-hour security")
		amenityReplace("Air conditioning", "Air conditioning")
		amenityReplace("Laptop safe box", "Laptop safe box")
		amenityReplace("Games room", "Games Room")
		amenityReplace("Table tennis", "Table Tennis")
		amenityReplace("Water sports (motorized)", "Water sports - Motorized")
		amenityReplace("Water sports (non-motorized)", "Water sports - Non Motorized")
		amenityReplace("Wind surfing", "Windsurfing")
		amenityReplace("Swimming pool [outdoor]", "Swimming pool")
		amenityReplace("Daily newspaper", "Newspapers")
		amenityReplace("Wi-Fi [free]", "Free Wifi")
		amenityReplace("Tennis court", "Tennis Court")
		amenityReplace("Kids club", "Kids Club")
		amenityReplace("Playground", "Children's playground")
		amenityReplace("Private pool", "Swimming pool")
		amenityReplace("Internet access ? wireless", "Free Wifi")
		amenityReplace("Dart board", "Dart Board")
		amenityReplace("Badminton court", "Badminton Courts")
		amenityReplace("Complimentary instant coffee", "Coffee/tea maker")
		amenityReplace("Separate shower and bathtub", "Separate shower and tub")
		amenityReplace("Free bottled water", "Complimentary bottled water")
		amenityReplace("Car park (on site)", "Car park")
		amenityReplace("Breakfast [free]", "Free Breakfast")
		amenityReplace("car park free of charge", "Car park")
		amenityReplace("Separate shower/bathtub", "Separate shower and tub")
		amenityReplace("Game room", "Games Room")
		amenityReplace("Welcome (English)", "English")
		amenityReplace("Welcome (Nepali)", "Nepali")
		amenityReplace("Xin ch?o! (Vietnamese)", "Vietnamese")
		amenityReplace("Welcome (Filipino)", "Filipino")
		amenityReplace("Welcome (Sinhala)", "Sinhala")
		amenityReplace("Welcome (Hindi)", "Hindi")
		amenityReplace("Welcome (Tamil)", "Tamil")
		amenityReplace("Dobrodo?li (Slovenian)", "Slovenian")
		amenityReplace("?? (Chinese [Mandarin])", "Chinese [Mandarin]")
		amenityReplace("Willkommen! (German)", "German")
		amenityReplace("???????????? (Russian)", "Russian")
		amenityReplace("", "")
						
		StringSplit,clipboard,clipboard,`n,`r
		amenities=
		Loop %clipboard0%
		{
			if(clipboard%A_Index% != ""){
				if(A_Index != clipboard0)
					amenities := amenities clipboard%A_Index% "#"
				else
					amenities := amenities clipboard%A_Index%
			}
		}
		
		
		Clipboard=$('.amenity_four_rows > input').prop('checked',false);var str = "%amenities%";`nvar str_array = str.split('#');`n`nvar missingAmenities = "";`n`nfor(var i = 0; i < str_array.length; i++) {`n   str_array[i] = str_array[i].replace(/^\s*/, "").replace(/\s*$/, "");`n   `n   if(str_array[i] != ""){`n	   if($('.amenity_four_rows:contains("' + str_array[i] + '") > input').length == 0)`n			missingAmenities += str_array[i] + "\n";`n	   $('.amenity_four_rows:contains("' + str_array[i] + '") > input').prop('checked',true)`n}`n}`n`nif(missingAmenities != "")`n	prompt("These amenities are missing \n\n", missingAmenities);`n
		;~ MsgBox %Clipboard%
	return
	}
	
#if (Stack="15e") ; generic clipFetch
	`:: ; next
		fetchValue(1, 0, 1)
		SendInput {Raw}%Clipboard%
		Sleep 100
		;~ Send {tab}
	return

	+`:: ; prev
		fetchValue(1, 0, 0)
		SendInput {Raw}%Clipboard%
		Sleep 100
		;~ Send {tab}
	return
	
	fetchValue(toClipboard = 0, skipBlanks = 0, next = 1, isRecursiveRun = 0){
		global clipCells_A_Index, clipCells0, clipList_A_Index
		status := "success"

		Loop {
			if(next)
				clipCells_A_Index++
			else
				clipCells_A_Index--
			
			if (clipCells_A_Index > clipCells0 or clipCells_A_Index < 1) {
				if(! isRecursiveRun){
					if(clipCells_A_Index < 1){
						clipList_A_Index -= 2
						success := ClipLoad()
						clipCells_A_Index := clipCells0 + 1
					}else
						success := ClipLoad()
					
					if(success)
                        return fetchValue(toClipboard, skipBlanks, next, 1)
                    status := "fail"
				}
				value := ""
				;~ status := "fail"
				break
			}
			
			value := clipCells%clipCells_A_Index%
			
			if(skipBlanks){
				if (RegExMatch(value, "\w"))
					break
			}else
				break
		}
		
		if(toClipboard){
			Clipboard := value
			myTT("Clipboard", 1)
			Sleep 100
		}

		return {value: value, status: status}
	}


#if (Stack="15f") ; tick room amenities
	`::	tickRoomAmenities()
	
	tickRoomAmenities(){
			clipboard=`n%clipboard%`n
			StringReplace, clipboard, clipboard, `r, , All
			
			amenityReplace("Wi-Fi [free]", "Wi-Fi in the room")
			amenityReplace("Free Wi-Fi in all rooms!", "Wi-Fi in the room")
			amenityReplace("Free Wi-Fi in all rooms", "Wi-Fi in the room")
			amenityReplace("Toiletries", "Basic toiletries")
			amenityReplace("Towels", "Bath towel")
			amenityReplace("Bathrobes", "Bathrobes, slippers")
			amenityReplace("Satellite/cable channels", "Cable TV")
			amenityReplace("Coffee/tea maker", "Coffee / Tea Facility")
			amenityReplace("DVD/CD player", "DVD player")
			amenityReplace("In-room safe box", "In-Room safe")
			amenityReplace("Refrigerator", "Kitchenette")
			amenityReplace("TV [flat screen]", "Television")
			amenityReplace("Desk", "Writing desk")
			amenityReplace("Alarm clock", "Alarm Clock")
			amenityReplace("Complimentary bottled water", "Complimentary Bottled water")
			amenityReplace("Complimentary instant coffee", "Coffee / Tea Facility")
			amenityReplace("Complimentary tea", "Coffee / Tea Facility")
			amenityReplace("Mini bar", "Mini Bar")
			amenityReplace("Ironing facilities", "Ironing Facilities")
			amenityReplace("Bathroom phone", "Bathroom Telephone")
			amenityReplace("Internet access ? wireless", "Wi-Fi in the room")
			amenityReplace("Fax machine", "")
			amenityReplace("Free bottled water", "Complimentary Bottled water")
			amenityReplace("Scale", "Weighing scale")
			amenityReplace("", "")
							
			StringSplit,clipboard,clipboard,`n,`r
			amenities=
			Loop %clipboard0%
			{
				if(clipboard%A_Index% != ""){
					if(A_Index != clipboard0)
						amenities := amenities clipboard%A_Index% "#"
					else
						amenities := amenities clipboard%A_Index%
				}
			}
			
			
			Clipboard=$('.amenity_four_rows > input').prop('checked',false);var str = "%amenities%";`nvar str_array = str.split('#');`n`nvar missingAmenities = "";`n`nfor(var i = 0; i < str_array.length; i++) {`n   str_array[i] = str_array[i].replace(/^\s*/, "").replace(/\s*$/, "");`n   `n   if(str_array[i] != ""){`n	   if($('.amenity_four_rows:contains("' + str_array[i] + '") > input').length == 0)`n			missingAmenities += str_array[i] + "\n";`n	   $('.amenity_four_rows:contains("' + str_array[i] + '") > input').prop('checked',true)`n}`n}`n`nif(missingAmenities != "")`n	prompt("These amenities are missing \n\n", missingAmenities);`n$('#file_select').focus()`;`n
			;~ MsgBox %Clipboard%
		return
	}
	
	amenityMatch(amenity){	
		amenity=`n%amenity%`n
		if(InStr(Clipboard,amenity))
			output:=true
		else
			output:=false
		
		return output
	}

	amenityReplace(needle, replacement){
		StringReplace, clipboard, clipboard, `n%needle%`n, `n%replacement%`n, All
	}

#if (Stack="15g") ; Download images
	`::
		FileCreateDir, % A_Desktop "\SoleAsia\New folder\Featured"

		StringSplit, clipboard, clipboard, `n, `r
		loop %clipboard0%
		{
			temp:= Clipboard%A_Index%
			if(A_Index = 1)
				run % A_Desktop "\SoleAsia\download.exe " temp " /notime /overwrite /output:""" A_Desktop "\SoleAsia\New folder\Featured"""
			else
				run % A_Desktop "\SoleAsia\download.exe " temp " /notime /overwrite /output:""" A_Desktop "\SoleAsia\New folder"""
		}
	return
		
#if (Stack="15h") ; Fill property template
	`::
		Send ^{Home}
		
		Send {Down 5}
		Send {Home}+{End}+{Left}
		gosub, fetchValue
		Sleep 100
		Send ^v
		Sleep 100
		
		Send {Down 9}
		Send {Home}+{End}+{Left}
		gosub, fetchValue
		Sleep 100
		Send ^v
		Sleep 100
		
		Send {Down 4}
		Send {Home}+{End}+{Left}
		gosub, fetchValue
		Sleep 100
		Send ^v
		Sleep 100
		
		Send {Down 6}
		Send {Home}+{End}+{Left}
		gosub, fetchValue
		Sleep 100
		Send ^v
		Sleep 200

		Send {Down 16}
		Send {Home}+{End}+{Left}
		gosub, fetchValue
		;~ tempbr=<br>`r
		;~ StringReplace, clipboard, clipboard, `r, %tempbr%, All
		Sleep 100
		Send ^v
		Sleep 200
		
		Send {Down 2}
		Send {Home}+{End}+{Left}
		gosub, fetchValue
		Sleep 100
		Send ^v
		Sleep 200

		Send {Down 2}
		Send {Home}+{End}+{Left}
		gosub, fetchValue
		Sleep 100
		Send ^v
		Sleep 100
	return
	
#if (Stack="11m") ; Copy coordinates in Corel Draw
	`::
	TT_showing:=0
	if(switch="")
		switch = 1
	
	if(switch=1){
		clipList=
		
		Clipboard=
		Send ^a^c
		mergeClipboard(0)
		
		Clipboard=
		Send ^a^c
		mergeClipboard(0)
		
		Clipboard=
		Send ^a^c
		mergeClipboard(0)
		
		Clipboard=
		Send ^a^c
		mergeClipboard(0)
		
		
	}else if(switch=2){
		StringSplit, clipList, clipList, `n
		
		Send ^a%clipList1%{Tab}
		Send ^a%clipList2%{Tab}
		Send ^a%clipList3%{Tab}
		Send ^a%clipList4%{Tab}
		
	
		switch = 0
		myTT("Reloaded")
	}
	
	switch++
	
return

#if (Stack="15a") ; Send datetime
	`:: sendDatetime()
	
	sendDatetime() {
		date_time := A_yyyy "-" A_MM "-" A_DD "-" A_Hour ":" A_Min
		Clipboard:= date_time
		Send ^v
		Sleep 300
		Clipboard := A_yyyy "_" A_MM "_" A_DD
		
		file := "C:\xampp\htdocs\eCouncil\web\protected\components\AccessController.php"
		FileRead, content, %file%
		content:= RegExReplace(content, ")(\$GLOBALS\[\""commit_date\""\] \= \').*(\'\;)", "$1" date_time "$2")
		fileWrite( content, file )
	}
	
		;~ waitClipboard()
		
		;~ formData:= Clipboard
		;~ StringSplit, formData, formData, `n, `r
		;~ formData=

		;~ Loop %formData0% {
			;~ t := formData%A_Index%
		
			;~ output := RegExReplace(formData%A_Index%, "s)^(\w\d{2,2}[.]?\d?) (.*)$", "$1`t$2")
			
			;~ if(output != formData%A_Index%)
				;~ formData := formData output "`n"
			
		;~ }
		
		;~ Clipboard := formData
	;~ return
	

	
#if (Stack="15i") ; Request in chrome to JS
	`::
		Send ^a
		waitClipboard(1, 0)

		requestUrl:= RegExReplace(Clipboard, "s)^Request URL: ([^\r\n]*?)\R.*", "$1")
		requestMethod:= RegExReplace(Clipboard, "s).*\RRequest Method: ([^\r\n]*?)\R.*", "$1")
		requestMethod := requestMethod = "POST" ? "post" : requestMethod
		requestMethod := requestMethod = "GET" ? "get" : requestMethod
		
		formData:= RegExReplace(Clipboard, "si).*\RUser-Agent: [^\r\n]*?\R(.*)", "$1")
		formData := formData = Clipboard ? "" : formData
		
		formData := runScaffold( "? value1 ?? value2 ?`n", formData, "MA", 1, 2)
		
		StringSplit, formData, formData, `n, `r
		formData=
		ajax = 0
				
		Loop %formData0% {
			t := formData%A_Index%
			if(A_Index = formData0)
				formData%A_Index% := RegExReplace(formData%A_Index%, "s)^([^:]+): ([^\r\n]*)", "    '$1': ""$2""`n")
			else
				formData%A_Index% := RegExReplace(formData%A_Index%, "s)^([^:]+): ([^\r\n]*)", "    '$1': ""$2"",`n")
			formData := formData formData%A_Index%
			
			; Check if ajax
			if(A_Index = 1 and InStr(formData%A_Index%, "XMLHttpRequest"))
				ajax = 1
		}
		
		if(ajax)
			Clipboard := "$." requestMethod "(`n"
		else
			Clipboard := "nonAjaxHttpQwzx(`n`t""" requestMethod """,`n"
		
		Clipboard := Clipboard """" requestUrl """,`n{ `n" formData " }`n)`n//.done(function( data ) {console.log(data);`n// });`n`n`nfunction nonAjaxHttpQwzx(method, url, data) {`n    'use strict'`;`n    var form`;`n`n    form = $('<form />'`, {`n        action`: url`,`n        method`: method`,`n        style`: 'display`: none`;'`n    })`;`n`n    var data = data`;`n`n    if (typeof data !== 'undefined' && data !== null) {`n        $.each(data`, function (name`, value) {`n            $('<input />'`, {`n                type`: 'hidden'`,`n                name`: name`,`n                value`: value`n            }).appendTo(form)`;`n        })`;`n    }`n    form.appendTo('body').submit()`;`n}"
		;~ StringReplace, Clipboard, Clipboard, % "http://localhost/SIS.Web", % "https://makudi.egov.mv/admin", All
		;~ StringReplace, Clipboard, Clipboard, % "http://localhost/SIS.Web", % "https://tr.egov.mv/makudi", All
		myTT(Clipboard)
	return
	
		StringReplace, Clipboard, Clipboard, URL:, , All
		StringReplace, Clipboard, Clipboard, `n, , All
		StringReplace, Clipboard, Clipboard, `r, , All
		temp= $.post( "%Clipboard%",
		Clipboard=
		Send ^c
		ClipWait, 2
		StringSplit, clipboard, clipboard, `n, `r
		temp := temp "`n{`n"
		
		Loop %clipboard0% {
			StringSplit, clipboard%A_Index%A, clipboard%A_Index%, :
			temp:= temp "'" clipboard%A_Index%A1 "':'" clipboard%A_Index%A2 "',`n"
		}
		
		clipboard := temp "})"
		myTT("done")
	return

	
#if (Stack="15j") ; create a property
	`::
		Clipboard=$.post( "https://www.soleasia.com/bookingadmin/properties/listing/id:",`n{`n'_method':'POST',`n'_method':'POST',`n'fromtab':'tab',`n'data[Property][search]':'sunsign',`n'data[Property][user]':'46',`n'data[Property][name]':'sdfsdf',`n'data[Property][propertyType]':'12',`n'data[Property][country]':'136',`n'data[Property][state]':'15',`n'data[Property][city]':'34',`n'data[Property][address]':'sunfront',`n'data[Property][zip]':'',`n'data[Property][phone_no]':'2343',`n'data[Property][email]':'sdfs@sdfsd.com',`n'data[Property][admin_email]':'sdfs@sdfsd.com',`n'data[Property][rating]':'3',`n'payments_type[]':'2',`n'data[Property][Tax][]':'44',`n'data[Property][Tax][]':'64',`n'data[Property][commision]':'32',`n'data[Property][latitude]':'4.1758374',`n'data[Property][longitude]':'73.50572710000006',`n'save':'',`n})
	return

#if (Stack="15k") ; run selenium test
	;~ ^s::
		;~ if(location = "NCIT"){
			;~ IfWinActive, ahk_class PX_WINDOW_CLASS ahk_exe sublime_text.exe
			;~ {
				;~ Send ^s
				
				;~ WinActivate, % "ahk_class TScpCommanderForm ahk_exe WinSCP.exe"
				;~ WinWaitActive, % "ahk_class TScpCommanderForm ahk_exe WinSCP.exe", , 2
				;~ IfWinActive, % "ahk_class TScpCommanderForm ahk_exe WinSCP.exe"
				;~ {
					;~ Send {f5}
					;~ Sleep 100
					;~ Send {Enter}
				;~ }
				
				;~ WinActivate, % "ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe"
				;~ WinWaitActive, % "ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe", , 2
				;~ IfWinActive, % "ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe"
				;~ {
					
				;~ }
			;~ }
		;~ }else{
			filename_v_15k =
			IfWinActive, event_register.php ahk_class PX_WINDOW_CLASS ahk_exe sublime_text.exe
				filename_v_15k = event_register.php
		
			IfWinActive, header.php ahk_class PX_WINDOW_CLASS ahk_exe sublime_text.exe
				filename_v_15k = header.php
		
			IfWinActive, event.class.php ahk_class PX_WINDOW_CLASS ahk_exe sublime_text.exe
				filename_v_15k = event.class.php
			
			
			if(filename_v_15k = ""){
				myTT("no match")
				return
			}
		
			Send ^a
			waitClipboard()
			WinActivate, % filename_v_15k " - cPanel File Manager v3 - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe"
			WinWaitActive, % filename_v_15k " - cPanel File Manager v3 - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe", , 2
			IfWinActive, % filename_v_15k " - cPanel File Manager v3 - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe"
			{
				Click 248, 354
				Sleep 100
				Send ^a
				Send ^v
				Sleep 100
				Click 1799, 97
			}
			WinActivate, India Expo - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
			WinWaitActive, India Expo - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe, , 2
			Send ^{f5}
		;~ }
	return

	F12:: camelCase()
	
	`::
		; copy css selector from chrome
		IfWinActive, ahk_exe chrome.exe
		{
			Click, right
			Sleep 100
			Send cc{Right}
			Sleep 100
			Clipboard=
			Send cc{Enter}
			Sleep 1000
			
			waitClipboard(0)
			StringReplace, Clipboard, Clipboard, `n, , All
			StringReplace, Clipboard, Clipboard, `r, , All
			;~ goToEndOfCliplist()
			;~ mergeClipboard(0)
			;~ mergeClipboard(0)
			
			;~ scaffold_template =`              "? value1 ?"+`n
			scaffold_template =`        .waitForElementByCss('? value1 ?')`r`n        .click()`r`n
			;~ scaffold_template =`    .waitForConditionInBrowser("$('? value1 ?').text().replace(',','').match(/\\d+\\.?\\d*/)[0]*1 == "`n        + total +";", 1000) // Assert total`n
			;~ scaffold_template =`    .eval("$('? value1 ?').val("+property.rm_nRooms+");")`n
			;~ scaffold_template =`$('? value1 ?').val()
			;~ scaffold_template =`$('? value1 ?')
			;~ scaffold_template =round(? value1 ?, decimalPlaces)
			;~ scaffold_template =output += $('? value1 ?').val() + "\t";`n
			;~ scaffold_template =$('? value1 ?').text()
			;~ scaffold_template =$('? value1 ?').hide();
			;~ scaffold_template =$('? value1 ?')
			printUsingScaffold("C")
		}else{
			WinActivate, ahk_exe chrome.exe
		}
	return
	
	+`::
		IfWinActive, ahk_class PX_WINDOW_CLASS ahk_exe sublime_text.exe
		{
			Send ^s
			Sleep 500
		}
		
		test_par:= "eCouncil-test"
	
		; run test using selenium
		IfWinNotExist, ahk_exe cmd.exe
		{
			Run cmd
			WinWaitActive, ahk_exe cmd.exe
			Send selenium-standalone start{Enter}
			
			WinActivate, ahk_exe SciTE.exe
			Run cmd
			WinWaitActive, ahk_exe cmd.exe
			Send cd /D C:\Users\hammadh.a\Downloads\selenium-old{Enter}
		}
		WinActivate, ahk_exe cmd.exe
		WinWaitActive, ahk_exe cmd.exe
		WinMove, ahk_exe cmd.exe, , -3, 515, 753, 539
		Send npm run %test_par%{Enter}
		WinActivate, ahk_exe chrome.exe
		WinMove, ahk_exe chrome.exe, , 287, 0, 1637, 1167
	return
	
	^`::
		;~ scaffold_template =`    .eval("$('? value1 ?').val("+property.rm_nRooms+");")`n
		scaffold_template =`    .sleep(1000)`n    .waitForElementByCss('? value1 ?')`n    .click()`n
		printUsingScaffold()
	return
	
	;~ `;:: ; make js safe for chrome console
		t := Clipboard
		StringReplace, t, t, % "\\", % "\", All
		StringReplace, t, t, % "\""", % """", All
		Clipboard := t
	return

#if (Stack="15m") ;Grab Articles for TTS Reader mode 
	`:: 
		mergeClipboard()
		Sleep 100
		Send ^w
	return
	
	F8:: ; close previous tab in chrome \\** For quora.com
		Send ^{PGUP}
		Sleep 100
		Send ^w
		Sleep 100
		Send ^{PGDN}
	return

	F1:: Send {End} ; Go to end \\** To go to end of article

	F2::
	XButton1::	
		SetKeyDelay, 100
		Click 3731, 830
		Sleep 100
		Send {Home}
		MouseMove 3470, 640
		Click, 2
		Send ^+{End}
		Sleep 100
		
		waitClipboard()
		Clipboard:= RegExReplace(Clipboard, "s)^(.*?\R){2}(.*)", "$2")
		StringSplit, Clipboard, Clipboard, `n, `r
		Clipboard:= RegExReplace(Clipboard, "s)^((.*?\R){" Clipboard0-7 "})(.*)", "$1")
		mergeClipboard(0)
		
		Sleep 100
		Click 3508, 394
		SetKeyDelay, 10
	return

#if (Stack="15n") ; Create Fake Room 
	`::
		;fake room
		Send {Tab}
		Send {Down}{Tab}
		Send 0{Tab}
		Send {Down}{Tab}
		Send {Down}{Tab}
		Send {Tab}
		Send {Down}{Tab}
		Send {Tab}
		Send {Tab}
		Send 100 sqft{Tab}
	return


#if (Stack="15r") ; Toggle Always on top
	`:: WinSet, AlwaysOnTop, toggle, A

#if (Stack="15o") ; Go to previous window
	`:: goToPreviousWindow()
	
	goToPreviousWindow(){
		result:= shiftwin(2)

		sleep 50
		Loop  ; Since no number is specified with it, this is an infinite loop unless "break" or "return" is encountered inside.
		{
			accent := 0
			alt := 0
			
			if GetKeyState("``", "P")
				accent := 1
			if GetKeyState("LAlt", "P")
				alt := 1
			
			if(alt and accent)
				WinActivate, % "ahk_id " result.3
			else if(accent)
				WinActivate, % "ahk_id " result.2
			else{
				WinActivate, % "ahk_id " result.1
				if(! alt)
					break
			}
			sleep 10
		}
	}

	goToPreviousWindow2(){
		global prevWindowActive_g
		result:= shiftwin(2)
		WinActivate, % "ahk_id " result.2
		prevWindowActive_g := 1

		sleep 200
		Loop  ; Since no number is specified with it, this is an infinite loop unless "break" or "return" is encountered inside.
		{
			if( GetKeyState("F", "P")) {
				prevWindowActive_g++
				if(prevWindowActive_g = 2) {
					WinActivate, % "ahk_id " result.1
					WinWaitActive, % "ahk_id " result.1, , 1
					Send {Alt Down}{Tab}
				} else if(prevWindowActive_g > 2) {
					Send {Tab}
				}
				
				sleep 150
			}
			
			if( !GetKeyState("D", "P") ) {
				if(prevWindowActive_g = 1) {
					WinActivate, % "ahk_id " result.1
				} else {
					Send {Alt Up}
				}
				
				break
			}
			sleep 10
		}
		prevWindowActive_g := 0
	}

#IfWinNotActive, Decision Tree v2 ahk_class AutoHotkeyGUI
	!;:: 
		WinActivate, Decision Tree v2 ahk_class AutoHotkeyGUI
		ControlFocus, Edit2, Decision Tree v2 ahk_class AutoHotkeyGUI
		Send ^a
	return
	
;~ #if (Stack != "15am") ; not scaffolding mode 
#if
	CapsLock::
			Stack:="15am"
			Manager()
			myTT("Scaffoldin mode")
			scaffold_mode_g = 0
		return
	
#if
	^+;:: ; set clip_two
		oldClipboard := Clipboard
		waitClipboard()
		if(Clipboard="")
			Clipboard:=oldClipboard
		clip_two := Clipboard
		scaffold_template := Clipboard
	return	
		
	^;:: ; get clip_two
		old_clip:=Clipboard
		Clipboard:=clip_two
		Sleep 100
		Send ^v
		;~ SendInput {Raw}%clip_two%
		Sleep 100
		Clipboard:=old_clip
	return

	;~ f::
	;~ !`::
		;~ oldClipboard := Clipboard
		;~ waitClipboard()
		;~ if(Clipboard="")
			;~ Clipboard:=oldClipboard
		;~ mergeClipboard(0)
	;~ return
	
	;~ `::
	;~ return
	
	
	;~ ^!;::
		;Send ^a
		;Sleep 100
		;~ printUsingScaffold("")
	;~ return

	;~ ~^s:: saveCodeAndRefreshChrome() ;save code and refresh chrome