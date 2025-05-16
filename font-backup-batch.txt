@echo off
setlocal EnableDelayedExpansion

echo ===================================
echo = BACKUP FONT INSTALLER WINDOWS 11 =
echo ===================================

REM Crea la cartella FontBackup nella stessa directory dello script
set "scriptPath=%~dp0"
set "backupFolder=%scriptPath%FontBackup"
mkdir "%backupFolder%" 2>nul

echo Creazione della cartella di backup: %backupFolder%
echo.

REM Crea un file per la lista dei font
set "fontsList=%backupFolder%\fonts_list.txt"
echo Lista dei font installati > "%fontsList%"
echo -------------------------- >> "%fontsList%"

REM Copia i font installati dall'utente
echo Copiando i font installati dall'utente...
set "userFontsFolder=%LOCALAPPDATA%\Microsoft\Windows\Fonts"
set "userFontCount=0"

if exist "%userFontsFolder%" (
    for %%F in ("%userFontsFolder%\*.*") do (
        if "%%~xF"==".ttf" set /a userFontCount+=1
        if "%%~xF"==".otf" set /a userFontCount+=1
        if "%%~xF"==".ttc" set /a userFontCount+=1
        if "%%~xF"==".fon" set /a userFontCount+=1
        
        if "%%~xF"==".ttf" (
            copy "%%F" "%backupFolder%" >nul
            echo [UTENTE] %%~nxF >> "%fontsList%"
        )
        if "%%~xF"==".otf" (
            copy "%%F" "%backupFolder%" >nul
            echo [UTENTE] %%~nxF >> "%fontsList%"
        )
        if "%%~xF"==".ttc" (
            copy "%%F" "%backupFolder%" >nul
            echo [UTENTE] %%~nxF >> "%fontsList%"
        )
        if "%%~xF"==".fon" (
            copy "%%F" "%backupFolder%" >nul
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
    if "%%~xF"==".ttf" set /a systemFontCount+=1
    if "%%~xF"==".otf" set /a systemFontCount+=1
    if "%%~xF"==".ttc" set /a systemFontCount+=1
    if "%%~xF"==".fon" set /a systemFontCount+=1
    
    if "%%~xF"==".ttf" (
        copy "%%F" "%backupFolder%" >nul
        echo [SISTEMA] %%~nxF >> "%fontsList%"
    )
    if "%%~xF"==".otf" (
        copy "%%F" "%backupFolder%" >nul
        echo [SISTEMA] %%~nxF >> "%fontsList%"
    )
    if "%%~xF"==".ttc" (
        copy "%%F" "%backupFolder%" >nul
        echo [SISTEMA] %%~nxF >> "%fontsList%"
    )
    if "%%~xF"==".fon" (
        copy "%%F" "%backupFolder%" >nul
        echo [SISTEMA] %%~nxF >> "%fontsList%"
    )
)

echo %systemFontCount% font di sistema copiati.
echo.

REM Crea anche uno script per reinstallare i font
set "installerScript=%backupFolder%\InstallFonts.bat"
echo @echo off > "%installerScript%"
echo echo Installazione dei font in corso... >> "%installerScript%"
echo. >> "%installerScript%"
echo set "fontCount=0" >> "%installerScript%"
echo. >> "%installerScript%"
echo for %%%%F in ("%%~dp0*.ttf", "%%~dp0*.otf", "%%~dp0*.ttc", "%%~dp0*.fon") do ( >> "%installerScript%"
echo     copy "%%%%F" "%%LOCALAPPDATA%%\Microsoft\Windows\Fonts" ^>nul >> "%installerScript%"
echo     reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "%%%%~nxF (TrueType)" /t REG_SZ /d "%%LOCALAPPDATA%%\Microsoft\Windows\Fonts\%%%%~nxF" /f ^>nul >> "%installerScript%"
echo     set /a fontCount+=1 >> "%installerScript%"
echo     echo Installato: %%%%~nxF >> "%installerScript%"
echo ) >> "%installerScript%"
echo. >> "%installerScript%"
echo echo Installazione completata! %%fontCount%% font installati. >> "%installerScript%"
echo echo Premere un tasto per uscire... >> "%installerScript%"
echo pause ^> nul >> "%installerScript%"

echo Backup completato con successo!
echo.
echo Totale dei font copiati: %userFontCount% + %systemFontCount% = !userFontCount! + !systemFontCount!
echo I font sono stati salvati in: %backupFolder%
echo È stato creato anche un file batch per reinstallare i font.
echo.
echo Premere un tasto per uscire...
pause > nul
