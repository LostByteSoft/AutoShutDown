;;--- Head --- Informations --- AHK ---

;;	Compatibility: Windows Xp , Windows Vista , Windows 7 , Windows 8
;;	All files must be in same folder. Where you want.
;;	64 bit AHK version : 1.1.24.2 64 bit Unicode
;;	Use as a developpement tool for AHK
;;	This entire thing (work) is a developpement tool for AHK scripting.
;;	Use an external EXE or DLL file for icon is shit load of job and the final quality is less.
;;	2018-03-14-1450 - Windows 10 x64 NOT compatible and that's it

;;--- Softwares Variables ---

	#NoEnv
	#SingleInstance Force
	#Persistent
	SetWorkingDir, %A_ScriptDir%

	SetEnv, title, AutoShutDown
	SetEnv, mode, at a time
	SetEnv, version, Version 2018-03-14-1502
	SetEnv, Author, LostByteSoft
	SetEnv, pause, 0
	SetEnv, icofolder, C:\Program Files\Common Files\
	SetEnv, logoicon, ico_time.ico
	SetEnv, debug, 0

	;; specific files
	FileInstall, AutoShutDown.ini, AutoShutDown.ini, 0
	FileInstall, ico_time.ico, %icofolder%\ico_time.ico, 0
	FileInstall, ico_time_w.ico, %icofolder%\ico_time_w.ico, 0
	FileInstall, ico_Session.ico, %icofolder%\ico_Session.ico, 0
	FileInstall, ico_veille.ico, %icofolder%\ico_veille.ico, 0

	;; Common ico
	FileInstall, ico_about.ico, %icofolder%\ico_about.ico, 0
	FileInstall, ico_lock.ico, %icofolder%\ico_lock.ico, 0
	FileInstall, ico_options.ico, %icofolder%\ico_options.ico, 0
	FileInstall, ico_reboot.ico, %icofolder%\ico_reboot.ico, 0
	FileInstall, ico_shut.ico, %icofolder%\ico_shut.ico, 0
	FileInstall, ico_debug.ico, %icofolder%\ico_debug.ico, 0
	FileInstall, ico_HotKeys.ico, %icofolder%\ico_HotKeys.ico, 0
	FileInstall, ico_pause.ico, %icofolder%\ico_pause.ico, 0
	FileInstall, ico_loupe.ico, %icofolder%\ico_loupe.ico, 0
	FileInstall, ico_folder.ico, %icofolder%\ico_folder.ico, 0

;;--- Set email and password here ---

	IniRead, sunday, AutoShutDown.ini, options, sunday
	IniRead, monday, AutoShutDown.ini, options, monday
	IniRead, tuesday, AutoShutDown.ini, options, tuesday
	IniRead, wenesday, AutoShutDown.ini, options, wenesday
	IniRead, thusday, AutoShutDown.ini, options, thusday
	IniRead, friday, AutoShutDown.ini, options, friday
	IniRead, saturday, AutoShutDown.ini, options, saturday

	IniRead, sundayonoff, AutoShutDown.ini, options, sundayonoff
	IniRead, mondayonoff, AutoShutDown.ini, options, mondayonoff
	IniRead, tuesdayonoff, AutoShutDown.ini, options, tuesdayonoff
	IniRead, wenesdayonoff, AutoShutDown.ini, options, wenesdayonoff
	IniRead, thusdayonoff, AutoShutDown.ini, options, thusdayonoff
	IniRead, fridayonoff, AutoShutDown.ini, options, fridayonoff
	IniRead, saturdayonoff, AutoShutDown.ini, options, saturdayonoff

	FormatTime, today_dddd, %today%, dddd

	IfEqual, today_dddd, dimanche, SetEnv, time, %sunday%
	IfEqual, today_dddd, sunday, SetEnv, time, %sunday%
	IfEqual, today_dddd, lundi, SetEnv, time, %monday%
	IfEqual, today_dddd, monday, SetEnv, time, %monday%
	IfEqual, today_dddd, mardi, SetEnv, time, %tuesday%
	IfEqual, today_dddd, tuesday, SetEnv, time, %tuesday%
	IfEqual, today_dddd, mercredi, SetEnv, time, %wenesday%
	IfEqual, today_dddd, wenesday, SetEnv, time, %wenesday%
	IfEqual, today_dddd, jeudi, SetEnv, time, %thusday%
	IfEqual, today_dddd, thusday, SetEnv, time, %thusday%
	IfEqual, today_dddd, vendredi, SetEnv, time, %friday%
	IfEqual, today_dddd, friday, SetEnv, time, %friday%
	IfEqual, today_dddd, samedi, SetEnv, time, %saturday%
	IfEqual, today_dddd, saturday, SetEnv, time, %saturday%

