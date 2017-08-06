@taskkill /f /im "AutoShutDown.exe"
copy "AutoShutDown.exe" "C:\Program Files\"
copy "AutoShutDown.ini" "C:\Program Files\"
copy "*.ico" "C:\Program Files\"
copy "*.lnk" "%appdata%\Microsoft\Windows\Start Menu\Programs\"
"C:\Program Files\AutoShutDown.exe"
@pause
@exit
