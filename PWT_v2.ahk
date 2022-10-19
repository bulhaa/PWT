;~ 10.241.12.140
Process, Close, dota2.exe
;~ Process, Close, explorer.exe

;~ iniClipList= one`t`ttwo`n`nthree`tfour`n

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;~ g_configurations:= "location, lastBackupDate, laravel_test_filter, clip_two, Stack, Picture, clipList, clipList_A_Index, scaffold_template, lastClockInDate, g_roomtypes, g_propertynames, ecouncil_role_id, ecouncil_action_id"
g_configurations:= "location, lastBackupDate, laravel_test_filter, clip_two, Stack, Picture, clipList_A_Index, scaffold_template, lastClockInDate, g_roomtypes, g_propertynames, ecouncil_role_id, ecouncil_action_id, case_permission_id"

g_configurations := g_configurations ", dbCache_users, dbCache_cases, dbCache_organisations, dbCache_organisation_types, dbCache_countries, dbCache_teams, dbCache_statuses, dbCache_origins, dbCache_priorities, dbCache_case_items, dbCache_case_item_types, dbCache_gender_types, dbCache_tasks, dbCache_case_users, dbCache_case_user_types, dbCache_primaryKey_users, dbCache_primaryKey_cases, dbCache_primaryKey_organisations, dbCache_primaryKey_organisation_types, dbCache_primaryKey_countries, dbCache_primaryKey_teams, dbCache_primaryKey_statuses, dbCache_primaryKey_origins, dbCache_primaryKey_priorities, dbCache_primaryKey_case_items, dbCache_primaryKey_case_item_types, dbCache_primaryKey_gender_types, dbCache_primaryKey_tasks, dbCache_primaryKey_case_users, dbCache_primaryKey_case_user_types, dbCache_individuals, dbCache_primaryKey_individuals, dbCache_task_statuses, dbCache_primaryKey_task_statuses, dbCache_electronic_signatures, dbCache_primaryKey_electronic_signatures, dbCache_model_types, dbCache_primaryKey_model_types, dbCache_roles, dbCache_primaryKey_roles, dbCache_permissions, dbCache_primaryKey_permissions, dbCache_role_permission, dbCache_primaryKey_role_permission, dbCache_user_role, dbCache_primaryKey_user_role, dbCache_audits, dbCache_primaryKey_audits, dbCache_activity_log, dbCache_primaryKey_activity_log, dbCache_confidentiality_classes, dbCache_primaryKey_sensitivities, dbCache_tags, dbCache_primaryKey_tags, dbCache_checklists, dbCache_primaryKey_checklists, dbCache_task_comments, dbCache_primaryKey_task_comments, dbCache_task_tags, dbCache_primaryKey_task_tags, dbCache_task_users, dbCache_primaryKey_task_users"

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
	%t%backup := %t%
}

if(location = "ERROR")
	MsgBox Could not load location

;~ StringSplit, clipList, clipList, `n, `r
clipList_A_Index := 0
	
if(iniClipList != ""){
	clipList .= "`n" iniClipList
}

;~ Stack := "15am" ; scaffolding mode

recentFunctions := Object()	; creates initially empty stack

#Include PWT_v2_include.ahk

coreStacks:= "Send datetime,15a;generic clipFetch,15e,get value;Request in chrome to javascript,15i,js;scaffolding mode,15am;clipLoad,15af;Go to previous window,15o;camelCase,15p;send raw clipboard,15q;Toggle Always on top,15r;needle in haystack finder,15s;make/undo file or folder read-only system hidden,15t;replace blank lines,15u;load new search configuration from external file,15v;CapitalCamelCase,15w;snake_case,15x;Toogle Hide Window,15ac;Get First 50000 characters,15ad;fetchRow,15ae,get;lower case,15ag;Title case,15ah;All Title Case,15ai;CAPITAL CASE,15aj,upper;Go to reference,15ak;clipwait,15al;merge multi-line element,15bh;create new stack,15bo,make;go to end of clipList,11o;clear clipList,11p;set value0,11q;restore clipList_A_Index,11r;prices,11t;snake-case-with-hyphen,11v;Remove useless text with regex,11w;edirectory,12b;Remove Lines,12i;RequireWinActive,13f;Check File Size,13i;"
personalStacks:= "r,12r;c,12v;a,11y;right click,13m;records mv notes,14b;"
infrequentStacks:= "Untick checkboxes,11b;Remove network adapters,11f;Copy coordinates in Corel Draw,11m;none,11n;First 1000 characters to localhost,11s;grab links from chrome,11x;go to next folder,12c;telnet,12h;Export SEFM members,12j;Adjust numbers,12l;screenshot chrome,12n;mouse click,12u;string replace,12x;windows start menu directory,12q;git remote add origin,13k;windows host file,13o;gitlab git.egov.mv,14d;"
soleAsiaStacks:= "Add Property,15b;Add Room,15c;tick property amenitites,15d;tick room amenities,15f;Download images,15g;Fill property template,15h;create a property,15j;Create Fake Room,15n;Get Property Amenities from SoleAsia,11c;get room amenities list,11d;Get Room Information,11e;get room amenities from soleasia,11g;Get Property Information,11h;Get Property amenities list,11i;Get image list,11j;Get property information from SoleAsia,11k;Open each room type,11l;convert to property function,15bn;save property description with raw html,12d;make number of rooms 0,12e;filter sent emails in gmail,12f;delete photos from SoleAsia,12k;property images from booking.com,13d;"
seleniumStacks:= "run selenium test,15k;install seleniumjs,15aa;"
jsStacks:="console log,15l;jquery ready,13c;map.js npm node,13g;"
ttsStacks:= "Grab Articles for TTS Reader mode,15m;"
eCouncilStacks:= "push eCouncil to git,15y;eCouncil training URL,15z;sync eCouncil folders,15bd;purify,11z;new role,13j;ecouncil roles,13l;"
gitStacks:= "Git commands,15ab;Git GUI,11a;Git export log to csv,12g;"
laravelStacks:= "laravel make events,15an;laravel make notification,15ao;laravel make test,15ap;laravel refresh classes,15ar;laravel refresh database seed,15as,db;laravel run a specific seeder,15at;laravel clear configuration,15au;laravel create policy,15av;laravel test increase memory limit,15aw;laravel dd session,15ax;laravel run selected test,15ay;laravel remove block comments,15az;laravel add block comments,15ba;laravel open test output in chrome,15be;request in chrome to laravel,11u;php var_dump to console,12o;php null check,12p;laravel make migration,12s;tailwind website,13p;deploy case management,13q;mysql mode,13r;SQLite,13s;laravel pretend migrate,13t;laravel seed db,13u;laravel clear view cache,13v;composer dump autoload,13w;dump laravel data,13x;livewire docs,14c;php,14n;data to seeder,14r;"
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
ncitStacks:= "case manager wireframe,14e;teams,14f;otrs demo,14g;outlook,14h;case manager local,14k;gemen online local,14l;gemen local,14m;hero icons,14o;gemen online TE,14p;eCouncil DB scripts,14q;composer custom php,14s;laravel run tests,14t;laravel test run group,14u;disable xdebug,14v;enable xdebug,14w;php ini,14x;"


allStacks:= coreStacks personalStacks infrequentStacks soleAsiaStacks seleniumStacks jsStacks ttsStacks eCouncilStacks gitStacks laravelStacks nodeJsStacks sisStacks chromeStacks etukuriStacks cSharpStacks sheriStacks fileZillaStacks sublimeStacks yiiStacks vbStacks phpStacks ncitStacks "swap css colors,15bc;gems user,13n;"

zStacks:= allStacks


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
Gui, Add, Pic, x-480 y0 vPic1
Gui, Add, Pic, x-480 y0 vPic2 +0x4000000 
gui, font, , Verdana 
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
Gui, Show, w486 h550 , Decision Tree v2
Gui, +HwndMyGuiHwnd
OnMessage(0x200, "WM_MOUSEMOVE")

OnMessage(0x0100, "WM_KEYUP")

OnMessage(0x14, "WM_ERASEBKGND")

RedPen := DllCall("CreatePen", "int", PS_SOLID:=0, "int", 5, "uint", 0xff)

GuiControl, Hide, MyEdit

xCoord:=A_ScreenWidth-480
if(Picture = "ERROR")
	Picture=%A_ScriptDir%\Wallpaper.jpg
GuiControl,, Pic1, *w%xCoord% *h-1 %Picture%
;~ GuiControl,, Pic2, *w%xCoord% *h-1 %Picture%


GuiControl,, Edit2, % "~" Stack "~"
chooseFirst()


FileRead, WindowList_global, %A_ScriptDir%\WindowList_global.txt
if ErrorLevel
	MyTT("Read Skipped1")


WindowList_global=%WindowList_global%`r`n`r`n%A_Year%%A_MMM%%A_DD% %A_Hour%:%A_Min%

WindowList_globalCounter:=A_Min-1
OnExit, OnExitFunction

if (a_hour=14 and a_min>=0 and PWT_Backed_Up=0)
	MsgBox CheckIn


	DriveGet, Devices2, List, REMOVABLE
	if( WinExist( "Debugging] ahk_class SciTEWindow") )
		MyTT("Debug Mode")
	else
		SetTimer, PeriodicJobsTimer, 100
return




PeriodicJobsTimer:
	if (PeriodicJobsRunning)
		return
	
	if( WinExist( "Debugging] ahk_class SciTEWindow") )
		SetTimer, PeriodicJobsTimer, 60000

	PeriodicJobsRunning:=1
	
	if(WindowList_globalCounter!=A_Min)
	{
		WinGetTitle, Title, A
		WindowList_global=%WindowList_global%`r`n%Title%
	}
	
	WindowList_globalCounter:=A_Min
		

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
































