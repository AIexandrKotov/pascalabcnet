///������ ABCSprites ��������� ������� - ������������ ������� � ������������� ����������� �������. 
///������ �������������� ������� SpriteABC � �������� �������������� �������������� MultiPictureABC.
unit ABCSprites;

//#savepcu false

interface

uses ABCObjects,Events,GraphABC,Utils;

type
  SpriteState = record
    Name: string;   // ����� ���������
    Beg: integer;   // ������ ��������, ���������� �������� ���������
    Count: integer; // ����� ���������
    constructor Create(n: string; b,c: integer);
    begin
      Name := n;
      Beg := b;
      Count := c;
    end;
  end;

  SpriteABC = class(MultiPictureABC)
  private
    States: Array of SpriteState;
    curst: integer;          // ����� �������� ���������
    ticks: integer;          // ������� ����� �������� �� ����� �����, ������� �������������� ��������: 0..10
    act: boolean;            // ������� �� ������
    curtick: integer;        // ������� ���, ����� �� ���������� ������
    procedure SetStateName(n: string);
    function GetStateName: string;
    procedure SetState(n: integer);
    function GetStateCount: integer;
    procedure SetSpeed(n: integer);
    function GetSpeed: integer;
    procedure SetActive(b: boolean);
    procedure SetFrame(n: integer);
    function GetFrame: integer;
  protected  
    procedure Init0;
    procedure Init(x,y: integer; fname: string);   // ����� ����� �������� �������� Add � AddState, ����� CheckStates
    procedure Init(x,y,w: integer; fname: string); // ����� ����� �������� �������� AddState, ����� CheckStates
    procedure Init(x,y,w: integer; p: Picture);
    procedure InitWithStates(x,y: integer; fname: string);
    procedure InitBy(g: SpriteABC);
  public
    /// ������� ������, �������� ��� �� ����� � ������ fname. 
    ///��� fname ����� ���� ���� ������ ������������ �����, ���� ������ ��������������� ����� ������� � ����������� .spinf 
    ///���� ��� �������� ������ ������������ �����, �� ��������� ������ � ����� ������. ��������� ����� ����������� ������� Add.
    ///����� ����� ��� ������������� ����������� ��������� ������� AddStates � ���������� ����� CheckStates 
    ///���� ���� ����� ���������� .spinf, �� �� �������� ���������� � ������ � ���������� ������� �
    ///������ �������������� ��������������� ����������� ������.
    ///����� �������� ������ ������������ �� ������ � ������� (x,y)
    constructor Create(x,y: integer; fname: string);   
    /// ������� ������, �������� ��� �� ����� fname. ���� ������ ������� �������, �������������� ����� 
    ///������������������ ������ ������ �������, ������������� �� �����������. 
    ///������ ���� ��������� ������� ������ w. ���� ������ ������� � ����� fname �� ������ w, �� ��������� ����������. 
    ///����� ����� ��� ������������� ����������� ��������� ������� AddStates � ���������� ����� CheckStates 
    ///����� �������� ������ ������������ �� ������ � ������� (x,y)
    constructor Create(x,y,w: integer; fname: string); 
    /// ������� ������, �������� ��� �� ������� p: Picture. �� ������ ������� �������, �������������� ����� 
    ///������������������ ������ ������ �������, ������������� �� �����������. 
    ///������ ���� ��������� ������� ������ w. ���� ������ ������� �� ������ w, �� ��������� ����������. 
    ///����� ����� ��� ������������� ����������� ��������� ������� AddStates � ���������� ����� CheckStates 
    ///����� �������� ������ ������������ �� ������ � ������� (x,y)
    constructor Create(x,y,w: integer; p: Picture);
    /// ������� ������ - ����� ������� g
    constructor Create(g: SpriteABC);
    /// ������� ������
    destructor Destroy;
    /// ��������� ��������� � �������. ����� ���������� ���� ��������� ������� ������� CheckStates
    procedure AddState(name: string; count: integer);
    /// ��������� ������������ ������ ���������. ���������� ����� ���������� ���� ���������
    procedure CheckStates;
    /// ��������� ���� � �������
    procedure Add(fname: string);
    /// ��������� ����������� � �������������� ����� �������
    /// ��� fname ������ ��� ������������ �����
    /// �������������� ���� ����������� � ��� �� �������, ��� � �����������, ����� �� �� ��� � ���������� .spinf
    procedure SaveWithInfo(fname: string); 
    /// ��������� � ���������� ����� � ������� ���������
    procedure NextFrame;     
    /// ��������� � ���������� ���� �������; ���� �� ����� ticks, �� �� ������������ � 1 � ���������� NextFrame
    procedure NextTick;      
    /// ��� ���������
    property StateName: string read GetStateName write SetStateName;
    /// ����� ��������� (1..StateCount)
    property State: integer read curst write SetState;
    /// ���������� ���������
    property StateCount: integer read GetStateCount;
    /// �������� ������� (1..10)
    property Speed: integer read GetSpeed write SetSpeed;
    /// ���������� �������: True, ���� ������ ������� (�.�. ���������� ��� ��������), � False � ��������� ������
    property Active: boolean read act write SetActive;
    /// ������� ���� � ������� ���������
    property Frame: integer read GetFrame write SetFrame;
    /// ���������� ���������� ������ � ������� ���������
    function FrameCount: integer;
    /// ���������� ��������� ���� � ������� ���������
    function FrameBeg: integer;
    /// ���������� ���� �������
    function Clone0: ObjectABC; override;
    /// ���������� ���� �������
    function Clone: SpriteABC; 
  end;

