;;--- Head --- Informations --- AHK --- File(s) needed ---

;;	Compatibility: Windows
;;	All files must be in same folder. Where you want.
;;	Just wait the time you set to shutdown computer.

;;--- Softwares var options files ---

	SetWorkingDir, %A_ScriptDir%
	#SingleInstance Force
	#Persistent
	#NoEnv

	FileInstall, ico_time.ico, ico_time.ico, 0
	FileInstall, ico_about.ico, ico_about.ico, 0
	FileInstall, ico_shut.ico, ico_shut.ico, 0
	FileInstall, ico_reboot.ico, ico_reboot.ico, 0
	FileInstall, ico_HotKeys.ico, ico_HotKeys.ico, 0
	FileInstall, ico_options.ico, ico_options.ico, 0
	FileInstall, ico_lock.ico, ico_lock.ico, 0

	SetEnv, title, AutoShutDown
	SetEnv, mode, at a time
	SetEnv, version, Version 2017-07-07
	SetEnv, Author, LostByteSoft

	;; IniRead, time, AutoShutDown.ini, options, time	 ; removed

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
	Menu, tray, add, --= %title% =--, about1
	Menu, Tray, Icon,  --= %title% =--, ico_time.ico
	Menu, tray, add,
	Menu, tray, add, About %author%, about2			; about author
	Menu, Tray, Icon, About %author%, ico_about.ico
	Menu, tray, add, %Version%, version			; About version
	Menu, Tray, Icon, %Version%, ico_about.ico
	Menu, tray, add,
	Menu, tray, add, Options AutoShutDown.ini, options
	Menu, Tray, Icon, Options AutoShutDown.ini, ico_options.ico
	Menu, tray, add, Time set = %time% H, about3
	Menu, Tray, Icon, Time set = %time% H, ico_options.ico
	Menu, tray, add, Secret MsgBox, secretmsgbox
	Menu, Tray, Icon, Secret MsgBox, ico_lock.ico
	Menu, tray, add,
	Menu, tray, add, Exit %title%, ExitApp			; GuiClose exit program
	Menu, Tray, Icon, Exit %title%, ico_shut.ico
	Menu, tray, add, Refresh, doReload 			; Reload the script.
	Menu, Tray, Icon, Refresh, ico_reboot.ico, 1
	Menu, tray, add, Do It Now (Shutdown), Gui
	Menu, Tray, Icon, Do It Now (Shutdown), ico_HotKeys.ico
	Menu, Tray, Tip, %title% - Shut at %time% H

;;--- Software start here ---

loop:

	FormatTime, today_dddd, %today%, dddd
	IfEqual, today_dddd, dimanche, goto, sunday
	IfEqual, today_dddd, sunday, goto, sunday
	IfEqual, today_dddd, lundi, goto, monday
	IfEqual, today_dddd, monday, goto, monday
	IfEqual, today_dddd, mardi, goto, tuesday
	IfEqual, today_dddd, tuesday, goto, tuesday
	IfEqual, today_dddd, mercredi, goto, wenesday
	IfEqual, today_dddd, wenesday, goto, wenesday
	IfEqual, today_dddd, vendredi, goto, friday
	IfEqual, today_dddd, friday, goto, friday
	IfEqual, today_dddd, samedi, goto, saturday
	IfEqual, today_dddd, saturday, goto, saturday
	Sleep, 55000
	MsgBox, error detecting the day. Retry.
	goto, loop


;;--- Days of the week ---

sunday:
	SetEnv, today, sunday
	SetEnv, var, %A_HOUR%%A_MIN%
	IfEqual, var, %sunday%, goto, shut
	Sleep, 55000
	IfNotEqual, today, sunday, goto, loop
	goto, sunday

monday:
	SetEnv, today, monday
	SetEnv, var, %A_HOUR%%A_MIN%
	IfEqual, var, %monday%, goto, shut
	Sleep, 55000
	IfNotEqual, today, monday, goto, loop
	goto, monday

tuesday:
	SetEnv, today, tuesday
	SetEnv, var, %A_HOUR%%A_MIN%
	IfEqual, var, %tuesday%, goto, shut
	Sleep, 55000
	IfNotEqual, today, tuesday, goto, loop
	goto, tuesday

wenesday:
	SetEnv, today, wenesday
	SetEnv, var, %A_HOUR%%A_MIN%
	IfEqual, var, %wenesday%, goto, shut
	Sleep, 55000
	IfNotEqual, today, wenesday, goto, loop
	goto, wenesday