skipFileOrFolder(src_path){
	if(InStr(src_path, "\Notepad++Portable\") or InStr(src_path, "\selenium-js-tester\") or InStr(src_path, "\.git\") or InStr(src_path, "~") or InStr(src_path, "Thumbs.db") or InStr(src_path, "\\wdmycloud\hammadh\hammadh\") or InStr(src_path, "C:\xampp\htdocs\Main\Source\LGAStatsSln\Source\ecouncil\assets\") or InStr(src_path, "C:\xampp\htdocs\eCouncil\eCouncil\web\assets\") or InStr(src_path, "C:\xampp\htdocs\Main\Source\LGAStatsSln\Source\ecouncil\protected\runtime\") or InStr(src_path, "C:\xampp5\htdocs\eCouncil\eCouncil\web\protected\runtime\") or InStr(src_path, ".gitattributes") or InStr(src_path, ".gitignore") or InStr(src_path, "ec.sublime-project") or InStr(src_path, "ec.sublime-workspace") or InStr(src_path, "C:\xampp\htdocs\case-manager\node_modules") or InStr(src_path, "C:\xampp\htdocs\case-manager\storage") or InStr(src_path, "C:\xampp\htdocs\case-manager\vendor") or InStr(src_path, "C:\xampp\htdocs\case-manager\node_modules") or InStr(src_path, "C:\xampp\htdocs\case-manager\storage") or InStr(src_path, "C:\xampp\htdocs\case-manager\vendor"))
		return 1 ; skip file
	else
		return 0 ; don't skip file
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
		StringReplace, destPath, A_LoopFileFullPath, % Source, % Destination, ALL
		if( copyDuplicateChild || not InStr(A_LoopFileFullPath "\", duplicateSource))
		{
			if(! skipFileOrFolder(A_LoopFileFullPath))
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
			}
			
			if(syncChildren){
				StringSplit, A_LoopFileFullPath, A_LoopFileFullPath, \
				destPath:=Destination "\" A_LoopFileFullPath%A_LoopFileFullPath0%
				MyTT("Back up " A_LoopFileFullPath " to " destPath)
				synchronizeCore(A_LoopFileFullPath, destPath, "DR", pAbsent, present)
				synchronizeCore(A_LoopFileFullPath, destPath, "FR", pAbsentChildren, presentChildren)
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
	
	if(loggingStyle)
		TT := TT ": " %TT%
	
	if(TT_showing)
		TT=%TT%`n%Old_TT%

	TT_showing:=1
	t := SubStr(TT, 1, 500)
	t:= RegExReplace(t, "s)^((.*?\R){10}).*", "$1")

	ToolTip % t
	SetTimer, RemoveTT, 4000
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
return



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
return


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
return



	;~ Send {Tab 9}
	;~ Sleep 100
	;~ Send {Space}
;~ return


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
return


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
return

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

#IfWinActive, ahk_class SciTEWindow ahk_exe SciTE.exe
F5::
	Send ^s
	Sleep 100
	Reload
return

OnExitFunction:
	if(a_hour>=6)
		MyTT("CheckOut")

	if(ExStyle)
		WinSet, AlwaysOnTop, Off, ahk_id %currWin%

	loop %g_configurations0%
	{
		t:=g_configurations%A_Index%
		if(%t% != %t%backup){
			%t% := EncodeLinesAndTabs(%t%)
			IniWrite, % %t%, %A_ScriptDir%\PWT_v2.ini, Main, % t
		}
	}

	;~ FileCopy, %A_ScriptDir%\WindowList_global.txt, %A_ScriptDir%\WindowList_global.txt.bkp
	;~ FileDelete, %A_ScriptDir%\WindowList_global.txt
	;~ if ErrorLevel
		;~ MyTT("Delete Fail")
	
	;~ FileAppend, %WindowList_global%, %A_ScriptDir%\WindowList_global.txt
	;~ if ErrorLevel
		;~ MyTT("Append Fail")
	
	;~ if(TT_showing)
		;~ sleep 1000
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

if(Stack="15am") ; scaffolding mode 
	{
		init_DB_Fields()
		scaffoldFiles()
		
		;~ init_DB_Fields(1, 0)
		;~ myTT("refreshed")
		
		Button1_Label=`t`tscaffold_template = ? value1 ?`n`t`tprintUsingScaffold("")`n`n
	}
else if(Stack=0)
	{
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
		Button1_Label=Run cmd`nWinWaitActive, ahk_exe cmd.exe`nSend cd C:\xampp\htdocs\eCouncil\eCouncil{Enter}`nSend "C:\Program Files\Git\cmd\git.exe"  push -u origin3 master{Enter}`n 
		if run 
		{ 
		  Run cmd 
		  WinWaitActive, ahk_exe cmd.exe 
		  Send cd /D C:\xampp\htdocs\eCouncil\eCouncil{Enter} 
		  Send "C:\Program Files\Git\cmd\git.exe"  push -u origin3 master{Enter} 
		} 
	}
else if(Stack="15z") ; eCouncil training URL
	{
		Button1_Label=http://trng01.egov.mv/ecouncil/
		if run
			run http://trng01.egov.mv/ecouncil/
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
		Button1_Label=C`:\xampp\php81\php artisan migrate`:fresh --seed
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
		Button1_Label=php artisan make`:migration create_users_table --create=users
	}
else if(Stack="12g") ; Git export log to csv 
	{
		Button1_Label=cd C`:\xampp\htdocs\eCouncil\eCouncil`n`rgit log --since="last month" --pretty=format`:`%s > log.txt
		;~ Button1_Label=git log --since="last month" --pretty=format`:'`%h`,`%an`,`%ar`,`%s' > log.csv
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
		Button1_Label=SELECT * FROM ``roles`` ORDER BY ``roles``.``role_id`` DESC limit 10`;`nSELECT * FROM ``actions`` ORDER BY ``action_id`` DESC limit 10`;
	}
else if(Stack="13n") ; gems user 
	{
		Button1_Label=A302409
	}
else if(Stack="13o") ; windows host file 
	{
		Button1_Label=C`:\Windows\System32\drivers\etc
	}
else if(Stack="13p") ; tailwind website 
	{
		Button1_Label=https`://www.figma.com/proto/sVmR0Xl1aatqh6uatmNJRk/CMS-v2?node-id=1`%3A2&scaling=min-zoom&page-id=0`%3A1&starting-point-node-id=1`%3A2`nhttps`://laravel.com/docs/9.x/eloquent#soft-deleting`nhttps`://laravel-livewire.com/`nC`:\Users\hammadh.a\Downloads\Code-Generator-main`nhttps`://dev.to/dariusdauskurdis/laravel-8-advanced-crud-livewire-and-tailwind-271l`nhttps`://github.com/spatie/enum`nhttps`://tailwindcomponents.com/`nhttps`://flowbite.com/docs/components/tabs/#`nhttps`://heroicons.com/
	}
else if(Stack="13u") ; laravel seed db 
	{
		Button1_Label=C`:\xampp\php81\php artisan db`:seed`n
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
		run http://localhost/phpmyadmin
	}
else if(Stack="13z") ; tailwinds docs 
	{
		Button1_Label=`https://tailwindcss.com/docs/font-size
		run https://tailwindcss.com/docs/font-size
	}
else if(Stack="14a") ; laravel docs 
	{
		Button1_Label=`https://laravel.com/docs/9.x/deployment#server-configuration
		run https://laravel.com/docs/9.x/deployment#server-configuration
	}
else if(Stack="14b") ; records mv notes 
	{
		Button1_Label=recordsofmaldives.com`n`n`nServerName recordsofmaldives.com`nServerAlias www.recordsofmaldives.com`n`nsudo a2ensite recordsofmaldives.com.conf`n`n`n`ncertbot --apache -d recordsofmaldives.com -d www.recordsofmaldives.com`n`n`nsudo chown -R www-data`:$USER storage`n`ne7eab6c566626e6a5d7388b6c410c818c3cb853aec05702a`n`n`nCREATE USER 'records'@'localhost' IDENTIFIED BY 'iyN6iKtCygUmR8V'`;`n`n`nGRANT CREATE`, ALTER`, DROP`, INSERT`, UPDATE`, DELETE`, SELECT`, REFERENCES`, RELOAD on *.* TO 'records'@'localhost' WITH GRANT OPTION`;`n`ncreate DATABASE records`n`nC`:\xampp\php81\php artisan migrate`:fresh --seed`n`nusermod -aG sudo webadmin`n`nrsync --archive --chown=webadmin`:webadmin ~/.ssh /home/webadmin
	}
else if(Stack="14c") ; livewire docs 
	{
		Button1_Label=`https://laravel-livewire.com/docs/2.x/properties#debouncing-input
		run, https://laravel-livewire.com/docs/2.x/properties#debouncing-input
	}
else if(Stack="14d") ; gitlab git.egov.mv 
	{
		Button1_Label=`https://git.egov.mv/
		run, https://git.egov.mv/
	}
else if(Stack="14e") ; case manager wireframe 
	{
		Button1_Label=https`://www.figma.com/proto/sVmR0Xl1aatqh6uatmNJRk/CMS-v2?node-id=1071`%3A2191&scaling=scale-down-width&page-id=0`%3A1&starting-point-node-id=1`%3A2`n`nhttps`://www.figma.com/proto/sVmR0Xl1aatqh6uatmNJRk/CMS-v2?node-id=343`%3A789&scaling=min-zoom&page-id=0`%3A1&starting-point-node-id=1`%3A2
		;~ run, https`://www.figma.com/proto/sVmR0Xl1aatqh6uatmNJRk/CMS-v2?node-id=1071`%3A2191&scaling=scale-down-width&page-id=0`%3A1&starting-point-node-id=1`%3A2
		run, https`://www.figma.com/file/sVmR0Xl1aatqh6uatmNJRk/CMS-v2?node-id=0`%3A1
	}
else if(Stack="14f") ; teams 
	{
		Button1_Label=`https://teams.microsoft.com/_#/conversations/19:4683f526-d766-4bc9-8a7b-382b3a77dcd5_9529b8a9-30a5-462f-94a3-d662d45fd698@unq.gbl.spaces?ctx=chat
		run, `https://teams.microsoft.com/_#/conversations/19:4683f526-d766-4bc9-8a7b-382b3a77dcd5_9529b8a9-30a5-462f-94a3-d662d45fd698@unq.gbl.spaces?ctx=chat
	}
else if(Stack="14g") ; otrs demo 
	{
		Button1_Label=https`://demo.otrsce.com/
		run, https`://demo.otrsce.com/
	}
else if(Stack="14h") ; outlook 
	{
		Button1_Label=https`://outlook.office.com/mail/sentitems
		run, https`://outlook.office.com/mail/sentitems
	}
else if(Stack="14i") ; chai builder tailwinds 
	{
		Button1_Label=https`://chaibuilder.com/try
		run, https`://chaibuilder.com/try
	}
else if(Stack="14j") ; tailwinds themeforest list 
	{
		Button1_Label=https`://angular-material.fusetheme.com/apps/academy
		run, https`://angular-material.fusetheme.com/apps/academy
	}
else if(Stack="14k") ; case manager local 
	{
		Button1_Label=http`://case-manager.test/login
		run, http`://case-manager.test/login
	}
else if(Stack="14l") ; gemen online local 
	{
		Button1_Label=http`://gemen-online.test/birth-certificates/22/edit
		run, http`://gemen-online.test/birth-certificates/22/edit
	}
else if(Stack="14m") ; gemen local 
	{
		Button1_Label=http`://ecouncil.test/ecouncil/index.php/site/login
		run, http`://ecouncil.test/ecouncil/index.php/site/login
	}
else if(Stack="14n") ; php 
	{
		Button1_Label=<?php var_dump(  )`; die`; ?>
	}
else if(Stack="14o") ; hero icons 
	{
		Button1_Label=https`://heroicons.com/
		Run, https`://heroicons.com/
	}
else if(Stack="14p") ; gemen online TE 
	{
		Button1_Label=https`://gemen.te.egov.mv/birth-records
		Run, https`://gemen.te.egov.mv/birth-records
	}
else if(Stack="14q") ; eCouncil DB scripts 
	{
		Button1_Label=\\10.241.3.108\Backup\Shared_IO\eGovProjects\eCouncil\Deployments\To Production\2022\Pending
		Run, \\10.241.3.108\Backup\Shared_IO\eGovProjects\eCouncil\Deployments\To Production\2022\Pending
	}
else if(Stack="14r") ; data to seeder 
	{
		Button1_Label=`        // dd( json_decode(json_encode(Organisation`:`:all()) ) )`;`n
	}
else if(Stack="14s") ; composer custom php 
	{
		Button1_Label=C`:\xampp\php81\php.exe C`:\ProgramData\ComposerSetup\bin\composer.phar install
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
		FileCopy, C:\xampp\php8\php.ini, C:\xampp\php8\php.ini.bkp
		
		file =C:\xampp\php8\php.ini
		FileRead, content, %file%
		StringReplace, content, content, xdebug.mode = debug, `; xdebug.mode = debug
		
		fileWrite( content, file )
	}
else if(Stack="14w") ; enable xdebug 
	{
		FileCopy, C:\xampp\php8\php.ini, C:\xampp\php8\php.ini.bkp
		
		file =C:\xampp\php8\php.ini
		FileRead, content, %file%
		StringReplace, content, content, `; xdebug.mode = debug, xdebug.mode = debug
		
		fileWrite( content, file )
	}
else if(Stack="14x") ; php ini 
	{
		run, EXPLORER.EXE /select`, "C:\xampp\php8\php.ini"
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
		if(Button1_Label != "")
			Clipboard := Button1_Label
	}else
		GuiControl,, MyEdit, %Stack%
	
	if Button1_TT=
		Button1_TT := Button1_Label

	return Stack
}


	
	
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
		file =C:\xampp\htdocs\case-manager\migrate.sql
		command:= "C:\xampp\php81\php artisan migrate --pretend --no-ansi > " file
		RunWait %comspec% /c "%command%", C:\xampp\htdocs\case-manager
		
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
		file := "C:\xampp\htdocs\case-manager\.env"
		content := "APP_NAME=Case-Manager`nAPP_ENV=local`nAPP_KEY=base64`:Jx7g4xVsDQ6t3cyiacsDmuDgkhvqQi2ICgGh8cFevYA=`nAPP_DEBUG=true`nAPP_URL=http`://case-manager.test`n`nLOG_CHANNEL=stack`nLOG_DEPRECATIONS_CHANNEL=null`nLOG_LEVEL=debug`n`nDB_CONNECTION=sqlite`nDB_DATABASE=C`:\xampp\htdocs\case-manager\database.sqlite`n`n#DB_CONNECTION=mysql`n#DB_DATABASE=case_manager`nDB_HOST=127.0.0.1`nDB_PORT=3306`nDB_USERNAME=root`nDB_PASSWORD=`n`nBROADCAST_DRIVER=log`nCACHE_DRIVER=file`nFILESYSTEM_DISK=local`nQUEUE_CONNECTION=sync`nSESSION_DRIVER=file`nSESSION_LIFETIME=120`n`nMEMCACHED_HOST=127.0.0.1`n`nREDIS_HOST=127.0.0.1`nREDIS_PASSWORD=null`nREDIS_PORT=6379`n`nMAIL_MAILER=smtp`nMAIL_HOST=mailhog`nMAIL_PORT=1025`nMAIL_USERNAME=null`nMAIL_PASSWORD=null`nMAIL_ENCRYPTION=null`nMAIL_FROM_ADDRESS=""hello@example.com""`nMAIL_FROM_NAME=""${APP_NAME}""`n`nAWS_ACCESS_KEY_ID=`nAWS_SECRET_ACCESS_KEY=`nAWS_DEFAULT_REGION=us-east-1`nAWS_BUCKET=`nAWS_USE_PATH_STYLE_ENDPOINT=false`n`nPUSHER_APP_ID=`nPUSHER_APP_KEY=`nPUSHER_APP_SECRET=`nPUSHER_APP_CLUSTER=mt1`n`nMIX_PUSHER_APP_KEY=""${PUSHER_APP_KEY}""`nMIX_PUSHER_APP_CLUSTER=""${PUSHER_APP_CLUSTER}""`n"
		
		
		FileDelete, %file%
		FileAppend, %content%, %file%
	return
	
#if (Stack="13r") ; mysql mode 
	`::
		file := "C:\xampp\htdocs\case-manager\.env"
		content := "APP_NAME=Case-Manager`nAPP_ENV=local`nAPP_KEY=base64`:Jx7g4xVsDQ6t3cyiacsDmuDgkhvqQi2ICgGh8cFevYA=`nAPP_DEBUG=true`nAPP_URL=http`://case-manager.test`n`nLOG_CHANNEL=stack`nLOG_DEPRECATIONS_CHANNEL=null`nLOG_LEVEL=debug`n`n#DB_CONNECTION=sqlite`n#DB_DATABASE=C`:\xampp\htdocs\case-manager\database.sqlite`n`nDB_CONNECTION=mysql`nDB_DATABASE=case_manager`nDB_HOST=127.0.0.1`nDB_PORT=3306`nDB_USERNAME=root`nDB_PASSWORD=`n`nBROADCAST_DRIVER=log`nCACHE_DRIVER=file`nFILESYSTEM_DISK=local`nQUEUE_CONNECTION=sync`nSESSION_DRIVER=file`nSESSION_LIFETIME=120`n`nMEMCACHED_HOST=127.0.0.1`n`nREDIS_HOST=127.0.0.1`nREDIS_PASSWORD=null`nREDIS_PORT=6379`n`nMAIL_MAILER=smtp`nMAIL_HOST=mailhog`nMAIL_PORT=1025`nMAIL_USERNAME=null`nMAIL_PASSWORD=null`nMAIL_ENCRYPTION=null`nMAIL_FROM_ADDRESS=""hello@example.com""`nMAIL_FROM_NAME=""${APP_NAME}""`n`nAWS_ACCESS_KEY_ID=`nAWS_SECRET_ACCESS_KEY=`nAWS_DEFAULT_REGION=us-east-1`nAWS_BUCKET=`nAWS_USE_PATH_STYLE_ENDPOINT=false`n`nPUSHER_APP_ID=`nPUSHER_APP_KEY=`nPUSHER_APP_SECRET=`nPUSHER_APP_CLUSTER=mt1`n`nMIX_PUSHER_APP_KEY=""${PUSHER_APP_KEY}""`nMIX_PUSHER_APP_CLUSTER=""${PUSHER_APP_CLUSTER}""`n"
		
		
		FileDelete, %file%
		FileAppend, %content%, %file%
	return
	
#if (Stack="13q") ; deploy case management 
	`::
		Click 70, 284
		Send {Home}
		Send {Down}
		Send {Down}{Space}
		Send {CtrlDown}
		
		Send {Down}{Space}
		Send {Down}{Space}
		Send {Down}{Space}
		Send {Down}{Space}
		Send {Down}
		Send {Down}{Space}
		Send {Down}{Space}
		Send {Down}{Space}
		Send {Down}
		Send {Down}{Space}
		
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
		Send ^a
		Sleep 100
		waitClipboard()
		t := Clipboard
		;~ t:= RegExReplace(t, "s)(\R).{21,21}(.*\R)", "$1$2")
		;~ t:= RegExReplace(t, ")(\R).{21,21}(.*\R)", "$1$2")
		StringReplace, t, t, % ",", % "`t", All
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
		Send ? value1 ?
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
	
#if (Stack="11s") ; First 1000 characters to localhost 
	`::
		Send ^a
		waitClipboard()
		t := SubStr(Clipboard, 1, 1000)
		Clipboard := SubStr(Clipboard, 1000)
		Send ^v
		FileDelete, C:\xampp\htdocs\read.html
		FileAppend, % "<div style='font-size: 72.8px;'>" t "</div>", C:\xampp\htdocs\read.html
		run, http://localhost/read.html
	return

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
		clipList_A_Index=0
		myTT("clipList cleared")
	return
	
#if (Stack="11o") ; go to end of clipList 
	`:: goToEndOfCliplist()
	goToEndOfCliplist(){
		global
		StringSplit, clipList, clipList, `n, `r
		clipList_A_Index := clipList0
		myTT("Now at end of clipList")
	}
	return
	

#if (Stack="15l") ; console log 
	`::
		mergeClipboard()
		scaffold_template = console.log('? value1 ?: ' + ? value1 ?);
		printUsingScaffold(1)
	return
	
#if (Stack="15bo") ; make new stack 
	`::
		stackPrefix := "14"
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
		
		clipList_A_Index++
		clipCells_A_Index = 0
		
		;~ if(clipList0 = "")
		StringSplit, clipList, clipList, `n, `r
		if(clipList_A_Index > clipList0){
			clipList_A_Index := clipList0
			myTT("Reached end of list")
			clipLine := ""
			return 0
		}else{
			clipLine := clipList%clipList_A_Index%
			StringSplit, clipCells, clipLine, `t, `r`n
            return 1
		}
	}
		
#if (Stack="15al") ; clipwait 
	`::
	
	return
	
	mergeClipboard(copy = 1, encodeAsSingleElement = 0, copyResult = 1) {
		return waitClipboard(copy, 1, encodeAsSingleElement, copyResult)
	}

	waitClipboard(copy = 1, merge = 0, encodeAsSingleElement = 0, copyResult = 1) {
		global clipList, clipList_A_Index
		
		Sleep 100
		
		if(copy = 1)
		{
			oldClipboard := Clipboard
			Clipboard=
			Send ^c
			Sleep 100
		}
		
		ClipWait, 0.5
		;~ Send {Esc}
		
		if !ErrorLevel
		{		
			temp := RegExReplace(Clipboard, "s)^((.*?\R){10}).*", "$1")
			
			if(encodeAsSingleElement)
			{
				StringReplace, Clipboard, Clipboard, `t, % chr(254), All
				StringReplace, Clipboard, Clipboard, `n, % chr(255), All
			}
			
			if(merge){
				if (clipList != "")
					clipList .= "`n" Clipboard
				else
					clipList := Clipboard
				
				StringSplit, clipList, clipList, `n, `r
				
				if(copyResult){
					output=
					loop % clipList0-clipList_A_Index {
						t := clipList_A_Index + A_Index
						if (output != "")
							output .= "`n" clipList%t%
						else
							output := clipList%t%
					}
					Clipboard := output
				}
			}
				
			myTT(temp)
			;~ Send {Esc}{Tab} 
		}
		else{
			MyTT("Clipboard could not be loaded")
			Clipboard := oldClipboard
		}
		
		return Clipboard
	}


#if (Stack="15bd") ; sync eCouncil folders 
	`::
	
		;~ StringReplace, clipboard, clipboard, `r, , All
		;~ StringReplace, clipboard, clipboard, `n, :, All
		;~ StringReplace, clipboard, clipboard, :, `n, All
	;~ return		
		
	
		;~ Source=C:\xampp\htdocs\case-manager
		;~ Destination=C:\xampp\htdocs\case-manager-gitlab
		
		Source=C:\xampp\htdocs\Main\Source\LGAStatsSln\Source\ecouncil
		Destination=C:\xampp\htdocs\eCouncil\eCouncil\web
		
		;~ Source=C:\xampp\htdocs\eCouncil\eCouncil\web
		;~ Destination=C:\xampp\htdocs\Main\Source\LGAStatsSln\Source\ecouncil	
		
		;~ Source=C:\xampp\htdocs\Main\Source\LGAStatsSln\Source\yii
		;~ Destination=C:\xampp\htdocs\eCouncil\eCouncil\yii
			
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

runScaffold( template, data ){
	global clipList, scaffold_template, clipList_A_Index, clipCells0
	
	value0=-1
	clipList := data "`n"
	scaffold_template := template
	clipList_A_Index = 0
	;~ StringSplit, clipList, clipList, `n, `r
	ClipLoad()
	;~ Clipboard=
	output := printUsingScaffold("MA", 1, -1, 1, 0)
	clipList := ""
	scaffold_template := "default"
	clipList_A_Index = 0
	clipCells0 := ""
	return output
}

model_casts( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
	name := scaffoldModel("? valueS1 ?")
	
	if(data_type = "datetime" or data_type = "timestamp" )
		t := "`        '? valueS1 ?' => 'datetime'`,`n"
	else if(data_type = "date" )
		t := "`        '? valueS1 ?' => 'date'`,`n"
	else
		t := ""

	return t
}

model_appends( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
	name := scaffoldModel("? valueS1 ?")
	
	if(data_type = "datetime" or data_type = "timestamp" or data_type = "date" )
		t := "`        '? valueS1 ?_for_editing'`,`n"
	else
		t := ""

	return t
}

model_validationRules( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
	name := scaffoldModel("? valueS1 ?")
	
	arr := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	if( HasVal(arr, field_name) )
		return ""
	
	required := "max`:1000000000|"`
	if( InStr(nullability, "No") )
		required := "required|"
	
	numeric := ""
	if( InStr(data_type, "int(") and !related_table_singular )
		numeric := "numeric|"
	
	if(data_type = "datetime" or data_type = "timestamp" or data_type = "date" )
		t := "`            $prefix.'? value1 ?_for_editing' => '" required "'`,`n"
	else
		t := "`            $prefix.'? value1 ?' => '" required numeric "'`,`n"

	return t
}

model_nullable( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
	name := scaffoldModel("? valueS1 ?")
	
	if( InStr(nullability, "Yes") )
		t := "`        '? valueS1 ?' => ''`,`n"
	else
		t := ""
	
	return t
}

model_dateGettersAndSetters( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
	name := scaffoldModel("? valueS1 ?")
	
	if(data_type = "datetime" or data_type = "timestamp" or data_type = "date" )
		t := "`    public function get? valueCC1 ?ForEditingAttribute()`n    {`n        return $this->? valueS1 ? ? $this->? valueS1 ?->format('d/m/Y') `: ''`;`n    }`n`n    public function set? valueCC1 ?ForEditingAttribute($value)`n    {`n        $this->? valueS1 ? = parseDate($value)`;`n    }`n`n"
	else
		t := ""
	
	return t
}

model_relations( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
	valueCC4 := "? valueCC4 ?"
	if( customModelName(related_table_singular) )
		valueCC4 := customModelName(related_table_singular)
	
	name := scaffoldModel("? valueL1 ?")
	plural := scaffoldModel("? valueL2 ?")
	plural_C := scaffoldModel("? valueC2 ?")
	model := scaffoldModel("? valueCC1 ?")
	
	if(related_table_singular != "" ){
		t := "`    /**`n     * Get the ? valueL4 ? that owns the " name ".`n     */`n    public function ? valueC91 ?()`n    {`n        return $this->belongsTo(" valueCC4 "`:`:class`, '? valueS1 ?'`, '" related_primary_key "')`;`n    }`n`n    // /**`n    //  * Get the " plural " for the ? valueL4 ?.`n    //  */`n    // public function " plural_C "()`n    // {`n    //     return $this->hasMany(" model "`:`:class`, '" related_primary_key "'`, '? valueS1 ?')`;`n    // }`n`n"
		without_id := StrReplace(field_name, "_id", "")
		t := replaceMarker(without_id, t, 91)
	}
	else
		t := ""
	
	return t
}

model_includes() {
	name := scaffoldModel("? valueS1 ?")
	
	if(name = "user" )
		t := "use Carbon\Carbon`;`nuse Illuminate\Contracts\Auth\MustVerifyEmail`;`nuse Illuminate\Database\Eloquent\Factories\HasFactory`;`nuse Illuminate\Foundation\Auth\? valueAT1 ? as Authenticatable`;`nuse Illuminate\Notifications\Notifiable`;`nuse Laravel\Sanctum\HasApiTokens`;`nuse Illuminate\Database\Eloquent\Model`;`nuse WithPagination`;`nuse Illuminate\Support\Facades\Auth`;`nuse Illuminate\Database\Eloquent\SoftDeletes`;`nuse OwenIt\Auditing\Contracts\Auditable`;`n"
	else
		t := "use Carbon\Carbon`;`nuse Illuminate\Database\Eloquent\Factories\HasFactory`;`nuse Illuminate\Database\Eloquent\Model`;`nuse WithPagination`;`nuse Illuminate\Support\Facades\Auth`;`nuse Illuminate\Database\Eloquent\SoftDeletes`;`nuse OwenIt\Auditing\Contracts\Auditable`;`n"
	
	return t
}

model_inheritance() {
	global fields
	
	name := scaffoldModel("? valueS1 ?")
	
	if(fields["deleted_at"])
		softDeletes := "`, SoftDeletes"
	
	if(name = "user" )
		t := "Authenticatable implements Auditable`n{`n    use HasApiTokens`, HasFactory`, Notifiable" softDeletes "`, \OwenIt\Auditing\Auditable`;"
	else
		t := "Model implements Auditable`n{`n    use HasFactory" softDeletes "`, \OwenIt\Auditing\Auditable`;"
	
	return t
}

opposite_relations(table_name_plural){
	if(table_name_plural = "individuals")
		return "`    /**`n     * Get the id cards for the individual.`n     */`n    public function idCards()`n    {`n        return $this->hasMany(IdCard`:`:class`, 'business_entity_id'`, 'business_entity_id')`;`n    }`n`n"
	else if(table_name_plural = "services")
		return "`    /**`n     * Get the requests for the service.`n     */`n    public function request()`n    {`n        return $this->hasOne(Request`:`:class`, 'service_id'`, 'service_id')`;`n    }`n`n"
	else if(table_name_plural = "birth_records")
		return "`    /**`n     * Get the birth certificates for the birth record.`n     */`n    public function birthCertificate()`n    {`n        return $this->hasOne(BirthCertificate`:`:class`, 'birth_records_id'`, 'birth_records_id')`;`n    }`n`n"
}

model(){
	global
	model_a( table_name_singular, table_name_plural, reverse, primary_key )
}
	
model_a(table_name_singular = 1, table_name_plural = 2, reverse = 0, primary_key = "id"){
	
	includes := model_includes()
	properties := scaffoldFields("` * @property integer $? valueS1 ?`n")
	inheritance := model_inheritance()
	casts := runSubScaffold( "model_casts")
	appends := runSubScaffold( "model_appends")
	validationRules := runSubScaffold( "model_validationRules")
	nullable := runSubScaffold( "model_nullable")
	name_field := "`        return $this->" name_field() "`;`n"
	fillable := scaffoldFields("`        '? valueS1 ?'`,`n")
	keys := scaffoldFields("`            '? value1 ?'`,`n")
	dateGettersAndSetters := runSubScaffold( "model_dateGettersAndSetters")
	relations := runSubScaffold( "model_relations", 1)
	opposite_relations := opposite_relations(table_name_plural)
	
	customModelName := scaffoldModel( "? valueCC1 ?" )
	
	if( customModelName(table_name_singular) )
		customModelName := customModelName(table_name_singular)
	
	;~ customModelName := scaffoldModel( customModelName )
	file =C:\xampp\htdocs\case-manager\app\Models\%customModelName%.php
	
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
		t := "<?php`nnamespace App\Models`;`n`n" includes "`n/**`n * Class ? valueAT1 ?`n * @package App\Models\ModelBase`n *`n" properties " */`nclass ? valueCC1 ? extends " inheritance "`n`n    /**`n     * The table associated with the model.`n     *`n     * @var string`n     */`n    protected $table = '? valueS2 ?'`;`n`n    /**`n     * The primary key for the model.`n     *`n     * @var string`n     */`n    protected $primaryKey = '" primary_key "'`;`n`n    /**`n     * Indicates if the IDs are auto-incrementing.`n     *`n     * @var bool`n     */`n    public $incrementing = true`;`n`n    /**`n     * Indicates if the model should be timestamped.`n     *`n     * @var bool`n     */`n    public $timestamps = true`;`n`n`n    const STATUSES = [`n        'success' => 'Success'`,`n        'failed' => 'Failed'`,`n        'processing' => 'Processing'`,`n    ]`;`n`n    protected $guarded = []`;`n    protected $casts = [`n" casts "    ]`;`n    protected $appends = [`n" appends "    ]`;`n`n    protected function rules($prefix = 'editing.')`n    {`n        return [`n" validationRules "        ]`;`n    }`n`n    public $nullable = [`n" nullable "    ]`;`n`n    /**`n     * This is model Observer which helps to do the same actions automatically when you creating or updating models`n     *`n     * @var array`n     */`n    protected static function boot()`n    {`n        parent`:`:boot()`;`n        static`:`:creating(function ($model) {`n            $model->created_by = Auth`:`:id()`;`n            $model->updated_by = Auth`:`:id()`;`n            $model->created_at = now()`;`n            $model->updated_at = now()`;`n        })`;`n        static`:`:updating(function ($model) {`n            $model->updated_by = Auth`:`:id()`;`n        })`;`n    }`n`n    public function getSingularAttribute()`n    {`n        return '? valueL1 ?'`;`n    }`n`n    public function getName()`n    {`n" name_field "    }`n`n    /**`n     * The attributes that are mass assignable.`n     *`n     * @var array<int`, string>`n     */`n    protected $fillable = [`n" fillable "   ]`;`n`n    // /**`n    //  * The attributes that should be hidden.`n    //  *`n    //  * @var array<string`, string>`n    //  */`n    // protected $hidden = [`n    // ]`;`n`n    /**`n     * @return string[]`n     */`n    public static function keys()`: array`n    {`n        return [`n" keys "        ]`;`n    }`n`n" dateGettersAndSetters "`n`n" relations " `n`n" opposite_relations "}`n"

		StringReplace, t, t, ? valueCC1 ?, % customModelName, All
		content := scaffoldModel( t )
	}
		
	fileWrite( content, file )
}
	
factory(){
	global
	factory_a( table_name_singular, table_name_plural, reverse )
}
	
factory_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	definitions := scaffoldFields("`            '? value1 ?' => $this->faker->name()`,`n")
	
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %definitions%, " definitions "
	}else
		content := scaffoldModel("<?php`n`nnamespace Database\Factories`;`n`nuse Illuminate\Database\Eloquent\Factories\Factory`;`nuse Illuminate\Support\Str`;`n`n/**`n * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\? valueCC1 ?>`n */`nclass ? valueCC1 ?Factory extends Factory`n{`n    /**`n     * Define the model's default state.`n     *`n     * @return array<string`, mixed>`n     */`n    public function definition()`n    {`n        return [`n" definitions "`n        ]`;`n    }`n`n    // /**`n    //  * `n    //  *`n    //  * @return static`n    //  */`n    // public function unverified()`n    // {`n    //     return $this->state(function (array $attributes) {`n    //         return [`n    //             'email_verified_at' => null`,`n    //         ]`;`n    //     })`;`n    // }`n}`n")
	
	name := scaffoldModel("? valueCC1 ?Factory")
	
	file =C:\xampp\htdocs\case-manager\database\factories\%name%.php
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
	file =C:\xampp\htdocs\case-manager\database\seeders\%name%.php
	
	fileWrite( content, file )
}
	
updateDatabaseSeeder(){
	global
	updateDatabaseSeeder_a( table_name_singular, table_name_plural, reverse )
}
	
updateDatabaseSeeder_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	seeder := scaffoldModel("`            // ? valueCC1 ?Seeder`:`:class`,`n")
	
	file =C:\xampp\htdocs\case-manager\database\seeders\DatabaseSeeder.php
	FileRead, content, %file%
	StringReplace, content, content, `        ])`;, %seeder%`        ])`;
	
	fileWrite( content, file )
}
	
apiController_validationRules( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
	name := scaffoldModel("? valueS1 ?")
	
	arr := ["created_by", "updated_by", "created_at", "updated_at", "deleted_at"]

	if( HasVal(arr, field_name) )
		return ""
	
	required := "max`:1000000000|"`
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

apiController(){
	global
	apiController_a( table_name_singular, table_name_plural, reverse )
}
	
apiController_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	validationRules := runSubScaffold( "apiController_validationRules")
	
	t := "<?php`n`nnamespace App\Http\Controllers\Api`;`n`nuse App\Http\Controllers\Controller`;`nuse App\Models\? valueCC1 ?`;`nuse Symfony\Component\HttpFoundation\Response`;`nuse Illuminate\Http\Request`;`nuse Illuminate\Support\Facades\Validator`;`nuse App\Repositories\? valueCC91 ?Repository`;`n`nclass ? valueCC91 ?Controller extends Controller`n{`n    /** @var ? valueCC91 ?Repository $? valueS1 ?Repository*/`n    private $? valueS1 ?Repository`;`n`n    protected $routePath = '? valueS1 ?'`;`n    protected $viewPath = '? valueS1 ?'`;`n`n    public function __construct(? valueCC91 ?Repository $? valueS1 ?Repo)`n    {`n        $this->? valueS1 ?Repository = $? valueS1 ?Repo`;`n    }`n`n    /**`n     * Display a listing of the resource.`n     * https`://? valueS1 ?.te.egov.mv/api/? valueS2 ??page=1&filter[priority_id]=2000&orderBy=-id`n     *`n     * @return \Illuminate\Contracts\View\View`n     */`n    public function index(Request $request)`n    {`n        $filters = $request->get('filter'`, array())`;`n        $orderBy = $request->get('orderBy'`, null)`;`n        $? valueS2 ? = $this->? valueS1 ?Repository->paginate(10`, ['*']`, $filters`, $orderBy)`;`n`n        return response()->json([`n                'data' => $? valueS2 ?`,`n            ]`, Response`:`:HTTP_OK)`;`n    }`n`n    protected function rules()`n    {`n        return [`n" validationRules "        ]`;`n    }`n`n    /**`n     * Show the form for creating a new resource.`n     *`n     * @return \Illuminate\Contracts\View\View`n     */`n    // public function create()`n    // {`n    //     $item = new ? valueCC1 ?()`;`n    //     $item->_token = csrf_token()`;`n    //     $item->_uri = ""/? valueS1 ?""`;`n    //     return view(""? valueS1 ?.edit""`, compact('item'))`;`n    // }`n`n    /**`n     * Store a newly created resource in storage.`n     *`n     * @param Request $request`n     * @return \Illuminate\Routing\Redirector`n     */`n    public function store(Request $request)`n    {`n        $validator = Validator`:`:make($request->all()`, $this->rules())`;`n        if ($validator->fails()) {`n            return response()->json([`n                    'data' => $validator->errors()`,`n                ]`, Response`:`:HTTP_BAD_REQUEST)`;`n        }`n`n        $item = new ? valueCC1 ?`;`n`n        $item->fill($request->validate($this->rules()))`;`n        $item->save()`;`n        return response()->json([`n                'data' => $item`,`n            ]`, Response`:`:HTTP_CREATED)`;`n    }`n`n    /**`n     * Display the specified resource.`n     *`n     * @param int $id`n     * @return \Illuminate\Contracts\View\View`n     */`n    public function show($id)`n    {`n        $? valueS1 ? = ? valueCC1 ?`:`:query()->findOrFail($id)`;`n        return view(""? valueS1 ?.show""`, compact('? valueS1 ?'))`;`n    }`n`n    /**`n     * Show the form for editing the specified resource.`n     *`n     * @param int $id`n     * @return \Illuminate\Contracts\View\View`n     */`n    // public function edit($id)`n    // {`n    //     $item = ? valueCC1 ?`:`:query()->findOrFail($id)`;`n    //     $item->_token = csrf_token()`;`n    //     $item->_method = 'PATCH'`;`n    //     $item->_uri = ""/? valueS1 ?/$item->id""`;`n    //     return view(""? valueS1 ?.edit""`, compact('item'))`;`n    // }`n`n    /**`n     * Update the specified resource in storage.`n     *`n     * @param int $id`n     * @param Request $request`n     * @return \Illuminate\Routing\Redirector`n     */`n    public function update(? valueCC1 ? $? valueS1 ?`, Request $request)`n    {`n        $validator = Validator`:`:make($request->all()`, $this->rules())`;`n        if ($validator->fails()) {`n            return response()->json([`n                    'data' => $validator->errors()`,`n                ]`, Response`:`:HTTP_BAD_REQUEST)`;`n        }`n`n        $? valueS1 ?->update($request->validate($this->rules()))`;`n        return response()->json([`n                'data' => $? valueS1 ?`,`n            ]`, Response`:`:HTTP_OK)`;`n    }`n`n    /**`n     * Remove the specified resource from storage.`n     *`n     * @param int $id`n     * @return \Illuminate\Routing\Redirector`n     */`n    // public function destroy($id)`n    // {`n    //     ? valueCC1 ?`:`:destroy($id)`;`n    //     return redirect(""/? valueS1 ?"")`;`n    // }`n}`n"
	
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( table_name_singular, t, 91)
	
	content := scaffoldModel(t)
	
	name := scaffoldModel("? valueCC1 ?Controller")
	file =C:\xampp\htdocs\case-manager\app\Http\Controllers\Api\%name%.php
	
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
	file =C:\xampp\htdocs\case-manager\app\Repositories\%name%.php
	
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
	FileCreateDir, C:\xampp\htdocs\case-manager\tests\Feature\Livewire\%directory%
	
	file =C:\xampp\htdocs\case-manager\tests\Feature\Livewire\%directory%\%name%.php
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
	file =C:\xampp\htdocs\case-manager\tests\Feature\Livewire\%directory%\%name%.php
	
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
	file =C:\xampp\htdocs\case-manager\tests\Feature\Livewire\%directory%\%name%.php
	
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
	file =C:\xampp\htdocs\case-manager\tests\Feature\Livewire\%directory%\%name%.php
	
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
	file =C:\xampp\htdocs\case-manager\app\Policies\%name%.php
	
	fileWrite( content, file )
}
	
