[Setup]
AppName=Action Test
AppVersion=1.0
WizardStyle=modern
DisableWelcomePage=no
DefaultGroupName=Action Test
DefaultDirName={autopf}\ActionTest
OutputBaseFilename=ActionTestInstaller

[Files]
Source: "README.md"; DestDir: "{app}"; Flags: isreadme
Source: "Test.exe"; DestDir: "{app}"

[Icons]
Name: "{group}\Action Test"; Filename: "{app}\Test.exe"