/// �������� �������� ���� ��������
procedure StartSprites;
/// ������������� �������� ���� ��������
procedure StopSprites;

///--
procedure __InitModule__;
///--
procedure __FinalizeModule__;

implementation

const infoext = '.spinf';
  
var
  _Sprites: System.Collections.ArrayList; // ������ ��������
  _t: System.Timers.Timer;                // ������ ��������
  timerMs: integer;
  
procedure SpriteABC.Init0;
begin
  SetLength(States,1);
  States[0].Name := '';
  States[0].Beg := 1;
  States[0].Count := 1;
  curst := 1;
  curtick := 1;
  Speed := 5;
  act := True;
  _Sprites.Add(Self);
end;

procedure SpriteABC.Init(x,y: integer; fname: string);
begin
  Init0;
  inherited Init(x,y,fname);
end;

procedure SpriteABC.Init(x,y,w: integer; fname: string);
begin
  Init0;
  inherited Init(x,y,w,fname);
  States[0].Count := Count;
end;

procedure SpriteABC.Init(x,y,w: integer; p: Picture);
begin
  Init0;
  inherited Init(x,y,w,p);
  States[0].Count := Count;
end;

procedure SpriteABC.InitWithStates(x,y: integer; fname: string);
var
  vs,sname: string;
  f: PABCSystem.text;
  i,j,w,sp,num: integer;
begin
{  if not FileExists(fname) then
    fname := StandardImageFolder + fname;}
  if not FileExists(fname) then
    raise Exception.Create('���� '+ExtractFileName(fname)+' �� ������');
    
  Init0;

{  s := LowerCase(ExtractFileExt(fname));
  i := Pos(s,fname);
  s := fname;
  Delete(s,i,Length(s));
  s := s + infoext;
  if not FileExists(s) then
    raise Exception.Create('�������������� ���� ������� '+ExtractFileName(s)+' �� ������');}

  try
    assign(f,fname);
    reset(f);
    readln(f,vs);
    j := Pos(' ',vs);
    fname := ExtractFilePath(fname)+Copy(vs,1,j-1);
    readln(f,w);
    readln(f,sp);
    Speed := sp;
    readln(f,num);
    for i:=1 to num do
    begin
      readln(f,vs);
      j := Pos(' ',vs);
      sname := Copy(vs,1,j-1);
      Delete(vs,1,j);
      vs := TrimLeft(vs);
      j := Pos(' ',vs);
      if j>0 then
        vs := Copy(vs,1,j-1);
      AddState(sname,StrToInt(vs));
    end;
    close(f);
  except
    on e: Exception do
    begin
      writeln(e);
      raise Exception.Create('������ ���������� �� ��������������� ����� �������');
    end;  
  end;
  inherited Init(x,y,w,fname);
  CheckStates;