scaffold_ListController_relations( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
	skip := {"created_by": 1, "updated_by": 1}
	
	if(related_table_singular != "" and !skip[field_name] )
		t := "`            '? valueS1 ?'`,`n"
	else 
		t := ""

	return t
}

;~ load_fields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
	
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
		
		fields[field1] := {"field_name": field1, "data_type": field2, "nullability": field3, "related_table_singular": field4, "related_table_plural": field5, "related_primary_key": field6, "column_number": A_Index, "table_name_singular": s, "table_name_plural": p}
	}
	
	return fields
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
		return "user()->name"
	else 
		return primary_key
	
	return ""
}

listController_dropdownsOnEdit( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
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
	file =C:\xampp\htdocs\case-manager\app\Http\Livewire\%directory%\List%name%.php

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
	
	FileCreateDir, C:\xampp\htdocs\case-manager\app\Http\Livewire\%directory%
	
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
	file =C:\xampp\htdocs\case-manager\app\Http\Livewire\%directory%\ChildList%name%.php

	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %relations%, " relations "
	}else{
		t := "<?php`n`nnamespace App\Http\Livewire\? valueCC91 ?`;`n`nuse Livewire\Component`;`nuse App\Models\? valueCC1 ?`;`nuse Illuminate\Support\Carbon`;`nuse App\Http\Livewire\DataTable\WithSorting`;`nuse App\Http\Livewire\DataTable\WithCachedRows`;`nuse App\Http\Livewire\DataTable\WithBulkActions`;`nuse App\Http\Livewire\DataTable\WithPerPagePagination`;`nuse Illuminate\Database\Eloquent\Builder`;`nuse Illuminate\Foundation\Auth\Access\AuthorizesRequests`;`n`nclass ChildList? valueCC2 ? extends Component`n{`n    use WithPerPagePagination`, WithSorting`, WithBulkActions`, WithCachedRows`, AuthorizesRequests`;`n`n    public $showDeleteModal = false`;`n    public $showEditModal = false`;`n    public $showAdvanced = false`;`n    public $filters = [`n        'search' => ''`,`n        'status' => ''`,`n        'amount-min' => null`,`n        'amount-max' => null`,`n        'created_at-min' => null`,`n        'created_at-max' => null`,`n    ]`;`n    public ? valueCC1 ? $editing`;`n`n    protected $queryString = ['sorts']`;`n`n    protected $listeners = ['refresh? valueCC2 ?' => '$refresh']`;`n`n    public $dependsOn`;`n`n    public function mount($dependsOn = [])`n    {`n        $this->editing = $this->makeBlank? valueCC91 ?()`;`n        $this->dependsOn = $dependsOn`;`n        $this->editing->? valueS1 ?_id = $dependsOn`;`n    }`n`n    protected function rules()`n    {`n        return ? valueCC1 ?`:`:rules()`;`n    }`n`n    public function updatedFilters() { $this->resetPage()`; }`n`n    public function exportSelected()`n    {`n        return response()->streamDownload(function () {`n            echo $this->selectedRowsQuery->toCsv()`;`n        }`, '? valueS2 ?.csv')`;`n    }`n`n    public function deleteSelected()`n    {`n        $this->authorize('delete'`, $this->editing)`;`n`n        $deleteCount = $this->selectedRowsQuery->count()`;`n`n        $this->selectedRowsQuery->delete()`;`n`n        $this->showDeleteModal = false`;`n`n        $this->notify('You\'ve deleted '.$deleteCount.' ? valueL2 ?')`;`n    }`n`n    public function makeBlank? valueCC91 ?()`n    {`n        return ? valueCC1 ?`:`:make(['date' => now()`, 'status' => 'success'])`;`n    }`n`n    public function toggleShowAdvanced()`n    {`n        $this->useCachedRows()`;`n`n        $this->showAdvanced = ! $this->showAdvanced`;`n    }`n`n    public function create()`n    {`n        $this->useCachedRows()`;`n`n        if ($this->editing->getKey()){`n            $this->editing = $this->makeBlank? valueCC1 ?()`;`n            $this->updateComponentValues()`;`n        }`n`n        $this->showEditModal = true`;`n    }`n`n    public function edit(? valueCC1 ? $? valueS1 ?)`n    {`n        $this->useCachedRows()`;`n`n        if ($this->editing->isNot($? valueS1 ?)){`n            $this->editing = $? valueS1 ?`;`n            $this->updateComponentValues()`;`n        }`n`n        $this->showEditModal = true`;`n    }`n`n    protected function updateComponentValues()`n    {`n" dropdownsOnEdit "`n    }`n`n    public function save()`n    {`n        nullableToNull($this->editing)`;`n        $this->validate()`;`n`n        if (!$this->editing->getKey()){`n            $this->authorize('create'`, $this->editing)`;`n        }else{`n            $this->authorize('update'`, $this->editing)`;`n        }`n`n        activityLog($this->editing)`;`n        $this->editing->save()`;`n`n        $this->showEditModal = false`;`n    }`n`n    public function resetFilters() { $this->reset('filters')`; }`n`n    public function getRowsQueryProperty()`n    {`n        $query = ? valueCC1 ?`:`:query()`n            ->where? valueCC91 ?Id($this->dependsOn)`n            ->when($this->filters['status']`, fn($query`, $status) => $query->where('status'`, $status))`n            ->when($this->filters['amount-min']`, fn($query`, $amount) => $query->where('amount'`, '>='`, $amount))`n            ->when($this->filters['amount-max']`, fn($query`, $amount) => $query->where('amount'`, '<='`, $amount))`n            ->when($this->filters['created_at-min']`, fn($query`, $created_at) => $query->where('created_at'`, '>='`, Carbon`:`:createFromFormat('d/m/Y'`, $created_at)))`n            ->when($this->filters['created_at-max']`, fn($query`, $created_at) => $query->where('created_at'`, '<='`, Carbon`:`:createFromFormat('d/m/Y'`, $created_at)))`n            ->when($this->filters['search']`, fn($query`, $search) => " searchQuery ")`;`n`n        return $this->applySorting($query)`;`n    }`n`n    public function getRowsProperty()`n    {`n        return $this->cache(function () {`n            return $this->applyPagination($this->rowsQuery)`;`n        })`;`n    }`n`n    public function render()`n    {`n        $this->authorize('viewAny'`, $this->editing)`;`n`n        return view('livewire.? valueSH1 ?.child-list-? valueSH2 ?'`, [`n            '? valueS2 ?' => $this->rows`,`n        ])`;`n    }`n`n    public function getListeners()`n    {`n        return collect([`n" relations "        ])->mapWithKeys(function ($key) {`n                return [""{$key}Updated"" => 'updateDependingValue']`;`n            })`n            ->toArray()`;`n    }`n`n    public function updateDependingValue($data)`n    {`n        $name = $data['name']`;`n        $value = $data['value']`;`n`n        $this->editing->{$name} = $value`;`n    }`n`n}`n"
		
		if( customModelName(table_name_singular) )
			StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
		
		t := replaceMarker( scaffoldModel("? valueCC1 ?"), t, 91)
		
		content := scaffoldModel( t )
	}
	
	FileCreateDir, C:\xampp\htdocs\case-manager\app\Http\Livewire\%directory%
	
	
	fileWrite( content, file )
}
	