;;--- Menu Tray options ---

	Menu, Tray, NoStandard
	Menu, tray, add, ---=== %title% ===---, about
	Menu, Tray, Icon, ---=== %title% ===---, %icofolder%\%logoicon%
	Menu, tray, add, Show logo, GuiLogo
	Menu, tray, add, Secret MsgBox, secret					; Secret MsgBox, just show all options and variables of the program.
	Menu, Tray, Icon, Secret MsgBox, %icofolder%\ico_lock.ico
	Menu, tray, add, About && ReadMe, author				; infos about author
	Menu, Tray, Icon, About && ReadMe, %icofolder%\ico_about.ico
	Menu, tray, add, Author %author%, about					; author msg box
	menu, tray, disable, Author %author%
	Menu, tray, add, %version%, about					; version of the software
	menu, tray, disable, %version%
	Menu, tray, add, Open project web page, webpage				; open web page project
	Menu, Tray, Icon, Open project web page, %icofolder%\ico_HotKeys.ico
	Menu, tray, add,
	Menu, tray, add, --== Control ==--, about
	Menu, Tray, Icon, --== Control ==--, %icofolder%\ico_options.ico
	;menu, tray, add, Show Gui (Same as click), start			; Default gui open
	;Menu, Tray, Icon, Show Gui (Same as click), %icofolder%\ico_loupe.ico
	;Menu, Tray, Default, Show Gui (Same as click)
	;Menu, Tray, Click, 1
	Menu, tray, add, Set Debug (Toggle), debug				; debug msg
	Menu, Tray, Icon, Set Debug (Toggle), %icofolder%\ico_debug.ico
	Menu, tray, add, Open A_WorkingDir, A_WorkingDir			; open where the exe is
	Menu, Tray, Icon, Open A_WorkingDir, %icofolder%\ico_folder.ico
	Menu, tray, add,
	Menu, tray, add, Exit %title%, ExitApp					; Close exit program
	Menu, Tray, Icon, Exit %title%, %icofolder%\ico_shut.ico
	Menu, tray, add, Refresh (Ini mod), doReload 				; Reload the script.
	Menu, Tray, Icon, Refresh (Ini mod), %icofolder%\ico_reboot.ico
	Menu, tray, add, Pause (Toggle), pause					; pause the script
	Menu, Tray, Icon, Pause (Toggle), %icofolder%\ico_pause.ico
	Menu, tray, add,
	Menu, tray, add, --== Options ==--, about
	Menu, Tray, Icon, --== Options ==--, %icofolder%\ico_options.ico
	Menu, tray, add, Options AutoShutDown.ini, options
	Menu, Tray, Default, Options AutoShutDown.ini
	Menu, Tray, Click, 1
	Menu, tray, add,
	Menu, Tray, Tip, %title% - Shut at %time% H

;;--- Software start here ---

