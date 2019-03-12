@echo off
set /p buscar= escribe 
if %buscar%==root goto root
if %buscar%==actual goto actual
if %buscar%==prueba goto prueba
if %buscar%==iss goto iss
:root
cmd /k cd "C:\windows\Microsoft.Net\Framework64\v3.0\Windows Communication Foundation\"
:actual
cmd /k cd "/d %~dp0"
:prueba
dism /online /enable-feature /featurename:netfx3
pause
:iss
Start /w pkgmgr /iu:IIS-WebServerRole;IIS-WebServer;IIS-CommonHttpFeatures;IIS-StaticContent;IIS-DefaultDocument;IIS-DirectoryBrowsing;IIS-HttpErrors;IIS-ApplicationDevelopment;IIS-ASPNET;IIS-NetFxExtensibility;IIS-ISAPIExtensions;IIS-ISAPIFilter;IIS-HealthAndDiagnostics;IIS-HttpLogging;IIS-LoggingLibraries;IIS-RequestMonitor;IIS-Security;IIS-RequestFiltering;IIS-HttpCompressionStatic;IIS-WebServerManagementTools;IIS-ManagementConsole;WAS-WindowsActivationService;WAS-ProcessModel;WAS-NetFxEnvironment;WAS-ConfigurationAPI
pause
:notas
ServiceModelReg –i