enum(){
	global
	enum_a( table_name_singular, table_name_plural, reverse )
}
	
enum_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	name := scaffoldModel("? valueCC2 ?")
	file =C:\xampp\htdocs\case-manager\app\Enum\%name%Enum.php
	
	data := "`tEdit Edit`tCopy Copy`tDelete Delete`t1`tuser.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t2`tuser.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t3`tuser.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t4`tuser.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t5`tuser.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t6`tcase.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t7`tcase.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t8`tcase.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t9`tcase.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t10`tcase.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t11`torganisation.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t12`torganisation.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t13`torganisation.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t14`torganisation.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t15`torganisation.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t16`torganisation_type.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t17`torganisation_type.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t18`torganisation_type.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t19`torganisation_type.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t20`torganisation_type.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t21`tcountry.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t22`tcountry.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t23`tcountry.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t24`tcountry.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t25`tcountry.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t26`tteam.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t27`tteam.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t28`tteam.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t29`tteam.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t30`tteam.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t31`tstatus.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t32`tstatus.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t33`tstatus.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t34`tstatus.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t35`tstatus.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t36`torigin.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t37`torigin.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t38`torigin.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t39`torigin.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t40`torigin.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t41`tpriority.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t42`tpriority.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t43`tpriority.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t44`tpriority.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t45`tpriority.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t46`tcase_item.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t47`tcase_item.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t48`tcase_item.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t49`tcase_item.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t50`tcase_item.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t51`tcase_item_type.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t52`tcase_item_type.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t53`tcase_item_type.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t54`tcase_item_type.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t55`tcase_item_type.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t56`tgender_type.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t57`tgender_type.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t58`tgender_type.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t59`tgender_type.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t60`tgender_type.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t61`ttask.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t62`ttask.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t63`ttask.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t64`ttask.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t65`ttask.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t66`tcase_user.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t67`tcase_user.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t68`tcase_user.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t69`tcase_user.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t70`tcase_user.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t71`tcase_user_type.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t72`tcase_user_type.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t73`tcase_user_type.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t74`tcase_user_type.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t75`tcase_user_type.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t76`tindividual.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t77`tindividual.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t78`tindividual.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t79`tindividual.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t80`tindividual.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t81`trole.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t82`trole.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t83`trole.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t84`trole.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t85`trole.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t86`tpermission.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t87`tpermission.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t88`tpermission.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t89`tpermission.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t90`tpermission.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t91`trole_permission.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t92`trole_permission.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t93`trole_permission.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t94`trole_permission.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t95`trole_permission.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t96`tuser_role.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t97`tuser_role.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t98`tuser_role.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t99`tuser_role.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t100`tuser_role.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t101`taudit.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t102`taudit.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t103`taudit.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t104`taudit.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t105`taudit.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t106`tactivity_log.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t107`tactivity_log.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t108`tactivity_log.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t109`tactivity_log.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t110`tactivity_log.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t111`ttag.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t112`ttag.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t113`ttag.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t114`ttag.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t115`ttag.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t116`tchecklist.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t117`tchecklist.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t118`tchecklist.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t119`tchecklist.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t120`tchecklist.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t121`ttask_comment.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t122`ttask_comment.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t123`ttask_comment.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t124`ttask_comment.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t125`ttask_comment.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t126`ttask_tag.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t127`ttask_tag.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t128`ttask_tag.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t129`ttask_tag.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t130`ttask_tag.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t131`ttask_user.view_any`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t132`ttask_user.create`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t133`ttask_user.view`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t134`ttask_user.update`tNULL`tNULL`tNULL`tNULL`tNULL`n`tEdit Edit`tCopy Copy`tDelete Delete`t135`ttask_user.delete`tNULL`tNULL`tNULL`tNULL`tNULL`n"
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
	
	t := "<?php`n`nnamespace App\Http\Livewire\? valueCC91 ?`;`n`nuse Livewire\Component`;`nuse App\Models\? valueCC1 ?`;`nuse Illuminate\Foundation\Auth\Access\AuthorizesRequests`;`n`nclass Manage? valueCC91 ? extends Component`n{`n    use AuthorizesRequests`;`n`n    public ? valueCC1 ? $? valueC1 ?`;`n    public ? valueCC1 ? $editing`;`n    public $isEditing = false`;`n`n    protected function rules()`n    {`n        return ? valueCC1 ?`:`:rules()`;`n    }`n`n    public function mount($? valueC1 ? = null)`n    {`n        if ($? valueC1 ?) {`n            $this->editing = $? valueC1 ?`;`n            $this->isEditing = true`;`n        } else {`n            $this->editing = ? valueCC1 ?`:`:make()`;`n        }`n    }`n`n    public function render()`n    {`n        $this->authorize( $this->editing->getKey() ? 'update' `: 'create'`, $this->editing)`;`n`n        return view('livewire.? valueSH1 ?.manage-? valueSH1 ?')`;`n    }`n`n    public function save()`n    {`n        $this->authorize( $this->editing->getKey() ? 'update' `: 'create'`, $this->editing)`;`n`n        $this->validate()`;`n`n        activityLog($this->editing)`;`n        $this->editing->save()`;`n        return redirect()->route('? valueS2 ?.show'`, $this->editing['id'])`;`n    }`n`n    public function getListeners()`n    {`n        return collect([`n" relations "        ])->mapWithKeys(function ($key) {`n                return [""{$key}Updated"" => 'updateDependingValue']`;`n            })`n            ->toArray()`;`n    }`n`n    public function updateDependingValue($data)`n    {`n        $name = $data['name']`;`n        $value = $data['value']`;`n`n        $this->editing->{$name} = $value`;`n    }`n}`n`n"
	
	if( customModelName(table_name_singular) )
		StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
	
	t := replaceMarker( scaffoldModel("? valueCC1 ?"), t, 91)
	
	content := scaffoldModel( t )
	
	name := scaffoldModel("? valueCC1 ?\Manage? valueCC1 ?")
	file =C:\xampp\htdocs\case-manager\app\Http\Livewire\%name%.php
	
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
	file =C:\xampp\htdocs\case-manager\app\Http\Livewire\%name%.php
	
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
	file =C:\xampp\htdocs\case-manager\app\Http\Livewire\%name%.php
	
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %filter%, " filter ", All
		StringReplace, content, content, %name_field%, " name_field ", All
		StringReplace, content, content, %primary_key%, " primary_key ", All
	}else{
		t := "<?php`nnamespace App\Http\Livewire\? valueCC91 ?`;`n`nuse Livewire\Component`;`nuse App\Models\? valueCC1 ?`;`nuse App\Http\Livewire\LivewireSelect\LivewireSelect`;`nuse Illuminate\Support\Collection`;`n`nclass Select? valueCC91 ? extends LivewireSelect`n{`n    public function options($searchTerm = null) `: Collection`n    {`n        if(!empty($searchTerm))`n            $? valueS2 ? = ? valueCC1 ?`:`:where('" name_field "'`, 'like'`, '`%' . $searchTerm . '`%')->limit(20)->get()`;`n        else`n            $? valueS2 ? = ? valueCC1 ?`:`:limit(20)->get()`;`n`n        $list = []`;`n        foreach ($? valueS2 ? as $key => $? valueS1 ?) {`n            $list[] = [`n                'value' => $? valueS1 ?->" primary_key "`,`n                'description' => $? valueS1 ?->" name_field "`,`n            ]`;`n        }`n`n        return collect($list)`;`n    }`n`n    public function selectedOption($searchTerm = null) `: Collection`n    {`n        $? valueS1 ? = ? valueCC1 ?`:`:find($searchTerm)`;`n`n        $list = [`n            'value' => $? valueS1 ? ? $? valueS1 ?->" primary_key " `: ''`,`n            'description' => $? valueS1 ? ? $? valueS1 ?->" name_field " `: ''`,`n        ]`;`n`n        return collect($list)`;`n    }`n}`n"
		
		name := scaffoldModel("? valueS1 ?")
		if( customModelName(table_name_singular) )
			StringReplace, t, t, ? valueCC1 ?, % customModelName(table_name_singular), All
		
		t := replaceMarker( scaffoldModel("? valueS1 ?"), t, 91)
		
		content := scaffoldModel( t )
	}
		
	fileWrite( content, file )
}