loop:
start:
	IfEqual, pause, 1, Goto, skipicon
	Menu, Tray, Icon, %icofolder%\ico_time_w.ico
	skipicon:
	Sleep, 5000
	IfEqual, debug, 1, msgbox, LOOP : watch day. (sleep 5000)
	;; FormatTime, today_dddd, %today%, dddd
	IfEqual, today_dddd, dimanche, goto, sunday
	IfEqual, today_dddd, sunday, goto, sunday
	IfEqual, today_dddd, lundi, goto, monday
	IfEqual, today_dddd, monday, goto, monday
	IfEqual, today_dddd, mardi, goto, tuesday
	IfEqual, today_dddd, tuesday, goto, tuesday
	IfEqual, today_dddd, mercredi, goto, wenesday
	IfEqual, today_dddd, wenesday, goto, wenesday
	IfEqual, today_dddd, thusday, goto, thusday
	IfEqual, today_dddd, jeudi, goto, thusday
	IfEqual, today_dddd, vendredi, goto, friday
	IfEqual, today_dddd, friday, goto, friday
	IfEqual, today_dddd, samedi, goto, saturday
	IfEqual, today_dddd, saturday, goto, saturday
	Goto, error

;;--- Days of the week ---

sunday:
	SetEnv, today, sunday
	SetEnv, var, %A_HOUR%%A_MIN%
	IfEqual, var, %sunday%, goto, shutsun
	Sleep, 50000
	IfNotEqual, today, sunday, goto, loop
	goto, sunday

	shutsun:
	IfEqual, sundayonoff, 0, goto, loop
	Sleep, 5000
	Goto, gui

monday:
	SetEnv, today, monday
	SetEnv, var, %A_HOUR%%A_MIN%
	IfEqual, var, %monday%, goto, shutmon
	IfEqual , debug, 1, msgbox, MONDAY : %A_HOUR%%A_MIN% . %var% %monday%
	Sleep, 50000
	IfNotEqual, today, monday, goto, loop
	goto, monday

	shutmon:
	IfEqual, mondayonoff, 0, goto, loop
	Sleep, 5000
	Goto, gui

tuesday:
	SetEnv, today, tuesday
	SetEnv, var, %A_HOUR%%A_MIN%
	IfEqual, var, %tuesday%, goto, shuttue
	Sleep, 50000
	IfNotEqual, today, tuesday, goto, loop
	goto, tuesday

	shuttue:
	IfEqual, tuesdayonoff, 0, goto, loop
	Sleep, 5000
	Goto, gui

wenesday:
	SetEnv, today, wenesday
	SetEnv, var, %A_HOUR%%A_MIN%
	IfEqual, var, %wenesday%, goto, shutwen
	Sleep, 50000
	IfNotEqual, today, wenesday, goto, loop
	goto, wenesday

	shutwen:
	IfEqual, wenesdayonoff, 0, goto, loop
	Sleep, 5000
	Goto, gui

thusday:
	SetEnv, today, thusday
	SetEnv, var, %A_HOUR%%A_MIN%
	IfEqual, var, %thusday%, goto, shutthu
	Sleep, 50000
	IfNotEqual, today, thusday, goto, loop
	goto, thusday

	shutthu:
	IfEqual, wenesdayonoff, 0, goto, loop
	Sleep, 5000
	Goto, gui

friday:
	SetEnv, today, friday
	SetEnv, var, %A_HOUR%%A_MIN%
	IfEqual, var, %friday%, goto, shutfri
	Sleep, 50000
	IfNotEqual, today, friday, goto, loop
	goto, friday

	shutfri:
	IfEqual, fridayonoff, 0, goto, loop
	Sleep, 5000
	Goto, gui

saturday:
	SetEnv, today, saturday
	SetEnv, var, %A_HOUR%%A_MIN%
	IfEqual, var, %saturday%, goto, shutsat
	Sleep, 50000
	IfNotEqual, today, saturday, goto, loop
	goto, saturday

	shutsat:
	IfEqual, saturdayonoff, 0, goto, loop
	Sleep, 5000
	Goto, gui

;;--- Debug Pause ---

Debug:
	IfEqual, debug, 0, goto, enable
	IfEqual, debug, 1, goto, disable

	enable:
	SetEnv, debug, 1
	Goto, start

	disable:
	SetEnv, debug, 0
	Goto, start

