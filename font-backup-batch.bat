@echo off
setlocal EnableDelayedExpansion

echo ===================================
echo = BACKUP FONT INSTALLER WINDOWS 11 =
echo ===================================

REM Percorso base per il backup
set "scriptPath=%~dp0"
set "backupFolder=%scriptPath%FontBackup"
set "systemBackup=%backupFolder%\Sistema"
set "userBackup=%backupFolder%\Utente"

mkdir "%systemBackup%" 2>nul
mkdir "%userBackup%" 2>nul

echo Cartelle di backup create:
echo   Utente : %userBackup%
echo   Sistema: %systemBackup%
echo.

REM File di log dei font
set "fontsList=%backupFolder%\fonts_list.txt"
echo Lista dei font installati > "%fontsList%"
echo -------------------------- >> "%fontsList%"

REM Copia i font dell'utente
echo Copiando i font installati dall'utente...
set "userFontsFolder=%LOCALAPPDATA%\Microsoft\Windows\Fonts"
set "userFontCount=0"

if exist "%userFontsFolder%" (
    for %%F in ("%userFontsFolder%\*.*") do (
        set "ext=%%~xF"
        if /I "!ext!"==".ttf" set /a userFontCount+=1
        if /I "!ext!"==".otf" set /a userFontCount+=1
        if /I "!ext!"==".ttc" set /a userFontCount+=1
        if /I "!ext!"==".fon" set /a userFontCount+=1

        if /I "!ext!"==".ttf" (
            copy "%%F" "%userBackup%" >nul
            echo [UTENTE] %%~nxF >> "%fontsList%"
        )
        if /I "!ext!"==".otf" (
            copy "%%F" "%userBackup%" >nul
            echo [UTENTE] %%~nxF >> "%fontsList%"
        )
        if /I "!ext!"==".ttc" (
            copy "%%F" "%userBackup%" >nul
            echo [UTENTE] %%~nxF >> "%fontsList%"
        )
        if /I "!ext!"==".fon" (
            copy "%%F" "%userBackup%" >nul
            echo [UTENTE] %%~nxF >> "%fontsList%"
        )
    )
)

echo %userFontCount% font personali copiati.
echo.

REM Copia i font di sistema
echo Copiando i font di sistema...
set "systemFontsFolder=C:\Windows\Fonts"
set "systemFontCount=0"

for %%F in ("%systemFontsFolder%\*.*") do (
    set "ext=%%~xF"
    if /I "!ext!"==".ttf" set /a systemFontCount+=1
    if /I "!ext!"==".otf" set /a systemFontCount+=1
    if /I "!ext!"==".ttc" set /a systemFontCount+=1
    if /I "!ext!"==".fon" set /a systemFontCount+=1

    if /I "!ext!"==".ttf" (
        copy "%%F" "%systemBackup%" >nul
        echo [SISTEMA] %%~nxF >> "%fontsList%"
    )
    if /I "!ext!"==".otf" (
        copy "%%F" "%systemBackup%" >nul
        echo [SISTEMA] %%~nxF >> "%fontsList%"
    )
    if /I "!ext!"==".ttc" (
        copy "%%F" "%systemBackup%" >nul
        echo [SISTEMA] %%~nxF >> "%fontsList%"
    )
    if /I "!ext!"==".fon" (
        copy "%%F" "%systemBackup%" >nul
        echo [SISTEMA] %%~nxF >> "%fontsList%"
    )
)

echo %systemFontCount% font di sistema copiati.
echo.

REM Script di reinstallazione dei font UTENTE
set "installerScript=%backupFolder%\InstallFonts.bat"
echo @echo off > "%installerScript%"
echo echo Installazione dei font personali in corso... >> "%installerScript%"
echo. >> "%installerScript%"
echo set "fontCount=0" >> "%installerScript%"
echo. >> "%installerScript%"
echo for %%%%F in ("%%~dp0Utente\*.ttf" "%%~dp0Utente\*.otf" "%%~dp0Utente\*.ttc" "%%~dp0Utente\*.fon") do ( >> "%installerScript%"
echo     copy "%%%%F" "%%LOCALAPPDATA%%\Microsoft\Windows\Fonts" ^>nul >> "%installerScript%"
echo     reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "%%%%~nxF (TrueType)" /t REG_SZ /d "%%LOCALAPPDATA%%\Microsoft\Windows\Fonts\%%%%~nxF" /f ^>nul >> "%installerScript%"
echo     set /a fontCount+=1 >> "%installerScript%"
echo     echo Installato: %%%%~nxF >> "%installerScript%"
echo ) >> "%installerScript%"
echo. >> "%installerScript%"
echo echo Installazione completata! %%fontCount%% font personali installati. >> "%installerScript%"
echo echo Premere un tasto per uscire... >> "%installerScript%"
echo pause ^> nul >> "%installerScript%"

echo Backup completato con successo!
echo.
echo Totale dei font copiati: !userFontCount! (utente) + !systemFontCount! (sistema)
echo I font sono stati salvati in:
echo   %userBackup%
echo   %systemBackup%
echo È stato creato anche uno script per reinstallare i font UTENTE.
echo.
echo Premere un tasto per uscire.....
pause > nul