scaffold_LiveWireImportController_rules( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
	name := scaffoldModel("? valueS1 ?")
	
	if( InStr(field3, "No") )
		t := "`        'fieldColumnMap.? valueS1 ?' => 'required'`,`n"
	else
		t := ""

	return t
}

scaffold_LiveWireImportController_createFields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
	name := scaffoldModel("? valueS1 ?")
	
	if(field2 = "datetime" or field2 = "timestamp" )
		t := "`                        ""? valueS1 ?"" =>  $row['? valueS1 ?'] ?  Carbon`:`:createFromFormat('d/m/Y H`:i'`, $row['? valueS1 ?'])->format('Y-m-d H:i:s') `: null`,`n"
	else
		t := "`                        ""? value1 ?"" => $row['? value1 ?']`,`n"

	return t
}

scaffold_LiveWireImportController_guesses( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
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
	file =C:\xampp\htdocs\case-manager\app\Http\Livewire\%name%.php
	
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
	FileCreateDir, C:\xampp\htdocs\case-manager\app\Http\Livewire\%directory%
		
	fileWrite( content, file )
}

importModel_fields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
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
		content := scaffoldModel("<?php`n`nnamespace App\Imports`;`n`nuse Carbon\Carbon`;`nuse App\Models\? valueAT1 ?`;`nuse Illuminate\Support\Facades\Hash`;`nuse Maatwebsite\Excel\Concerns\ToModel`;`nuse PhpOffice\PhpSpreadsheet\Shared\Date`;`n`nclass ? valueAT2 ?Import implements ToModel`n{`n    /**`n     * @param array $row`n     *`n     * @return ? valueAT1 ?|null`n     */`n    public function model(array $row)`n    {`n        if($row[12] == ""last_activity_date"")`n            return null`;`n        `n        return new ? valueAT1 ?([`n" fields "        ])`;`n    }`n}")
	
	name := scaffoldModel("? valueCC2 ?Import")
	file =C:\xampp\htdocs\case-manager\app\Imports\%name%.php
	
	fileWrite( content, file )
}
	
