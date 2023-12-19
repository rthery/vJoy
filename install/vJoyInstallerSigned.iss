; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "vJoy Device Driver"
#define MyShortAppName "vJoy"
#define MyAppPublisher "Shaul Eizikovich"
#define MyAppURL "http://vjoystick.sourceforge.net"
#define AppGUID "{{8E31F76F-74C3-47F1-9550-E041EEDC5FBB}"

#define vJoyInstx86 "..\Win32\Release\Package"
#define vJoyInstx64 "..\x64\Release\Package"
#define vJoyLibx86 "..\Win32\Release"
#define vJoyLibx64 "..\x64\Release"

#define vJoyAppsx86 "..\Win32\Release"
#define vJoyAppsx64 "..\x64\Release"

#define vJoyMonDirx86 "..\apps\External\JoyMonitor\x86"
#define vJoyMonDirx64 "..\apps\External\JoyMonitor\x64"
#define vJoyDllDirx64 "..\apps\External\DLL\x64"
#define vJoyDllDirx86 "..\apps\External\DLL\x86"
#define vJoyIconFile ".\Joystick-icon.ico"

#define DestSubDirX86 "x86"
#define DestSubDirX64 "x64"
#define RegLocDirX86 "DllX86Location"
#define RegLocDirX64 "DllX64Location"


