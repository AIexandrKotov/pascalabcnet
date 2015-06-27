// Copyright (c) Ivan Bondarev, Stanislav Mihalkovich (for details please see \doc\copyright.txt)
// This code is distributed under the GNU LGPL (for details please see \doc\license.txt)
///--
unit __RedirectIOMode;

//------------------------------------------------------------------------------
// ������ ������������ � ������ ������� �� ������ � ���������                  
// (�) DarkStar 2007
// �������:
//    1. ������� � ����� ErrorStream ������� [READLNSIGNAL]
//    2. �������� ���������� �� AppDomain.CurrentDomain.UnhandledException � 
//       ������� �� � ����� ErrorStream
//    3. �������� ���������� �� Application.ThreadException � 
//       ������� �� � ����� ErrorStream  
//------------------------------------------------------------------------------

{$reference 'System.Windows.Forms.dll'}

interface

uses PABCSystem, System;

type
  __ReadSignalOISystem = class(IOStandardSystem)
  public
    function peek: integer; override;
    function read_symbol: char; override;
  end;

///--
procedure __InitModule__;

implementation

const
  RedirectIOModeArg = '[REDIRECTIOMODE]';
  RedirectIOModeNoWait = '[REDIRECTIOMODENOWAIT]';
  ReadlnSignalCommand = '[READLNSIGNAL]';
  CodePageCommandTemplate = '[CODEPAGE{0}]';
  RuntimeExceptionCommandTemplate = '[EXCEPTION]{0}[MESSAGE]{1}[STACK]{2}[END]';
  R = #10;
  N = #13;
  
var 
  ReadlnSignalSendet := false;
  LastReadSymbol := #0;
  
procedure WriteToProcessErrorStream(text: string);
begin
  Console.Error.Write(text);
  Console.Error.Flush;
  //System.Diagnostics.Debug.Write(text);
  //System.Diagnostics.Debug.Flush;
end;

procedure SendReadlnRequest;
begin
  ReadlnSignalSendet := true;
  WriteToProcessErrorStream(ReadlnSignalCommand);
end;

function __ReadSignalOISystem.peek: integer;
var i: integer;
begin
  if not ReadlnSignalSendet then
    SendReadlnRequest;
  i := inherited peek;
  result := i;
end;

function __ReadSignalOISystem.read_symbol: char;
var c: char;
begin
  if not ReadlnSignalSendet then
    SendReadlnRequest;
  c := inherited read_symbol;
  if (LastReadSymbol=N) and (c=R) then
    ReadlnSignalSendet := false;  
  LastReadSymbol := c;
  result := c;
end;

procedure SendExceptionToProcessErrorStream(e: Exception);
begin
  WriteToProcessErrorStream(
    string.Format(RuntimeExceptionCommandTemplate, e.GetType.ToString, e.Message, e.StackTrace));
end;

procedure DbgExceptionHandler(sender: object; args: UnhandledExceptionEventArgs);
var e: Exception;
begin
  e := Exception(args.ExceptionObject);
  if args.IsTerminating and (ExecuteBeforeProcessTerminateIn__Mode<>nil) then 
    ExecuteBeforeProcessTerminateIn__Mode(e);
  SendExceptionToProcessErrorStream(e);
  if args.IsTerminating then
    System.Diagnostics.Process.GetCurrentProcess.Kill;
end;

procedure Application_ThreadException(sender: object; args: System.Threading.ThreadExceptionEventArgs);
begin 
  SendExceptionToProcessErrorStream(args.Exception);
end;

var __initialized := false;

procedure __InitModule;
begin
  try
    if (CommandLineArgs.Length > 0) and ((CommandLineArgs[0] = RedirectIOModeArg) or (AppDomain.CurrentDomain.GetData('_RedirectIO_SpecialArgs') <> nil)) and not ExecuteAssemlyIsDll then 
    begin
        if AppDomain.CurrentDomain.GetData('_RedirectIO_SpecialArgs') = nil then
          Console.ReadLine;
        RedirectIOInDebugMode := true;
        if IOStandardSystem(CurrentIOSystem).GetType = typeof(IOStandardSystem) then // SSM 30.04.06 - �� ������! ������ �� PT4!
          CurrentIOSystem := new __ReadSignalOISystem;        
        AppDomain.CurrentDomain.UnhandledException += DbgExceptionHandler;
        System.Windows.Forms.Application.ThreadException += Application_ThreadException;
        if not IsConsoleApplication then
        begin
          WriteToProcessErrorStream(string.Format(CodePageCommandTemplate, 65001)); // IB 5.08.08
        end;
        var _a := new string[CommandLineArgs.Length-1];
        for var i:=1 to CommandLineArgs.Length - 1 do
          _a[i-1] := CommandLineArgs[i];
        CommandLineArgs := _a;
        Console.OutputEncoding := System.Text.Encoding.UTF8;
        Console.InputEncoding := System.Text.Encoding.UTF8;
    end;
  except
  end;
end;

procedure __InitModule__;
begin
  if not __initialized then
  begin
    __initialized := true;
    PABCSystem.__InitModule__;
    __InitModule;
  end;
end;

begin
  __InitModule;
end.