thusday:
	SetEnv, today, thusday
	SetEnv, var, %A_HOUR%%A_MIN%
	IfEqual, var, %thusday%, goto, shut
	Sleep, 55000
	IfNotEqual, today, thusday, goto, loop
	goto, thusday

friday:
	SetEnv, today, friday
	SetEnv, var, %A_HOUR%%A_MIN%
	IfEqual, var, %friday%, goto, shut
	Sleep, 55000
	IfNotEqual, today, friday, goto, loop
	goto, friday

saturday:
	SetEnv, today, saturday
	SetEnv, var, %A_HOUR%%A_MIN%
	IfEqual, var, %saturday%, goto, shut
	Sleep, 55000
	IfNotEqual, today, saturday, goto, loop
	goto, saturday

;;--- Shutdown ---

shut:
	IfEqual, sundayonoff, 0, goto, loop
	IfEqual, mondayonoff, 0, goto, loop
	IfEqual, tuesdayonoff, 0, goto, loop
	IfEqual, wenesdayonoff, 0, goto, loop
	IfEqual, thusdayonoff, 0, goto, loop
	IfEqual, fridayonoff, 0, goto, loop
	IfEqual, saturdayonoff, 0, goto, loop

Gui:
	Gui, Add, Text, x12 y10 w450 h100 , The computer will shutdown in 20 seconds. This message have a 10 seconds timeout. `n`nYou can press "Cancel" to cancel it will cancel. Button "Do it now" shutdown now without any notifications. Button "ok" shutdown normally.`n`n%author% %title% %mode% %version%. The time set is %time%.
	Gui, Add, Button, x75 y100 w110 h50 , Ok
	Gui, Add, Button, x200 y100 w110 h50 , Do it now
	Gui, Add, Button, x325 y100 w110 h50 , Cancel
	Gui, Show, x990 y435 h175 w500, AutoShutDown
	SetTimer, Splash, 10000
	Return

	ButtonOk:
		Gui, destroy
		Goto, Splash

	ButtonDoitnow:
		Gui, destroy
		Goto, Shutdown

	ButtonCancel:
		Gui, destroy
		goto, doReload

	Splash:
	SplashTextOn, 300, 75, Shutdown Computer, Shutdown in: 10
	sleep, 1000
	SplashTextOn, 300, 75, Shutdown Computer, Shutdown in: 9
	sleep, 1000
	SplashTextOn, 300, 75, Shutdown Computer, Shutdown in: 8
	sleep, 1000
	SplashTextOn, 300, 75, Shutdown Computer, Shutdown in: 7
	sleep, 1000
	SplashTextOn, 300, 75, Shutdown Computer, Shutdown in: 6
	sleep, 1000
	SplashTextOn, 300, 75, Shutdown Computer, Shutdown in: 5
	sleep, 1000
	SplashTextOn, 300, 75, shutdown Computer, Shutdown in: 4
	sleep, 1000
	SplashTextOn, 300, 75, shutdown Computer, Shutdown in: 3
	sleep, 1000
	SplashTextOn, 300, 75, shutdown Computer, Shutdown in: 2
	sleep, 1000
	SplashTextOn, 300, 75, shutdown Computer, Shutdown in: 1
	sleep, 1000
	SplashTextOff

;;--- Shutdown ---

	Shutdown:
	;; MsgBox, IS SHUTDOWN 	;; for debug purpose
	Shutdown, 5
	goto, Exitapp

;;--- Quit (escape , esc)

Exitapp:
	ExitApp

;;--- Tray Bar (must be at end of file) ---

options:
	run, notepad.exe "AutoShutDown.ini"
	Sleep, 2000
	Return

about1:
about2:
about3:
	TrayTip, %title%, ShutDown at time %Author%, 2, 2
	Return

Version:
	TrayTip, %title%, %version%, 2, 2
	Return

doReload:
	Reload
	Exitapp

secretmsgbox:
	MsgBox, a_hour=%a_hour% - A_MIN=%A_MIN% - today_dddd=%today_dddd% - time=%time% - sunday=%sunday% - monday=%monday% - tuesday=%tuesday% - wenesday=%wenesday% - thusday=%thusday% - friday=%friday% - saturday=%saturday% - sundayonoff=%sundayonoff% - mondayonoff=%mondayonoff% - tuesdayonoff=%tuesdayonoff% - wenesdayonoff=%wenesdayonoff% - thusdayonoff=%thusdayonoff% - fridayonoff=%fridayonoff% - saturdayonoff=%saturdayonoff%
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
;	As is customary and in compliance with current global and
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