; Get product version from the driver (vJoy.sys)
#define SrcDrv vJoyInstx64+"\vJoy.sys"
#define FileVerStr GetFileVersion(SrcDrv)
#define StripBuild(str VerStr) Copy(VerStr, 1)
#define DrvVerStr StripBuild(FileVerStr)

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppID={code:GetAppId}
AppName={#MyAppName}
AppVersion={#DrvVerStr}
VersionInfoVersion={#DrvVerStr}
AppVerName= {#MyAppName} {#DrvVerStr}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
CreateAppDir=true
OutputDir=.
OutputBaseFilename=vJoySetup
SetupIconFile=install.ico
Compression=lzma/Max
SolidCompression=true
DefaultDirName={commonpf}\{#MyShortAppName}
DefaultGroupName={#MyShortAppName}
VersionInfoCompany=Shaul Eizikovich
AppCopyright=Copyright (c) 2005-2016 by Shaul Eizikovich
;10.0.14393: Windows 10 Version 1607 (Anniversary Update)
;or Windows Server 2016
;MinVersion = 10.0.14393
MinVersion = 6.1sp1

;SignTool=DigiCert sign /sha1 "6d 54 71 df 6b bf af a5 d5 90 0c 88 c0 8d f0 e9 c5 13 69 0a"  /noInput  $f
;SignTool=sig sign /a /v /i DigiCert /t http://timestamp.digicert.com $f
SignedUninstaller=no
DisableDirPage=yes
DisableProgramGroupPage=yes
DisableReadyMemo=true
DisableFinishedPage=true
DisableWelcomePage=no
PrivilegesRequired=admin
ArchitecturesInstallIn64BitMode=x64
SetupLogging=true
UsePreviousLanguage=no
Uninstallable=yes

;[Languages]
;Name: "english"; MessagesFile: "compiler:Default.isl"
;Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
;Name: "hebrew"; MessagesFile: "compiler:Languages\Hebrew.isl"


[Files]
;Driver
Source: "{#vJoyInstx64}\*"; DestDir: "{app}"; Flags: promptifolder; Check: IsX86
Source: "{#vJoyInstx64}\*"; DestDir: "{app}"; Flags: promptifolder; Check: IsX64
; DLLs used by applications
Source: "{#vJoyLibx86}\*.dll"; DestDir: "{app}\{#DestSubDirX86}"
Source: "{#vJoyLibx64}\*.dll"; DestDir: "{app}\{#DestSubDirX64}"; Check: IsX64
Source: "{#vJoyDllDirx86}\*.dll"; DestDir: "{app}\{#DestSubDirX86}"
Source: "{#vJoyDllDirx64}\*.dll"; DestDir: "{app}\{#DestSubDirX64}"; Check: IsX64
;Installer
Source: "{#vJoyAppsx86}\vJoyInstall.exe"; DestDir: "{app}"; Check: IsX86
Source: "{#vJoyAppsx64}\vJoyInstall.exe"; DestDir: "{app}"; Check: IsX64
;Configuration application
Source: "{#vJoyAppsx86}\vJoyConf.exe"; DestDir: "{app}\{#DestSubDirX86}"; Components: Apps\vJoyConf; Check: IsX86
Source: "{#vJoyAppsx64}\vJoyConf.exe"; DestDir: "{app}\{#DestSubDirX64}"; Components: Apps\vJoyConf; Check: IsX64
Source: "{#vJoyAppsx86}\vJoyConfig.exe"; DestDir: "{app}\{#DestSubDirX86}"; Components: Apps\vJoyConf; Check: IsX86
Source: "{#vJoyAppsx64}\vJoyConfig.exe"; DestDir: "{app}\{#DestSubDirX64}"; Components: Apps\vJoyConf; Check: IsX64
;Demo feeder
Source: "{#vJoyAppsx86}\vJoyFeeder.exe"; DestDir: "{app}\{#DestSubDirX86}"; Components: Apps\vJoyFeeder ; Check: IsX86
Source: "{#vJoyAppsx64}\vJoyFeeder.exe"; DestDir: "{app}\{#DestSubDirX64}"; Components: Apps\vJoyFeeder ; Check: IsX64
Source: "{#vJoyAppsx86}\LBIndustrialCtrls.dll"; DestDir: "{app}\{#DestSubDirX86}"; Components: Apps\vJoyFeeder ; Check: IsX86
Source: "{#vJoyAppsx64}\LBIndustrialCtrls.dll"; DestDir: "{app}\{#DestSubDirX64}"; Components: Apps\vJoyFeeder ; Check: IsX64
; Monitor
Source: "{#vJoyMonDirx86}\JoyMonitor.exe"; DestDir: "{app}\{#DestSubDirX86}"; Components: Apps\vJoyMon; Check: IsX86
Source: "{#vJoyMonDirx64}\JoyMonitor.exe"; DestDir: "{app}\{#DestSubDirX64}"; Components: Apps\vJoyMon; Check: IsX64
Source: "{#vJoyMonDirx86}\*.dll"; DestDir: "{app}\{#DestSubDirX86}"; Components: Apps\vJoyMon; Check: IsX86
Source: "{#vJoyMonDirx64}\*.dll"; DestDir: "{app}\{#DestSubDirX64}"; Components: Apps\vJoyMon; Check: IsX64
; vJoyList
Source: "{#vJoyAppsx86}\vJoyList.exe"; DestDir: "{app}\{#DestSubDirX86}"; Components: Apps\vJoyList; Check: IsX86
Source: "{#vJoyAppsx64}\vJoyList.exe"; DestDir: "{app}\{#DestSubDirX64}"; Components: Apps\vJoyList; Check: IsX64


[Icons]
Name: "{group}\Uninstall vJoy"; Filename: "{uninstallexe}"
Name: "{group}\Monitor vJoy"; Filename: "{app}\{#DestSubDirX86}\JoyMonitor.exe"; Components: Apps\vJoyMon  ; Check: IsX86
Name: "{group}\Monitor vJoy"; Filename: "{app}\{#DestSubDirX64}\JoyMonitor.exe"; Components: Apps\vJoyMon  ; Check: IsX64
Name: "{group}\Configure vJoy"; Filename: "{app}\{#DestSubDirX86}\vJoyConf.exe"; Components: Apps\vJoyConf ; Check: IsX86
Name: "{group}\Configure vJoy"; Filename: "{app}\{#DestSubDirX64}\vJoyConf.exe"; Components: Apps\vJoyConf ; Check: IsX64
Name: "{group}\vJoy Feeder (Demo)"; Filename: "{app}\{#DestSubDirX86}\vJoyFeeder.exe"; Components: Apps\vJoyFeeder ; Check: IsX86
Name: "{group}\vJoy Feeder (Demo)"; Filename: "{app}\{#DestSubDirX64}\vJoyFeeder.exe"; Components: Apps\vJoyFeeder ; Check: IsX64
Name: "{group}\vJoy Device List"; Filename: "{app}\{#DestSubDirX86}\vJoyList.exe"; Components: Apps\vJoyList ; Check: IsX86
Name: "{group}\vJoy Device List"; Filename: "{app}\{#DestSubDirX64}\vJoyList.exe"; Components: Apps\vJoyList ; Check: IsX64
Name: "{group}\vJoy Home"; Filename: "http://vjoystick.sourceforge.net/site"; Comment: "vJoy site"; IconFilename:  "{#vJoyIconFile}"
Name: "{group}\vJoy SDK"; Filename: "http://vjoystick.sourceforge.net/redirect_download_vJoy2SDK.php"; Comment: "vJoy SDK"; IconFilename:  "{#vJoyIconFile}"

[Registry]
Root: HKCU; Subkey: "System\CurrentControlSet\Control\MediaProperties\PrivateProperties\Joystick\OEM\VID_1234&PID_BEAD"; ValueName: "OEMName";  ValueType: none; Flags:deletevalue  uninsdeletevalue
Root: HKLM; Subkey: "System\CurrentControlSet\Control\MediaProperties\PrivateProperties\Joystick\OEM\VID_1234&PID_BEAD"; ValueName: "OEMName";  ValueType: none; Flags:deletevalue  uninsdeletevalue

[Run]
; Filename: "{win}\regedit.exe"; Parameters: "/s vJoyInit.reg"; WorkingDir: "{src}"; Flags: runascurrentuser waituntilterminated ;Check: not InitFromRegistry
; Filename: "{app}\vJoyInstall.exe"; Parameters: "I"; WorkingDir: "{app}"; Flags: waituntilterminated RunHidden; StatusMsg: "Installing vJoy device (May take up to 5 minutes)"; Check: not DelayedRestart

[UninstallRun]
Filename: {app}\vJoyInstall.exe; Parameters: C; StatusMsg: "Uninstalling vJoy device"; Flags: waituntilterminated RunHidden; WorkingDir: {app}; 

[Types]
Name: "Custom"; Description: "Select companion applications"; Flags: iscustom

[Components]
Name: "Apps"; Description: "Companion Applications"; Types: Custom
Name: "Apps\vJoyFeeder"; Description: "Demo vJoy Feeder application"; Types: Custom; Flags: checkablealone
Name: "Apps\vJoyConf"; Description: "vJoy Configuration application"; Types: Custom; Flags: checkablealone
Name: "Apps\vJoyMon"; Description: "vJoy Monitoring application"; Types: Custom; Flags: checkablealone
Name: "Apps\vJoyList"; Description: "vJoy Device Listing application"; Types: Custom; Flags: checkablealone

[Code]
const
  (* General *)
    ParamInitReg        = 'initreg';

	(* Messages *)
		ManuallySetTestMode = 'You cannot install vJoy on this system.'#13#13'To enable the system open a command prompt (DOS) window as Administrator.'#13'In this window type the following line:'#13#13'BCDEDIT -SET TESTSIGNING ON'#13#13'Then Restart your computer.';
		InstallGood					= 'vJoy installed successfully';
		InstallReboot				= 'vJoy installation requires reboot'#13#13'restart your computer and run this program again';
		InstallBad					= 'vJoy failed to install';
		TestModeChanged			=	'Would you like to reset your computer back to TestSigning mode OFF?'#13'This will take effect only after you restart your computer';
    InstallContinue     = 'vJoy Completing Installation';

  (* Constants related to registry *)
    GUID_WINDOWS_BOOTMGR      = '{9DEA862C-5CDD-4E70-ACC1-F32B344D4795}';
    DefaultObjec              = '23000003';
    AllowPrereleaseSignatures = '16000049';
    BCDRoot                   = 'BCD00000000';
    UninstKey 								= 'Software\Microsoft\Windows\CurrentVersion\Uninstall\';
  	ValOrig 									= 'OrigTestMode';
    vJoyInitFile              = 'vJoyInit.reg';


    (* Constants related to two-phase installation *)
    RunOnceName = 'vJoy Setup restart';
    RunOnceKey  = 'Software\Microsoft\Windows\CurrentVersion\RunOnce';
    Ph2Flag			=	'ph2';
    Ph2Param    = ' -'+Ph2Flag+' 1';
    QuitMessageReboot = 'The installer will now set your computer to TestSigning mode. You will need to restart your computer to complete that installation.'#13#13'After restarting your computer, Setup will continue next time an administrator logs in.';
    WaitingForRestart = 'You should now restat your computer.'#13#13'Press OK then restart your computer manually'#13'Press Cancel to cancel installation';
    ErrorRunOnce      = 'Failed to update RunOnce registry entry';
    ErrorSetTestMode  = 'Failed to set computer to TestSigning Mode';
    
    (* Constants related to installation under SPP *)
    SppFlag		= 'SPP';
    SppParam	= ' /'+SppFlag+'=1';
    AppIdFlag	= 'ID';
    AppIdParam	= ' /'+AppIdFlag;

    // Exit codes
    EXIT_INSTALL_BAD = 109;


var
		SkipToPh2: 		boolean; (* True is installer resumes installation after Set Test mode & restart*)
		OrigTestMode:	Boolean; (* Value of the original Test Mode *)
		DldRestart:		Boolean; (* True if delayed restart requested *)

(* Forward Function declarations - Start *)
procedure CurStepChanged(CurStep: TSetupStep); Forward;
procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep); Forward;
function GetOrigTestMode(): Boolean; Forward;
function InitializeSetup(): Boolean; Forward;
function IsTestMode(): Boolean; Forward;
function IsVjoyInstalled(): Boolean; Forward;
function IsX64: Boolean; Forward;
function IsX86: Boolean; Forward;
function PrepareToInstall(var NeedsRestart: Boolean): String; Forward;
//function ShouldSkipPage(PageID: Integer): Boolean; Forward;
function SetTestMode(value: Boolean): Boolean; Forward;
function SetTestModeOff(): Boolean; Forward;
function SetTestModeOn(): Boolean; Forward;
function GetAppId(Param: String): String; Forward;
function DelayedRestart(): Boolean; Forward;
function InitFromRegistry(): Boolean; Forward;
function GetCommandlineParam (inParam: String):String;  Forward;
function Exec_vJoyInstall(): Boolean; Forward;
procedure PreparePh2; Forward;
function IsVerySilent: Boolean;  Forward;
function vJoyMsgBox(const Text: String; const Typ: TMsgBoxType; const Buttons: Integer): Integer;   Forward;
//procedure ExitProcess(exitCode:integer);    Forward;
(* Forward Function declarations - End *)

(* Helper Functions *)
procedure ExitProcess(exitCode:integer);
external 'ExitProcess@kernel32.dll stdcall';

function IsX64: Boolean;
begin
  Result := ProcessorArchitecture = paX64;
end;

function IsX86: Boolean;
begin
  Result := ProcessorArchitecture = paX86;
end;

// Test if vJoy is installed
function IsVjoyInstalled(): Boolean;
var
  Name, RegValVjoy, Path: String;
  Len: Longint;
  Res: Boolean;
  Names: TArrayOfString;

begin
  // Get the first subkey under 'HIDCLASS' - expected values are 0000 or 0001
  // If found test it for  valid 'Service'
  RegValVjoy := 'SYSTEM\CurrentControlSet\Enum\Root\HIDCLASS'; 
  if RegGetSubkeyNames(HKEY_LOCAL_MACHINE, RegValVjoy, Names) then
  begin
   RegValVjoy := RegValVjoy + '\' + Names[0];
   end else
  begin
    Result := false;
    exit;
  end;
  
  Name := 'Service';
  Res := RegQueryStringValue(HKEY_LOCAL_MACHINE, RegValVjoy, Name, Path);
  if Res then Len := Length(Path) else Len := 0;
  if (Len > 0) then Result := true  else    Result := false;
end;

(*
  Check if computer in testsigning mode
  How: 
  Go to the BCD in the registry and look for the Boot manager entry
  Inside, get the GUID of the defoalt loader.
  Inside the default loader, get the value of the testsigning mode
  Note: If does not exist = testsigning is off
  Return:
  True if testsigning is ON
  False if testsigning is OFF
*)
function IsTestMode(): Boolean;
var
  RegValDeflt, RegValTestsig, Name, Path, msg : String;
  tmp: AnsiString;
  Res: Boolean;
begin
  Log('IsTestMode: Start');

  RegValDeflt := BCDRoot + '\Objects\' + GUID_WINDOWS_BOOTMGR + '\Elements\' + DefaultObjec;
  Name := 'Element'
  
  // Get pointer to default loader
  Res := RegQueryStringValue(HKEY_LOCAL_MACHINE, RegValDeflt, Name, Path);
  if not Res then
    begin
    (* Debug start  *)
      msg := 'IsTestMode: Cannot find value for ' + RegValDeflt + '\' + Name;
      Log(msg);
     (*Debug end*)
      Result := False;
      exit;
    end; 
  (* Debug start *)
   msg := 'IsTestMode: Got value for ' + RegValDeflt + '\' + Name +': ' + Path;
   Log(msg);
  (*  Debug end*)
   
  // Get testsigning value
  RegValTestsig := BCDRoot + '\Objects\' + Path + '\Elements\' + AllowPrereleaseSignatures;
  tmp := '#0';
  Res := RegQueryBinaryValue(HKEY_LOCAL_MACHINE, RegValTestsig, Name, tmp);
 (* Debug start   *)
 if Res then
 begin
  if tmp <> #0 then
   begin
   msg := 'IsTestMode: RegQueryBinaryValue for ' + RegValTestsig + '\' + NAME + ': Test mode ON ('+ tmp +')';
   Log(msg);
   end
  else
   begin
   msg := 'IsTestMode: RegQueryBinaryValue for ' + RegValTestsig + '\' + NAME + ': Test mode OFF ('+ tmp +')';
   Log(msg);
   end;
  end
 else
  begin
  msg := 'IsTestMode: RegQueryBinaryValue for ' + RegValTestsig + '\' + NAME + ': failed';
  Log(msg);
  end;
 
(*  Debug end *)
  if tmp = #1 then
    Result := True
  else
    Result := False;
end; // End Function IsTestMode

/////////////////////////////////////////////////////////////////////
function GetUninstallString(): String;
var
  sUnInstPath: String;
  sUnInstallString: String;
begin
  sUnInstPath := ExpandConstant('Software\Microsoft\Windows\CurrentVersion\Uninstall\{#emit SetupSetting("AppId")}_is1');
  sUnInstallString := '';
  if not RegQueryStringValue(HKLM, sUnInstPath, 'UninstallString', sUnInstallString) then
    RegQueryStringValue(HKCU, sUnInstPath, 'UninstallString', sUnInstallString);
  Result := sUnInstallString;
end;


/////////////////////////////////////////////////////////////////////
function IsUpgrade(): Boolean;
begin
  Result := (GetUninstallString() <> '');
end;

// Checks for flag '/verysilent'
function IsVerySilent: Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 1 to ParamCount do
    if CompareText(ParamStr(I), '/verysilent') = 0 then
    begin
      Result := True;
      Exit;
    end; 
end;

// Special version of the standard message box
// If in VerySilent mode - dialog box supressed and message is sent to log file
function vJoyMsgBox(const Text: String; const Typ: TMsgBoxType; const Buttons: Integer): Integer;

begin
  Result :=  IDOK;
  if  not IsVerySilent then
    begin
      Result :=  MsgBox(Text,  Typ, Buttons);
      Exit; 
    end
    else begin
      Log('Suppressed Message Box: ' + Text);
      case Buttons of
       MB_OK: 
        begin
         Log('Return default value: OK'); 
         Result := IDOK;
        end;
        MB_OKCANCEL:
         begin
          Log('Return default value: Cancel'); 
          Result := IDCANCEL;
         end;
        MB_ABORTRETRYIGNORE:
         begin
          Log('Return default value: Abort'); 
          Result := IDABORT;
         end;
        MB_YESNOCANCEL:
         begin
          Log('Return default value: Yes'); 
          Result := IDYES;
         end;
        MB_YESNO:
          begin
          Log('Return default value: Yes'); 
          Result := IDYES;
         end;
       MB_RETRYCANCEL:
         begin
          Log('Return default value: Cancel'); 
          Result := IDCANCEL;
         end;
      end;
    end;
end;

/////////////////////////////////////////////////////////////////////

function UnInstallOldVersion(): Integer;
var
  sUnInstallString: String;
  sUnInstallFlags: String;
  iResultCode: Integer;
  i :  Integer;
begin
// Return Values:
// 1 - uninstall string is empty
// 2 - error executing the UnInstallString
// 3 - successfully executed the UnInstallString
// 4 - Timeout. Waited too much for the ununstaller

  // default return value
  Result := 0;

  // Preparing the uninstall flags
  if IsVerySilent then
    sUnInstallFlags :=  '/VERYSILENT  /NORESTART /SUPPRESSMSGBOXES'
  else
    sUnInstallFlags :=  '/SILENT  /NORESTART /SUPPRESSMSGBOXES';


  // get the uninstall string of the old app
  sUnInstallString := GetUninstallString();
  if sUnInstallString <> '' then begin
    sUnInstallString := RemoveQuotes(sUnInstallString);
    if Exec(sUnInstallString, sUnInstallFlags,'', SW_HIDE, ewWaitUntilTerminated  , iResultCode) then
      Result := 3
    else
      Result := 2;
  end else
    Result := 1;

  // Wait until files are removed
  i := 0;
  while FileOrDirExists(sUnInstallString) do
   begin
    i := i+1;
    Sleep(100);
    if i>50 then
     begin
      Result := 4 ;
      Log('Uninstaller timed out');
      Exit;
     end;
  end;
end;

/////////////////////////////////////////////////////////////////////

(*
	InitializeSetup() is an event function that is 
	Called during Setup's initialization.
	Setup aborted if function returns False. 
	
	In this case:
  Always Returns True (never abort installation)
  
  Test command-line parameters
  If parameter PH2 exists then go directly to PrepareToInstall() (set SkipToPh2)
  
  If this is a call made while the computer is waiting for manual restart
  (RunOnce parameter is set) then reset status (Delete RunOnce+Reset Test mode) and continue.
*)
function InitializeSetup(): Boolean;

var
  Ph2Val: string;

begin
  Log('InitializeSetup()');
  SkipToPh2 := false;
  Result := True;
	
  // Command-line parameters 
  Ph2Val :=  GetCommandlineParam(Ph2Flag);
  Log('InitializeSetup() - Value of Ph2 Flag = ' + Ph2Val);
  if CompareStr(Ph2Val, '1')=0 then
  begin
     Log('InitializeSetup() - Ph2 detected');
     SkipToPh2 := true;
     if  SkipToPh2  then vJoyMsgBox(InstallContinue, mbInformation, MB_OK);
     exit;
  end;

  if (IsUpgrade()) then
  begin
    Log('InitializeSetup() - IsUpgrade=true');
    UnInstallOldVersion();    
  end;
   
end;

(* Pre & Post-install operations *)
procedure CurStepChanged(CurStep: TSetupStep);

begin
//	if  CurStep=ssInstall then
//		MsgBox('CurStepChanged(ssInstall)' , mbInformation, MB_OK);	
//	if  CurStep=ssPostInstall then
//		MsgBox('CurStepChanged(ssPostInstall)' , mbInformation, MB_OK);
//	if  CurStep=ssDone then
//		MsgBox('CurStepChanged(ssDone)' , mbInformation, MB_OK);

// Check if this is an upgrade. If so, uninstall previous version
// From http://stackoverflow.com/questions/2000296/innosetup-how-to-automatically-uninstall-previous-installed-version#2099805
  if (CurStep=ssInstall) then
  begin
    Log('CurStepChanged(ssInstall)');
 //   if (IsUpgrade()) then
 //   begin
 //     UnInstallOldVersion();
 //  end;
  end;        

 	if  (CurStep=ssPostInstall) and (not DldRestart) then
	begin // Post install actions - check if vJoy is now installed
    Log('CurStepChanged(ssPostInstall)');
		if IsVjoyInstalled then
			vJoyMsgBox(InstallGood , mbInformation, MB_OK)
		else
     begin
			vJoyMsgBox(InstallBad , mbError, MB_OK)
      ExitProcess(EXIT_INSTALL_BAD);
     end
	end; // Post install actions
  
 end;

(* Pre & Post-uninstall operations *)
procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
	if CurUninstallStep = usPostUninstall then
		DelTree( ExpandConstant('{app}'), True, True, True);
end;

(* 
    Called by the installer just before installation
    In phase 2 it does nothing.
    
    If must set test mode (x64 machine that is not in test mode) then:
      Set  NeedsRestart to true
      Set Test mode
      Create RunOnce entry
      Return "Restart?" dialog box
    Else
      Set  NeedsRestart to false
*)

function PrepareToInstall(var NeedsRestart: Boolean): String;
  
begin
// Default
  Log(' PrepareToInstall()');
	NeedsRestart := False;
	DldRestart := False;

end;

(*
  Called before every wizard page.
  Pages skipped if installer called with parameter PH2 

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  Log(' ShouldSkipPage() - Page ID:'  + IntToStr(PageID));
  if (PageID = wpWelcome) then  Log(' ShouldSkipPage() - Page ID: wpWelcome');
  if (PageID = wpSelectComponents) then  Log(' ShouldSkipPage() - Page ID: wpSelectComponents');
  if (PageID = wpReady) then  Log(' ShouldSkipPage() - Page ID: wpReady');
  if (PageID = wpInstalling) then  Log(' ShouldSkipPage() - Page ID: wpInstalling');
  if (PageID = wpInfoAfter) then  Log(' ShouldSkipPage() - Page ID: wpInfoAfter');
  if (PageID = wpFinished) then  Log(' ShouldSkipPage() - Page ID: wpFinished');
  Result := SkipToPh2;
end;
*)
(*
  Set Testsigning mode On/Off acording to value of variable 'value'
  Executed only for x64 - else NOP (return FALSE)
  Return TRUE is succeeded
  Return FALSE if failed or if already was in the required state
*)
function SetTestMode(value: Boolean): Boolean;
var
  ResultCode: Integer;
  params: String;
  
Begin
   
  if not ProcessorArchitecture = paX64 then
  begin
   Result := false;
   //exit;
  end; // Not x64
  
  if (IsTestMode = value) then
  begin
   Result := false;
   exit;
  end; //  already was in the required state
   
   // Execute BCDEdit shell command 
   if value then
    Params := ' -set TESTSIGNING ON'
   else
    Params := ' -set TESTSIGNING OFF';
       
   Exec('Bcdedit.exe',Params, '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
   Result := True;
end; // End Function SetTestMode

function SetTestModeOn(): Boolean;
begin
  result := SetTestMode(True);
end;

function SetTestModeOff(): Boolean;
begin
  result := SetTestMode(False);
end;

(*
  Record the original value of TestSigning in the registry for usage by uninstall
  Do NOT override original value
  Assuming that is called by the function that actually perform the operation so no testing.
  Set boolean Value:  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{XXX}_is1\OrigTestMode
  {XXX} stands for the AppID
*)
Procedure RegWriteOrigTestMode(TestModeSet: Boolean);
var
	UninstKeyVjoy: String;

Begin  
  	
  UninstKeyVjoy := UninstKey + GetAppId('') + '_is1';

	Log('RegWriteOrigTestMode(): UninstKeyVjoy='+UninstKeyVjoy+'\'+ValOrig);
  // Test if Value exists
  if not RegValueExists(HKEY_LOCAL_MACHINE, UninstKeyVjoy, ValOrig) then
  begin // Set the Value because it does not exist
  	Log('Set the Value because it does not exist');
  	if TestModeSet then
    	RegWriteBinaryValue(HKEY_LOCAL_MACHINE, UninstKeyVjoy, ValOrig, #1)
  	else
    	RegWriteBinaryValue(HKEY_LOCAL_MACHINE, UninstKeyVjoy, ValOrig, #0);
  end; // Set the key because it does not exist
End;

(*
  Record the location of X86/X64 DLL files for use by filter applications
  Set string Value:  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{XXX}_is1\DllX86Location\ to {app}\x86
  Set string Value:  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{XXX}_is1\DllX64Location\ to {app}\x64
  {XXX} stands for the AppID
*)
Procedure RegWriteDllFolderLocation();
var
	UninstKeyVjoy: String;

Begin  
  	
  UninstKeyVjoy := UninstKey + GetAppId('') + '_is1';

	

  Log('RegWriteDllFolderLocation(): UninstKeyVjoy='+UninstKeyVjoy+'\'+'{#RegLocDirX86}');
  RegWriteStringValue(HKEY_LOCAL_MACHINE, UninstKeyVjoy, '{#RegLocDirX86}', expandconstant('{app}')+'\'+'{#DestSubDirX86}')
  if IsX64 then
    begin
    Log('RegWriteDllFolderLocation(): UninstKeyVjoy='+UninstKeyVjoy+'\'+'{#RegLocDirX64}');
    RegWriteStringValue(HKEY_LOCAL_MACHINE, UninstKeyVjoy, '{#RegLocDirX64}', expandconstant('{app}')+'\'+'{#DestSubDirX64}')
    end;
End;

(* 
    This is called just on the way out of the wizard 
    The app Uninstall registry entry already exists
*)
procedure DeinitializeSetup();
begin
  (* 
  	Write the original value of Test Mode to the Registry
  	If this is the second step it must be '0' 
  	Otherwise we don't care.
  *)
  //MsgBox('Inside DeinitializeSetup()' , mbInformation, MB_OK) 
	  RegWriteOrigTestMode(OrigTestMode);

  (* Write directory locations to the registry *)
  if not SkipToPh2 then  RegWriteDllFolderLocation();
	  
end;


(*
	Get the original value of Test Mode - call it on InitializeSetup()
	
	There are 4 cases:
	1. Check if this is Phase2. If it is then the original value was False.
	2. If this is not Phase2, this might be repetition of the first phase: 
	   The RunOnce registry entry is set to /PH2=1 so the original value is False.
	3. This can be a new installation over an already installed vJoy:
	   check the value in the registry (inside the appropriate Uninstall key). 
	4. If this value does not exist check the current test mode.
	
  Keep the value for use in the ssPostInstall step.	
*)
function GetOrigTestMode(): Boolean;
var
	data: String;
	UninstKeyVjoy: String;
	Adata: AnsiString;
	
begin
	(* Case 1 *)
	if ExpandConstant('{param:'+Ph2Flag+'|0}') = '1' then
		begin	// Case 1
			Log('GetOrigTestMode(): Case 1');
			Result := false;
			exit;
		end;	// Case 1
	
	(* Case 2 *)
	if RegQueryStringValue(HKLM, RunOnceKey, RunOnceName, data) then
		begin // Case 1/2
			Log('GetOrigTestMode(): RunOnce String is: '+ data);
			if Pos(Ph2Param,data) > 0  then 
			begin	// Found PH2
				Log('GetOrigTestMode(): "PH2" was found in RunOnce key');
				Result := false;
				exit;
			end		// Found PH2
		end;	// Case 1/2
		
	(* Case 3 *)
  UninstKeyVjoy := UninstKey + GetAppId('')  + '_is1';
  if RegQueryBinaryValue(HKEY_LOCAL_MACHINE, UninstKeyVjoy, ValOrig, Adata) then
  	begin // Case 3
  	if Adata = #1 then 
  		Result := true
  	else
  		Result := false;
  		Log('GetOrigTestMode(): Found entry in '+ UninstKeyVjoy);
  	exit;
  	end;	// Case 3
  	
  	(* Case 4 *)
		Log('GetOrigTestMode(): call IsTestMode()'); 
  	Result := IsTestMode;

end;

(*
	Called when starting uninstall
	
	Check if need to Revert Test Mode to OFF
*)
function InitializeUninstall(): Boolean;
var
	UninstKeyVjoy: String;
	Adata: AnsiString;
	
begin
  Result := true				// Default
  OrigTestMode := true; // Default
	UninstKeyVjoy := UninstKey + GetAppId('') + '_is1';

  if RegQueryBinaryValue(HKEY_LOCAL_MACHINE, UninstKeyVjoy, ValOrig, Adata) then
  	begin 
  		Log('InitializeUninstall(): Found entry in '+ UninstKeyVjoy);
  		if Adata = #0 then 
  			OrigTestMode := false; 		
  	end;	
end;

(*
	Need restart if the user choses to reset Test Mode
*)
function UninstallNeedRestart(): Boolean;
var
	ResetTestMode: Integer;
	
begin
	Result := False; // Defaul
	
	if (OrigTestMode = false) and  IsTestMode then
	begin // Test Mode Changed
		ResetTestMode := vJoyMsgBox(TestModeChanged, mbConfirmation, MB_YESNO);
		if ResetTestMode = IDYES then
		begin	// Reset Test Mode
			SetTestModeOff();
			result := True;
		end;	// Reset Test Mode
	end;  // Test Mode Changed
end;

(*
  Get AppID from command line parameter ID (/ID=ABC)
  If this parameter is missing use AppGUID constant
*)
function GetAppId(Param: String): String;	
begin
 Result := ExpandConstant('{param:'+AppIdFlag+'}');
  if Length(Result)=0 then
    Result :=  expandconstant('{#AppGUID}');;

end;

function DelayedRestart(): Boolean;
begin
	Result:= DldRestart;
end;


(*
			If delayed restart needed then change exit value
*)
function GetCustomSetupExitCode: Integer;
begin
	if DldRestart then Result := 8;
end;


(*
    Normalize Flag:
    Remove one leading flag-sign: Slash(/) or Minus(-) - If missing return empty string
    Convert to lower case
*)
function  NormalizeFlag (inFlag : String) : String;

begin
    Result :=  '';
// Check length
    if (Length(inFlag) <2) then exit;
    
// Remove the first character if it '/' or '-'
    Result :=  inFlag;
    Delete(Result, 1, 1)

// Convert to lower case
    Result := Lowercase(Result);
    
end;

(*
    Allows for standard command line parsing assuming a key/value organization
    Based on:  http://stackoverflow.com/questions/3618257/is-it-possible-to-accept-custom-command-line-parameters-with-innosetup
*)
function GetCommandlineParam (inParam: String):String;
var
  LoopVar : Integer;
  BreakLoop : Boolean;
  strParam : String;

begin
  { Init the variable to known values }
  LoopVar :=0;
  Result := '';
  BreakLoop := False;


  { Loop through the passed in arry to find the parameter }
  while ( (LoopVar < ParamCount) and (not BreakLoop) ) do
  begin
  
  strParam := NormalizeFlag(ParamStr(LoopVar));

    { Determine if the looked for parameter is the next value }
    if ( (strParam = inParam) and ( (LoopVar+1) <= ParamCount )) then
    begin
      { Set the return result equal to the next command line parameter }
      Result := ParamStr(LoopVar+1);

      { Break the loop }
      BreakLoop := True;
      Log('GetCommandlineParam(): Flag: '+ inParam + ' Value: ' + Result);
    end;

    { Increment the loop variable }
    LoopVar := LoopVar + 1;
  end;

  if (BreakLoop = False) then Log('GetCommandlineParam(): Flag: '+ inParam + ' not found');
end;

(*
    Gets from the command line the name of the file to merge into the registry
    If exists returns TRUE else FALSE
*)
function InitFromRegistry(): Boolean;
var
  FileName : String ;
  ResultCode: Integer;
begin

  Log('InitFromRegistry() - Start');
  Result := FALSE;

  // Gets the file name - exit with FALSE if fails
  FileName :=  GetCommandlineParam(ParamInitReg);
  if (Length(FileName) = 0 )   then 

  // Command line does not specify a registry file
  begin
    FileName := vJoyInitFile;
    Log('InitFromRegistry() - using the default registry file: ' + FileName);
  end;

  // Merge file to registry
  if (not FileExists(ExpandConstant('{src}\'+FileName))) then
    begin
      Log('InitFromRegistry(): Default optional registry File' + ExpandConstant('{src}\'+FileName) + ' not found, continue without it');
      exit;
    end;

  if Exec(ExpandConstant('{win}\regedit.exe'), '/s ' + FileName, ExpandConstant('{src}'), SW_HIDE, ewWaitUntilTerminated, ResultCode) then   Result := TRUE;
  
  if (Result = TRUE) then
        Log('InitFromRegistry(): Merging file  ' + FileName + ' into the registry - code: ' + IntToStr(ResultCode))
  else
        Log('InitFromRegistry(): Merging file  ' + FileName + ' into the registry - Failed');

end;

// Exec vJoyInstall with parameter Q for quiet installation
// Returns TRUE if need to restart
function Exec_vJoyInstall(): Boolean;
var
  TmpFileName, msg: string;
  ResultCode: Integer;
  
  Begin
  Log('Exec_vJoyInstall() - Start');
	begin 
	TmpFileName := ExpandConstant('{app}') + '\vJoyInstall.exe';
  if not FileExists(TmpFileName) then   Log('Exec_vJoyInstall() - file ' + TmpFileName + 'was not found');

  // Executing   vJoyInstall.exe Q
	if Exec(TmpFileName, 'Q', '',  SW_HIDE, ewWaitUntilTerminated, ResultCode) then
	begin (* handle success if necessary; ResultCode contains the exit code *)
    msg:= 'vJoyInstall.exe Was executed. Result code: ' +  IntToStr(ResultCode);
		Log(msg);
	end
	else begin
		Log('vJoyInstall.exe Was NOT executed');
    Result := false;
    exit;
	end;

  // Test if need reboot
  // Later replace with RunOnce
  if ResultCode=-8  then 
  begin
    Log('vJoyInstall.exe reported that it needs reboot');
    Result := true;
    Exit;
   end
   else
    Log('vJoyInstall.exe reported that it does not need reboot');
    Result := false;
    Exit;
   end;
end;

// Prepare for Ph2 after restart
// Write to RunOnce registry entry
procedure PreparePh2;
begin
  Log('PreparePh2() - Start');
  if  not IsVerySilent then RegWriteStringValue(HKEY_LOCAL_MACHINE, RunOnceKey, 'vJoy Installer Phase 2', expandconstant('{srcexe}')+' '+ Ph2Param)
  else  RegWriteStringValue(HKEY_LOCAL_MACHINE, RunOnceKey, 'vJoy Installer Phase 2', expandconstant('{srcexe}')+' '+ Ph2Param + '  /VERYSILENT');
end;


function NeedRestart(): Boolean;
begin
  Log('NeedRestart() - Start');

  if not SkipToPh2  then InitFromRegistry;
  DldRestart   := Exec_vJoyInstall;
  if   DldRestart then  PreparePh2;
	Result       := DldRestart;
end;