end;

procedure SpriteABC.InitBy(g: SpriteABC);
var i: integer;
begin
  inherited InitBy(g);
  Init0;
  SetLength(States,g.States.Length);
  for i:=0 to States.Length-1 do
  begin
    States[i].Beg := g.States[i].Beg;
    States[i].Count := g.States[i].Count;
    States[i].Name := g.States[i].Name;
  end;
end;

constructor SpriteABC.Create(x,y: integer; fname: string);   
begin
  var s := ExtractFileExt(fname);
  if LowerCase(s) = infoext then
    InitWithStates(x,y,fname)
  else Init(x,y,fname);
  InternalDraw;
end;

constructor SpriteABC.Create(x,y,w: integer; fname: string); 
begin
  Init(x,y,w,fname);
  InternalDraw;
end;

constructor SpriteABC.Create(x,y,w: integer; p: Picture);
begin
  Init(x,y,w,p);
  InternalDraw;
end;

constructor SpriteABC.Create(g: SpriteABC);
begin
  InitBy(g);
end;

destructor SpriteABC.Destroy;
begin
  _Sprites.Remove(Self);
  inherited Destroy;
end;

procedure SpriteABC.SaveWithInfo(fname: string);
var
  s,fnameold: string;
  f: PABCSystem.text;
  i: integer;
begin
  CheckStates;
  s:=LowerCase(ExtractFileExt(fname));
  if (s<>'.bmp') and (s<>'.jpg') and (s<>'.gif') and (s<>'.png') then
    raise Exception.Create('����� �������� ������ ������������ �����');
  Save(fname);
  fnameold := fname;
  i := Pos(s,fname);
  Delete(fname,i,Length(s));
  fname := fname + infoext;
  assign(f,fname);
  rewrite(f);
  writeln(f,ExtractFileName(fnameold),' // ��� ����� �������');
  writeln(f,width,' // ������ �����');
//  writeln(f,count,' // ���������� ������');
  writeln(f,Speed,' // ��������');
  writeln(f,StateCount,' // ���������� ���������');
  for i:=0 to StateCount-1 do
    if i=0 then
      writeln(f,States[i].Name,' ',States[i].Count,' // ����� ��������� � ���������� ������ � ���')
    else writeln(f,States[i].Name,' ',States[i].Count);
  close(f);
end;

procedure SpriteABC.CheckStates;
var
  s: integer;
  i: integer;
begin
  s := 0;
  for i:=0 to StateCount-1 do
    s := s + States[i].Count;
  if s<>Count then
    raise Exception.Create('����� ������ � ���������� ������� ���������� �� ������ ���������� ������');
end;

procedure SpriteABC.Add(fname: string);
begin
//  Assert(StateCount=1,'��� ���������� ������ ���������� ��������� ������ ���� ����� 1');
  inherited Add(fname);
  Inc(States[0].Count);
end;

procedure SpriteABC.NextTick;
begin
  if not act then exit;
  Inc(curtick);
  if curtick>ticks then
  begin
    NextFrame;
    curtick := 1;
  end;
end;

procedure SpriteABC.SetStateName(n: string);
var i,ind: integer;
begin
  ind := -1;
  for i:=0 to States.Length-1 do
    if States[i].Name = n then
    begin
      ind := i;
      break;
    end;
  if ind<>-1 then
    State := ind + 1;
end;

function SpriteABC.GetStateName: string;
begin
  Result := States[curst-1].Name;
end;

procedure SpriteABC.SetState(n: integer);
begin
  if curst=n then
    exit;
  if n<1 then
    n := 1;
  if n>StateCount then
    n := StateCount;
  curst := n;
  CurrentPicture := States[curst-1].Beg;
  Redraw;
