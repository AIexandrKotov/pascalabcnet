Unit Timers;

(*
    ������� ��� ������ System.Timers.Timer
    (c) ������������ �.�. 2007

    �������� ��������� ������ Timer �� PascalABC
    �� ����������� ������� Handle.
*)

interface

uses System;

type
  /// ����� �������
  Timer = class
  private
    _timer: System.Timers.Timer;
    _procedure: procedure;
    procedure SetEnabled(_enabled: boolean);
    function GetEnabled: boolean;
    procedure SetInterval(_interval: integer);
    function GetInterval: integer;
    procedure OnTimer(sender: object; e: System.Timers.ElapsedEventArgs);
  public
    /// ������� ������ � ���������� ������������ ms ����������� � ������������ TimerProc
    constructor Create(ms: integer; TimerProc: procedure); 
    /// ��������� ������
    procedure Start;
    /// ������������� ������
    procedure Stop;
    /// ������� �� ������
    property Enabled: boolean read GetEnabled write SetEnabled;
    /// �������� ������������ �������
    property Interval: integer read GetInterval write SetInterval;
  end;

implementation

  procedure Timer.OnTimer(sender: object; e: System.Timers.ElapsedEventArgs);
  begin
    _procedure;    
  end;
  
  constructor Timer.Create(ms: integer; TimerProc: procedure); 
  begin
    _timer := new System.Timers.Timer(ms);
    _procedure := TimerProc;
    _timer.Elapsed += OnTimer;
  end;
  
  procedure Timer.Start;
  begin
    Enabled := True;
  end;

  procedure Timer.Stop;
  begin
    Enabled := False;
  end;
  
  procedure Timer.SetEnabled(_enabled: boolean);
  begin
    _timer.Enabled := _enabled;
  end;
  
  function Timer.GetEnabled: boolean;
  begin
    Result := _timer.Enabled;
  end;
  
  procedure Timer.SetInterval(_interval: integer);
  begin
    _timer.Interval := _interval;
  end;
  
  function Timer.GetInterval: integer;
  begin
    Result := Round(_timer.Interval);
  end;
  
end.