@echo off
setlocal enabledelayedexpansion

:start
cls
echo.
echo Select a category:
echo 1. Jackpot PCs
echo 2. Kassa PCs
set /p category=

if %category%==1 (
    rem Define list of Jackpot PCs
    set PCList=EEMARJP01 EEJARJP01 EETASJP01 EEOLUJP01 EEPIRJP01 EETARJP01 EEMKVJP01 EEKRIJP01 EEJOHJP01 EENORJP01 EEROCJP01 EEPARJP01 EEMUSJP01 EEIDAJP01 EENURJP01 EEYLEJP01 EEMAGJP01 EELOUJP01 EEKOPJP01 EEVIRJP01 EELASJP01 EEHILJP01 EENARJP01 OLDEENARJP01 EEPARJP01
) else if %category%==2 (
    rem Define list of Kassa PCs
    set PCList=eekrik01 eekopk01 eenork01
) else (
    echo Invalid choice. Please select a valid category.
    goto :start
)

rem Loop through the list of PCs
for %%i in (%PCList%) do (
    echo Checking online status of %%i...
    ping -n 1 %%i | find /i "TTL=" >nul
    if errorlevel 1 (
        echo %%i is Offline
        set PCStatus=Offline
    ) else (
        echo %%i is Online
        set PCStatus=Online
    )
    echo %%i : !PCStatus!
)

pause
