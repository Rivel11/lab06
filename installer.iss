[Setup]
AppName=MyApp
AppVersion=1.0.0
DefaultDirName={pf}\MyApp
DefaultGroupName=MyApp
OutputDir=.
OutputBaseFilename=MyAppInstaller
Compression=lzma
SolidCompression=yes

[Files]
Source: "bin\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\MyApp"; Filename: "{app}\MyApp.exe"
Name: "{group}\Uninstall MyApp"; Filename: "{uninstallexe}"