pause:
	Ifequal, pause, 0, goto, paused
	Ifequal, pause, 1, goto, unpaused

	paused:
	Menu, Tray, Icon, %icofolder%\ico_pause.ico
	SetEnv, pause, 1
	goto, start

	unpaused:	
	Menu, Tray, Icon, %icofolder%\ico_time_w.ico
	SetEnv, pause, 0
	Goto, start

;;--- Error ---

error:
	Random, error, 1111, 9999
	MsgBox, 16, %title%, Error %error%
	Sleep, 500
	Goto, loop

;;--- Shutdown ---

Gui:						; Gui form script to shutdown, have a timeout
	Ifequal, pause, 1, goto, sleep
	Menu, Tray, Icon, %icofolder%\ico_time.ico
	WinMinimizeAll
	MsgBox , 33, Auto Shut Down, The computer will shutdown in 20 seconds. This message have a 10 seconds timeout.`n`nYou can press "Cancel" to cancel. Button "ok" shutdown normally.`n`n%author% %title% %mode% %version%.`n`nThe time set is %time%., 10
		if ErrorLevel, goto, loop
	IfMsgBox, TIMEOUT, goto, splash
	IfMsgBox, Ok, goto, splash
	IfMsgBox, CANCEL, goto, sleep
	WinMinimizeAllUndo
	goto, loop

Gui2:						; Gui from tray
	Menu, Tray, Icon, %icofolder%\ico_time.ico
	WinMinimizeAll
	MsgBox , 33, Auto Shut Down, The computer will shutdown in 10 seconds if you press OK.`n`nYou can press "Cancel" to cancel. Button "ok" shutdown normally.`n`n%author% %title% %mode% %version%.`n`nThe time set is %time%.
		if ErrorLevel, goto, loop
	IfMsgBox, Ok, goto, splash
	IfMsgBox, CANCEL, goto, sleep
	WinMinimizeAllUndo
	goto, loop

sleep:
	WinMinimizeAllUndo
	sleep, 500
	Menu, Tray, Icon, %icofolder%\ico_pause.ico
	IfEqual, debug, 1, MsgBox, I'm sleeping for 2 min.
	sleep, 125000			; sleep for 2 min after cancel is pressed.
	goto, loop

;;--- Shutdown ---

	Splash:
	Menu, Tray, Icon, %icofolder%\ico_shut.ico
	Loop, 
	{
	if (BreakLoop = 1)
	break 
	SplashTextOn, 300, 75, Shutdown Computer, Shutdown in: 10 Press " Alt + A " to cancel
	sleep, 1000
	SplashTextOn, 300, 75, Shutdown Computer, Shutdown in: 09 Press " Alt + A " to cancel
	sleep, 1000
	SplashTextOn, 300, 75, Shutdown Computer, Shutdown in: 08 Press " Alt + A " to cancel
	sleep, 1000
	SplashTextOn, 300, 75, Shutdown Computer, Shutdown in: 07 Press " Alt + A " to cancel
	sleep, 1000
	SplashTextOn, 300, 75, Shutdown Computer, Shutdown in: 06 Press " Alt + A " to cancel
	sleep, 1000
	SplashTextOn, 300, 75, Shutdown Computer, Shutdown in: 05 Press " Alt + A " to cancel
	sleep, 1000
	SplashTextOn, 300, 75, shutdown Computer, Shutdown in: 04 Press " Alt + A " to cancel
	sleep, 1000
	SplashTextOn, 300, 75, shutdown Computer, Shutdown in: 03 Press " Alt + A " to cancel
	sleep, 1000
	SplashTextOn, 300, 75, shutdown Computer, Shutdown in: 02 Press " Alt + A " to cancel
	sleep, 1000
	SplashTextOn, 300, 75, shutdown Computer, Shutdown in: 01 Press " Alt + A " to cancel
	sleep, 1000
	SplashTextOff
	IfEqual, debug, 1, MsgBox, !!! IS SHUTDOWN !!! You are in debug mode, return to loop. (No shutdown) 	;; for debug purpose
	IfEqual, debug, 1, goto, loop 										;; for debug purpose
	Shutdown, 5
	goto, Exitapp
	}
	!a::
	BreakLoop = 1
	WinMinimizeAllUndo
	Reload
	Exitapp