scaffoldTableFields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11, child = 0){
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

scaffoldFormFields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11, hidden = 0 ){
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

childListView_FormFields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
	hiddenArr := {"case_item_case_id" : 1}
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
	arr["case_item_from_organisation_id"] := "FROM"
	arr["case_item_case_item_type_id"] := "TYPE"
	arr["case_item_recieved_date"] := "RECIEVED"
	
	if(arr[table_name_singular "_" field_name])
		return arr[table_name_singular "_" field_name]
	else
		return ""
	
}

scaffoldTableHeaders( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
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
		
		t := %functionName%( field["field_name"], field["data_type"], field["nullability"], field["related_table_singular"], field["related_table_plural"], field["related_primary_key"], key, field["table_name_singular"], field["table_name_plural"], primary_key, fieldsArr.Length() )
		
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
		}
		output := output t
	}
	
	return output
}
	
listView(){
	global
	listView_a( table_name_singular, table_name_plural, reverse, primary_key )
}
	
listView_a(table_name_singular = 1, table_name_plural = 2, reverse = 0, primary_key = "id"){
	fieldsArr := ShowView_fieldsArr( table_name_singular )
	table_fieldsArr := table_fields( table_name_singular )
	
	table_headers := runSubScaffold( "scaffoldTableHeaders", 1, table_fieldsArr)
	table_rows := runSubScaffold( "scaffoldTableFields", 1, table_fieldsArr)
	form_fields := runSubScaffold( "scaffoldFormFields", 0 )

	directory := scaffoldModel("? valueSH1 ?")
	name := scaffoldModel("? valueSH2 ?")
	file =C:\xampp\htdocs\case-manager\resources\views\livewire\%directory%\list-%name%.blade.php
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %table_headers%, " table_headers "
		StringReplace, content, content, %table_rows%, " table_rows "
		StringReplace, content, content, %form_fields%, " form_fields "
	}else{
	
		content := scaffoldModel("<div class=""pt-16 mx-auto px-2 sm`:px-4 md`:px-8"">`n    {{-- Breadcrumbs --}}`n    <div class=""pt-2"">`n        <div class=""text-sm mb-2"">`n            <a class=""text-blue-600"" href=""{{ route('home') }}"">`n                Home`n            </a>`n            >`n            <a class=""text-blue-600"" href=""{{ route('? valueSH2 ?') }}"">`n                ? valueAT2 ?`n            </a>`n        </div>`n    </div>`n`n    <h1 class=""text-2xl font-semibold text-gray-900"">? valueAT2 ?</h1>`n`n    <div class=""py-4 space-y-4"">`n        <!-- Top Bar -->`n        <div class=""flex justify-between"">`n            <div class=""w-2/4 flex space-x-4"">`n                <x-input.text wire`:model=""filters.search"" placeholder=""Search ? valueAT2 ?..."" />`n`n                <x-button.link wire`:click=""toggleShowAdvanced"">@if ($showAdvanced) Hide @endif Advanced...</x-button.link>`n            </div>`n`n            <div class=""space-x-2 flex items-center"">`n                @if ($showAdvanced)`n                <div class=""sm`:grid sm`:grid-cols-3 sm`:gap-4 sm`:items-start  sm`:border-gray-200 "">`n                    <label for=""perPage"" class=""block text-sm font-medium leading-5 text-gray-700 sm`:mt-px sm`:pt-2"">`n                        Per Page`n                    </label>`n`n                    <div class=""mt-1 sm`:mt-0 sm`:col-span-2"">`n                        <div class=""flex"">`n                            <select class=""form-select block w-full pl-3 pr-10 py-2 text-base leading-6 border-gray-300 focus`:outline-none focus`:shadow-outline-blue focus`:border-blue-300 sm`:text-sm sm`:leading-5"" wire`:model=""perPage"" id=""perPage"">`n                                <option value=""10"">10</option>`n                                <option value=""25"">25</option>`n                                <option value=""50"">50</option>`n                            </select>`n                        </div>`n                    </div>`n                </div>`n`n`n                <x-dropdown label=""Bulk Actions"">`n                    <x-dropdown.item type=""button"" wire`:click=""exportSelected"" class=""flex items-center space-x-2"">`n                        <x-icon.download class=""text-cool-gray-400""/> <span>Export</span>`n                    </x-dropdown.item>`n`n                    <x-dropdown.item type=""button"" wire`:click=""$toggle('showDeleteModal')"" class=""flex items-center space-x-2"">`n                        <x-icon.trash class=""text-cool-gray-400""/> <span>Delete</span>`n                    </x-dropdown.item>`n                </x-dropdown>`n`n                <livewire`:? valueSH1 ?.import-? valueSH2 ? />`n                @endif`n`n                <x-button.primary wire`:click=""create""><x-icon.plus/> New</x-button.primary>`n            </div>`n        </div>`n`n        <!-- Advanced Search -->`n        <div>`n            @if ($showAdvanced)`n            <div class=""bg-cool-gray-200 p-4 rounded shadow-inner flex relative"">`n                <?php /* <div class=""w-1/2 pr-2 space-y-4"">`n                    <x-input.group inline for=""filter-status"" label=""Status"">`n                        <x-input.select wire`:model=""filters.status"" id=""filter-status"">`n                            <option value="""" disabled>Select Status...</option>`n`n                            @foreach (App\Models\? valueCC1 ?`:`:STATUSES as $value => $label)`n                            <option value=""{{ $value }}"">{{ $label }}</option>`n                            @endforeach`n                        </x-input.select>`n                    </x-input.group>`n`n                    <x-input.group inline for=""filter-amount-min"" label=""Minimum Amount"">`n                        <x-input.money wire`:model.lazy=""filters.amount-min"" id=""filter-amount-min"" />`n                    </x-input.group>`n`n                    <x-input.group inline for=""filter-amount-max"" label=""Maximum Amount"">`n                        <x-input.money wire`:model.lazy=""filters.amount-max"" id=""filter-amount-max"" />`n                    </x-input.group>`n                </div> */ ?>`n`n                <div class=""w-1/2 pl-2 space-y-4"">`n                    <x-input.group inline for=""filter-created_at-min"" label=""Minimum Date"">`n                        <x-input.date wire`:model=""filters.created_at-min"" id=""filter-created_at-min"" placeholder=""MM/DD/YYYY"" />`n                    </x-input.group>`n`n                    <x-input.group inline for=""filter-created_at-max"" label=""Maximum Date"">`n                        <x-input.date wire`:model=""filters.created_at-max"" id=""filter-created_at-max"" placeholder=""MM/DD/YYYY"" />`n                    </x-input.group>`n`n                    <x-button.link wire`:click=""resetFilters"" class=""absolute right-0 bottom-0 p-4"">Reset Filters</x-button.link>`n                </div>`n            </div>`n            @endif`n        </div>`n`n        <!-- ? valueAT2 ? Table -->`n        <div class=""flex-col space-y-4 backdrop-blur-lg`n        [ bg-gradient-to-b from-white/60 to-white/30 ]`n        [ border-[1px] border-solid border-white border-opacity-30 ]`n        [ shadow-lg ]"">`n            <x-table>`n                <x-slot name=""head"">`n                    <x-table.heading class=""pr-0 w-8"">`n                        <x-input.checkbox wire`:model=""selectPage"" />`n                    </x-table.heading>`n" table_headers "                </x-slot>`n`n                <x-slot name=""body"">`n                    @if ($selectPage)`n                    <x-table.row class=""bg-cool-gray-200"" wire`:key=""row-message"">`n                        <x-table.cell colspan=""6"">`n                            @unless ($selectAll)`n                            <div>`n                                <span>You have selected <strong>{{ $? valueS2 ?->count() }}</strong> ? valueS2 ?`, do you want to select all <strong>{{ $? valueS2 ?->total() }}</strong>?</span>`n                                <x-button.link wire`:click=""selectAll"" class=""ml-1 text-blue-600"">Select All</x-button.link>`n                            </div>`n                            @else`n                            <span>You are currently selecting all <strong>{{ $? valueS2 ?->total() }}</strong> ? valueS2 ?.</span>`n                            @endif`n                        </x-table.cell>`n                    </x-table.row>`n                    @endif`n`n                    @forelse ($? valueS2 ? as $? valueS1 ?)`n                    <x-table.row wire`:loading.class.delay=""opacity-50"" wire`:key=""row-{{ $? valueS1 ?->" primary_key " }}"" class=""cursor-pointer"">`n                        <x-table.cell class=""pr-0"">`n                            <x-input.checkbox wire`:model=""selected"" value=""{{ $? valueS1 ?->" primary_key " }}"" />`n                        </x-table.cell>`n`n" table_rows "                    </x-table.row>`n                    @empty`n                    <x-table.row>`n                        <x-table.cell colspan=""11"">`n                            <div class=""flex justify-center items-center space-x-2"">`n                                <x-icon.inbox class=""h-8 w-8 text-cool-gray-400"" />`n                                <span class=""font-medium py-8 text-cool-gray-400 text-xl"">No ? valueAT2 ? found...</span>`n                            </div>`n                        </x-table.cell>`n                    </x-table.row>`n                    @endforelse`n                </x-slot>`n            </x-table>`n`n            {!! pagination( $? valueS2 ? ) !!}`n        </div>`n    </div>`n`n    <!-- Delete ? valueAT2 ? Modal -->`n    <form wire`:submit.prevent=""deleteSelected"">`n        <x-modal.confirmation wire`:model.defer=""showDeleteModal"">`n            <x-slot name=""title"">Delete ? valueAT1 ?</x-slot>`n`n            <x-slot name=""content"">`n                <div class=""py-8 text-cool-gray-700"">Are you sure you? This action is irreversible.</div>`n            </x-slot>`n`n            <x-slot name=""footer"">`n                <x-button.secondary wire`:click=""$set('showDeleteModal'`, false)"">Cancel</x-button.secondary>`n`n                <x-button.primary type=""submit"">Delete</x-button.primary>`n            </x-slot>`n        </x-modal.confirmation>`n    </form>`n`n    <!-- Save ? valueAT1 ? Modal -->`n    <form wire`:submit.prevent=""save"">`n        <x-modal.dialog wire`:model.defer=""showEditModal"" `:maxWidth=""'5xl'"">`n            <x-slot name=""title"">{{ $editing['" primary_key "'] ? 'Edit' `: 'Create' }} ? valueAT1 ?</x-slot>`n`n            <x-slot name=""content"">`n                <div class=""flex flex-wrap -mx-3 mb-6"">`n" form_fields "`n                </div>`n`n                <div class=""text-right"">`n                    <x-button.secondary wire`:click=""$set('showEditModal'`, false)"">Cancel</x-button.secondary>`n`n                    <x-button.primary type=""submit"">Save</x-button.primary>`n`n                </div>`n            </x-slot>`n        </x-modal.dialog>`n    </form>`n</div>`n")
	}
	
	FileCreateDir, C:\xampp\htdocs\case-manager\resources\views\livewire\%directory%
	
	fileWrite( content, file )
}

ChildListView_specificFieldsArr(table_name_singular){
	global specificFieldsArr
	specificFieldsArr["case_item"] := ["from_organisation_id", "case_item_type_id", "recieved_date", "title"]
	;~ specificFieldsArr["case_user"] := ["user_id"]
	specificFieldsArr["task"] := ["title", "assigned_user_id", "progress", "deadline"]
	return specificFieldsArr[table_name_singular]
}

ChildListView_ShowView_fieldsArr(table_name_singular){
	fieldsArr := {}
	fieldsArr["case_item"] := ["from_organisation_id", "title", "content", "recieved_date"]
	return fieldsArr[ table_name_singular ]
}

childListView_TableFields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
	return scaffoldTableFields( field_name, data_type, nullability, related_table_singular, related_table_plural, related_primary_key, column_number, table_name_singular, table_name_plural, primary_key, arrayLength, 1)
}

childListView_heading( table_name_singular ){
	arr := []
	arr["case_item"] := "Communications / Attachments"
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
	file =C:\xampp\htdocs\case-manager\resources\views\livewire\%directory%\child-list-%name%.blade.php
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
	
	FileCreateDir, C:\xampp\htdocs\case-manager\resources\views\livewire\%directory%
	
	
	fileWrite( content, file )
}

ManageView_fields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
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
	file =C:\xampp\htdocs\case-manager\resources\views\livewire\%name%.blade.php
	
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %form_fields%, " form_fields "
	}else
		content := scaffoldModel("<x-slot name=""header"">`n    <h2 class=""font-semibold text-xl text-gray-800 leading-tight"">`n        {{ __('? valueAT2 ?') }}`n    </h2>`n</x-slot>`n<div class=""max-w-7xl mx-auto px-4 sm`:px-6 lg`:px-8 pt-20 pb-10 "">`n    {{-- Breadcrumbs --}}`n    <div class="""">`n        <div class=""text-sm mb-2"">`n            <a class=""text-blue-600"" href=""{{ route('home') }}"">`n                Home`n            </a>`n            >`n            <a class=""text-blue-600"" href=""{{ route('? valueSH2 ?') }}"">`n                ? valueAT2 ?`n            </a>`n            >`n            <a class=""text-blue-600"" href=""{{ $editing['id'] ? route('? valueSH2 ?.show'`, $editing['id']) `: '#' }}"">`n                {{ $editing->id }}`n            </a>`n        </div>`n    </div>`n`n    @if (session()->has('message'))`n        <div id=""alert"" class=""text-white px-6 py-4 border-0 rounded relative mb-4 bg-green-500"">`n            <span class=""inline-block align-middle mr-8"">`n                {{ session('message') }}`n            </span>`n            <button class=""absolute bg-transparent text-2xl font-semibold leading-none right-0 top-0 mt-4 mr-6 outline-none focus`:outline-none"" onclick=""document.getElementById('alert').remove()`;"">`n                <span>?</span>`n            </button>`n        </div>`n    @endif`n`n`n    <div class=""w-full align-center"">`n        <div class=""float-left"">`n            <h1 class=""font-semibold leading-tight text-2xl mt-4 mb-2 mx-6 text-gray-900"">`n                <a href=""{{ route('? valueSH2 ?') }}"">`n                    ? valueAT1 ?`n                </a>`n                / {{ $editing['id'] ? 'Edit' `: 'Create' }}`:`n                <a href=""{{ $editing['id'] ? route('? valueSH2 ?.show'`, $editing['id']) `: route('? valueSH2 ?') }}"">`n                    {{ $editing->getName() }}`n                </a>`n            </h1>`n        </div>`n        <div class=""float-left"">`n        </div>`n    </div>`n`n    <div class=""`n    [ bg-white ]`n    [ border-[1px] border-solid border-white border-opacity-30 ]`n    [ shadow-lg ] shadow rounded-lg "">`n        <div class=""inline-block min-w-full overflow-hidden"">`n            <form>`n                <div class=""px-4 pt-5 pb-4 sm`:p-6 sm`:pb-4"">`n                    <div class=""flex flex-wrap -mx-3 mb-6"">`n" form_fields "                    </div>`n                </div>`n                <div class=""px-4 py-3 sm`:px-6 sm`:flex sm`:flex-row-reverse"">`n                <span class=""flex w-full sm`:ml-3 sm`:w-auto"">`n                    <button wire`:click.prevent=""save()"" type=""button"" class=""inline-flex bg-blue-500 hover`:bg-blue-700 text-white font-bold py-2 px-4 rounded"">Save</button>`n                </span>`n                </div>`n            </form>`n        </div>`n    </div>`n</div>`n`n@push('styles')`n<link rel=""stylesheet"" href=""https`://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css"">`n@endpush`n`n@push('scripts')`n<script src=""https`://cdn.jsdelivr.net/npm/sweetalert2@10""></script>`n<script src=""https`://cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js""></script>`n<script type=""text/javascript"">`n    document.addEventListener('DOMContentLoaded'`, function () {`n`n    })`n</script>`n@endpush`n")
	
	fileWrite( content, file )
}

