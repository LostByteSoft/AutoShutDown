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

	SetEnv, title, AutoShutDown
	SetEnv, mode, at a time
	SetEnv, version, Version 2017-07-07
	SetEnv, Author, LostByteSoft

	; SetEnv, time, 0001		; go to ini var
	IniRead, time, AutoShutDown.ini, options, time
	;; msgbox, %time%		; for debug purpose

;;--- Menu Tray options ---

	Menu, Tray, NoStandard
	Menu, tray, add, --= %title% =--, about1
	Menu, tray, add,
	Menu, tray, add, About %author%, about2			; about author
	Menu, Tray, Icon, About %author%, ico_about.ico
	Menu, tray, add, %Version%, version			; About version
	Menu, Tray, Icon, %Version%, ico_about.ico
	Menu, tray, add,
	Menu, tray, add, Options AutoShutDown.ini, options			; About version
	Menu, Tray, Icon, Options AutoShutDown.ini, ico_options.ico
	Menu, tray, add,
	Menu, tray, add, Exit %title%, ExitApp			; GuiClose exit program
	Menu, Tray, Icon, Exit %title%, ico_shut.ico
	Menu, tray, add, Refresh, doReload 			; Reload the script.
	Menu, Tray, Icon, Refresh, ico_reboot.ico, 1
	Menu, tray, add, Do It Now (Shutdown), shut
	Menu, Tray, Icon, Do It Now (Shutdown), ico_HotKeys.ico
	Menu, Tray, Tip, %title% - Shut at %time% H

;;--- Software start here ---


loop:
	SetEnv, var, %A_HOUR%%A_MIN%
	IfEqual, var, %time%, goto, shut
	Sleep, 55000
	;; msgbox,0,Time,%A_HOUR%%A_MIN%	; for debug purpose
	goto, loop


shut:
	Gui, Add, Text, x12 y10 w450 h100 , The computer will shutdown in 20 seconds. This message have a 10 seconds timeout. You can press "Cancel" to cancel it will cancel. Button "Do it now" shutdown now without any notifications. Button "ok" shutdown normally. %author% %title% %mode% %version%. The time set is %time%.
	Gui, Add, Button, x12 y130 w110 h50 , Ok
	Gui, Add, Button, x132 y130 w110 h50 , Do it now
	Gui, Add, Button, x252 y130 w110 h50 , Cancel

	Gui, Show, x990 y435 h206 w479, AutoShutDown
	SetTimer, Splash, 10000
	Return

	ButtonOk:
		Goto, Splash

	ButtonDoitnow:
		Gui, destroy
		Goto, Shutdown

	ButtonCancel:
		Gui, destroy
		goto, doReload

	Splash:
	Gui, destroy
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
	TrayTip, %title%, ShutDown at time %Author%, 2, 2
	Return

Version:
	TrayTip, %title%, %version%, 2, 2
	Return

doReload:
	Reload
	Exitapp

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