;--- Computer mode ---

reboot:
	Menu, Tray, Icon, %icofolder%\ico_shut.ico
	sleep, 1000
	Shutdown, 6
	Goto, Exitapp

sessionpc:
	Menu, Tray, Icon, %icofolder%\ico_Session.ico
	sleep, 1000
	Shutdown, 0
	Goto, Exitapp

sleeppc:
	Menu, Tray, Icon, %icofolder%\ico_veille.ico
	sleep, 1000
	DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
	Goto, Exitapp

;;--- Quit ---

;; Escape::		; Debug purpose
	ExitApp

GuiClose:
	Gui, destroy
	goto, start

ExitApp:
	ExitApp

doReload:
	Reload
	sleep, 100
	goto, ExitApp

;;--- Tray Bar (must be at end of file) ---

options:
	run, notepad.exe "AutoShutDown.ini"
	Sleep, 2000
	Return

about:
	TrayTip, %title%, ShutDown at time %Author%, 2, 2
	Return

Version:
	TrayTip, %title%, %version%, 2, 2
	Return

author:
	MsgBox, 64, %title%, %title% %mode% %version% %author%. This software is usefull for shutdown a computer automaticly.`n`n`tGo to https://github.com/LostByteSoft
	Return

secret:
	msgbox, 49, %title%, title=%title% mode=%mode% version=%version% author=%author% debug=%debug%`n`na_hour=%a_hour% - A_MIN=%A_MIN% - today_dddd=%today_dddd% - time=%time%`n`nsunday=%sunday% - monday=%monday% - tuesday=%tuesday% - wenesday=%wenesday% - thusday=%thusday% - friday=%friday% - saturday=%saturday%`n`nsundayonoff=%sundayonoff% mondayonoff=%mondayonoff% - tuesdayonoff=%tuesdayonoff% - wenesdayonoff=%wenesdayonoff% - thusdayonoff=%thusdayonoff% - fridayonoff=%fridayonoff% - saturdayonoff=%saturdayonoff%`n`n Now is: %a_hour%%A_MIN% %today_dddd% is set to shut %time%.
	Return

GuiLogo:
	Gui, 4:Add, Picture, x25 y25 w400 h400, %icofolder%\%logoicon%
	Gui, 4:Show, w450 h450, %title% Logo
	Gui, 4:Color, 000000
	Gui, 4:-MinimizeBox
	Sleep, 500
	Return

	4GuiClose:
	Gui 4:Cancel
	return

A_WorkingDir:
	IfEqual, debug, 1, msgbox, run, explorer.exe "%A_WorkingDir%"
	run, explorer.exe "%A_WorkingDir%"
	Return

webpage:
	run, https://github.com/LostByteSoft/%title%
	Return

;;--- End of script ---
;
;            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
;   Version 3.14159265358979323846264338327950288419716939937510582
;                          March 2017
;
; Everyone is permitted to copy and distribute verbatim or modified
; copies of this license document, and changing it is allowed as long
; as the name is changed.
;
;            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
;   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
;
;              You just DO WHAT THE FUCK YOU WANT TO.
;
;		     NO FUCKING WARRANTY AT ALL
;
;      The warranty is included in your anus. Look carefully you
;             might miss all theses small characters.
;
;	        Here is no fucking small carachter at all.
;
;	   As is customary and in compliance with current global and
;	interplanetary regulations, the author of these pages disclaims
;	all liability for the consequences of the advice given here,
;	in particular in the event of partial or total destruction of
;	the material, Loss of rights to the manufacturer's warranty,
;	electrocution, drowning, divorce, civil war, the effects of
;	radiation due to atomic fission, unexpected tax recalls or
;	    encounters with extraterrestrial beings 'elsewhere.
;
;     LostByteSoft no copyright or copyleft is just in the center.
;
;	If you are unhappy with this software i do not care.
;
;;--- End of file ---   