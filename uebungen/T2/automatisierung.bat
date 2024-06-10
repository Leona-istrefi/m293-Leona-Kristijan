@echo off
setlocal
 
:: Konfigurationsabschnitt
set SERVER=http://leonaistrefi.bplaced.net/
set PORT=21
set USERNAME=leona.istrefi@edu.tbz.ch
set PASSWORD=Leeoona.08
set LOCAL_PATH="C:\Users\TBZ\Documents\GitHub\m293-Leona-Kristijan\uebungen\H2\Uebung3"
set REMOTE_PATH=/htdocs
 
:: Skriptabschnitt
echo open %SERVER% %PORT% > ftpcmd.dat
echo user %USERNAME% %PASSWORD% >> ftpcmd.dat
echo binary >> ftpcmd.dat
echo lcd %LOCAL_PATH% >> ftpcmd.dat
echo cd %REMOTE_PATH% >> ftpcmd.dat
echo mput * >> ftpcmd.dat
echo bye >> ftpcmd.dat
 
ftp -s:ftpcmd.dat
 
del ftpcmd.dat
 
endlocal
