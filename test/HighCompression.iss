[Setup]
AppName=Compression Test
AppVersion=1.0
WizardStyle=modern
DisableWelcomePage=no
DefaultGroupName=Compression Test
DefaultDirName={autopf}\CompressionTest
OutputBaseFilename=CompressionTestInstaller
; ADDITIONAL ON TOP OF Test.iss
; Best compression settings as per https://stackoverflow.com/questions/40447498/best-compression-settings-in-inno-setup-compiler
SolidCompression=yes
Compression=lzma2/ultra64
LZMAUseSeparateProcess=yes
LZMADictionarySize=1048576
LZMANumFastBytes=273

[Files]
Source: "..\README.md"; DestDir: "{app}"; Flags: isreadme
Source: "Test.exe"; DestDir: "{app}"

[Icons]
Name: "{group}\Compression Test"; Filename: "{app}\Test.exe"