ShowView_Fields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
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
	showView_a( table_name_singular, table_name_plural, reverse, primary_key )
}
	
showView_a(table_name_singular = 1, table_name_plural = 2, reverse = 0, primary_key = "id"){
	fieldsArr := ShowView_fieldsArr( table_name_singular )
	
	before := ShowView_before( table_name_singular, table_name_plural )
	form_fields := runSubScaffold( "ShowView_Fields", 1, fieldsArr )
	
	;~ fieldsArr.Push("scaffold_blacklist")
	fieldsMoreArr := ShowView_fieldsMoreArr( table_name_singular )
	form_fields_more := fieldsMoreArr = "" ? "" : runSubScaffold( "ShowView_Fields", 1, fieldsMoreArr )
	sub_list := ShowView_subList( table_name_singular, table_name_plural )

	name := scaffoldModel("? valueSH1 ?\show-? valueSH1 ?")
	file =C:\xampp\htdocs\case-manager\resources\views\livewire\%name%.blade.php
	
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

ImportView_form_fields( field_name = 1, data_type = 2, nullability = 3, related_table_singular = 4, related_table_plural = 5, related_primary_key = 6, column_number = 7, table_name_singular = 8, table_name_plural = 9, primary_key = 10, arrayLength = 11 ){
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
	file =C:\xampp\htdocs\case-manager\resources\views\livewire\%name%.blade.php
	
	if(reverse){
		FileRead, content, %file%
		StringReplace, content, content, `r, , All
		
		StringReplace, content, content, %form_fields%, " form_fields "
	}else{
		content := scaffoldModel("<div>`n    <x-button.secondary wire`:click=""$toggle('showModal')"" class=""flex items-center space-x-2""><x-icon.upload class=""text-cool-gray-500""/> <span>Import</span></x-button.secondary>`n`n    <form wire`:submit.prevent=""import"">`n        <x-modal.dialog wire`:model=""showModal"">`n            <x-slot name=""title"">Import ? valueAT2 ?</x-slot>`n`n            <x-slot name=""content"">`n                @unless ($upload)`n                <div class=""py-12 flex flex-col items-center justify-center "">`n                    <div class=""flex items-center space-x-2 text-xl"">`n                        <x-icon.upload class=""text-cool-gray-400 h-8 w-8"" />`n                        <x-input.file-upload wire`:model=""upload"" id=""upload""><span class=""text-cool-gray-500 font-bold"">CSV or Excel File</span></x-input.file-upload>`n                    </div>`n                    @error('upload') <div class=""mt-3 text-red-500 text-sm"">{{ $message }}</div> @enderror`n                </div>`n                @else`n                <div>`n" form_fields "                </div>`n                @endif`n            </x-slot>`n`n            <x-slot name=""footer"">`n                <x-button.secondary wire`:click=""$set('showModal'`, false)"">Cancel</x-button.secondary>`n`n                <x-button.primary type=""submit"">Import</x-button.primary>`n            </x-slot>`n        </x-modal.dialog>`n    </form>`n</div>`n")
	}
	
	directory := scaffoldModel("? valueSH1 ?")
	FileCreateDir, C:\xampp\htdocs\case-manager\resources\views\livewire\%directory%

	fileWrite( content, file )
}

updateRoutesFile(){
	global
	updateRoutesFile_a( table_name_singular, table_name_plural, reverse )
}
	
updateRoutesFile_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	route := scaffoldModel("`    Route`:`:group(['prefix' => '? valueSH2 ?']`, function () {`n        Route`:`:get('/'`, App\Http\Livewire\? valueCC1 ?\List? valueCC2 ?`:`:class)->name('? valueSH2 ?')`;`n        Route`:`:get('/create'`, App\Http\Livewire\? valueCC1 ?\Manage? valueCC1 ?`:`:class)->name('? valueSH2 ?.create')`;`n        Route`:`:get('/{? valueC1 ?}/edit'`, App\Http\Livewire\? valueCC1 ?\Manage? valueCC1 ?`:`:class)->name('? valueSH2 ?.edit')`;`n        Route`:`:get('/{? valueC1 ?}'`, App\Http\Livewire\? valueCC1 ?\Show? valueCC1 ?`:`:class)->name('? valueSH2 ?.show')`;`n    })`;`n`n")
	
	file =C:\xampp\htdocs\case-manager\routes\web.php
	FileRead, content, %file%
	StringReplace, content, content, `}); // group end, %route%`}); // group end
	
	fileWrite( content, file )
}
	
updateApiRoutes(){
	global
	updateApiRoutes_a( table_name_singular, table_name_plural, reverse )
}
	
updateApiRoutes_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	route := scaffoldModel("`    Route`:`:group(['prefix' => '? valueSH2 ?']`, function () {`n        Route`:`:get('/'`, [App\Http\Controllers\Api\? valueCC1 ?Controller`:`:class`, 'index'])->name('api.? valueSH2 ?')`;`n        Route`:`:post('/store'`, [App\Http\Controllers\Api\? valueCC1 ?Controller`:`:class`, 'store'])->name('api.? valueSH2 ?.store')`;`n        Route`:`:post('/{? valueS1 ?}/update'`, [App\Http\Controllers\Api\? valueCC1 ?Controller`:`:class`, 'update'])->name('api.? valueSH2 ?.update')`;`n        Route`:`:get('/{? valueS1 ?}'`, [App\Http\Controllers\Api\? valueCC1 ?Controller`:`:class`, 'show'])->name('api.? valueSH2 ?.show')`;`n    })`;`n`n")
	
	file =C:\xampp\htdocs\case-manager\routes\web.php
	FileRead, content, %file%
	StringReplace, content, content, // add API routes here, %route%// add API routes here
	
	fileWrite( content, file )
}
	
updatePermissions(){
	global
	updatePermissions_a( table_name_singular, table_name_plural, reverse )
}
	