end;

function SpriteABC.GetStateCount: integer;
begin
  Result := States.Length;
end;

procedure SpriteABC.SetSpeed(n: integer);
begin
  // ���� ��� ������� ��������
  // ������� �������� �� ��������� ���� ��� ���������� ��������!
  if n<1 then n := 1;
  if n>10 then n := 10;
  case n of
1: ticks := 30;
2: ticks := 20;
3: ticks := 14;
4: ticks := 10;
5: ticks := 8;
6: ticks := 6;
7: ticks := 4;
8: ticks := 3;
9: ticks := 2;
10: ticks := 1;
  end;
end;

function SpriteABC.GetSpeed: integer;
begin
  case ticks of
30: Result := 1;
20: Result := 2;
14: Result := 3;
10: Result := 4;
8:  Result := 5;
6:  Result := 6;
4:  Result := 7;
3:  Result := 8;
2:  Result := 9;
1:  Result := 10;
  end;
end;

procedure SpriteABC.SetActive(b: boolean);
begin
  act:=b;
end;

procedure SpriteABC.NextFrame;
var n: integer;
begin
  n := Frame + 1;
  if n>States[curst-1].Count then
    n := 1;
  Frame := n;
//  Redraw; // ��� ���� ��������� �� �����!
end;

procedure SpriteABC.SetFrame(n: integer);
begin
  if Frame=n then
    exit;
  if n<1 then
    n := 1;
  if n>States[curst-1].Count then
    n := States[curst-1].Count;
  CurrentPicture := States[curst-1].Beg + n - 1;
end;

function SpriteABC.GetFrame: integer;
begin
  Result := CurrentPicture - States[curst-1].Beg + 1;
end;

function SpriteABC.FrameCount: integer;
begin
  Result := States[curst-1].Count;
end;

function SpriteABC.FrameBeg: integer;
begin
  Result := States[curst-1].Beg;
end;

procedure SpriteABC.AddState(name: string; count: integer);
begin
  if (States[0].Name='') then
  begin
//    StateBegs[1]:=1;
    States[0].Count := count;
    States[0].Name := name;
  end
  else
  begin
    var v := States.Length;
    SetLength(States,v+1);
    States[States.Length-1].Beg := States[States.Length-2].Beg + States[States.Length-2].Count;
    States[States.Length-1].Count := count;
    States[States.Length-1].Name := name;
//    StateBegs.Add(StateBegs[StateCount-1]+StateCounts[StateCount-1]);
//    StateCounts.Add(count);
//    StateNames.Add(name);
  end;
end;

function SpriteABC.Clone0: ObjectABC;
begin
  Result := new SpriteABC(Self);
end;

function SpriteABC.Clone: SpriteABC; 
begin
  Result := new SpriteABC(Self);
end;

procedure StartSprites;
begin
  _t.Start;
end;

procedure StopSprites;
begin
  _t.Stop;
end;

var k: integer;

procedure TimerProc(o: Object; e: System.Timers.ElapsedEventArgs);
var i: integer;
begin
  LockDrawingObjects;
  i := 0;
  while i<_Sprites.Count do
  begin
    SpriteABC(_Sprites[i]).NextTick;
    Inc(i);
  end;
  Inc(k);
  //SetWindowCaption(IntToStr(round(k*1000/Milliseconds)));
  RedrawObjects;
end;

var __initialized := false;

procedure __InitModule;
begin
  timerMs := 50; // ������������� �������. ����� ��������� ��������������
  _Sprites := new System.Collections.ArrayList;
  _t := new System.Timers.Timer(timerMs);
  _t.Elapsed += TimerProc;
end;

procedure __InitModule__;
begin
  if not __initialized then
  begin
    __initialized := true;
    ABCObjects.__InitModule__;
    GraphABC.__InitModule__;
    __InitModule;
  end;
end;

procedure __FinalizeModule__;
begin
  StartSprites;
end;

initialization
  __InitModule;
finalization
  __FinalizeModule__;
end.