updatePermissions_a(table_name_singular = 1, table_name_plural = 2, reverse = 0){
	permissions := scaffoldModel("`            // ? valueS1 ?`n            [`n                'name' => '? valueS1 ?.view_any'`,`n            ]`,`n            [`n                'name' => '? valueS1 ?.create'`,`n            ]`,`n            [`n                'name' => '? valueS1 ?.view'`,`n            ]`,`n            [`n                'name' => '? valueS1 ?.update'`,`n            ]`,`n            [`n                'name' => '? valueS1 ?.delete'`,`n            ]`,`n`n")
	
	file =C:\xampp\htdocs\case-manager\database\seeders\PermissionSeeder.php
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
	
	;~ file := "C:\xampp\htdocs\case-manager\resources\views\layouts\app.blade.php"
	;~ FileRead, content, %file%
	;~ StringReplace, content, content, `r,
	;~ StringReplace, content, content, `    // add new menu items here, %item%`    // add new menu items here, All
	
	item := scaffoldModel("`                    <a href=""{{ route('? valueSH2 ?') }}"" class=""block px-4 py-2 mt-2 text-sm font-semibold bg-transparent rounded-lg dark-mode`:bg-transparent dark-mode`:hover`:bg-gray-600 dark-mode`:focus`:bg-gray-600 dark-mode`:focus`:text-white dark-mode`:hover`:text-white dark-mode`:text-gray-200 md`:mt-0 hover`:text-gray-900 focus`:text-gray-900 hover`:bg-gray-200 focus`:bg-gray-200 focus`:outline-none focus`:shadow-outline"">? valueAT2 ?</a>`n")
	
	file := "C:\xampp\htdocs\case-manager\resources\views\layouts\sidebar\desktop.blade.php"
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
	
	name := scaffoldModel("? valueS2 ?")
	
	if(!cache[name] and name and name != "s"){
		if(location = "ncit_laptop")
			UrlDownloadToFile http://localhost/phpmyadmin/tbl_structure.php?db=case_manager&table=%name%, %A_ScriptDir%\table_info.html
		else
			UrlDownloadToFile http://localhost/phpmyadmin/index.php?route=/table/structure&db=case_manager&table=%name%, %A_ScriptDir%\table_info.html
		
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
	
	name := scaffoldModel("? valueS2 ?")
	
	if(!cache[name] and name and name != "s"){
		if(location = "ncit_laptop")
			UrlDownloadToFile http://localhost/phpmyadmin/tbl_relation.php?db=case_manager&table=%name%, %A_ScriptDir%\table_info.html
		else
			UrlDownloadToFile http://localhost/phpmyadmin/index.php?route=/table/relation&db=case_manager&table=%name%&ajax_request=true&ajax_page_request=true, %A_ScriptDir%\table_info.html
		
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
	
	clipList_A_Index := 0
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

	clipList_A_Index := 0
	clipList := modelName
	scaffold_template := "? value9 ?`t? value14 ?`n"
	ClipLoad()
	Clipboard=
	printUsingScaffold( "M", 16, 16)
	relations := Clipboard
	
	Clipboard := mergeDataTypesAndRelationships(dataTypes, relations)
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

load_singularToPlural(){
	global singularToPlural, pluralToSingular
	
	singularToPlural := {}
	;~ singularToPlural["contact_information_type"] := "contact_information_types"
	;~ singularToPlural["atoll"] := "atolls"
	;~ singularToPlural["island"] := "islands"
	;~ singularToPlural["country"] := "countries"
	;~ singularToPlural["operation_type"] := "operation_types"
	;~ singularToPlural["organisation_type"] := "organisation_types"
	;~ singularToPlural["operation_log"] := "operation_logs"
	;~ singularToPlural["user_organisation"] := "user_organisations"
	;~ singularToPlural["business_entity_type"] := "business_entity_types"
	;~ singularToPlural["business_entity"] := "business_entities"
	;~ singularToPlural["user"] := "users"
	;~ singularToPlural["password_reset"] := "password_resets"
	;~ singularToPlural["document_type"] := "document_types"
	;~ singularToPlural["file"] := "files"
	;~ singularToPlural["failed_job"] := "failed_jobs"
	;~ singularToPlural["personal_access_token"] := "personal_access_tokens"
	;~ singularToPlural["action"] := "actions"
	;~ singularToPlural["location_type"] := "location_types"
	;~ singularToPlural["location"] := "locations"
	;~ singularToPlural["auditlogactiontype"] := "auditlogactiontypes"
	;~ singularToPlural["auditlogdatatype"] := "auditlogdatatypes"
	;~ singularToPlural["auditlog"] := "auditlogs"
	;~ singularToPlural["business_entity_contact_information"] := "business_entity_contact_informations"
	;~ singularToPlural["business_entity_document"] := "business_entity_documents"
	;~ singularToPlural["business_entity_location_type"] := "business_entity_location_types"
	;~ singularToPlural["business_entity_location"] := "business_entity_locations"
	;~ singularToPlural["errorlog"] := "errorlog"
	;~ singularToPlural["gender_type"] := "gender_types"
	;~ singularToPlural["individual"] := "individuals"
	;~ singularToPlural["link_type"] := "link_types"
	;~ singularToPlural["role"] := "roles"
	;~ singularToPlural["navigation_link"] := "navigation_links"
	;~ singularToPlural["organisation"] := "organisations"
	;~ singularToPlural["request_state"] := "request_states"
	;~ singularToPlural["sequence_number_type"] := "sequence_number_types"
	;~ singularToPlural["request_type"] := "request_types"
	;~ singularToPlural["request"] := "requests"
	;~ singularToPlural["request_document"] := "request_documents"
	;~ singularToPlural["request_types_allowed_request_state_transition"] := "request_types_allowed_request_state_transitions"
	;~ singularToPlural["request_type_specific_document_type"] := "request_type_specific_document_types"
	;~ singularToPlural["role_action"] := "role_action"
	;~ singularToPlural["sequence_number_next_number"] := "sequence_number_next_numbers"
	;~ singularToPlural["sso_user_state"] := "sso_user_state"
	;~ singularToPlural["user_group"] := "user_groups"
	;~ singularToPlural["user_assigned_user_group"] := "user_assigned_user_groups"
	;~ singularToPlural["user_group_role"] := "user_group_roles"
	;~ singularToPlural["ward"] := "wards"
	;~ singularToPlural["case"] := "cases"
	;~ singularToPlural["case_item_type"] := "case_item_types"
	;~ singularToPlural["case_item"] := "case_items"
	;~ singularToPlural["case_attachment"] := "case_attachments"
	;~ singularToPlural["case_user"] := "case_users"
	;~ singularToPlural["comment"] := "comments"
	;~ singularToPlural["gems_mail"] := "gems_mails"
	;~ singularToPlural["task"] := "tasks"
	singularToPlural["status"] := "statuses"
	singularToPlural["task_status"] := "task_statuses"
	singularToPlural["confidentiality_class"] := "confidentiality_classes"
	singularToPlural["sensitivity"] := "sensitivities"
	;~ singularToPlural["origin"] := "origins"
	;~ singularToPlural["priority"] := "priorities"
	;~ singularToPlural["team"] := "teams"

	singularToPlural["address"] := "addresses"
	
	pluralToSingular := {}
	
	for index, value in singularToPlural
		pluralToSingular[value] := index
	
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

init_DB_Fields( loadName = 1, cache = 1){
	global modelName, DB_Fields, singularToPlural, pluralToSingular, singular, fields, table_name_singular, table_name_plural, primary_key, primary_key_row
	
	if( loadName )
		modelName()
	
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
			;~ if( RegExMatch(singular, ".*ies$") )
				;~ singular := RegExReplace(singular, "(.*)ies$", "$1y")
			;~ else if( RegExMatch(singular, ".*s$") )
				;~ singular := RegExReplace(singular, "(.*)s$", "$1")
			
			;~ if( RegExMatch(singular, ".*y$") )
				;~ plural := RegExReplace(singular, "(.*)y$", "$1") "ies"
			;~ else
				;~ plural := singular "s"
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
		}
	}
		
	fields := load_fields()
	specificFieldsArr()
}

HasVal(haystack, needle) {
	if !(IsObject(haystack)) || (haystack.Length() = 0)
		return 0
	for index, value in haystack
		if (value = needle)
			return index
	return 0
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

modelName(){
	global singular
	
	singular := "task-comment"
}

scaffoldFiles(){
	global singular, reverse, table_name_plural, found_DB_table, DB_Fields
	
	;~ reverse := 1
			
	myTT(singular)
	if( !DB_Fields )
		myTT("DB table not found")
	else{
		;~ apiController()
		;~ repository()
		;~ updateApiRoutes()
	
		
		
		;~ childListTest()
		;~ listTest()
		;~ manageTest()
		;~ showTest()
		
		
		;~ policy()
		;~ updatePermissions()
		
	
		;~ enum()
		
		;~ childListController()
		;~ childListView()
		

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
		

		;~ importView()
		;~ listView()
		;~ manageView()
		;~ showView()
		
		;~ updateRoutesFile()
		;~ updateSidebar()
		

		if(reverse)
			myTT("reverse")
		else
			myTT("scaffold done")
	}
}

#if (Stack="15am") ; scaffolding mode 
	~^s::
		if( WinActive("ahk_exe Code.exe") or WinActive("ahk_exe sublime_text.exe") )
			if( WinExist("Case Manager - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe") )
			{
				if( requireWinActive("Case Manager - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe") )
					Send {F5}
					;~ t = 1
			}
			else if( requireWinActive("ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe") )
					Send {F5}
				;~ t = 1
	return
	
	F1:: goToReference()
	
	F4:: goToPrevReference()
	return
	
	+`:: Send ? value1 ?{Left 2}+{Left}
	
	`::
		;~ printUsingScaffold( "", 1, -1) ; scaffold single
		;~ return
		
		;~ Send ^a
		
		Clipboard=
		waitClipboard()
		if(Clipboard){
			; decodeLinesAndTabs
			content := decodeLinesAndTabs(Clipboard)
			StringReplace, content, content, `"`", `", All	
			Clipboard := content
		}else{
			myTT("load as single-tab-plural if using unscaffolded template")
			printUsingScaffold( "MA", 1, -1) ; merge all
		}
		
		;~ Clipboard := RegExReplace(Clipboard, "i)(.*priority_id.*)1", "$13000")
		;~ Clipboard := RegExReplace(Clipboard, "i)(.*priority_id.*)2", "$12000")
		;~ Clipboard := RegExReplace(Clipboard, "i)(.*priority_id.*)3", "$11000")
		
		;~ Clipboard := RegExReplace(Clipboard, "i)(.*priority_id.*)", "$1`n              ""confidentiality_class_id"" => 1000`,")
		;~ Send ^v
	return

	^!`:: Clipboard := scaffoldFields("""? value1 ?""`, ", 1) ; list of fields

	^+!`:: ; bulk
		;~ bulkArr := ["users", "cases", "organisations", "organisation_types", "countries", "teams", "statuses", "origins", "priorities", "case_items", "case_item_types", "gender_types", "tasks", "case_users", "case_user_types", "individuals", "role", "permission", "role_permission", "user_role", "audits", "activity_log", "sensitivities", "tags", "checklists", "task_comments", "task_tags", "task_users"]
		bulkArr := ["tags", "checklists", "task_comments", "task_tags", "task_users"]
		
		for k, v in bulkArr {
			singular := snakeCase(v)
		
			init_DB_Fields(0)
			scaffoldFiles()
		}
		
		;~ for k, v in bulkArr {
			;~ singular := snakeCase(v)
		
			;~ init_DB_Fields(0, 0)
		;~ }
	return
			
	^`:: ; hydrate template
		old_Clipboard := Clipboard
		Clipboard := """ " Clipboard " """
		Send ^v
		Sleep 200
		Clipboard := old_Clipboard
	return
	
	^+`:: ; unscaffold
		waitClipboard()
		
		content := Clipboard
		
		if(singular){
			init_DB_Fields()
			StringCaseSense, On
			
			cases =CC`tAT`tS`tSH`tC`tL`tU`tT
			StringSplit, cases, cases, `t
			
			iterations := [2, 1]
			
			name := scaffoldModel("? valueCC1 ?")
			content := StrReplace(content, name, "? valueCC91 ?")
			
			name := scaffoldModel("? valueCC91 ?Model")
			content := StrReplace(content, name, "? valueCC1 ?")
			
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
	return
	
	
	
	;~ `:: 
		;~ Clipboard=
		;~ waitClipboard()
		;~ printUsingScaffold("C", 1, -1)

		printUsingScaffold("", 1, -1)
	;~ `:: 
		;~ StringReplace, Clipboard, Clipboard, `n, *, All
		;~ StringReplace, Clipboard, Clipboard, `r, , All
		
		;~ scaffoldFiles()
		;~ fieldsFromDB()
	return
	
	
	
	;~ ^`:: printUsingScaffold( 0, -1, 0) ; reverse
	
	;~ ^+`:: printUsingScaffold( "MA", 1, -1) ; merge all
	;~ `:: 
		;~ printUsingScaffold( "MA", 1, -1) ; merge all
		;~ Stack := "15s"
	;~ return
	
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
			nRows := clipList0 - clipList_A_Index
		}
		
		if(useLastLine){
			clipList_A_Index := clipList0 - 1
		}
		

		switch++
		
		if( defaultTemplate and !InStr(scaffold_template, "? value"))
			scaffold_template=? value1 ?
		
		if(fromClipboard){
			waitClipboard()
			row := replaceMarker()
		}else{
			Loop % nRows
			{
				thisRow := fetchRow(nColumns, 1, next)
				;~ run, thisRow
				
				;~ if(thisRow = "1")
					;~ Send {Space}
				;~ Send %thisRow%
				;~ Send {Tab 5}
				;~ sleep 50
				
				
				;~ thisRow := RegExReplace(thisRow, "i)\s*magu$", " magu")
				;~ thisRow := RegExReplace(thisRow, "i)\s*maagu$", " magu")
				;~ thisRow := RegExReplace(thisRow, "i)\s*goalhi$", " goalhi")
				;~ thisRow := RegExReplace(thisRow, "i)\s*hingun$", " hingun")
				;~ thisRow := RegExReplace(thisRow, "i)\s*" Chr(0x0789) Chr(0x07A6) Chr(0x078E) Chr(0x07AA) "$", " " Chr(0x0789) Chr(0x07A6) Chr(0x078E) Chr(0x07AA) ) ; magu
				;~ thisRow := RegExReplace(thisRow, "i)\s*" Chr(0x078E) Chr(0x07AF) Chr(0x0785) Chr(0x07A8) "$", " " Chr(0x078E) Chr(0x07AF) Chr(0x0785) Chr(0x07A8) ) ; goalhi
				;~ thisRow := RegExReplace(thisRow, "i)\s*" Chr(0x0780) Chr(0x07A8) Chr(0x0782) Chr(0x078E) Chr(0x07AA) Chr(0x0782) Chr(0x07B0) "$", " " Chr(0x0780) Chr(0x07A8) Chr(0x0782) Chr(0x078E) Chr(0x07AA) Chr(0x0782) Chr(0x07B0) ) ; hingun
				;~ row .= thisRow "`n"
				
				row .= thisRow
				

				;~ if(thisRow = "1"){
					;~ Send {Space}
					;~ Sleep 100
				;~ }
				
				;~ Send {Tab}
				;~ Sleep 100
				
				
				;~ if(thisRow = "1"){
					;~ Send {Enter}p{Enter}
				;~ }
				;~ Sleep 200
				;~ Send {tab}{tab}
				;~ Sleep 200

			}
		}
		
		if(skipLine)
			return

		StringReplace, row, row, % chr(254), `t, All
		StringReplace, row, row, % chr(255), `n, All

		;~ if(!mergeToClipboard)
			Clipboard=
		
		Clipboard .= row
		;~ myTT(Clipboard)
		
		
		if(!mergeToClipboard){
			Sleep 100
			;~ Send !d
			;~ Send ^v{Enter}
			Send ^v
			;~ run, % Clipboard
			;~ SendInput {Raw}%Clipboard%
			;~ Send {tab}
			
		}
		return row
	}
	
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
		
		; if browser is open
		if(WinActive("ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe")){
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
				if( InStr(t, "http://case.test") or InStr(t, "http://case-manager.test/") or InStr(t, "http://gemen-online.test/") or InStr(t, "http://recordsmv.ddns.net/") ){
					StringReplace, t, t, http://case.test/
					StringReplace, t, t, http://case-manager.test/
					StringReplace, t, t, http://gemen-online.test/
					StringReplace, t, t, http://recordsmv.ddns.net/
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
						Send % "@render"
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
			
			if(! WinActive("ahk_exe sublime_text.exe") and ! WinActive("ahk_exe Code.exe")){
			;~ if(location="NCIT"){
				StringReplace, ref, ref, ~, , All
				StringReplace, ref, ref, /, \, All
				ref := RegExReplace(ref, "^\\", "")
				Clipboard:= ref
				Send ^n
			}else {
				StringReplace, ref, ref, ., \, All
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
			nColumns := clipList0 - clipList_A_Index
		
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
				break
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
		
		StringReplace, hayStack, hayStack, ? value%index% ?, % value%index%, All
		StringReplace, hayStack, hayStack, ? valueC%index% ?, % valueC%index%, All
		StringReplace, hayStack, hayStack, ? valueCC%index% ?, % valueCC%index%, All
		StringReplace, hayStack, hayStack, ? valueS%index% ?, % valueS%index%, All
		StringReplace, hayStack, hayStack, ? valueSH%index% ?, % valueSH%index%, All
		StringReplace, hayStack, hayStack, ? valueU%index% ?, % valueU%index%, All
		StringReplace, hayStack, hayStack, ? valueAT%index% ?, % valueAT%index%, All
		StringReplace, hayStack, hayStack, ? valueT%index% ?, % valueT%index%, All
		StringReplace, hayStack, hayStack, ? valueL%index% ?, % valueL%index%, All
		
		return hayStack
	}

#if (Stack="15ad") ; Get First 50000 characters
	`::
		Click 317, 508
		Sleep 1000
		Send {Tab 2}
		Sleep 300
		Clipboard := SubStr(clipList, 1, 50000) " Hammadh End of document Hammadh End of document"
		clipList := SubStr(clipList, 50001)
		Send ^v
		myTT("clip loaded")
		MouseMove 3752, 500
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
		Clipboard := replaceBlankLines(Clipboard)
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
				
				if(tempN1 = tempH1)
				{
					output:= output needle%outIndex% "`t" haystack%A_Index% "`t1`n"
					break
				}else if(a_index=haystack0)
					output:= output needle%outIndex% "`t" needle%outIndex% "`tnot found`n"
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
		Send ^c
		waitClipboard(0)
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
		snakecasewithhyphen()
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

#if (Stack="15w") ; CapitalCamelCase
	`:: 
		capitalCamelCase()
		Send ^v
	return

	capitalCamelCase(source = "qpmz_default_never_used_by_anyone"){
		return genericWordCaseFormatter(source, "", 2, 2)
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
		;~ source := RegExReplace(source, "\W+", " ")
		
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
	`::
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
	
		Clipboard:= A_yyyy "-" A_MM "-" A_DD "-" A_Hour ":" A_Min
		Send ^v
		Sleep 300
		Clipboard := A_yyyy "_" A_MM "_" A_DD
	return

	
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

#IfWinNotActive, Decision Tree v2 ahk_class AutoHotkeyGUI
	!;:: 
		WinActivate, Decision Tree v2 ahk_class AutoHotkeyGUI
		ControlFocus, Edit2, Decision Tree v2 ahk_class AutoHotkeyGUI
		Send ^a
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
		;~ SendInput {Raw}%clip_bkp%
		Sleep 100
		Clipboard:=old_clip
	return

	;~ f::
	!`::
		mergeClipboard()
	return
	
	;~ `::
	;~ return
	
	
	^!;::
		;~ Send ^a
		;~ Sleep 100
		printUsingScaffold("")
	return

