/// ����������� ������
unit PABCSystem;

 {$define PascalABC}

{$gendoc true}

// Default Application type
{$apptype console}

{$reference 'System.dll'}
{$reference 'mscorlib.dll'}
{$reference 'System.Core.dll'}

interface

uses
  System, 
  System.IO, 
  //System.Reflection, 
  System.Collections, 
  System.Collections.Generic,
  System.Runtime.InteropServices;

const
  /// ������������ �������� ���� shortint
  MaxShortInt = shortint.MaxValue; 
  /// ������������ �������� ���� byte
  MaxByte = byte.MaxValue;
  /// ������������ �������� ���� smallint
  MaxSmallInt = smallint.MaxValue;
  /// ������������ �������� ���� word
  MaxWord = word.MaxValue;
  /// ������������ �������� ���� longword
  MaxLongWord = longword.MaxValue; 
  /// ������������ �������� ���� int64
  MaxInt64 = int64.MaxValue; 
  /// ������������ �������� ���� uint64
  MaxUInt64 = uint64.MaxValue; 
  /// ������������ �������� ���� double
  MaxDouble = real.MaxValue; 
  /// ����������� ������������� �������� ���� double
  MinDouble = real.Epsilon;
  /// ������������ �������� ���� real
  MaxReal = real.MaxValue; 
  /// ����������� ������������� �������� ���� real
  MinReal = real.Epsilon;
  /// ������������ �������� ���� single
  MaxSingle = single.MaxValue; 
  /// ����������� ������������� �������� ���� single
  MinSingle = single.Epsilon;
  
  /// ������������ �������� ���� integer
  MaxInt = integer.MaxValue;
  /// ��������� Pi
  Pi = 3.141592653589793;
  /// ��������� E
  E  = 2.718281828459045;
  END_OF_LINE_SYMBOL = #10;
  /// ��������� �������� �� ����� ������
  NewLine = System.Environment.NewLine;


function RunTimeSizeOf(t: System.Type): integer;

/// �������� �������� �������� ������, � �������� ���� �������� ���������
var
  CommandLineArgs: array of string;

//������ ����, ��� ��� ��������� ������
///--
const
  __IS_SYSTEM_MODULE = true;

type
  /// ������� ��� ��������
  object   = System.Object;
  
  /// ������� ��� ����������
  exception = System.Exception;
  
  double   = System.Double;
  
  longint  = System.Int32;
  
  cardinal = System.UInt32;
  
  /// ������������ 128-������ ������������ �����
  decimal  = System.Decimal;
  
  //------------------------------------------------------------------------------
  //Pointers
  //------------------------------------------------------------------------------
  
  //1                   //pointed to
  PBoolean  = ^boolean; //bool
  PByte     = ^byte;    //byte
  PShortint = ^shortint;//sbyte
  //2
  PChar     = ^char;    //char
  PSmallint = ^smallint;//short
  PWord     = ^word;    //ushort
  //4
  PPointer  = ^pointer; //void*
  PInteger  = ^integer; //int32
  PLongword = ^longword;//uint32
  PLongint  = ^longint; //int64
  //8
  PInt64    = ^int64;
  PUInt64   = ^uint64;  //unit64
  
  //8
  PSingle   = ^single;  //single
  //16
  PReal     = ^real;    //double
  PDouble   = ^double;  //double  //������, �� ����������, ���� ���������
  //------------------------------------------------------------------------------
  ShortString = string[255];
  
  /// ��� ���������� �����
  Text = class
  private 
    fi: FileInfo;
    sr: StreamReader;
    sw: StreamWriter;
  end;
  
  TextFile = Text;
  
  RangeException = class(SystemException) end; 
  CommandLineArgumentOutOfRangeException = class(SystemException) end; 
  
  // ��������������� ��� ��� ������������ ����
  ///--
  Diapason = record
    low, high: integer;
    clow, chigh: object;
    constructor(_low, _high: integer);
    constructor(_low, _high: object);
  end;
  
  ///--
  TypedSetComparer = class(System.Collections.IEqualityComparer)
    public function Equals(x: System.Object; y: System.Object): boolean;
    public function GetHashCode(obj: System.Object): integer;
  end;
  
  // ��������������� ��� ��� ���������
  ///-- 
  TypedSet = class (System.Collections.IEnumerable)
  private 
    ht: Hashtable;
    len: integer;
    //copy_ht: Hashtable;
    low_bound, upper_bound: object;
  public 
    constructor Create;
    constructor Create(len: integer);
    constructor Create(low_bound, upper_bound: object);
    constructor Create(vals: array of byte);
    constructor Create(initValue: TypedSet);
    constructor Create(low_bound, upper_bound: object; initValue: TypedSet);
    procedure CreateIfNeed;
    function UnionSet(s: TypedSet): TypedSet;
    function SubtractSet(s: TypedSet): TypedSet;
    function IntersectSet(s: TypedSet): TypedSet;
    function CloneSet: TypedSet;
    function GetBytes: array of byte;
    function IsInDiapason(elem: object): boolean;
    function Contains(elem: object): boolean;
    procedure Clip;
    procedure Clip(len: integer);
    procedure IncludeElement(elem: object);
    procedure ExcludeElement(elem: object);
    procedure Init(params elems: array of object);
    procedure AssignSetFrom(s: TypedSet);
    function CompareEquals(s: TypedSet): boolean;
    function CompareInEquals(s: TypedSet): boolean;
    function CompareLess(s: TypedSet): boolean;
    function CompareLessEqual(s: TypedSet): boolean;
    function CompareGreater(s: TypedSet): boolean;
    function CompareGreaterEqual(s: TypedSet): boolean;
    function GetEnumerator: IEnumerator;
    function ToString: string; override;
  end;

var
  output: TextFile;
  input: TextFile;

///--
function Union(s1, s2: TypedSet): TypedSet;
///--
function Subtract(s1, s2: TypedSet): TypedSet;
///- Include(var s : set of T; el : T)
///��������� ������� el �� ��������� s
procedure Include(var s: TypedSet; el: object);
///- Exclude(var s : set of T; el : T)
///������� ������� el �� ��������� s
procedure Exclude(var s: TypedSet; el: object);
///--
function Intersect(s1, s2: TypedSet): TypedSet;
///--
function CreateSet(params elems: array of object): TypedSet;
///--
function CreateSet: TypedSet;
///--
function CreateBoundedSet(low, high: object): TypedSet;
///--
function InSet(obj: object; s: TypedSet): boolean;
///--
function CreateDiapason(low, high: integer): Diapason;
///--
function CreateObjDiapason(low, high: object): Diapason;
///--
function CompareSetEquals(s1, s2: TypedSet): boolean;
///--
function CompareSetInEquals(s1, s2: TypedSet): boolean;
///--
function CompareSetLess(s1, s2: TypedSet): boolean;
///--
function CompareSetGreaterEqual(s1, s2: TypedSet): boolean;
///--
function CompareSetLessEqual(s1, s2: TypedSet): boolean;
///--
function CompareSetGreater(s1, s2: TypedSet): boolean;
///--
procedure ClipSet(var s: TypedSet; low, high: object);
///--
procedure AssignSet(var left: TypedSet; right: TypedSet);
///--
function ClipSetFunc(s: TypedSet; low, high: object): TypedSet;
///--
function ClipShortStringInSet(s: TypedSet; len: integer): TypedSet;
///--
procedure ClipShortStringInSetProcedure(var s: TypedSet; len: integer);
///--
procedure AssignSetWithBounds(var left: TypedSet; right: TypedSet; low, high: object);
///--
procedure TypedSetInit(var st: TypedSet);
///--
procedure TypedSetInitWithBounds(var st: TypedSet; low, high: object);
///--
procedure TypedSetInitWithShortString(var st: TypedSet; len: integer);

///--
function ExecuteAssemlyIsDll: boolean;

// Base class for typed and binary files
///--
type
  AbstractBinaryFile = class
    fi: FileInfo;
    fs: FileStream;
    br: BinaryReader;
    bw: BinaryWriter;
  end;

///--
type
  TypedFile = sealed class(AbstractBinaryFile)
  private 
    ElementSize: int64;
    offset: integer;
    offsets: array of integer;
  public 
    ElementType: System.Type;
    constructor Create(ElementType: System.Type);
    constructor Create(ElementType: System.Type; offs: integer; params offsets: array of integer);
    function ToString: string; override;
  end;
  
  ///--
  BinaryFile = sealed class(AbstractBinaryFile)
  public 
    function ToString: string; override;
  end;
  
  /// ��������� ���������� �����/������
  IOSystem = interface
    function peek: integer;
    function read_symbol: char;
    procedure read(var x: integer);
    procedure read(var x: real);
    procedure read(var x: char);
    procedure read(var x: string);
    procedure read(var x: byte);
    procedure read(var x: shortint);
    procedure read(var x: smallint);
    procedure read(var x: word);
    procedure read(var x: longword);
    procedure read(var x: int64);
    procedure read(var x: uint64);
    procedure read(var x: single);
    procedure read(var x: boolean);
    procedure readln;
    procedure write(obj: object);
    procedure write(p: pointer);
    procedure writeln;
  end;
  
  IOStandardSystem = class(IOSystem)
  public 
    function peek: integer;          virtual;
    function read_symbol: char;      virtual;
    procedure read(var x: integer);  virtual; 
    procedure read(var x: real);     virtual;
    procedure read(var x: char);     virtual;
    procedure read(var x: string);   virtual; 
    procedure read(var x: byte);     virtual;
    procedure read(var x: shortint); virtual; 
    procedure read(var x: smallint); virtual; 
    procedure read(var x: word);     virtual;
    procedure read(var x: longword); virtual; 
    procedure read(var x: int64);    virtual;
    procedure read(var x: uint64);   virtual;
    procedure read(var x: single);   virtual;
    procedure read(var x: boolean);  virtual;
    procedure readln;                virtual;
    procedure write(p: pointer);     virtual;
    procedure write(obj: object);    virtual;
    procedure writeln;               virtual;
  end;
  
  ///--
  GCHandlersController = class(IEnumerable)
  private 
    Counters, Handlers: Hashtable;
  public 
    constructor;
    procedure Add(obj: Object);
    procedure Remove(obj: Object);
    function GetCounter(obj: Object): integer;
    function GetEnumerator: IEnumerator;
  end;
  
  ///������� ����� ��� ����������, ��������� ��� �������� ��������� generic-����
  BadGenericInstanceParameterException = class(Exception)
  protected 
    InstanceType: System.Type;
  public 
    constructor Create(ActualParameterType: System.Type);
  end;
  
  ///��������� ���� ��� ���������� ��� ����������
  CanNotUseTypeForPointersException = class(BadGenericInstanceParameterException)
  public 
    function ToString: string; override;
  end;
  
  ///��������� ���� ��� ���������� ��� �������������� ������
  CanNotUseTypeForTypedFilesException = class(BadGenericInstanceParameterException)
  public 
    function ToString: string; override;
  end;
  
  ///��������� ���� ��� ���������� ��� �������� ������
  CanNotUseTypeForFilesException = class(BadGenericInstanceParameterException)
  public 
    function ToString: string; override;
  end;

///--
function GetCharInShortString(s: string; ind, n: integer): char;
///--
function SetCharInShortString(s: string; ind, n: integer; c: char): string;
///--
function ClipShortString(s: string; len: integer): string;
///--
function GetResourceStream(ResourceFileName: string): Stream;


// -----------------------------------------------------
//                  read - readln
// -----------------------------------------------------
///- read(a,b,...)
/// ������ �������� a,b,... � ����������
procedure read;
///--
procedure read(var x: integer);
///--
procedure read(var x: real);
///--
procedure read(var x: char);
///--
procedure read(var x: string);
///--
procedure read(var x: byte);
///--
procedure read(var x: shortint);
///--
procedure read(var x: smallint);
///--
procedure read(var x: word);
///--
procedure read(var x: longword);
///--
procedure read(var x: int64);
///--
procedure read(var x: uint64);
///--
procedure read(var x: single);
///--
procedure read(var x: boolean);

/// ���������� �������� ���� integer, ��������� � ����������
function ReadInteger: integer;
/// ���������� �������� ���� real, ��������� � ����������
function ReadReal: real;
/// ���������� �������� ���� char, ��������� � ����������
function ReadChar: char;
/// ���������� �������� ���� string, ��������� � ����������
function ReadString: string;
/// ���������� �������� ���� boolean, ��������� � ����������
function ReadBoolean: boolean;

/// ���������� �������� ���� integer, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnInteger: integer;
/// ���������� �������� ���� real, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnReal: real;
/// ���������� �������� ���� char, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnChar: char;
/// ���������� �������� ���� string, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnString: string;
/// ���������� �������� ���� boolean, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnBoolean: boolean;

///--
procedure ReadShortString(var s: string; n: integer);
///--
procedure ReadShortStringFromFile(f: Text; var s: string; n: integer);

///- readln(a,b,...)
/// ������ �������� a,b,... � ���������� � ������������ ������� �� ��������� ������
procedure readln;

///- read(f,a,b,...)
/// ������ �������� a,b,... �� ����� f
procedure read(f: Text);
///--
procedure read(f: Text; var x: integer);
///--
procedure read(f: Text; var x: real);
///--
procedure read(f: Text; var x: char);
///--
procedure read(f: Text; var x: string);
///--
procedure read(f: Text; var x: byte);
///--
procedure read(f: Text; var x: shortint);
///--
procedure read(f: Text; var x: smallint);
///--
procedure read(f: Text; var x: word);
///--
procedure read(f: Text; var x: longword);
///--
procedure read(f: Text; var x: int64);
///--
procedure read(f: Text; var x: uint64);
///--
procedure read(f: Text; var x: single);
///--
procedure read(f: Text; var x: boolean);

///- readln(f: Text; a,b,...)
/// ������ �������� a,b,... �� ���������� ����� f � ������������ ������� �� ��������� ������
procedure readln(f: Text);

/// ���������� �������� ���� integer, ��������� �� ���������� ����� f
function ReadInteger(f: Text): integer;
/// ���������� �������� ���� real, ��������� �� ���������� ����� f
function ReadReal(f: Text): real;
/// ���������� �������� ���� char, ��������� �� ���������� ����� f
function ReadChar(f: Text): char;
/// ���������� �������� ���� string, ��������� �� ���������� ����� f
function ReadString(f: Text): string;
/// ���������� �������� ���� boolean, ��������� �� ���������� ����� f
function ReadBoolean(f: Text): boolean;

/// ���������� True, ���� ��������� ����� ������
function Eoln: boolean;
/// ���������� True, ���� ��������� ����� �����
function Eof: boolean;

///--
function check_in_range(val: int64; low, up: int64): int64;
///--
function check_in_range_char(val: char; low, up: char): char;

type
  ///--
  PointerOutput = class
  public 
    p: pointer;
    function ToString: string; override;
    constructor(ptr: pointer);
  end;  

// -----------------------------------------------------
//                  write - writeln
// -----------------------------------------------------
///- write(a,b,...)
/// ������� �������� a,b,... �� �����
procedure write;
///--
procedure write(obj: object);
///--
procedure write(obj1, obj2: object);
///--
procedure write(params args: array of object);

///- writeln(a,b,...)
/// ������� �������� a,b,... �� ����� � ������������ ������� �� ����� ������
procedure writeln;
///--
procedure writeln(obj: object);
///--
//procedure writeln(ptr: pointer); 
///--
procedure writeln(obj1, obj2: object);
///--
procedure writeln(params args: array of object);

///- write(f: Text; a,b,...)
/// ������� �������� a,b,... � ��������� ���� f
procedure write(f: Text);
///--
procedure write(f: Text; val: object);
///--
procedure write(f: Text; params args: array of object);

///- writeln(f: Text; a,b,...)
/// ������� �������� a,b,... � ��������� ���� f � ������������ ������� �� ����� ������
procedure writeln(f: Text);
///--
procedure writeln(f: Text; val: object);
///--
procedure writeln(f: Text; params args: array of object);

/// ������� �������� args �������� ��������� ������ formatstr
procedure WriteFormat(formatstr: string; params args: array of object);
/// ������� �������� args �������� ��������� ������ formatstr � ������������ ������� �� ����� ������
procedure WritelnFormat(formatstr: string; params args: array of object);
/// ������� �������� args � ��������� ���� f �������� ��������� ������ formatstr
procedure WriteFormat(f: Text; formatstr: string; params args: array of object);
/// ������� �������� args � ��������� ���� f �������� ��������� ������ formatstr
///� ������������ ������� �� ����� ������
procedure WritelnFormat(f: Text; formatstr: string; params args: array of object);

// -----------------------------------------------------
//                  Text files
// -----------------------------------------------------
/// ��������� �������� ���������� f � ������ ����� name
procedure Assign(f: Text; name: string);
/// ��������� �������� ���������� f � ������ ����� name
procedure AssignFile(f: Text; name: string);
/// ��������� ���� f
procedure Close(f: Text);
/// ��������� ���� f
procedure CloseFile(f: Text);
/// ��������� ��������� ���� f �� ������
procedure Reset(f: Text);
/// ��������� ��������� ���� f �� ������, ��� ���� ������� ��� ����������. ���� ���� �����������, �� ����������
procedure Rewrite(f: Text);
/// ��������� ��������� f ���� �� ����������
procedure Append(f: Text);
/// ���������� True, ���� ��������� ����� ����� f
function Eof(f: Text): boolean;
/// ���������� True, ���� ��������� ����� ������ � ����� f
function Eoln(f: Text): boolean;
/// ���������� ���������� �������, ����� ���� ���������� True, ���� ��������� ����� ����� f
function SeekEof(f: Text): boolean;
/// ���������� ���������� �������, ����� ���� ���������� True, ���� ��������� ����� ������ � ����� f
function SeekEoln(f: Text): boolean;
/// ���������� ���������� ������ ����� �� ����
procedure Flush(f: Text);
/// ������� ����, ��������� � �������� ���������� f
procedure Erase(f: Text);
/// ��������������� ����, �������� � �������� ���������� f, ����� ��� ��� newname. 
procedure Rename(f: Text; newname: string);
///--
procedure TextFileInit(var f: Text);

// -----------------------------------------------------
//                  Abstract binary files
// -----------------------------------------------------
///- Assign(f: file of T; name: string)
/// ��������� �������� ���������� f � ������ ����� name
procedure Assign(f: AbstractBinaryFile; name: string);
///- AssignFile(f: file of T; name: string)
/// ��������� �������� ���������� f � ������ ����� name
procedure AssignFile(f: AbstractBinaryFile; name: string);
///- Close(f: file of T)
/// ��������� ���� f
procedure Close(f: AbstractBinaryFile);
///- CloseFile(f: file of T)
/// ��������� ���� f
procedure CloseFile(f: AbstractBinaryFile);
///- Reset(f: file of T)
/// ��������� �������� ���� f �� ������ � ������
procedure Reset(f: AbstractBinaryFile);
///- Rewrite(f: file of T)
/// ��������� �������� ���� f �� ������ � ������, ��� ���� ������� ��� ����������. ���� ���� �����������, �� ����������
procedure Rewrite(f: AbstractBinaryFile);
///- Truncate(f: file of T)
/// ������� �������� ���� f, ���������� ��� �������� � ������� ��������� ���������
procedure Truncate(f: AbstractBinaryFile);
///- Eof(f: file of T)
/// ���������� True, ���� ��������� ����� ����� f
function Eof(f: AbstractBinaryFile): boolean;
///- Erase(f: file of T)
/// ������� ����, ��������� � �������� ���������� f
procedure Erase(f: AbstractBinaryFile);
///- Rename(f: file of T; newname: string)
/// ��������������� ����, �������� � �������� ���������� f, ����� ��� ��� newname. 
procedure Rename(f: AbstractBinaryFile; newname: string);

///- write(f: file of T; a,b,...)
/// ������� �������� a,b,... � �������������� ���� f
//procedure Write(f: AbstractBinaryFile; val: object; arr: boolean); 
///- write(f: file; a,b,...)
/// ������� �������� a,b,... � ���������������� ���� f
procedure Write(f: AbstractBinaryFile; params vals: array of object);
///--
procedure Writeln(f: AbstractBinaryFile);
///--
procedure Writeln(f: AbstractBinaryFile; val: object);
///--
procedure Writeln(f: AbstractBinaryFile; params vals: array of object);

// -----------------------------------------------------
//                  Typed files
// -----------------------------------------------------
///- FilePos(f : file of T): int64
/// ���������� ������� ������� ��������� ��������� � �������������� ����� f 
function FilePos(f: TypedFile): int64;
///- FileSize(f : file of T): int64
/// ���������� ���������� ��������� � �������������� ����� f 
function FileSize(f: TypedFile): int64;
///- Seek(f : file of T; n : int64)
/// ������������� ������� ������� ��������� ��������� � �������������� ����� f �� ������� � ������� n  
procedure Seek(f: TypedFile; n: int64);
///--
procedure TypedFileInit(var f: TypedFile; ElementType: System.Type);
///--
procedure TypedFileInit(var f: TypedFile; ElementType: System.Type; off: integer; params offs: array of integer);
///--
procedure TypedFileInitWithShortString(var f: TypedFile; ElementType: System.Type; off: integer; params offs: array of integer);
///--
function TypedFileRead(f: TypedFile): object;

// -----------------------------------------------------
//                  Binary files
// -----------------------------------------------------
///- FilePos(f : file): int64
/// ���������� ������� ������� ��������� ��������� � ���������������� ����� f 
function FilePos(f: BinaryFile): int64;
///- FileSize(f : file): int64
/// ���������� ���������� ���� � ���������������� ����� f 
function FileSize(f: BinaryFile): int64;
///- Seek(f : file; n : int64)
/// ������������� ������� ������� ��������� ��������� � ���������������� ����� f �� ���� � ������� n  
procedure Seek(f: BinaryFile; n: int64);
///--
procedure BinaryFileInit(var f: BinaryFile);
///--
function BinaryFileRead(var f: BinaryFile; ElementType: System.Type): object;

// -----------------------------------------------------
//                Operating System routines
// -----------------------------------------------------
/// ���������� ���������� ���������� ��������� ������
function ParamCount: integer;
/// ���������� i-��� �������� ��������� ������
function ParamStr(i: integer): string;
/// ���������� ������� �������
function GetDir: string;
/// ������ ������� �������
procedure ChDir(s: string);
/// ������� �������
procedure MkDir(s: string);
/// ������� �������
procedure RmDir(s: string);

/// ������� �������. ���������� True, ���� ������� ������� ������
function CreateDir(s: string): boolean;
/// ������� ����. ���� ���� �� ����� ���� ������, �� ���������� False
function DeleteFile(s: string): boolean;
/// ���������� ������� �������
function GetCurrentDir: string;
/// ������� �������. ���������� True, ���� ������� ������� ������
function RemoveDir(s: string): boolean;
/// ��������������� ���� name, ����� ��� ����� ��� newname. ���������� True, ���� ���� ������� ������������
function RenameFile(name, newname: string): boolean;
/// ������������ ������� �������. ���������� True, ���� ������� ������� ������
function SetCurrentDir(s: string): boolean;

/// �������� ���������� ����� � ������ name �� newext
function ChangeFileNameExtension(name, newext: string): string;
/// ���������� True, ���� ���� � ������ name ����������
function FileExists(name: string): boolean;

/// ������� � ����������� ���� ���� ������� ����������� ���� ������� �� �����������
procedure Assert(cond: boolean);
/// ������� � ����������� ���� ��������������� ��������� mes � ���� ������� ����������� ���� ������� �� �����������
procedure Assert(cond: boolean; mes: string);

/// ���������� ��������� ����� � ������ �� ����� � ������ diskname
function DiskFree(diskname: string): int64;
/// ���������� ������ � ������ �� ����� � ������ diskname
function DiskSize(diskname: string): int64;
/// ���������� ��������� ����� � ������ �� ����� disk. disk=0 - ������� ����, disk=1 - ���� A: , disk=2 - ���� B: � �.�.
function DiskFree(disk: integer): int64;
/// ���������� ������ � ������ �� ����� disk. disk=0 - ������� ����, disk=1 - ���� A: , disk=2 - ���� B: � �.�.
function DiskSize(disk: integer): int64;
/// ���������� ���������� ����������� � ������� ������ ������ ���������
function Milliseconds: integer;

// -----------------------------------------------------
//                File name routines
// -----------------------------------------------------
/// �������� ��� ����� �� ������� ����� ����� fname
function ExtractFileName(fname: string): string;
/// �������� ���������� �� ������� ����� ����� fname
function ExtractFileExt(fname: string): string;
/// �������� ���� �� ������� ����� ����� fname
function ExtractFilePath(fname: string): string;
/// �������� ��� ����� � ���� �� ������� ����� ����� fname
function ExtractFileDir(fname: string): string;
/// �������� ���� �� ������� ����� ����� fname
function ExtractFileDrive(fname: string): string;
/// ���������� ������ ��� ����� fname
function ExpandFileName(fname: string): string;

// -----------------------------------------------------
//                Mathematical routines
// -----------------------------------------------------
/// ���������� ���� ����� x
function Sign(x: integer): integer;
/// ���������� ���� ����� x
function Sign(x: longword): integer;
/// ���������� ���� ����� x
function Sign(x: int64): integer;
/// ���������� ���� ����� x
function Sign(x: uint64): integer;
/// ���������� ���� ����� x
function Sign(x: real): integer;
/// ���������� ������ ����� x
function Abs(x: integer): integer;
/// ���������� ������ ����� x
function Abs(x: longword): longword;
/// ���������� ������ ����� x
function Abs(x: int64): int64;
/// ���������� ������ ����� x
function Abs(x: uint64): uint64;
/// ���������� ������ ����� x
function Abs(x: real): real;
/// ���������� ����� ����� x
function Sin(x: real): real;
/// ���������� ��������������� ����� ����� x
function Sinh(x: real): real;
/// ���������� ������� ����� x
function Cos(x: real): real;
/// ���������� ��������������� ������� ����� x
function Cosh(x: real): real;
/// ���������� ������� ����� x
function Tan(x: real): real;
/// ���������� ��������������� ������� ����� x
function Tanh(x: real): real;
/// ���������� �������� ����� x
function ArcSin(x: real): real;
/// ���������� ���������� ����� x
function ArcCos(x: real): real;
/// ���������� ���������� ����� x
function ArcTan(x: real): real;
/// ���������� ���������� ����� x
function Exp(x: real): real;
/// ���������� ����������� �������� ����� x
function Ln(x: real): real;
/// ���������� �������� ����� x �� ��������� 2
function Log2(x: real): real;
/// ���������� ���������� �������� ����� x
function Log10(x: real): real;
/// ���������� �������� ����� x �� ��������� base
function LogN(base, x: real): real;
/// ���������� ���������� ������ ����� x
function Sqrt(x: real): real;
/// ���������� ������� ����� x
function Sqr(x: integer): int64;
/// ���������� ������� ����� x
function Sqr(x: longword): uint64;
/// ���������� ������� ����� x
function Sqr(x: int64): int64;
/// ���������� ������� ����� x
function Sqr(x: uint64): uint64;
/// ���������� ������� ����� x
function Sqr(x: real): real;
/// ���������� x � ������� y
function Power(x, y: real): real;
/// ���������� x, ����������� �� ���������� ������
function Round(x: real): integer;
/// ���������� ����� ����� ����� x
function Trunc(x: real): integer;
/// ���������� ����� ����� ����� x
function Int(x: real): real;
/// ���������� ������� ����� ����� x
function Frac(x: real): real;
/// ���������� ���������� ����� <= x
function Floor(x: real): integer;
/// ���������� ���������� ����� >= x
function Ceil(x: real): integer;
/// ��������� ������� � �������
function RadToDeg(x: real): real;
/// ��������� ������� � �������
function DegToRad(x: real): real;

/// �������������� ������ ��������������� �����
procedure Randomize;
/// �������������� ������ ��������������� �����, ��������� �������� seed. ��� ����� � ��� �� seed ������������ ���������� ��������������� ������������������
procedure Randomize(seed: integer);
/// ���������� ��������� ����� � ��������� �� 0 �� maxValue-1
function Random(maxValue: integer): integer;
/// ���������� ��������� ����� � ��������� �� a �� b
function Random(a, b: integer): integer;
/// ���������� ��������� ������������ � ��������� [0..1)
function Random: real;

/// ���������� ������������ �� ����� a,b
function Max(a, b: integer): integer;
/// ���������� ������������ �� ����� a,b
function Max(a, b: longword): longword;
/// ���������� ������������ �� ����� a,b
function Max(a, b: int64): int64;
/// ���������� ������������ �� ����� a,b
function Max(a, b: uint64): uint64;
/// ���������� ������������ �� ����� a,b
function Max(a, b: real): real;
/// ���������� ����������� �� ����� a,b
function Min(a, b: integer): integer;
/// ���������� ����������� �� ����� a,b
function Min(a, b: longword): longword;
/// ���������� ����������� �� ����� a,b
function Min(a, b: int64): int64;
/// ���������� ����������� �� ����� a,b
function Min(a, b: uint64): uint64;
/// ���������� ����������� �� ����� a,b
function Min(a, b: real): real;
/// ���������� True, ���� i �������
function Odd(i: integer): boolean;
/// ���������� True, ���� i �������
function Odd(i: longword): boolean;
/// ���������� True, ���� i �������
function Odd(i: int64): boolean;
/// ���������� True, ���� i �������
function Odd(i: uint64): boolean;

///- Low(i: array): integer
function Low(i: System.Array): integer;
///- High(i: array): integer
function High(i: System.Array): integer;

// -----------------------------------------------------
//                Char and String manipulation
// -----------------------------------------------------
/// ����������� ��� � ������ � ��������� Windows
function Chr(a: byte): char;
/// ����������� ������ � ��� � ��������� Windows
function Ord(a: char): byte;
/// ���������� ���������� ����� �������� a
function Ord(a: integer): integer;
/// ���������� ���������� ����� �������� a
function Ord(a: longword): longword;
/// ���������� ���������� ����� �������� a
function Ord(a: int64): int64;
/// ���������� ���������� ����� �������� a
function Ord(a: uint64): uint64;
/// ���������� ���������� ����� �������� a
function Ord(a: boolean): integer;
/// ����������� ��� � ������ � ��������� Unicode
function ChrUnicode(a: word): char;
/// ����������� ������ � ��� � ��������� Unicode
function OrdUnicode(a: char): word;
/// ����������� ������ � ������� �������
function UpperCase(ch: char): char;
/// ����������� ������ � ������ �������
function LowerCase(ch: char): char;
/// ����������� ������ � ������� �������
function UpCase(ch: char): char;
/// ����������� ������ � ������ �������
function LowCase(ch: char): char;

/// ����������� ����� �������� i � ���������� ������������� � ���������� ��������� � s
procedure Str(i: integer; var s: string);
///--
procedure Str(i: longword; var s: string);
///--
procedure Str(i: int64; var s: string);
///--
procedure Str(i: uint64; var s: string);
/// ����������� ������������ �������� r � ���������� ������������� � ���������� ��������� � s
procedure Str(r: real; var s: string);
/// ����������� ������������ �������� r � ���������� ������������� � ���������� ��������� � s
procedure Str(r: single; var s: string);
///--
procedure Str(s1: string; var s: string);
/// ���������� ������� ��������� subs � ������ s. ���� �� �������, ���������� 0 
function Pos(subs, s: string): integer;
/// ���������� ������� ��������� subs � ������ s ������� � ������� from. ���� �� �������, ���������� 0 
function PosEx(subs, s: string; from: integer := 1): integer;
/// ���������� ����� ������ 
function Length(s: string): integer;
/// ������������� ����� ������ s ������ n
procedure SetLength(var s: string; n: integer);
///--
procedure SetLengthForShortString(var s: string; n, sz: integer);
/// ��������� ��������� source � ������ s � ������� index
procedure Insert(source: string; var s: string; index: integer);
///--
procedure InsertInShortString(source: string; var s: string; index, n: integer);
/// ������� �� ������ s count �������� � ������� index
procedure Delete(var s: string; index, count: integer);
/// ���������� ��������� ������ s ����� count � ������� index
function Copy(s: string; index, count: integer): string;
///-Concat(s1,s2,...): string 
/// ���������� ������, ���������� ����������� ������� ����� s1,s2,...
function Concat(params strs: array of string): string;
/// ���������� ������, ���������� ����������� ������� ����� s1 � s2
function Concat(s1, s2: string): string;
/// ���������� ������ � ������ ��������
function LowerCase(s: string): string;
/// ���������� ������ � ������� ��������
function UpperCase(s: string): string;
/// ���������� ������, ��������� �� count �������� ch
function StringOfChar(ch: char; count: integer): string;
/// ���������� ��������������� ������
function ReverseString(s: string): string;
/// ���������� ������. ���������� �������� < 0 ���� s1<s2, > 0 ���� s1>s2 � = 0 ���� s1=s2
function CompareStr(s1, s2: string): integer;
/// ���������� ������ count �������� ������ s
function LeftStr(s: string; count: integer): string;
/// ���������� ��������� count �������� ������ s
function RightStr(s: string; count: integer): string;

/// ���������� ������ � ���������� ���������� � ��������� ���������
function Trim(s: string): string;
/// ���������� ������ � ���������� ���������� ���������
function TrimLeft(s: string): string;
/// ���������� ������ � ���������� ��������� ���������
function TrimRight(s: string): string;

/// ����������� ��������� ������������� ������ ����� � ��������� ��������
function StrToInt(s: string): integer;
/// ����������� ��������� ������������� ������ ����� � ��������� ��������
function StrToInt64(s: string): int64;
/// ����������� ��������� ������������� ������������� ����� � ��������� ��������
function StrToFloat(s: string): real;
/// ����������� ��������� ������������� s ������ ����� � ��������� �������� � ���������� ��� � value. ��� ������������� �������������� ������������ False
function TryStrToInt(s: string; var value: integer): boolean;
/// ����������� ��������� ������������� s ������ ����� � ��������� �������� � ���������� ��� � value. ��� ������������� �������������� ������������ False
function TryStrToInt64(s: string; var value: int64): boolean;
/// ����������� ��������� ������������� s ������������� ����� � ��������� �������� � ���������� ��� � value. ��� ������������� �������������� ������������ False
function TryStrToFloat(s: string; var value: real): boolean;
/// ����������� ��������� ������������� s ������������� ����� � ��������� �������� � ���������� ��� � value. ��� ������������� �������������� ������������ False
function TryStrToFloat(s: string; var value: single): boolean;

/// ����������� ��������� ������������� s ������ ����� � ��������� �������� � ���������� ��� � ���������� value. ���� �������������� �������, �� err=0, ����� err>0
procedure Val(s: string; var value: integer; var err: integer);
/// ����������� ��������� ������������� s ������ ����� � ��������� �������� � ���������� ��� � ���������� value. ���� �������������� �������, �� err=0, ����� err>0
procedure Val(s: string; var value: shortint; var err: integer);
/// ����������� ��������� ������������� s ������ ����� � ��������� �������� � ���������� ��� � ���������� value. ���� �������������� �������, �� err=0, ����� err>0
procedure Val(s: string; var value: smallint; var err: integer);
/// ����������� ��������� ������������� s ������ ����� � ��������� �������� � ���������� ��� � ���������� value. ���� �������������� �������, �� err=0, ����� err>0
procedure Val(s: string; var value: int64; var err: integer);
/// ����������� ��������� ������������� s ������ ����� � ��������� �������� � ���������� ��� � ���������� value. ���� �������������� �������, �� err=0, ����� err>0
procedure Val(s: string; var value: byte; var err: integer);
/// ����������� ��������� ������������� s ������ ����� � ��������� �������� � ���������� ��� � ���������� value. ���� �������������� �������, �� err=0, ����� err>0
procedure Val(s: string; var value: word; var err: integer);
/// ����������� ��������� ������������� s ������ ����� � ��������� �������� � ���������� ��� � ���������� value. ���� �������������� �������, �� err=0, ����� err>0
procedure Val(s: string; var value: longword; var err: integer);
/// ����������� ��������� ������������� s ������ ����� � ��������� �������� � ���������� ��� � ���������� value. ���� �������������� �������, �� err=0, ����� err>0
procedure Val(s: string; var value: uint64; var err: integer);
/// ����������� ��������� ������������� s ������������� ����� � ��������� �������� � ���������� ��� � ���������� value. ���� �������������� �������, �� err=0, ����� err>0
procedure Val(s: string; var value: real; var err: integer);
/// ����������� ��������� ������������� s ������������� ����� � ��������� �������� � ���������� ��� � ���������� value. ���� �������������� �������, �� err=0, ����� err>0
procedure Val(s: string; var value: single; var err: integer);

/// ����������� ����� ����� � ���������� �������������
function IntToStr(a: integer): string;
/// ����������� ����� ����� � ���������� �������������
function IntToStr(a: int64): string;
/// ����������� ������������ ����� � ���������� �������������
function FloatToStr(a: real): string;

/// ���������� ����������������� ������, ����������� �� ��������� ������ fmtstr � ������ ������������ ���������� pars
function Format(fmtstr: string; params pars: array of object): string;

// -----------------------------------------------------
//                Common Routines
// -----------------------------------------------------
/// ����������� �������� ���������� i �� 1
procedure Inc(var i: integer);
/// ����������� �������� ���������� i �� n
procedure Inc(var i: integer; n: integer);
/// ��������� �������� ���������� i �� 1
procedure Dec(var i: integer);
/// ��������� �������� ���������� i �� n
procedure Dec(var i: integer; n: integer);
/// ����������� ��� ������� c �� 1
procedure Inc(var c: char);
/// ����������� ��� ������� c �� n
procedure Inc(var c: char; n: integer);
/// ��������� ��� ������� c �� 1
procedure Dec(var c: char);
/// ��������� ��� ������� c �� n
procedure Dec(var c: char; n: integer);
///--
procedure Inc(var b: byte);
///--
procedure Inc(var b: byte; n: integer);
///--
procedure Dec(var b: byte);
///--
procedure Dec(var b: byte; n: integer);
procedure Inc(var f: boolean);
procedure Dec(var f: boolean);

//------------------------------------------------------------------------------
//PRED-SUCC
/// ���������� ��������� �� x ��������
function succ(x: integer): integer;
/// ���������� ��������� �� x ��������
function succ(x: boolean): boolean;
/// ���������� ��������� �� x ��������
function succ(x: byte): byte;
/// ���������� ��������� �� x ��������
function succ(x: shortint): shortint;
/// ���������� ��������� �� x ��������
function succ(x: smallint): smallint;
/// ���������� ��������� �� x ��������
function succ(x: word): word;
/// ���������� ��������� �� x ��������
function succ(x: longword): longword;
/// ���������� ��������� �� x ��������
function succ(x: int64): int64;
/// ���������� ��������� �� x ��������
function succ(x: uint64): uint64;
/// ���������� ��������� �� x ��������
function succ(x: char): char;
/// ���������� �������������� x ��������
function pred(x: boolean): boolean;
/// ���������� �������������� x ��������
function pred(x: byte): byte;
/// ���������� �������������� x ��������
function pred(x: shortint): shortint;
/// ���������� �������������� x ��������
function pred(x: smallint): smallint;
/// ���������� �������������� x ��������
function pred(x: word): word;
/// ���������� �������������� x ��������
function pred(x: integer): integer;
/// ���������� �������������� x ��������
function pred(x: longword): longword;
/// ���������� �������������� x ��������
function pred(x: int64): int64;
/// ���������� �������������� x ��������
function pred(x: uint64): uint64;
/// ���������� �������������� x ��������
function pred(x: char): char;
// -----------------------------------------------------
//                Linq Ext
// -----------------------------------------------------
/// ���������� ������������������ ����� �� a �� b
function Range(a,b: integer): IEnumerable<integer>;

//------------------------------------------------------------------------------

/// ���������� ����� ������������� �������
function Length(a: &Array): integer;
/// ���������� ����� ������������� ������� �� ����������� dim
function Length(a: &Array; dim: integer): integer;
/// ��������� ������ ���������
procedure Halt;
/// ��������� ������ ���������, ��������� ��� ������ exitCode
procedure Halt(exitCode: integer);

/// ��� ������������� � Pascal ABC. �� ��������� ������� ��������
procedure cls;

// ���������, ��� ������ ����� ����� �����. ����� (SS)
//procedure Pause;
/// ������ ����� �� ms �����������
procedure Sleep(ms: integer);
/// ��������� ��� ����������� .exe-�����
function GetEXEFileName: string;
/// ����������� ��������� � ���������� �������������
function PointerToString(p: pointer): string;

/// ������ ����� ������������� �������
function Copy(a: &Array): &Array;

//function Copy<T>(a: array of T): array of T;
///--
function CopyWithSize(source, dest: &Array): &Array;

/// ������ ������� �������� ���� ����������
procedure Swap<T>(var a, b: T);

/// ��������� ��������� ��� �������� � ������ filename 
procedure Exec(filename: string);

/// ��������� ��������� ��� �������� � ������ filename � ����������� ��������� ������ args
procedure Exec(filename: string; args: string);

/// ��������� ��������� ��� �������� � ������ filename 
procedure Execute(filename: string);

/// ��������� ��������� ��� �������� � ������ filename � ����������� ��������� ������ args
procedure Execute(filename: string; args: string);

// ��������������� ������������. �� ������� ���������� �� �������! 
///--
function FormatValue(value: object; NumOfChars: integer): string;
///--
function FormatValue(value: integer; NumOfChars: integer): string;
///--
function FormatValue(value: real; NumOfChars: integer): string;
///--
function FormatValue(value: real; NumOfChars, NumOfSignesAfterDot: integer): string;
///--
procedure StringDefaultPropertySet(var s: string; index: integer; c: char);

//procedure InitShortString(var s: ShortString; Length: integer);

///��������� ����������� ������������� ���������� �� ��� T
procedure CheckCanUsePointerOnType(T: System.Type);
///��������� ����������� ������ ���� T � ����
procedure CheckCanUseTypeForBinaryFiles(T: System.Type);
///��������� ����������� �������� file of T
procedure CheckCanUseTypeForTypedFiles(T: System.Type);
///���������� ����������� ����
function RuntimeDetermineType(T: System.Type): byte;
///���������� ������ ������ � ����������� �� �������� kind
function RuntimeInitialize(kind: byte; variable: object): object;
///���������� ������� ���� �� ����� ����������
function GetRuntimeSize<T>: integer;
///���������� ����� ������������� �������
//function Copy1<T>(a: array of T): array of T;
///���������� ������ ��� ������ � write
function _ObjectToString(obj: object): string;

//------------------------------------------------------------------------------
// WINAPI
// ������������� ���� ������� ������ ������������� �����������. ���������� ������
///--
function WINAPI_TerminateProcess(Handle: IntPtr; ExitCode: integer): boolean;
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// OpenMPSupport
procedure omp_set_nested(nested:integer);
function omp_get_nested:integer;
var OMP_NESTED:boolean:=false;
//------------------------------------------------------------------------------

var
  /// ���������� ������� ������� �����-������
  CurrentIOSystem: IOSystem;
  /// ��������� �������� True, ���� ���������� ����� ���������� ����
  IsConsoleApplication: boolean;
  ///--
  RedirectIOInDebugMode := False;
  ///--
  ExecuteBeforeProcessTerminateIn__Mode: procedure(e: Exception);
  //GCHandlersForReferencePointers := new GCHandlersController;
  ///--
  ExitCode := 0;  //TODO ������� ������� � Main

///--
procedure __InitModule__;
///--
procedure __FinalizeModule__;

implementation

var
  rnd: System.Random;
  //  ENCultureInfo: System.Globalization.CultureInfo;
  nfi: System.Globalization.NumberFormatInfo;
  LastReadChar := #0;
  DefaultOrdChrEncoding := System.Text.Encoding.GetEncoding(1251);
  __one_char := new char[1];
  __one_byte := new byte[1];
  StartTime: DateTime; // ��� Milliseconds

const
  WRITELN_IN_BINARYFILE_ERROR_MESSAGE = '�������� Writeln �� ��������� � �������� ������';
  InternalNullBasedArrayName = 'NullBasedArray';
  FILE_NOT_ASSIGNED = '��� �������� ���������� �� ��������� ��������� Assign';
  FILE_NOT_OPENED = '���� �� ������';
  RANGE_ERROR_MESSAGE = '����� �� ������� ���������';
  EOF_FOR_TEXT_WRITEOPENED = '������� Eof �� ����� ���� ������� ��� ���������� �����, ��������� �� ������';
  EOLN_FOR_TEXT_WRITEOPENED = '������� Eoln �� ����� ���� ������� ��� ���������� �����, ��������� �� ������';
  SEEKEOF_FOR_TEXT_WRITEOPENED = '������� SeekEof �� ����� ���� ������� ��� ���������� �����, ��������� �� ������';
  SEEKEOLN_FOR_TEXT_WRITEOPENED = '������� SeekEoln �� ����� ���� ������� ��� ���������� �����, ��������� �� ������';
  BAD_TYPE_IN_RUNTIMESIZEOF = 'Bad Type in RunTimeSizeOf';
//------------------------------------------------------------------------------
// WINAPI

function WINAPI_TerminateProcess(Handle: IntPtr; ExitCode: integer): boolean;
external 'kernel32.dll' name 'TerminateProcess';

function WINAPI_AllocConsole: longword; external 'kernel32.dll' name 'AllocConsole';

var
  console_alloc: boolean := false;

//------------------------------------------------------------------------------

// -----------------------------------------------------
//                  Internal functions
// -----------------------------------------------------

[System.Security.SecuritySafeCriticalAttribute]
procedure AllocConsole;
begin
  if not IsConsoleApplication and (System.Environment.OSVersion.Platform <> PlatformID.Unix) and (AppDomain.CurrentDomain.GetData('_RedirectIO_SpecialArgs') = nil) then
    WINAPI_AllocConsole;
  console_alloc := true;
end;

function GetNullBasedArray(arr: object): System.Array;
var
  fi: System.Reflection.FieldInfo;
begin
  fi := arr.GetType.GetField(InternalNullBasedArrayName);
  if fi <> nil then
    Result := System.Array(fi.GetValue(arr))
  else
    Result := nil;
end;

function RunTimeSizeOf(t: System.Type): integer;
var
  t1: System.Type;
  elem: object;
  fa: array of System.Reflection.FieldInfo;
  NullBasedArray: System.Array;
  i: integer;
  fi: System.Reflection.FieldInfo;
begin
  if t.IsPrimitive or t.IsEnum then 
    //begin
    case System.Type.GetTypeCode(t) of
      TypeCode.Boolean: Result := sizeof(Boolean);
      TypeCode.Byte:    Result := sizeof(Byte);
      TypeCode.Char:    Result := 1;//sizeof(Char);
      TypeCode.Decimal: Result := sizeof(Decimal);
      TypeCode.Double:  Result := sizeof(Double);
      TypeCode.Int16:   Result := sizeof(Int16);
      TypeCode.Int32:   Result := sizeof(Int32);
      TypeCode.Int64:   Result := sizeof(Int64);
      TypeCode.UInt16:  Result := sizeof(UInt16);
      TypeCode.UInt32:  Result := sizeof(UInt32);
      TypeCode.UInt64:  Result := sizeof(UInt64);
      TypeCode.SByte:   Result := sizeof(SByte);
      TypeCode.Single:  Result := sizeof(Single);
    else if t.IsEnum then result := sizeof(integer);
    end//;
  //end 
  else
  if t.IsValueType then // it is a record
  begin
    //elem := Activator.CreateInstance(t); //ssyy commented
    fa := t.GetFields;
    Result := 0;
    for i := 0 to fa.Length - 1 do
      if not fa[i].IsStatic then 
        Result := Result + RunTimeSizeOf(fa[i].FieldType)
  end
  else if t = typeof(string) then
    Result := 0
  else
  if t = typeof(TypedSet) then
  begin
    //elem := Activator.CreateInstance(t); //ssyy commented
    Result := 256 div 8;
  end
  else
  begin
    fi := t.GetField(InternalNullBasedArrayName);
    if fi = nil then 
      raise new SystemException(BAD_TYPE_IN_RUNTIMESIZEOF);
    elem := Activator.CreateInstance(t);
    NullBasedArray := GetNullBasedArray(elem);
    
    t1 := NullBasedArray.GetType.GetElementType;
    Result := RunTimeSizeOf(t1) * NullBasedArray.Length;
  end;
end;

// -----------------------------------------------------
//                  Diapason
// -----------------------------------------------------
constructor Diapason.Create(_low, _high: integer);
begin
  low := _low; high := _high;
end;

constructor Diapason.Create(_low, _high: object);
begin
  clow := _low; chigh := _high;
end;

function FormatFloatNumber(s: string): string;
begin
  Result := s.Replace(',', '.');
end;

procedure Pause;
begin
  System.Threading.Thread.CurrentThread.Suspend;
end;

function GetResourceStream(ResourceFileName: string): Stream;
begin
  result := System.Reflection.Assembly.GetEntryAssembly().GetManifestResourceStream(ResourceFileName);
end;

procedure ClipSet(var s: TypedSet; low, high: object);
begin
  s.low_bound := low;
  s.upper_bound := high;
  s.Clip;
end;

function ClipSetFunc(s: TypedSet; low, high: object): TypedSet;
begin
  s.low_bound := low;
  s.upper_bound := high;
  s.Clip();
  Result := s;
end;

function ClipShortStringInSet(s: TypedSet; len: integer): TypedSet;
begin
  s.len := len;
  s.Clip;
  Result := s;
end;

procedure ClipShortStringInSetProcedure(var s: TypedSet; len: integer);
begin
  s.len := len;
  s.Clip;
end;

procedure AssignSet(var left: TypedSet; right: TypedSet);
begin
  left := right.CloneSet();
end;

procedure AssignSetWithBounds(var left: TypedSet; right: TypedSet; low, high: object);
begin
  left := right.CloneSet();
  left.low_bound := low;
  right.upper_bound := high;
end;

procedure TypedSetInit(var st: TypedSet);
begin
  if st = nil then
    st := new TypedSet;
end;

procedure TypedSetInitWithBounds(var st: TypedSet; low, high: object);
begin
  if st = nil then
    st := new TypedSet(low, high);
end;

procedure TypedSetInitWithShortString(var st: TypedSet; len: integer);
begin
  if st = nil then
    st := new TypedSet(len);
end;

constructor TypedSet.Create;
begin
  ht := new Hashtable({new TypedSetComparer()});
end;

constructor TypedSet.Create(len: integer);
begin
  ht := new Hashtable({new TypedSetComparer()});
  self.len := len;
end;

constructor TypedSet.Create(low_bound, upper_bound: object);
begin
  ht := new Hashtable({new TypedSetComparer()});
  self.low_bound := low_bound;
  self.upper_bound := upper_bound;
end;

constructor TypedSet.Create(initValue: TypedSet);
begin
  ht := new Hashtable({new TypedSetComparer()});
  self.AssignSetFrom(initValue);
  self.len := initValue.len;
end;

constructor TypedSet.Create(low_bound, upper_bound: object; initValue: TypedSet);
begin
  ht := new Hashtable({new TypedSetComparer()});
  self.low_bound := low_bound;
  self.upper_bound := upper_bound;
  self.AssignSetFrom(initValue);
end;

constructor TypedSet.Create(vals: array of byte);
var
  i: integer;
begin
  ht := new Hashtable({new TypedSetComparer()});
  i := 0;
  while i < 256 div 8 do
  begin
    if vals[i] and 128 = 128 then ht.Add(i * 8, i * 8);
    if vals[i] and 64 = 64 then ht.Add(i * 8 + 1, i * 8 + 1);
    if vals[i] and 32 = 32 then ht.Add(i * 8 + 2, i * 8 + 2);
    if vals[i] and 16 = 16 then ht.Add(i * 8 + 3, i * 8 + 3);
    if vals[i] and 8 = 8 then ht.Add(i * 8 + 4, i * 8 + 4);
    if vals[i] and 4 = 4 then ht.Add(i * 8 + 5, i * 8 + 5);
    if vals[i] and 2 = 2 then ht.Add(i * 8 + 6, i * 8 + 6);
    if vals[i] and 1 = 1 then ht.Add(i * 8 + 7, i * 8 + 7);
    i := i + 1;
  end;
end;

procedure TypedSet.CreateIfNeed;
begin
  if ht = nil then ht := new Hashtable({new TypedSetComparer()});
end;

[System.Diagnostics.DebuggerStepThrough]
function TypedSet.CloneSet: TypedSet;
begin
  Result := new TypedSet();
  Result.ht := ht.Clone() as Hashtable;
  //Result.copy_ht := ht;
  Result.low_bound := low_bound;
  Result.upper_bound := upper_bound;
end;

function TypedSet.GetBytes: array of byte;
var
  ba: System.Collections.BitArray;
  i: integer;
begin
  ba := new BitArray(256);
  Result := nil;
  foreach o: object in ht.Keys do
  begin
    try
      i := Convert.ToInt32(o);
      if (i < 0) and (i >= -128) and (i <= 127) then
        ba[i + 128] := true
      else if (i >= 0) and (i <= 255) then
        ba[i] := true;
    
    except 
      on e: System.Exception do
      begin
        Result := nil;
        Exit;
      end;
    end;
  end;
  SetLength(Result, 256 div 8);
  i := 0;
  while i < 256 div 8 do
  begin
    Result[i] := Convert.ToByte(ba[i * 8 + 7]) or (Convert.ToByte(ba[i * 8 + 6]) shl 1) or (Convert.ToByte(ba[i * 8 + 5]) shl 2) or (Convert.ToByte(ba[i * 8 + 4]) shl 3)
    or (Convert.ToByte(ba[i * 8 + 3]) shl 4) or (Convert.ToByte(ba[i * 8 + 2]) shl 5) or (Convert.ToByte(ba[i * 8 + 1]) shl 6) or (Convert.ToByte(ba[i * 8]) shl 7);
    i := i + 1;
  end;
end;

function TypedSet.UnionSet(s: TypedSet): TypedSet;
begin
  Result := Union(self, s);
end;

function TypedSet.SubtractSet(s: TypedSet): TypedSet;
begin
  Result := Subtract(self, s);
end;

function TypedSet.IntersectSet(s: TypedSet): TypedSet;
begin
  Result := Intersect(self, s);
end;

function TypedSet.IsInDiapason(elem: object): boolean;
begin
  if (low_bound <> nil) and (upper_bound <> nil) and (elem is IComparable) then
  begin
    case System.Type.GetTypeCode(elem.GetType) of
      TypeCode.Char:
        begin
          if ((elem as IComparable).CompareTo(Convert.ToChar(low_bound)) >= 0) and ((elem as IComparable).CompareTo(Convert.ToChar(upper_bound)) <= 0) then
            Result := true
          else Result := false
        end;
      TypeCode.Int32:
        begin
          if not (elem is integer) then elem := Convert.ToInt32(elem);
          if ((elem as IComparable).CompareTo(Convert.ToInt32(low_bound)) >= 0) and ((elem as IComparable).CompareTo(Convert.ToInt32(upper_bound)) <= 0) then
            Result := true
          else Result := false
        end;
      TypeCode.Byte:
        begin
          if ((elem as IComparable).CompareTo(Convert.ToByte(low_bound)) >= 0) and ((elem as IComparable).CompareTo(Convert.ToByte(upper_bound)) <= 0) then
            Result := true
          else Result := false
        end;
      TypeCode.SByte:
        begin
          if ((elem as IComparable).CompareTo(Convert.ToSByte(low_bound)) >= 0) and ((elem as IComparable).CompareTo(Convert.ToSByte(upper_bound)) <= 0) then
            Result := true
          else Result := false
        end;
      TypeCode.Int16:
        begin
          if ((elem as IComparable).CompareTo(Convert.ToInt16(low_bound)) >= 0) and ((elem as IComparable).CompareTo(Convert.ToInt16(upper_bound)) <= 0) then
            Result := true
          else Result := false
        end;
      TypeCode.UInt16:
        begin
          if ((elem as IComparable).CompareTo(Convert.ToUint16(low_bound)) >= 0) and ((elem as IComparable).CompareTo(Convert.ToUInt16(upper_bound)) <= 0) then
            Result := true
          else Result := false
        end;
      TypeCode.UInt32:
        begin
          if ((elem as IComparable).CompareTo(Convert.ToUInt32(low_bound)) >= 0) and ((elem as IComparable).CompareTo(Convert.ToUInt32(upper_bound)) <= 0) then
            Result := true
          else Result := false
        end;
      TypeCode.Int64:
        begin
          if ((elem as IComparable).CompareTo(Convert.ToInt64(low_bound)) >= 0) and ((elem as IComparable).CompareTo(Convert.ToInt64(upper_bound)) <= 0) then
            Result := true
          else Result := false
        end;
      TypeCode.UInt64:
        begin
          if ((elem as IComparable).CompareTo(Convert.ToUInt64(low_bound)) >= 0) and ((elem as IComparable).CompareTo(Convert.ToUInt64(upper_bound)) <= 0) then
            Result := true
          else Result := false
        end;
    else
      if elem.GetType().IsEnum then 
      begin
        if ((Convert.ToInt32(elem)).CompareTo(Convert.ToInt32(low_bound)) >= 0) and ((Convert.ToInt32(elem)).CompareTo(Convert.ToInt32(upper_bound)) <= 0) then
          Result := true
        else Result := false
      end
      else Result := true;
    end// case
  end // then
  else Result := true;
end;

function convert_elem(obj: object): object;
begin
  var t := obj.GetType;
  if t.IsEnum then
  begin
    Result := obj;
    exit;
  end;
  case System.Type.GetTypeCode(t) of
    TypeCode.Byte, TypeCode.SByte, TypeCode.Int16, TypeCode.UInt16, TypeCode.Int32:
    Result := Convert.ToInt32(obj);
    TypeCode.UInt32:
      begin
        var tmp: longword := longword(obj);
        if tmp <= integer.MaxValue then
          Result := integer(tmp)
        else
          Result := Convert.ToInt64(obj);
      end;
    TypeCode.Int64:
      begin
        var tmp: int64 := int64(obj);
        if tmp <= integer.MaxValue then
          Result := integer(tmp)
        else
          Result := obj;
      end;
    TypeCode.UInt64:
      begin
        var tmp: uint64 := uint64(obj);
        if tmp <= integer.MaxValue then
          Result := integer(tmp)
        else
        if tmp <= int64.MaxValue then
          Result := int64(tmp)
        else
          Result := obj;
      end
  else
    Result := obj;
  end;
end;

function TypedSet.Contains(elem: object): boolean;
begin
  if elem.GetType().IsEnum then
  begin
    Result := ht[elem] <> nil
  end
  else 
  begin
    elem := convert_elem(elem);
    Result := ht.ContainsKey(elem);// <> nil;
    if not Result and (elem is char) then
      Result := ht.ContainsKey(Convert.ToString(elem));
  end;
end;

procedure TypedSet.Clip;
begin
  if self.len > 0 then
  begin
    Clip(self.len);
    exit;
  end;
  var tmp_ht := new Hashtable();
  foreach el: object in ht.Keys do
  begin
    if IsInDiapason(el) then 
    begin
      if (self.low_bound <> nil) then
      begin
        var tmp := convert_elem(el);
        tmp_ht.Add(tmp, tmp)
      end
      else
        tmp_ht.Add(el, el);
    end;
  end;
  ht := tmp_ht;
end;

procedure TypedSet.Clip(len: integer);
begin
  var tmp_ht := new Hashtable();
  foreach el: object in ht.Keys do
  begin
    var str_el := Convert.ToString(el);
    if str_el.Length > len then
    begin
      var s := str_el.Substring(0, len);
      tmp_ht.Add(s, s);
    end
    else
      tmp_ht.Add(str_el, str_el);
  end;
  ht := tmp_ht;
end;



procedure TypedSet.IncludeElement(elem: object);
var
  diap: Diapason;
  i: integer;
  c: char;
begin
  if elem = nil then exit;
  elem := convert_elem(elem);
  if not IsInDiapason(elem) then Exit;
  if elem.GetType().IsEnum then
  begin
    ht[elem] := elem;
    //if copy_ht <> nil then 
    //  copy_ht[elem] := elem;
  end
  else
  if not (elem is Diapason) then
  begin
    ht[elem] := elem;
    //if copy_ht <> nil then
    //  copy_ht[elem] := elem;
  end
  else
  begin
    diap := Diapason(elem);
    if diap.clow = nil then
    begin
      for i := diap.low to diap.high do
      begin
        ht[i] := i;
        //if copy_ht <> nil then
        //  copy_ht[i] := i;
      end
    end
    else 
    begin
      if diap.clow is char then
      begin
        for c := char(diap.clow) to char(diap.chigh) do
        begin
          ht[c] := c;
          //if copy_ht <> nil then
          //  copy_ht[c] := c;
        end
      end
      else if diap.clow is boolean then
      begin
        for var b := boolean(diap.clow) to boolean(diap.chigh) do
          ht[b] := b;
      end
      else if diap.clow.GetType().IsEnum then
      begin
        for i := integer(diap.clow) to integer(diap.chigh) do
        begin
          var obj := Enum.ToObject(diap.clow.GetType(), i);
          ht[obj] := obj;
          //if copy_ht <> nil then
          // copy_ht[obj] := obj;
        end;
      end;
    end;
  end;
end;

procedure TypedSet.ExcludeElement(elem: object);
begin
  if elem.GetType().IsEnum then
  begin
    ht.Remove(elem);
    //if copy_ht <> nil then
    //  copy_ht.Remove(elem);
  end
  else
  begin
    elem := convert_elem(elem);
    ht.Remove(elem);
    //if copy_ht <> nil then
    //  copy_ht.Remove(elem);
  end
end;

procedure TypedSet.Init(params elems: array of object);
begin
  for var i := 0 to elems.Length - 1 do
    ht[elems[i]] := elems[i];
end;

[System.Diagnostics.DebuggerStepThrough]
procedure TypedSet.AssignSetFrom(s: TypedSet);
begin
  ht := s.ht.Clone() as Hashtable;
  //copy_ht := s.ht;
  Clip;
end;

function TypedSet.GetEnumerator: IEnumerator;
begin
  Result := ht.Keys.GetEnumerator; 
end;

function FormatStr(obj: object): string;
begin
  if (obj.GetType = typeof(char)) or (obj.GetType = typeof(string)) then
    Result := '''' + string.Format(System.Globalization.NumberFormatInfo.InvariantInfo, '{0}', obj) + ''''
  else
    Result := string.Format(System.Globalization.NumberFormatInfo.InvariantInfo, '{0}', obj)
end;

function TypedSet.ToString: string;
var
  i: IEnumerator;
  lst: ArrayList;
begin
  i := GetEnumerator;
  lst := new ArrayList();
  var t: &Type; 
  var added := false;
  if i.MoveNext then
    if not (i.Current is IComparable) then
    begin
      result := '' + FormatStr(i.Current) + '';
      added := true;
    end
    else 
    begin
      lst.Add(i.Current);
      t := i.Current.GetType;
    end;
  while i.MoveNext do
    if not (i.Current is IComparable) then
    begin
      //if IsInDiapason(i.Current) then
      result := (added ? result + ',' : '') + FormatStr(i.Current);
      added := true;
    end
    else
    //if IsInDiapason(i.Current) then
    begin
      if (t <> nil) and (t <> i.Current.GetType) then
      begin
        result := (added ? result + ',' : '') + FormatStr(i.Current);
        added := true;
      end
      else
      begin
        t := i.Current.GetType;
        lst.Add(i.Current);
      end;  
    end;
  
  if lst.Count > 0 then
  begin
    lst.Sort;
    var ind := 1;
    if not added then
      result := '' + FormatStr(lst[0]) + ''
    else
      ind := 0;
    for j: integer := ind to lst.Count - 1 do
    begin
      result := result + ',' + FormatStr(lst[j]);
    end;
  end;
  result := '[' + result + ']';
end;

// -----------------------------------------------------
//                      TypedFile
// -----------------------------------------------------
constructor TypedFile.Create(ElementType: System.Type);
begin
  self.ElementType := ElementType;
  ElementSize := RuntimeSizeOf(ElementType);
end;

constructor TypedFile.Create(ElementType: System.Type; offs: integer; params offsets: array of integer);
begin
  self.ElementType := ElementType;
  ElementSize := RuntimeSizeOf(ElementType);
  self.offsets := offsets;
  if offs <> 0 then
  begin
    ElementSize := ElementSize + offs{*2};
    offset := offs{*2};
  end;
end;

function TypedFile.ToString: string;
begin
  Result := string.Format('file of {0}', ElementType);
end;

// -----------------------------------------------------
//                      BinaryFile
// -----------------------------------------------------
function BinaryFile.ToString: string;
begin
  Result := 'file';
end;


// -----------------------------------------------------
//                  GCHandlersController    
// -----------------------------------------------------
constructor GCHandlersController.Create;
begin
  Counters := new Hashtable;
  Handlers := new Hashtable;
end;

procedure GCHandlersController.Add(obj: Object);
begin
  if obj <> nil then begin
    if Counters.Contains(obj) then
      Counters[obj] := integer(Counters[obj]) + 1
    else begin
      Counters.Add(obj, 1);          
      Handlers.Add(obj, GCHandle.Alloc(obj, GCHandleType.Pinned));
      //var ptr := Marshal.AllocHGlobal(Marshal.SizeOf(obj));
      //Marshal.StructureToPtr(obj, ptr, false);
      //Handlers.Add(obj, ptr);
      //GC.KeepAlive(obj);
      //var ptr:=IntPtr(pointer(@obj));
      //Handlers.Add(obj,new IntPtr(integer(ptr) or 1));
    end;
  end;
end;

procedure GCHandlersController.Remove(obj: Object);
begin
  if obj <> nil then begin
    if Counters.Contains(obj) then begin
      var Count := integer(Counters[obj]);
      if Count > 1 then 
        Counters[obj] := Count - 1
      else begin
        Counters.Remove(obj);
        GCHandle(Handlers[obj]).Free;
        Handlers.Remove(obj);
      end;
    end else
      raise new SystemException('PABCSystem.GCHandleForPointersController not contains object ' + obj.ToString);
  end;  
end;

function GCHandlersController.GetCounter(obj: Object): integer;
begin
  result := 0;
  if Counters.Contains(obj) then
    result := integer(Counters[obj]);      
end;

function GCHandlersController.GetEnumerator: IEnumerator;
begin
  result := Counters.Keys.GetEnumerator; 
end;

// -----------------------------------------------------
[System.Diagnostics.DebuggerStepThrough]
function CreateSet: TypedSet;
begin
  Result := new TypedSet();
end;

[System.Diagnostics.DebuggerStepThrough]
function CreateBoundedSet(low, high: object): TypedSet;
begin
  Result := new TypedSet(low, high);
end;

[System.Diagnostics.DebuggerStepThrough]
function CreateDiapason(low, high: integer): Diapason;
begin
  Result.low := low;
  Result.high := high;
end;

[System.Diagnostics.DebuggerStepThrough]
function CreateObjDiapason(low, high: object): Diapason;
begin
  Result.clow := low;
  Result.chigh := high;
end;

function TypedSet.CompareEquals(s: TypedSet): boolean;
begin
  Result := CompareSetEquals(self, s);
end;

function TypedSet.CompareInEquals(s: TypedSet): boolean;
begin
  Result := CompareSetInEquals(self, s);
end;

function TypedSet.CompareLess(s: TypedSet): boolean;
begin
  Result := CompareSetLess(self, s);
end;

function TypedSet.CompareLessEqual(s: TypedSet): boolean;
begin
  Result := CompareSetLessEqual(self, s);
end;

function TypedSet.CompareGreater(s: TypedSet): boolean;
begin
  Result := CompareSetGreater(self, s);
end;

function TypedSet.CompareGreaterEqual(s: TypedSet): boolean;
begin
  Result := CompareSetGreaterEqual(self, s);
end;

[System.Diagnostics.DebuggerStepThrough]
function CreateSet(params elems: array of object): TypedSet;
var
  i: integer;
begin
  Result := new TypedSet();
  for i := 0 to elems.Length - 1 do
    Result.IncludeElement(elems[i]);
end;

[System.Diagnostics.DebuggerStepThrough]
function Subtract(s1, s2: TypedSet): TypedSet;
var
  en: IEnumerator;
begin
  //Result := new TypedSet();
  Result := s1.CloneSet;
  {en := s1.ht.GetEnumerator();
  while en.MoveNext() = true do
  begin
  if not s2.Contains((en as IDictionaryEnumerator).Key) then 
  Result.ht[(en as IDictionaryEnumerator).Key] := (en as IDictionaryEnumerator).Key;
  end;}
  en := s2.ht.GetEnumerator();
  while en.MoveNext() = true do
  begin
    if s1.Contains((en as IDictionaryEnumerator).Key) then 
      Result.ht.Remove((en as IDictionaryEnumerator).Key);
  end;
end;

[System.Diagnostics.DebuggerStepThrough]
procedure Include(var s: TypedSet; el: object);
begin
  s.IncludeElement(el);
end;

[System.Diagnostics.DebuggerStepThrough]
procedure Exclude(var s: TypedSet; el: object);
begin
  s.ExcludeElement(el);
end;

[System.Diagnostics.DebuggerStepThrough]  
function Union(s1, s2: TypedSet): TypedSet;
var
  en: IEnumerator;
begin
  Result := s1.CloneSet;
  en := s2.ht.GetEnumerator();
  while en.MoveNext() = true do
    Result.ht[(en as IDictionaryEnumerator).Key] := (en as IDictionaryEnumerator).Key;
end;

[System.Diagnostics.DebuggerStepThrough]  
function Intersect(s1, s2: TypedSet): TypedSet;
var
  en: IEnumerator;
begin
  Result := new TypedSet();
  en := s1.ht.GetEnumerator();
  while en.MoveNext() = true do
    if s2.Contains((en as IDictionaryEnumerator).Key) then 
      Result.ht[(en as IDictionaryEnumerator).Key] := (en as IDictionaryEnumerator).Key;
end;

[System.Diagnostics.DebuggerStepThrough]  
function InSet(obj: object; s: TypedSet): boolean;
begin
  {if obj.GetType().IsEnum then 
  Result := s.ht[obj] <> nil
  else} 
  Result := (obj <> nil) and s.Contains(obj);
  {Result := (obj <> nil) and (s.ht[obj] <> nil);
  if not Result and (obj is TypedSet) then
  Result := s.Contains(obj as TypedSet);}
  //if Result = true then
  // Result := s.IsInDiapason(obj);
end;

[System.Diagnostics.DebuggerStepThrough]  
function CompareSetEquals(s1, s2: TypedSet): boolean;
var
  en: IEnumerator;
  equals: boolean := true;
begin
  if s1.ht.Count <> s2.ht.Count then
  begin
    Result := false;
    Exit;
  end;
  en := s1.ht.GetEnumerator();
  while en.MoveNext() = true do
  begin
    var is_in_s1 := s1.Contains((en as IDictionaryEnumerator).Key);
    var is_in_s2 := s2.Contains((en as IDictionaryEnumerator).Key);
    if is_in_s1 and not is_in_s2 then 
    begin
      equals := false;
      break;
    end
    else if not is_in_s1 and is_in_s2 then
    begin
      equals := false;
      break;
    end
  end;
  if equals <> false then 
  begin
    en := s2.ht.GetEnumerator();
    en.Reset();
    while en.MoveNext() = true do
    begin
      var is_in_s1 := s1.Contains((en as IDictionaryEnumerator).Key);
      var is_in_s2 := s2.Contains((en as IDictionaryEnumerator).Key);
      if is_in_s2 and not is_in_s1 then
      begin
        equals := false;
        break;
      end
      else if not is_in_s2 and is_in_s1 then
      begin
        equals := false;
        break;
      end
    end;
  end;
  Result := equals;
end;

[System.Diagnostics.DebuggerStepThrough]  
function CompareSetInEquals(s1, s2: TypedSet): boolean;
begin
  Result := not CompareSetEquals(s1, s2);
end;

[System.Diagnostics.DebuggerStepThrough]  
function CompareSetLess(s1, s2: TypedSet): boolean;
var
  en: IEnumerator;
  less: boolean := true;
begin
  en := s1.ht.GetEnumerator();
  en.Reset();
  while en.MoveNext() = true do
  begin
    if not s2.Contains((en as IDictionaryEnumerator).Key) then 
    begin
      less := false;
      break;
    end;
  end;
  if less <> false then
  begin
    en := s2.ht.GetEnumerator();
    en.Reset();
    var b: boolean := false;
    while en.MoveNext() = true do
    begin
      if not s1.Contains((en as IDictionaryEnumerator).Key) then 
      begin
        b := true;
        break;
      end;
    end;
    less := b;
  end;
  Result := less;
end;

[System.Diagnostics.DebuggerStepThrough]  
function CompareSetGreaterEqual(s1, s2: TypedSet): boolean;
var
  en: IEnumerator;
  greater: boolean := true;
begin
  en := s2.ht.GetEnumerator();
  en.Reset();
  while en.MoveNext() = true do
  begin
    if not s1.Contains((en as IDictionaryEnumerator).Key) then 
    begin
      greater := false;
      break;
    end;
  end;
  Result := greater;
end;

[System.Diagnostics.DebuggerStepThrough]  
function CompareSetLessEqual(s1, s2: TypedSet): boolean;
var
  en: IEnumerator;
  less: boolean := true;
begin
  en := s1.ht.GetEnumerator();
  en.Reset();
  while en.MoveNext() = true do
  begin
    if not s2.Contains((en as IDictionaryEnumerator).Key) then 
    begin
      less := false;
      break;
    end;
  end;
  Result := less;
end;

[System.Diagnostics.DebuggerStepThrough]  
function CompareSetGreater(s1, s2: TypedSet): boolean;
var
  greater: boolean := true;
  en: IEnumerator;
begin
  en := s2.ht.GetEnumerator();
  en.Reset();
  while en.MoveNext() = true do
  begin
    if not s1.Contains((en as IDictionaryEnumerator).Key) then 
    begin
      greater := false;
      break;
    end;
  end;
  if greater <> false then
  begin
    en := s1.ht.GetEnumerator();
    en.Reset();
    var b: boolean := false;
    while en.MoveNext() = true do
    begin
      if not s2.Contains((en as IDictionaryEnumerator).Key) then 
      begin
        b := true;
        break;
      end;
    end;
    greater := b;
  end;
  Result := greater;
end;

//------------------------------------------------------------------------------
// Extension methods for String
//------------------------------------------------------------------------------
procedure string.operator+=(var left: string; right: string);
begin
  left := left + right;
end;

function string.operator<(left, right: string): boolean;
begin
  result := string.CompareOrdinal(left, right) < 0;
end;

function string.operator<=(left, right: string): boolean;
begin
  result := string.CompareOrdinal(left, right) <= 0;
end;

function string.operator>(left, right: string): boolean;
begin
  result := string.CompareOrdinal(left, right) > 0;
end;

function string.operator>=(left, right: string): boolean;
begin
  result := string.CompareOrdinal(left, right) >= 0;
end;
//------------------------------------------------------------------------------

[System.Diagnostics.DebuggerStepThrough]
function GetCharInShortString(s: string; ind, n: integer): char;
begin
  if ind < 0 then 
    raise new IndexOutOfRangeException;
  if ind = 0 then 
    Result := char(s.Length)
  else 
    try
      Result := s[ind];
    except 
      on e: Exception do
        if ind > n then raise;
    end;
end;

[System.Diagnostics.DebuggerStepThrough]
function SetCharInShortString(s: string; ind, n: integer; c: char): string;
begin
  if ind < 0 then 
    raise new IndexOutOfRangeException;
  if ind <> 0 then
  begin
    var sb := new System.Text.StringBuilder();
    sb.Append(s);
    if ind - 1 < sb.Length then
      sb[ind - 1] := c;
    if ind > n then raise new IndexOutOfRangeException;
    Result := sb.ToString;
  end
  else
  begin
    //Result := s.PadRight(integer(c));
    raise new IndexOutOfRangeException;
  end;
end;

[System.Diagnostics.DebuggerStepThrough]
function ClipShortString(s: string; len: integer): string;
begin
  if s.Length <= len then 
    Result := s
  else Result := s.Substring(0, len);
end;

{function read_lexem: string; 
var
  c: char;
  sb: System.Text.StringBuilder;
begin
  repeat
    c := CurrentIOSystem.read_symbol;
  until not char.IsWhiteSpace(c); // pass spaces
  sb := new System.Text.StringBuilder;
  repeat
    sb.Append(c);
    c := CurrentIOSystem.read_symbol;
  until char.IsWhiteSpace(c) or (c = char(-1)); // accumulate nonspaces
  Result := sb.ToString;
end;}

function read_lexem: string; // SSM 08.03.11 - ������� ��������� � peek�� �������� � ������ '1 hello'. ������ ��������
var
  c: char;
  sb: System.Text.StringBuilder;
begin
  repeat
    c := CurrentIOSystem.read_symbol;
  until not char.IsWhiteSpace(c);
  sb := new System.Text.StringBuilder;
  repeat
    sb.Append(c);
    c := char(CurrentIOSystem.peek);
    if char.IsWhiteSpace(c) or (c = char(-1)) then // char(-1) - Ctrl-Z �� ������� ������
      break;
    c := CurrentIOSystem.read_symbol;
  until False; // accumulate nonspaces
  Result := sb.ToString;
end;

function read_lexem(f: Text): string;
var
  c: char;
  i: integer;
  sb: System.Text.StringBuilder;
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  if f.sr = nil then 
    raise new System.IO.IOException(FILE_NOT_OPENED);
  repeat
    i := f.sr.Read();
  until not char.IsWhiteSpace(char(i)); // pass spaces
  c := char(i);
  sb := System.Text.StringBuilder.Create;
  repeat
    sb.Append(c);
    i := f.sr.Peek();
    if i = -1 then
      break;
    c := char(i);
    if char.IsWhiteSpace(c) then
      break;
    f.sr.Read();
  until False; // accumulate nonspaces
  Result := sb.ToString;
end;

// -----------------------------------------------------
//                  IOStandardSystem
// -----------------------------------------------------
function IOStandardSystem.peek: integer;
begin
  if not console_alloc then
    AllocConsole;
  Result := Console.In.Peek();
end;

function IOStandardSystem.read_symbol: char;
begin
  if not console_alloc then
    AllocConsole;
  Result := char(Console.Read());
end;

procedure IOStandardSystem.read(var x: integer);
begin
  x := Convert.ToInt32(read_lexem);
end;

procedure IOStandardSystem.read(var x: real);
begin
  x := Convert.ToDouble(read_lexem, nfi);
end;

procedure IOStandardSystem.read(var x: char);
begin
  x := CurrentIOSystem.read_symbol;
end;

{procedure IOStandardSystem.read(var x: string);
begin
  var sb := new System.Text.StringBuilder;
  var c := read_symbol;
  while c <> #13 do 
  begin
    sb.Append(c);
    c := read_symbol;
  end;
  x := sb.ToString;
end;}

procedure IOStandardSystem.read(var x: string); // ��� ������-�� �� ��������. ���-�� ������� � ���, ��� console.Peek() ���������� -1
begin
  var sb := new System.Text.StringBuilder;
// SSM 8.04.10
  var c := char(peek()); // ������ ��� ����� ���� char(-1) - ��� ������, ��� � ������ ����� ������ ���, ����� �� ������ ������
  while (c <> #13) and (c <> #10) do 
  begin
    c := read_symbol;
    sb.Append(c);
    c := char(peek());
  end;
  x := sb.ToString;
end;

procedure IOStandardSystem.read(var x: byte);
begin
  x := Convert.ToByte(read_lexem);
end;

procedure IOStandardSystem.read(var x: shortint);
begin
  x := Convert.ToSByte(read_lexem);
end;

procedure IOStandardSystem.read(var x: smallint);
begin
  x := Convert.ToInt16(read_lexem);
end;

procedure IOStandardSystem.read(var x: word);
begin
  x := Convert.ToUInt16(read_lexem);
end;

procedure IOStandardSystem.read(var x: longword);
begin
  x := Convert.ToUInt32(read_lexem);
end;

procedure IOStandardSystem.read(var x: int64);
begin
  x := Convert.ToInt64(read_lexem);
end;

procedure IOStandardSystem.read(var x: uint64);
begin
  x := Convert.ToUInt64(read_lexem);
end;

procedure IOStandardSystem.read(var x: single);
begin
  x := Convert.ToSingle(read_lexem, nfi);
end;

// ------------ IOStandardSystem ------------ 
procedure IOStandardSystem.read(var x: boolean);
begin
  var s := read_lexem.ToLower;
  if s = 'true' then
    x := True
  else if s = 'false' then
    x := False  
  else raise new System.FormatException('������� ������ ����� �������� ������');
end;

procedure IOStandardSystem.readln;
begin
  while CurrentIOSystem.read_symbol <> END_OF_LINE_SYMBOL do;
end;

// string for writeln
function _ObjectToString(obj: object): string;
begin
  if obj = nil then
    Result := 'nil'
  else case System.Type.GetTypeCode(obj.GetType) of
      TypeCode.Double,  
      TypeCode.Single,  
      TypeCode.Decimal:
      Result := FormatFloatNumber(obj.ToString);
    else
      Result := obj.ToString;
    end;
end;

procedure IOStandardSystem.write(obj: object);
begin
  if not console_alloc then
    AllocConsole;
  Console.Write(_ObjectToString(obj));  
  {  if obj = nil then 
  begin
  Console.Write('nil');
  //System.Diagnostics.Debug.Write('nil');
  Exit;
  end;
  case System.Type.GetTypeCode(obj.GetType) of
  TypeCode.Double,  
  TypeCode.Single,  
  TypeCode.Decimal:
  begin
  Console.Write(FormatFloatNumber(obj.ToString));
  //System.Diagnostics.Debug.Write(FormatFloatNumber(obj.ToString));
  end
  else
  begin
  Console.Write(obj);
  //System.Diagnostics.Debug.Write(obj);
  end;
  end;}
end;

procedure IOStandardSystem.write(p: pointer);
begin
  Write(PointerToString(p));
end;

procedure IOStandardSystem.writeln;
begin
  if not console_alloc then
    AllocConsole;
  Console.WriteLine;
  System.Diagnostics.Debug.WriteLine('');
end;

// -----------------------------------------------------
//                  read - readln
// -----------------------------------------------------
procedure read;
begin
end;

procedure readln;
begin
  if input.sr <> nil then
    input.sr.ReadLine
  else 
    try
      CurrentIOSystem.readln
    except
      on e: Exception do
        raise e;
    end;
end;

procedure read(var x: integer);
begin
  if input.sr <> nil then
    read(input, x)
  else 
    try
      CurrentIOSystem.read(x)
    except
      on e: Exception do
        raise e;
    end;
end;

procedure read(var x: real);
begin
  if input.sr <> nil then
    read(input, x)
  else 
    try
      CurrentIOSystem.read(x)
    except
      on e: Exception do
        raise e;
    end;
end;

procedure read(var x: char);
begin
  if input.sr <> nil then
    read(input, x)
  else 
    try
      CurrentIOSystem.read(x)
    except
      on e: Exception do
        raise e;
    end;
end;

procedure read(var x: string);
begin
  if input.sr <> nil then
    read(input, x)
  else 
    try
      CurrentIOSystem.read(x)
    except
      on e: Exception do
        raise e;
    end;
end;

procedure read(var x: byte);
begin
  if input.sr <> nil then
    read(input, x)
  else 
    try
      CurrentIOSystem.read(x)
    except
      on e: Exception do
        raise e;
    end;
end;

procedure read(var x: shortint);
begin
  if input.sr <> nil then
    read(input, x)
  else 
    try
      CurrentIOSystem.read(x)
    except
      on e: Exception do
        raise e;
    end;
end;

procedure read(var x: smallint);
begin
  if input.sr <> nil then
    read(input, x)
  else 
    try
      CurrentIOSystem.read(x)
    except
      on e: Exception do
        raise e;
    end;
end;

procedure read(var x: word);
begin
  if input.sr <> nil then
    read(input, x)
  else 
    try
      CurrentIOSystem.read(x)
    except
      on e: Exception do
        raise e;
    end;
end;

procedure read(var x: longword);
begin
  if input.sr <> nil then
    read(input, x)
  else 
    try
      CurrentIOSystem.read(x)
    except
      on e: Exception do
        raise e;
    end;
end;

procedure read(var x: int64);
begin
  if input.sr <> nil then
    read(input, x)
  else 
    try
      CurrentIOSystem.read(x)
    except
      on e: Exception do
        raise e;
    end;
end;

procedure read(var x: uint64);
begin
  if input.sr <> nil then
    read(input, x)
  else 
    try
      CurrentIOSystem.read(x)
    except
      on e: Exception do
        raise e;
    end;
end;

procedure read(var x: single);
begin
  if input.sr <> nil then
    read(input, x)
  else 
    try
      CurrentIOSystem.read(x)
    except
      on e: Exception do
        raise e;
    end;
end;

procedure read(var x: boolean);
begin
  if input.sr <> nil then
    read(input, x)
  else 
    try
      CurrentIOSystem.read(x)
    except
      on e: Exception do
        raise e;
    end;
end;

function ReadInteger: integer;
begin
  var x: integer;
  read(x);
  Result := x;
end;

function ReadReal: real;
begin
  var x: real;
  read(x);
  Result := x;
end;

function ReadChar: char;
begin
  var x: char;
  read(x);
  Result := x;
end;

function ReadString: string;
begin
  var x: string;
  read(x);
  readln();
  Result := x;
end;

function ReadBoolean: boolean;
begin
  var x: boolean;
  read(x);
  Result := x;
end;

function ReadlnInteger: integer;
begin
  Result := ReadInteger;
  readln();
end;

function ReadlnReal: real;
begin
  Result := ReadReal;
  readln();
end;

function ReadlnChar: char;
begin
  Result := ReadChar;
  readln();
end;

function ReadlnString: string;
begin
  Result := ReadString;
end;

function ReadlnBoolean: boolean;
begin
  Result := ReadBoolean;
  readln();
end;

procedure ReadShortStringFromFile(f: Text; var s: string; n: integer);
begin
  //x := f.sr.ReadLine;//���� ����� ����� �� ������ nil  
  //������ ��� ������������ �.�. ��������� � ����� ������
  var i := 1;
  var sb := new System.Text.StringBuilder;
  repeat
    if f.sr.EndOfStream then
      break;
    if f.sr.Peek = 13 then
      break;
    if i > n then break;
    sb.Append(Convert.ToChar(f.sr.Read));
    i := i + 1;
  until False;
  s := sb.ToString; {}
  if s = nil then 
    s := string.Empty;
  if s.Length > n then s := s.Substring(0, n);
end;

procedure ReadShortString(var s: string; n: integer); // ����� ������ peek. � ������� ��� ���� ������
begin
  if (input.fi <> nil) and (input.sr <> nil) then
  begin
    ReadShortStringFromFile(input, s, n);
    exit;
  end;

{  var sb := new System.Text.StringBuilder;
  var c := CurrentIOSystem.read_symbol;
  while c <> #13 do 
  begin
    sb.Append(c);
    c := CurrentIOSystem.read_symbol;
  end;
  s := sb.ToString;
  if s.Length > n then s := s.Substring(0, n);
}  

// SSM 8.04.10
  var sb := new System.Text.StringBuilder;
  var c := char(CurrentIOSystem.peek());
  var i := 0;
  while (c <> #13) and (c <> #10) and (i<n) do 
  begin
    c := CurrentIOSystem.read_symbol;
    i += 1;
    sb.Append(c);
    c := char(CurrentIOSystem.peek());
  end;
  s := sb.ToString;
end;

//--------------------------------
procedure read(f: Text);
begin
end;

procedure readln(f: Text);
begin
  f.sr.ReadLine;
end;

procedure read(f: Text; var x: integer);
begin
  try
    x := Convert.ToInt32(read_lexem(f));
  except
    on e: Exception do
      raise e;
  end;
end;

procedure read(f: Text; var x: real);
begin
  try
    x := Convert.ToDouble(read_lexem(f), nfi);
  except
    on e: Exception do
      raise e;
  end;
end;

procedure read(f: Text; var x: string);
var
  s: System.Text.StringBuilder;
begin
  //x := f.sr.ReadLine;//���� ����� ����� �� ������ nil  
  //������ ���� ������������ �.�. ��������� � ����� ������
  
  s := new System.Text.StringBuilder;
  repeat
    if f.sr.EndOfStream then
      break;
    if f.sr.Peek = 13 then
      break;
    s.Append(Convert.ToChar(f.sr.Read));
  until False;
  x := s.ToString; {}
  if x = nil then 
    x := string.Empty; 
end;

procedure read(f: Text; var x: char);
begin
  try
    x := Convert.ToChar(f.sr.Read());
  except
    on e: Exception do
      raise e;
  end;
end;

procedure read(f: Text; var x: byte);
begin
  try
    x := Convert.ToByte(read_lexem(f));
  except
    on e: Exception do
      raise e;
  end;
end;

procedure read(f: Text; var x: shortint);
begin
  try
    x := Convert.ToSByte(read_lexem(f));
  except
    on e: Exception do
      raise e;
  end;
end;

procedure read(f: Text; var x: smallint);
begin
  try
    x := Convert.ToInt16(read_lexem(f));
  except
    on e: Exception do
      raise e;
  end;
end;

procedure read(f: Text; var x: word);
begin
  try
    x := Convert.ToUInt16(read_lexem(f));
  except
    on e: Exception do
      raise e;
  end;
end;

procedure read(f: Text; var x: longword);
begin
  try
    x := Convert.ToUInt32(read_lexem(f));
  except
    on e: Exception do
      raise e;
  end;
end;

procedure read(f: Text; var x: int64);
begin
  try
    x := Convert.ToInt64(read_lexem(f));
  except
    on e: Exception do
      raise e;
  end;
end;

procedure read(f: Text; var x: uint64);
begin
  try
    x := Convert.ToUInt64(read_lexem(f));
  except
    on e: Exception do
      raise e;
  end;
end;

procedure read(f: Text; var x: single);
begin
  try
    x := Convert.ToSingle(read_lexem(f));
  except
    on e: Exception do
      raise e;
  end;
end;

procedure read(f: Text; var x: boolean);
begin
  var s := read_lexem(f).ToLower;
  if s = 'true' then
    x := True
  else if s = 'false' then
    x := False  
  else raise new System.FormatException('������� ������ ����� �������� ������');
end;

function ReadInteger(f: Text): integer;
begin
  var x: integer;
  read(f,x);
  Result := x;
end;

function ReadReal(f: Text): real;
begin
  var x: real;
  read(f,x);
  Result := x;
end;

function ReadChar(f: Text): char;
begin
  var x: char;
  read(f,x);
  Result := x;
end;

function ReadString(f: Text): string;
begin
  var x: string;
  read(f,x);
  readln(f);
  Result := x;
end;

function ReadBoolean(f: Text): boolean;
begin
  var x: boolean;
  read(f,x);
  Result := x;
end;

function Eoln: boolean;
begin
  if not console_alloc then
    AllocConsole;
  Result := CurrentIOSystem.peek=13
end;

function Eof: boolean;
begin
  if not console_alloc then
    AllocConsole;
  Console.WriteLine(CurrentIOSystem.peek);  
  Result := CurrentIOSystem.peek=-1
end;

// -----------------------------------------------------
//                  write - writeln
// -----------------------------------------------------
function PointerOutput.ToString: string;
begin
  result := PointerToString(p);
end;

constructor PointerOutput.Create(ptr: pointer);
begin
  p := ptr;
end;

function PointerToString(p: pointer): string;
begin
  //result:= Convert.ToString(integer(p), 16);
  if p = nil then
    result := 'nil'
  else result := '$' + integer(p).ToString('X');
end;

procedure write;
begin
end;

procedure write_in_output(obj: object);
begin
  write(output, obj);
end;

procedure writeln_in_output;
begin
  writeln(output);
end;

procedure write(obj: object);
begin
  if output.sw <> nil then
    write_in_output(obj)
  else CurrentIOSystem.Write(obj);
end;

//procedure write(ptr: pointer);
//begin
//  CurrentIOSystem.Write(ptr);
//end;

procedure write(obj1, obj2: object);
begin
  if output.sw <> nil then
  begin
    write_in_output(obj1);
    write_in_output(obj2);
  end
  else
  begin
    CurrentIOSystem.Write(obj1);
    CurrentIOSystem.Write(obj2);
  end;
end;

procedure write(params args: array of object);
begin
  for var i := 0 to args.length - 1 do
    if output.sw <> nil then
      write_in_output(args[i])
    else
      CurrentIOSystem.Write(args[i]);
end;

procedure writeln(obj: object);
begin
  if output.sw <> nil then
  begin
    write_in_output(obj);
    writeln_in_output;
  end
  else
  begin
    CurrentIOSystem.Write(obj);
    CurrentIOSystem.Writeln;
  end
end;

//procedure writeln(ptr: pointer);
//begin
//  CurrentIOSystem.Write(PointerToString(ptr));
//  CurrentIOSystem.Writeln;
//end;

procedure writeln(obj1, obj2: object);
begin
  if output.sw <> nil then
  begin
    write_in_output(obj1);
    write_in_output(obj2);
    writeln_in_output;
  end
  else
  begin
    CurrentIOSystem.Write(obj1);
    CurrentIOSystem.Write(obj2);
    CurrentIOSystem.Writeln;
  end
end;

procedure writeln;
begin
  if output.sw <> nil then
    writeln_in_output
  else CurrentIOSystem.Writeln;
end;

procedure writeln(params args: array of object);
begin
  if output.sw <> nil then
  begin
    for var i := 0 to args.length - 1 do
      write_in_output(args[i]);
    writeln_in_output;
  end
  else
  begin
    for var i := 0 to args.length - 1 do
      CurrentIOSystem.Write(args[i]);
    CurrentIOSystem.Writeln;
  end;
end;

procedure write(f: Text);
begin
end;

procedure write(f: Text; val: object);
begin
  if val = nil then
  begin
    f.sw.Write('nil');
    exit;
  end;
  case System.Type.GetTypeCode(val.GetType) of
    TypeCode.Double, 
    TypeCode.Single,  
    TypeCode.Decimal: 
    f.sw.Write(FormatFloatNumber(val.ToString));
  else
    f.sw.Write(val)
  end;
end;

procedure write(f: Text; params args: array of object);
begin
  for var i := 0 to args.length - 1 do
    write(f, args[i]);
end;

procedure writeln(f: Text);
begin
  f.sw.WriteLine;
end;

procedure writeln(f: Text; val: object);
begin
  write(f, val);
  writeln(f);
end;

procedure writeln(f: Text; params args: array of object);
begin
  for var i := 0 to args.length - 1 do
    write(f, args[i]);
  writeln(f);  
end;

procedure WriteFormat(formatstr: string; params args: array of object);
begin
  var s := Format(formatstr, args);
  write(s);
end;

procedure WritelnFormat(formatstr: string; params args: array of object);
begin
  var s := Format(formatstr, args);
  writeln(s);
end;

procedure WriteFormat(f: Text; formatstr: string; params args: array of object);
begin
  var s := Format(formatstr, args);
  write(f, s);
end;

procedure WritelnFormat(f: Text; formatstr: string; params args: array of object);
begin
  var s := Format(formatstr, args);
  writeln(f, s);
end;

// -----------------------------------------------------
//                  Text files
// -----------------------------------------------------
procedure Assign(f: Text; name: string);
begin
  try
    f.fi := System.IO.FileInfo.Create(name);
  except
    on e: Exception do
      raise e;
  end;
  if f = output then
    f.sw := new StreamWriter(f.fi.FullName);
  if f = input then
    f.sr := new StreamReader(f.fi.FullName, System.Text.Encoding.GetEncoding(1251));
end;

procedure AssignFile(f: Text; name: string);
begin
  Assign(f, name);
end;

procedure Close(f: Text);
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  if f.sr <> nil then 
  begin
    f.sr.Close; 
    f.sr := nil; 
    f.sw := nil;
    //    f.fi := nil;
  end
  else if f.sw <> nil then 
  begin
    f.sw.Close;
    f.sr := nil;
    f.sw := nil;
    //    f.fi := nil;
  end
  else raise new System.IO.IOException(FILE_NOT_OPENED);
end;

procedure CloseFile(f: Text);
begin
  Close(f);
end;

procedure Reset(f: Text);
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  if f.sr = nil then
  begin
    f.sr := System.IO.StreamReader.Create(f.fi.FullName, System.Text.Encoding.GetEncoding(1251));
    if f.sw <> nil then
    begin
      f.sw.Close;
      f.sw := nil;
    end;  
  end
  else 
  begin
    f.sr.BaseStream.Position := 0;
    f.sr.DiscardBufferedData;
  end;
end;

procedure Rewrite(f: Text);
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  if f.sw = nil then
  begin
    f.sw := System.IO.StreamWriter.Create(f.fi.FullName, False, System.Text.Encoding.GetEncoding(1251));
    if f.sr <> nil then
    begin
      f.sr.Close;
      f.sr := nil;
    end;  
  end
  else 
  begin
    f.sw.BaseStream.Position := 0;
  end;
end;

procedure Append(f: Text);
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  f.sw := System.IO.StreamWriter.Create(f.fi.FullName, True, System.Text.Encoding.GetEncoding(1251));
end;

function Eof(f: Text): boolean;
begin
  if f.sr <> nil then
    Result := f.sr.EndOfStream
  else if f.sw <> nil then
    raise new System.IO.IOException(EOF_FOR_TEXT_WRITEOPENED)
  else raise new System.IO.IOException(FILE_NOT_OPENED);
end;

function Eoln(f: Text): boolean;
begin
  if f.sr <> nil then
    Result := f.sr.EndOfStream or (f.sr.Peek = 13) // ������� �������
  else if f.sw <> nil then
    raise new System.IO.IOException(EOLN_FOR_TEXT_WRITEOPENED)
  else raise new System.IO.IOException(FILE_NOT_OPENED);
end;

function SeekEof(f: Text): boolean;
var
  i: integer;
begin
  if f.sw <> nil then
    raise new System.IO.IOException(SEEKEOF_FOR_TEXT_WRITEOPENED);
  if f.sr = nil then  
    raise new System.IO.IOException(FILE_NOT_OPENED);
  repeat
    if f.sr.EndOfStream then
      break;
    i := f.sr.Peek;
    if not char.IsWhiteSpace(char(i)) then
      break;
    f.sr.Read;
  until False;  
  Result := f.sr.EndOfStream;
end;

function SeekEoln(f: Text): boolean;
begin
  if f.sw <> nil then
    raise new System.IO.IOException(SEEKEOLN_FOR_TEXT_WRITEOPENED);
  if f.sr = nil then  
    raise new System.IO.IOException(FILE_NOT_OPENED);
  repeat
    if f.sr.EndOfStream then
      break;
    var i := f.sr.Peek;
    //    if not char.IsWhiteSpace(char(i)) then
    if (i <> 32) and (i <> 9) then // ���� ��� �� ������ � �� ���������
      break;
    f.sr.Read;
  until False;
  Result := f.sr.EndOfStream or (f.sr.Peek = 13) or (f.sr.Peek = 10); // ������ ������ 
end;

procedure Flush(f: Text);
begin
  if f.sw <> nil then
    f.sw.Flush
end;

procedure Erase(f: Text);
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  f.fi.Delete;
end;

procedure Rename(f: Text; newname: string);
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  System.IO.File.Move(f.fi.FullName, newname);
end;


procedure TextFileInit(var f: Text);
begin
  f := new Text;  
end;

// -----------------------------------------------------
//                  Abstract binary files
// -----------------------------------------------------
procedure Assign(f: AbstractBinaryFile; name: string);
begin
  f.fi := System.IO.FileInfo.Create(name);
end;

procedure AssignFile(f: AbstractBinaryFile; name: string);
begin
  Assign(f, name);
end;

procedure Close(f: AbstractBinaryFile);
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  if f.fs = nil then
    raise new System.IO.IOException(FILE_NOT_OPENED);
  if f.fs <> nil then
  begin
    f.br.Close; 
    f.bw.Close;
    f.fs := nil; 
    f.br := nil;
    f.bw := nil;
  end;
end;

procedure CloseFile(f: AbstractBinaryFile);
begin
  Close(f);
end;

procedure Reset(f: AbstractBinaryFile);
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  if f.fs = nil then 
  begin
    f.fs := new FileStream(f.fi.FullName, FileMode.Open);
    f.br := new BinaryReader(f.fs, System.Text.Encoding.Default);
    f.bw := new BinaryWriter(f.fs, System.Text.Encoding.Default);
  end 
  else
    f.fs.Position := 0;
end;

procedure Rewrite(f: AbstractBinaryFile);
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  if f.fs = nil then
  begin
    f.fs := new FileStream(f.fi.FullName, FileMode.Create);
    f.bw := new BinaryWriter(f.fs, System.Text.Encoding.Default);
    f.br := new BinaryReader(f.fs, System.Text.Encoding.Default);
  end
  else 
  begin
    f.fs.Position := 0;
    Truncate(f);
  end;  
end;

procedure Truncate(f: AbstractBinaryFile);
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  if f.fs = nil then
    raise new System.IO.IOException(FILE_NOT_OPENED);
  f.fs.SetLength(f.fs.Position);
end;

function Eof(f: AbstractBinaryFile): boolean;
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  if f.fs = nil then
    raise new System.IO.IOException(FILE_NOT_OPENED);
  if f.fs <> nil then
    Result := f.fs.Position = f.fs.Length;
end;

procedure Erase(f: AbstractBinaryFile);
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  f.fi.Delete;
end;

procedure Rename(f: AbstractBinaryFile; newname: string);
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  System.IO.File.Move(f.fi.FullName, newname);
end;

function AbstractBinaryFileReadT(f: AbstractBinaryFile; t: System.Type; var ind: integer; in_arr: boolean): object;
var
  t1: System.Type;
  elem: object;
  fa: array of System.Reflection.FieldInfo;
  NullBasedArray: System.Array;
  i: integer;
begin
  if t.IsPrimitive then 
  begin
    with f.br do
      case System.Type.GetTypeCode(t) of
        TypeCode.Boolean: Result := ReadBoolean;
        TypeCode.Byte:    Result := ReadByte;
        TypeCode.Char:    Result := ReadChar;
        TypeCode.Decimal: Result := ReadDecimal;
        TypeCode.Double:  Result := ReadDouble;
        TypeCode.Int16:   Result := ReadInt16;
        TypeCode.Int32:   Result := ReadInt32;
        TypeCode.Int64:   Result := ReadInt64;
        TypeCode.UInt16:  Result := ReadUInt16;
        TypeCode.UInt32:  Result := ReadUInt32;
        TypeCode.UInt64:  Result := ReadUInt64;
        TypeCode.SByte:   Result := ReadSByte;
        TypeCode.Single:  Result := ReadSingle;
      
      end;
    {
    if t = typeof(integer) then
    Result := f.br.ReadInt32
    else if t = typeof(real) then
    Result := f.br.ReadDouble
    else if t = typeof(boolean) then
    Result := f.br.ReadBoolean
    else if t = typeof(char) then
    Result := f.br.ReadChar
    else if t = typeof(byte) then
    Result := f.br.ReadByte
    else if t = typeof(shortint) then // sizeof(shortint)=1
    Result := f.br.ReadSByte
    else if t = typeof(smallint) then // sizeof(smallint)=2
    Result := f.br.ReadInt16
    else if t = typeof(word) then
    Result := f.br.ReadUInt16
    else if t = typeof(longword) then
    Result := f.br.ReadUInt32
    else if t = typeof(int64) then
    Result := f.br.ReadInt64
    else if t = typeof(uint64) then
    Result := f.br.ReadUInt64
    else if t = typeof(single) then
    Result := f.br.ReadSingle{}
  end 
  else if t.IsEnum then Result := f.br.ReadInt32
  else if t.IsValueType then
  begin
    elem := Activator.CreateInstance(t);
    fa := t.GetFields;
    for i := 0 to fa.Length - 1 do
      if not fa[i].IsStatic then
        fa[i].SetValue(elem, AbstractBinaryFileReadT(f, fa[i].FieldType, ind, in_arr));
    Result := elem;
  end
  else
  if t = typeof(string) then
  begin
    Result := f.br.ReadString();
    if (f is TypedFile) and ((f as TypedFile).offsets <> nil) and ((f as TypedFile).offsets.Length > 0) then
    begin
      f.br.BaseStream.Seek((f as TypedFile).offsets[ind] - (Result as string).Length, SeekOrigin.Current);
    end;
    if not in_arr then
      Inc(ind);
    //if f is TypedFile then
    //f.br.BaseStream.Seek(255-(Result as string).Length,SeekOrigin.Current);
  end
  else if t = typeof(TypedSet) then
  begin
    Result := f.br.ReadBytes(256 div 8);
    elem := Activator.CreateInstance(t, Result);
    Result := elem;
  end
  else
  begin
    elem := Activator.CreateInstance(t);
    NullBasedArray := GetNullBasedArray(elem);
    if NullBasedArray <> nil then 
    begin
      t1 := NullBasedArray.GetType.GetElementType;
      var tmp := ind;
      var tmp2 := 0;
      for i := 0 to NullBasedArray.Length - 1 do
      begin
        NullBasedArray.SetValue(AbstractBinaryFileReadT(f, t1, ind, i = 0 ? false : true), i);
        if i = 0 then
          tmp2 := ind;
        ind := tmp;
      end;
      ind := tmp2;
    end;
    result := elem;
  end;
end;

procedure Write(f: AbstractBinaryFile; val: object; arr: boolean; var ind: integer; in_arr: boolean);
var
  t: System.Type;
  fa: array of System.Reflection.FieldInfo;
  i: integer;
  NullBasedArray: System.Array;
begin
  t := val.GetType;
  if f is TypedFile and not arr then
  begin
    t := (f as TypedFile).ElementType;
  end;
  if t.IsPrimitive or t.IsEnum then 
  begin
    if t = typeof(integer) then
      f.bw.Write(Convert.ToInt32(val))
    else if t = typeof(real) then
      f.bw.Write(Convert.ToDouble(val))
    else if t = typeof(char) then
      f.bw.Write(Convert.ToChar(val))
    else if t = typeof(boolean) then
      f.bw.Write(Convert.ToBoolean(val))
    else if t = typeof(byte) then
      f.bw.Write(Convert.ToByte(val))
    else if t = typeof(shortint) then
      f.bw.Write(Convert.ToSByte(val))
    else if t = typeof(smallint) then
      f.bw.Write(Convert.ToInt16(val))
    else if t = typeof(word) then
      f.bw.Write(Convert.ToUInt16(val))
    else if t = typeof(longword) then
      f.bw.Write(Convert.ToUInt32(val))
    else if t = typeof(int64) then
      f.bw.Write(Convert.ToInt64(val))
    else if t = typeof(uint64) then
      f.bw.Write(Convert.ToUInt64(val))
    else if t = typeof(single) then
      f.bw.Write(Convert.ToSingle(val))
    else if t.IsEnum then
      f.bw.Write(Convert.ToInt32(val));
  end  
  else if t.IsValueType then
  begin
    fa := t.GetFields;
    for i := 0 to fa.Length - 1 do
    begin
      if not fa[i].IsStatic then
        Write(f, fa[i].GetValue(val), true, ind, in_arr);
    end;
  end
  else if t = typeof(string) then
  begin
    //var tmp := f.bw.BaseStream.Position;
    //f.bw.Write(byte(string(val).Length));
    f.bw.Write(string(val));
    if (f is TypedFile) and ((f as TypedFile).offsets <> nil) and ((f as TypedFile).offsets.Length > 0) then
    begin
      f.bw.Write(new byte[(f as TypedFile).offsets[ind] - (val as string).Length]);
    end;
    if not in_arr then
      Inc(ind);
  end
  else if t = typeof(TypedSet) then
  begin
    f.bw.Write((val as TypedSet).GetBytes());
  end
  else
  begin
    NullBasedArray := GetNullBasedArray(val);
    if NullBasedArray <> nil then
    begin
      var tmp := ind;
      var tmp2 := 0;
      for i := 0 to NullBasedArray.Length - 1 do
      begin
        Write(f, NullBasedArray.GetValue(i), true, ind, i = 0 ? false : true);
        if i = 0 then
          tmp2 := ind;
        ind := tmp;
      end;
      ind := tmp2;
    end;
  end;
end;

procedure Write(f: AbstractBinaryFile; params vals: array of object);
var
  i: integer;
begin
  if f.fi = nil then raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  if f.fs = nil then raise new System.IO.IOException(FILE_NOT_OPENED);
  for i := 0 to vals.Length - 1 do
  begin
    var NullBasedArray := GetNullBasedArray(vals[i]);
    var ind := 0;
    Write(f, vals[i], NullBasedArray <> nil, ind, false);
    //if (f is TypedFile) and ((f as TypedFile).offset > 0) then
    //f.bw.Write(new byte[tmp+(f as TypedFile).ElementSize-f.fs.Position]);
  end;
end;

procedure Writeln(f: AbstractBinaryFile);
begin
  raise new System.IO.IOException(WRITELN_IN_BINARYFILE_ERROR_MESSAGE);
end;

procedure Writeln(f: AbstractBinaryFile; val: object);
begin
  raise new System.IO.IOException(WRITELN_IN_BINARYFILE_ERROR_MESSAGE);
end;

procedure Writeln(f: AbstractBinaryFile; params vals: array of object);
begin
  raise new System.IO.IOException(WRITELN_IN_BINARYFILE_ERROR_MESSAGE);
end;

// -----------------------------------------------------
//                  Typed files
// -----------------------------------------------------

function FilePos(f: TypedFile): int64;
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  if f.fs = nil then
    raise new System.IO.IOException(FILE_NOT_OPENED);
  Result := f.fs.Position div f.ElementSize;
end;

function FileSize(f: TypedFile): int64;
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  if f.fs = nil then
    raise new System.IO.IOException(FILE_NOT_OPENED);
  if f.fs.Length mod f.ElementSize <> 0 then
    raise new System.IO.IOException('Bad typed file size');
  Result := f.fs.Length div f.ElementSize;
end;

procedure Seek(f: TypedFile; n: int64);
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  if f.fs = nil then
    raise new System.IO.IOException(FILE_NOT_OPENED);
  f.fs.Position := n * f.ElementSize
end;

procedure TypedFileInit(var f: TypedFile; ElementType: System.Type);
begin
  f := new TypedFile(ElementType, 0, new integer[0]);
end;

procedure TypedFileInit(var f: TypedFile; ElementType: System.Type; off: integer; params offs: array of integer);
begin
  f := new TypedFile(ElementType, off, offs);
end;

procedure TypedFileInitWithShortString(var f: TypedFile; ElementType: System.Type; off: integer; params offs: array of integer);
begin
  f := new TypedFile(ElementType, off, offs);
end;

function TypedFileRead(f: TypedFile): object;
begin
  var ind := 0;
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  if f.fs = nil then
    raise new System.IO.IOException(FILE_NOT_OPENED);
  Result := AbstractBinaryFileReadT(f, f.ElementType, ind, false);
  //if f.offset > 0 then
  //f.fs.Seek(tmp+(f as TypedFile).ElementSize-f.fs.Position,SeekOrigin.Current);
end;

// -----------------------------------------------------
//                  Binary files
// -----------------------------------------------------
function FilePos(f: BinaryFile): int64;
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  if f.fs = nil then
    raise new System.IO.IOException(FILE_NOT_OPENED);
  Result := f.fs.Position;
end;

function FileSize(f: BinaryFile): int64;
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  if f.fs = nil then
    raise new System.IO.IOException(FILE_NOT_OPENED);
  Result := f.fs.Length;
end;

procedure Seek(f: BinaryFile; n: int64);
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  if f.fs = nil then
    raise new System.IO.IOException(FILE_NOT_OPENED);
  f.fs.Position := n;
end;

procedure BinaryFileInit(var f: BinaryFile);
begin
  f := new BinaryFile();
end;

function BinaryFileRead(var f: BinaryFile; ElementType: System.Type): object;
begin
  if f.fi = nil then
    raise new System.IO.IOException(FILE_NOT_ASSIGNED);
  if f.fs = nil then
    raise new System.IO.IOException(FILE_NOT_OPENED);
  var ind := 0;
  Result := AbstractBinaryFileReadT(f, ElementType, ind, false);
end;

// -----------------------------------------------------
//                  Operating System routines
// -----------------------------------------------------
function ParamCount: integer;
begin
  if (Environment.GetCommandLineArgs.Length > 1) and ((Environment.GetCommandLineArgs[1] = '[REDIRECTIOMODE]') or (Environment.GetCommandLineArgs[1] = '[RUNMODE]')) then
    Result := Environment.GetCommandLineArgs.Length - 2
  else
    Result := Environment.GetCommandLineArgs.Length - 1;
end;

function ParamStr(i: integer): string;
begin
  if (Environment.GetCommandLineArgs.Length > 1) and ((Environment.GetCommandLineArgs[1] = '[REDIRECTIOMODE]') or (Environment.GetCommandLineArgs[1] = '[RUNMODE]')) then
    Result := Environment.GetCommandLineArgs[i + 1]
  else
    Result := Environment.GetCommandLineArgs[i];
end;

function GetDir: string;
begin
  Result := Environment.CurrentDirectory;
end;

procedure ChDir(s: string);
begin
  Environment.CurrentDirectory := s;
end;

procedure MkDir(s: string);
begin
  Directory.CreateDirectory(s);
end;

procedure RmDir(s: string);
begin
  Directory.Delete(s);
end;

function CreateDir(s: string): boolean;
begin
  try
    Result := True;
    Directory.CreateDirectory(s);
  except
    Result := False;
  end;
end;

function DeleteFile(s: string): boolean;
begin
  try
    Result := True;
    &File.Delete(s);
  except
    Result := False;
  end;
end;

function GetCurrentDir: string;
begin
  Result := Environment.CurrentDirectory;
end;

function RemoveDir(s: string): boolean;
begin
  try
    Result := True;
    Directory.Delete(s);
  except
    Result := False;
  end;
end;

function RenameFile(name, newname: string): boolean;
begin
  try
    Result := True;
    &File.Move(name, newname);
  except
    Result := False;
  end;
end;

function SetCurrentDir(s: string): boolean;
begin
  try
    Result := True;
    Environment.CurrentDirectory := s;
  except
    Result := False;
  end;
end;

function ChangeFileNameExtension(name, newext: string): string;
begin
  Result := System.IO.Path.ChangeExtension(name, newext);
end;

function FileExists(name: string): boolean;
begin
  Result := System.IO.File.Exists(name);
end;

procedure Assert(cond: boolean);
begin
  System.Diagnostics.Debug.Assert(cond);
end;

procedure Assert(cond: boolean; mes: string);
begin
  System.Diagnostics.Debug.Assert(cond, mes);
end;

function DiskFree(diskname: string): int64;
begin
  try
    var d := new System.IO.DriveInfo(diskname);
    Result := d.TotalFreeSpace;
  except
    Result := -1;
  end;
end;

function DiskSize(diskname: string): int64;
begin
  try
    var d := new System.IO.DriveInfo(diskname);
    Result := d.TotalSize;
  except
    Result := -1;
  end;
end;

function ConvertDiskToDiskName(disk: integer): string;
begin
  if disk = 0 then
  begin
    var s := Paramstr(0);
    var p := Pos(':', s);
    if p > 0 then 
      Result := Copy(s, 1, p)
    else Result := 'C:';  
  end
  else
  begin
    if disk < 0 then disk := 0;
    if disk > 26 then disk := 26;
    var ch := 'A';
    Inc(ch, disk - 1);
    Result := ch + ':';
  end;
end;

function DiskFree(disk: integer): int64;
begin
  Result := DiskFree(ConvertDiskToDiskName(disk));
end;

function DiskSize(disk: integer): int64;
begin
  Result := DiskSize(ConvertDiskToDiskName(disk));
end;

function Milliseconds: integer;
begin
  Milliseconds := Convert.ToInt32((DateTime.Now - StartTime).TotalMilliseconds);
end;

// -----------------------------------------------------
//                File name routines
// -----------------------------------------------------
function ExtractFileName(fname: string): string;
begin
  var fi := new System.IO.FileInfo(fname);
  Result := fi.Name;
end;

function ExtractFileExt(fname: string): string;
begin
  var fi := new System.IO.FileInfo(fname);
  Result := fi.Extension;
end;

function ExtractFilePath(fname: string): string;
begin
  var fi := new System.IO.FileInfo(fname);
  Result := fi.DirectoryName;
  if (Result.Length > 0) and (Result[Result.Length] <> '\') and  (Result[Result.Length] <> '/') then
    Result += '\';
end;

function ExtractFileDir(fname: string): string;
begin
  var fi := new System.IO.FileInfo(fname);
  Result := fi.DirectoryName;
end;

function ExtractFileDrive(fname: string): string;
begin
  try
    var fi := new System.IO.FileInfo(fname);
    Result := fi.DirectoryName;
    var p := Pos(':', Result);
    if p > 0 then
      Result := Copy(Result, 1, p)
    else Result := '';
  except
    on e: Exception do
      raise e;  
  end;
end;

function ExpandFileName(fname: string): string;
begin
  var fi := new System.IO.FileInfo(fname);
  Result := fi.FullName;
end;


// -----------------------------------------------------
//                Mathematical routines
// -----------------------------------------------------
function Sign(x: integer): integer;
begin
  Result := Math.Sign(x);
end;

function Sign(x: int64): integer;
begin
  Result := Math.Sign(x);
end;

function Sign(x: longword): integer;
begin
  Result := Math.Sign(int64(x));
end;

function Sign(x: uint64): integer;
begin
  Result := Math.Sign(int64(x));
end;

function Sign(x: real): integer;
begin
  Result := Math.Sign(x);
end;

function Abs(x: integer): integer;
begin
  Result := Math.Abs(x);
end;

function Abs(x: int64): int64;
begin
  Result := Math.Abs(x);
end;

function Abs(x: longword): longword;
begin
  Result := Math.Abs(int64(x));
end;

function Abs(x: uint64): uint64;
begin
  Result := Math.Abs(int64(x));
end;

function Abs(x: real): real;
begin
  Result := Math.Abs(x);
end;

function Sin(x: real): real;
begin
  Result := Math.Sin(x);
end;

function Sinh(x: real): real;
begin
  Result := Math.Sinh(x);
end;

function Cos(x: real): real;
begin
  Result := Math.Cos(x);
end;

function Cosh(x: real): real;
begin
  Result := Math.Cosh(x);
end;

function Tan(x: real): real;
begin
  Result := Math.Tan(x);
end;

function Tanh(x: real): real;
begin
  Result := Math.Tanh(x);
end;

function ArcSin(x: real): real;
begin
  Result := Math.Asin(x);
end;

function ArcCos(x: real): real;
begin
  Result := Math.Acos(x);
end;

function ArcTan(x: real): real;
begin
  Result := Math.Atan(x);
end;

function Exp(x: real): real;
begin
  Result := Math.Exp(x);
end;

function Ln(x: real): real;
begin
  Result := Math.Log(x);
end;

function Log2(x: real): real;
begin
  Result := LogN(2, x);
end;

function Log10(x: real): real;
begin
  Result := Math.Log10(x);
end;

function LogN(base, x: real): real;
begin
  Result := Math.Log(x) / Math.Log(base);
end;

function Sqrt(x: real): real;
begin
  Result := Math.Sqrt(x);
end;

function Sqr(x: integer): int64;
begin
  Result := x * x;
end;

function Sqr(x: longword): uint64;
begin
  Result := x * x;
end;

function Sqr(x: int64): int64;
begin
  Result := x * x;
end;

function Sqr(x: uint64): uint64;
begin
  Result := x * x;
end;

function Sqr(x: real): real;
begin
  Result := x * x;
end;

function Power(x, y: real): real;
begin
  Result := Math.Pow(x, y);
end;

function Round(x: real): integer;
begin
  Result := Convert.ToInt32(Math.Round(x));
end;

function Trunc(x: real): integer;
begin
  Result := Convert.ToInt32(Math.Truncate(x));
end;

function Int(x: real): real;
begin
  //if x>=0 then
  //  Result := Math.Floor(x)
  //else Result := Math.Ceiling(x);
  Result := x >= 0 ? Math.Floor(x) : Math.Ceiling(x);
end;

function Frac(x: real): real;
begin
  Result := x - Int(x);
end;

function Floor(x: real): integer;
begin
  Result := Convert.ToInt32(Math.Floor(x));
end;

function Ceil(x: real): integer;
begin
  Result := Convert.ToInt32(Math.Ceiling(x));
end;

function RadToDeg(x: real): real;
begin
  Result := x * 180 / Pi;
end;

function DegToRad(x: real): real;
begin
  Result := x * Pi / 180;
end;

procedure Randomize;
begin
  rnd := new System.Random;
end;

procedure Randomize(seed: integer);
begin
  rnd := new System.Random(seed);
end;

function Random(MaxValue: integer): integer;
begin
  Result := rnd.Next(MaxValue);
end;

function Random(a, b: integer): integer;
begin
  if a > b then Swap(a, b);
  Result := rnd.Next(a, b + 1);
end;

function Random: real;
begin
  Result := rnd.NextDouble;
end;

function Max(a, b: integer): integer;
begin
  Result := Math.Max(a, b);
end;

function Max(a, b: longword): longword;
begin
  Result := Math.Max(a, b);
end;

function Max(a, b: int64): int64;
begin
  Result := Math.Max(a, b);
end;

function Max(a, b: uint64): uint64;
begin
  Result := Math.Max(a, b);
end;

function Max(a, b: real): real;
begin
  Result := Math.Max(a, b);
end;

function Min(a, b: integer): integer;
begin
  Result := Math.Min(a, b);
end;

function Min(a, b: longword): longword;
begin
  Result := Math.Min(a, b);
end;

function Min(a, b: int64): int64;
begin
  Result := Math.Min(a, b);
end;

function Min(a, b: uint64): uint64;
begin
  Result := Math.Min(a, b);
end;

function Min(a, b: real): real;
begin
  Result := Math.Min(a, b);
end;

function Odd(i: integer): boolean;
begin
  result := (i mod 2) <> 0;
end;

function Odd(i: longword): boolean;
begin
  result := (i mod 2) <> 0;
end;

function Odd(i: int64): boolean;
begin
  result := (i mod 2) <> 0;
end;

function Odd(i: uint64): boolean;
begin
  result := (i mod 2) <> 0;
end;

function Low(i: System.Array): integer;
begin
  Result := i.GetLowerBound(0);
end;

function High(i: System.Array): integer;
begin
  Result := i.GetUpperBound(0);
end;

// -----------------------------------------------------
//                Char and String manipulation
// -----------------------------------------------------
function Chr(a: Byte): char;
begin
  __one_byte[0] := a;
  Result := DefaultOrdChrEncoding.GetChars(__one_byte)[0];
end;

function Ord(a: char): byte;
begin
  __one_char[0] := a;
  Result := DefaultOrdChrEncoding.GetBytes(__one_char)[0];
end;

function Ord(a: integer): integer;
begin
  Result := a;
end;

function Ord(a: longword): longword;
begin
  Result := a;
end;

function Ord(a: int64): int64;
begin
  Result := a;
end;

function Ord(a: uint64): uint64;
begin
  Result := a;
end;

function Ord(a: boolean): integer;
begin
  Result := integer(a);
end;

function ChrUnicode(a: word): char;
begin
  Result := Convert.ToChar(a);
end;

function OrdUnicode(a: char): word;
begin
  Result := word(a);
end;

function UpperCase(ch: char): char;
begin
  Result := char.ToUpper(ch);
end;

function LowerCase(ch: char): char;
begin
  Result := char.ToLower(ch);
end;

function UpCase(ch: char): char;
begin
  Result := char.ToUpper(ch);
end;

function LowCase(ch: char): char;
begin
  Result := char.ToLower(ch);
end;

procedure Str(i: integer; var s: string);
begin
  s := i.ToString;
end;

procedure Str(i: longword; var s: string);
begin
  s := i.ToString;
end;

procedure Str(i: int64; var s: string);
begin
  s := i.ToString;
end;

procedure Str(i: uint64; var s: string);
begin
  s := i.ToString;
end;

procedure Str(s1: string; var s: string);
begin
  s := s1;
end;

procedure Str(r: single; var s: string);
begin
  s := Convert.ToString(r, nfi);
end;

procedure Str(r: real; var s: string);
begin
  s := Convert.ToString(r, nfi);
end;

function Pos(subs, s: string): integer;
begin
  if (subs=nil) or (subs.Length=0) then
    Result := 0
  else Result := s.IndexOf(subs) + 1;
end;

function PosEx(subs, s: string; from: integer): integer;
begin
  Result := s.IndexOf(subs, from - 1) + 1;
end;

function Length(s: string): integer;
begin
  if s <> nil then 
    Result := s.Length
  else Result := 0;
end;

procedure SetLength(var s: string; n: integer);
begin
  if n < 0 then
    raise new System.ArgumentOutOfRangeException('n');
  if n = 0 then
    s := String.Empty  
  else if s.Length > n then
    s := s.Substring(0, n)
  else if s.Length < n then
    s += new string(' ', n - s.Length);
end;

procedure SetLengthForShortString(var s: string; n, sz: integer);
begin
  if n < 0 then
    raise new System.ArgumentOutOfRangeException('n');
  if n = 0 then
    s := String.Empty  
  else if s.Length > n then
    s := s.Substring(0, n)
  else if s.Length < n then
    if n <= sz then
      s += new string(' ', n - s.Length )
    else 
      s += new String(' ', sz - s.Length)
end;

procedure Insert(source: string; var s: string; index: integer);
// Insert ������� �� ���������� ����������
begin
  if index<1 then 
    index := 1;
  if index>s.Length+1 then
    index := s.Length + 1;
  s := s.Insert(index - 1, source);
{  try
    s := s.Insert(index - 1, source);
  except 
    on e: System.Exception do
      s := s.Insert(s.Length, source);
  end;}
end;

procedure InsertInShortString(source: string; var s: string; index, n: integer);
begin
  if index<1 then 
    index := 1;
  if index>n then
    exit;
  try
    s := s.Insert(index - 1, source);
    if s.Length > n then s := s.Substring(0, n);
  except
    s := s.Insert(s.Length, source);
    if s.Length > n then s := s.Substring(0, n);
  end;
end;

procedure Delete(var s: string; index, count: integer);
// Delete ������� �� ���������� ����������
begin
  if (index < 1) or (index > s.Length) or (count<=0) then
    Exit;
  if index + count - 1 > s.Length then
    count := s.Length - index + 1;
  s := s.Remove(index - 1, count);
end;

function Copy(s: string; index, count: integer): string;
// Copy ������� �� ���������� ����������
begin
  if index<1 then
    index := 1;
  if (index>s.Length) or (count<=0) then
  begin
    Result := '';
    exit;
  end;
  if index + count - 1 > s.Length then
    count := s.Length - index + 1;
  Result := s.SubString(index - 1, count);
{  try
    if index - 1 >= s.Length then 
      Result := ''
    else Result := s.SubString(index - 1, count);
  except 
    on e: System.Exception do
      Result := s.Substring(index - 1, s.Length - index + 1);
  end;}
end;

function Concat(s1, s2: string): string;
begin
  Result := s1 + s2;
end;

function Concat(params strs: array of string): string;
begin
  var sb := new System.Text.StringBuilder;
  for var i := 0 to strs.length - 1 do
    sb.Append(strs[i]);
  concat := sb.ToString;
end;

function LowerCase(s: string): string;
begin
  Result := s.ToLower;
end;

function UpperCase(s: string): string;
begin
  Result := s.ToUpper;
end;

function StringOfChar(ch: char; count: integer): string;
begin
  Result := new string(ch, count);
end;

function ReverseString(s: string): string;
begin
  var ca := s.ToCharArray;
  &Array.Reverse(ca);
  Result := new string(ca);
end;

function CompareStr(s1, s2: string): Integer;
begin
  Result := string.CompareOrdinal(s1, s2);
end;

function LeftStr(s: string; count: integer): string;
begin
  if count > s.Length then
    count := s.Length;
  Result := s.Substring(0, count)
end;

function RightStr(s: string; count: integer): string;
begin
  if count > s.Length then
    count := s.Length;
  Result := s.Substring(s.Length - count, count);
end;

function Trim(s: string): string;
begin
  Result := s.Trim;
end;

function TrimLeft(s: string): string;
begin
  Result := s.TrimStart(' ');
end;

function TrimRight(s: string): string;
begin
  Result := s.TrimEnd(' ');
end;

function StrToInt(s: string): integer;
begin
  Result := Convert.ToInt32(s); 
end;

function StrToInt64(s: string): int64;
begin
  Result := Convert.ToInt64(s); 
end;

function StrToFloat(s: string): real;
begin
  Result := Convert.ToDouble(s, nfi);
end;

function TryStrToInt(s: string; var value: integer): boolean;
begin
  Result := integer.TryParse(s, value);
end;

function TryStrToInt64(s: string; var value: int64): boolean;
begin
  Result := int64.TryParse(s, value);
end;

function TryStrToFloat(s: string; var value: real): boolean;
begin
  try  
    Result := True;
    value := Convert.ToDouble(s, nfi);
  except
    value := 0;
    Result := False;
  end;
end;

function TryStrToFloat(s: string; var value: single): boolean;
begin
  try  
    Result := True;
    value := Convert.ToSingle(s, nfi);
  except
    value := 0;
    Result := False;
  end;
end;

procedure Val(s: string; var value: integer; var err: integer);
begin
  if TryStrToInt(s, value) then
    err := 0
  else err := 1;  
end;

procedure Val(s: string; var value: real; var err: integer);
begin
  if TryStrToFloat(s, value) then
    err := 0
  else err := 1;  
end;

procedure Val(s: string; var value: single; var err: integer);
begin
  try  
    err := 0;
    value := Convert.ToSingle(s, nfi);
  except
    value := 0;
    err := 1;
  end;
end;

procedure Val(s: string; var value: shortint; var err: integer);
begin
  if shortint.TryParse(s, value) then
    err := 0
  else err := 1;
end;

procedure Val(s: string; var value: smallint; var err: integer);
begin
  if smallint.TryParse(s, value) then
    err := 0
  else err := 1;
end;

procedure Val(s: string; var value: int64; var err: integer);
begin
  if int64.TryParse(s, value) then
    err := 0
  else err := 1;
end;

procedure Val(s: string; var value: byte; var err: integer);
begin
  if byte.TryParse(s, value) then
    err := 0
  else err := 1;
end;

procedure Val(s: string; var value: word; var err: integer);
begin
  if word.TryParse(s, value) then
    err := 0
  else err := 1;
end;

procedure Val(s: string; var value: longword; var err: integer);
begin
  if longword.TryParse(s, value) then
    err := 0
  else err := 1;
end;

procedure Val(s: string; var value: uint64; var err: integer);
begin
  if uint64.TryParse(s, value) then
    err := 0
  else err := 1;
end;

function IntToStr(a: integer): string;
begin
  Result := a.ToString;
end;

function IntToStr(a: int64): string;
begin
  Result := a.ToString;
end;

function FloatToStr(a: real): string;
begin
  Result := a.ToString(nfi);
end;

function Format(fmtstr: string; params pars: array of object): string;
begin
  try
    Result := string.Format(nfi, fmtstr, pars);
  except
    on e: Exception do
      raise e;
  end;
end;

// -----------------------------------------------------
//                Common Routines
// -----------------------------------------------------
function Length(a: &Array): integer;
begin
  if a = nil then
    Result := 0
  else Result := a.Length;
end;

function Length(a: &Array; dim: integer): integer;
begin
  if a = nil then
    Result := 0
  else Result := a.GetLength(dim);
end;

procedure Halt;
begin
  Halt(ExitCode);
end;

procedure Halt(exitCode: integer);
begin
  //System.Diagnostics.Process.GetCurrentProcess.Kill;
  //WINAPI_TerminateProcess(System.Diagnostics.Process.GetCurrentProcess.Handle, exitCode);
  System.Environment.Exit(exitCode);
end;

procedure cls;
begin
  //��� �������������
  {  if IsConsoleApplication then
  Console.Clear;}
end;

procedure Sleep(ms: integer);
begin
  System.Threading.Thread.Sleep(ms);
end;

procedure Inc(var i: integer);
begin
  i += 1;
end;

procedure Inc(var i: integer; n: integer);
begin
  i += n;
end;

procedure Dec(var i: integer);
begin
  i -= 1;
end;

procedure Dec(var i: integer; n: integer);
begin
  i -= n;
end;

procedure Inc(var c: char);
begin
  c := Chr(Ord(c) + 1);
end;

procedure Inc(var c: char; n: integer);
begin
  c := Chr(Ord(c) + n);
end;

procedure Dec(var c: char);
begin
  c := Chr(Ord(c) - 1);
end;

procedure Dec(var c: char; n: integer);
begin
  c := Chr(Ord(c) - n);
end;

procedure Inc(var b: byte);
begin
  b += 1;
end;

procedure Inc(var b: byte; n: integer);
begin
  b += n;
end;

procedure Dec(var b: byte);
begin
  b -= 1;
end;

procedure Dec(var b: byte; n: integer);
begin
  b -= n;
end;

procedure Inc(var f: boolean);
begin
  f := not f;
end;

procedure Dec(var f: boolean);
begin
  f := not f;
end;

//------------------------------------------------------------------------------
//PRED-SUCC
function succ(x:  boolean): boolean;
begin
  Result := not x;
end;

function succ(x: byte): byte;
begin
  Result := x + 1;
end;

function succ(x: shortint): shortint;
begin
  Result := x + 1;
end;

function succ(x: smallint): smallint;
begin
  Result := x + 1;
end;

function succ(x: word): word;
begin
  Result := x + 1;
end;

function succ(x: integer): integer;
begin
  Result := x + 1;
end;

function succ(x: longword): longword;
begin
  Result := x + 1;
end;

function succ(x: int64): int64;
begin
  Result := x + 1;
end;

function succ(x: uint64): uint64;
begin
  Result := x + 1;
end;

function succ(x: char): char;
begin
  Result := System.Convert.ToChar(System.Convert.ToUInt16(x) + 1);
end;

function pred(x: boolean): boolean;
begin
  Result := not x;
end;

function pred(x: byte): byte;
begin
  Result := x - 1;
end;

function pred(x: shortint): shortint;
begin
  Result := x - 1;
end;

function pred(x: smallint): smallint;
begin
  Result := x - 1;
end;

function pred(x: word): word;
begin
  Result := x - 1;
end;

function pred(x:  integer): integer;
begin
  Result := x - 1;
end;

function pred(x: longword): longword;
begin
  Result := x - 1;
end;

function pred(x: int64): int64;
begin
  Result := x - 1;
end;

function pred(x: uint64): uint64;
begin
  Result := x - 1;
end;

function pred(x: char): char;
begin
  Result := System.Convert.ToChar(System.Convert.ToUInt16(x) - 1);
end;
//------------------------------------------------------------------------------

function Range(a,b: integer): IEnumerable<integer>;
begin
  Result := System.Linq.Enumerable.Range(a,b);
end;


function GetEXEFileName: string;
begin
  Result := System.Reflection.Assembly.GetEntryAssembly().ManifestModule.FullyQualifiedName;
end;

function FormatValue(value: object; NumOfChars: integer): string;
begin
  if value <> nil then
    Result := value.ToString
  else
    Result := 'nil';
  Result := Result.PadLeft(NumOfChars);
end;

function FormatValue(value: integer; NumOfChars: integer): string;
begin
  Result := value.ToString;
  Result := Result.PadLeft(NumOfChars);
end;

function FormatValue(value: real; NumOfChars: integer): string;
begin
  Result := value.ToString(nfi);
  Result := Result.PadLeft(NumOfChars);
end;

function FormatValue(value: real; NumOfChars, NumOfSignesAfterDot: integer): string;
begin
  // SSM 31.03.09
  var FmtStr := '{0,' + NumOfChars.ToString + ':f' + abs(NumOfSignesAfterDot).ToString + '}';
  Result := Format(FmtStr, value);
  {var s := value.ToString(ENCultureInfo);
  var i := s.IndexOf('.')+1;
  if NumOfSignesAfterDot>=0 then 
  begin
  if i=0 then 
  begin
  s := s + '.';
  for var j:=1 to NumOfSignesAfterDot do
  s := s + '0'
  end 
  else if NumOfSignesAfterDot=0 then begin
  s := Round(value).ToString(ENCultureInfo);      
  //s := s.SubString(0,i-1);
  end else 
  begin
  var d := s.Length - i;
  if NumOfSignesAfterDot>d then
  for var j:=1 to NumOfSignesAfterDot-d do
  s := s + '0'
  else if NumOfSignesAfterDot<d then begin
  var p := Round(Math.Pow(10,NumOfSignesAfterDot));
  s := (Round(value*p) / p).ToString(ENCultureInfo);
  //s := s.SubString(0,s.IndexOf('.')+1+NumOfSignesAfterDot)
  end;
  end;
  end;
  s := s.PadLeft(NumOfChars); 
  result := s;}
end;

procedure StringDefaultPropertySet(var s: string; index: integer; c: char);
begin
  //s := string.Concat( s.Copy(0,index-1), c, s.Copy(index, s.Length - index));
  //s := string.Concat(s.Substring(0, index), c, s.Substring(index + 1));
  var chars := s.ToCharArray;
  chars[index] := c;
  s := new String(chars);
end;

procedure CheckCanUsePointerOnType(T: System.Type);
var
  fields: array of System.Reflection.FieldInfo;
  fi: System.Reflection.FieldInfo;
begin
  if T.IsPointer then
  begin
    CheckCanUsePointerOnType(T.GetElementType());
    exit;
  end;
  if T.IsValueType then
  begin
    fields := T.GetFields();
    foreach fi in fields do
      if not fi.IsStatic then
        CheckCanUsePointerOnType(fi.FieldType);
    exit;
  end;
  raise new CanNotUseTypeForPointersException(T);
end;

procedure CheckCanUseTypeForFiles(T: System.Type; FileIsBinary: boolean);
var
  fields: array of System.Reflection.FieldInfo;
  fi: System.Reflection.FieldInfo;
begin
  if T.IsPrimitive or T.IsEnum then
    exit;
  if T = typeof(TypedSet) then
  begin
    //TODO: ���������� ���������
    raise new CanNotUseTypeForFilesException(T);
  end;
  if T = typeof(string) then
    if FileIsBinary then
      exit
    else
      raise new CanNotUseTypeForTypedFilesException(T);
  if T.IsValueType then
  begin
    fields := T.GetFields();
    foreach fi in fields do
      if not fi.IsStatic then
        CheckCanUseTypeForFiles(fi.FieldType, FileIsBinary);
    exit;
  end;
  raise new CanNotUseTypeForFilesException(T);
end;

procedure CheckCanUseTypeForBinaryFiles(T: System.Type);
begin
  CheckCanUseTypeForFiles(T, true);
end;

procedure CheckCanUseTypeForTypedFiles(T: System.Type);
begin
  CheckCanUseTypeForFiles(T, false);
end;

constructor BadGenericInstanceParameterException.Create(ActualParameterType: System.Type);
begin
  InstanceType := ActualParameterType;
end;

function CanNotUseTypeForPointersException.ToString: string;
begin
  result := InstanceType.FullName + ' ���������� ��� ����������.';
end;

function CanNotUseTypeForTypedFilesException.ToString: string;
begin
  result := InstanceType.FullName + ' ���������� ��� �������������� ������.';
end;

function CanNotUseTypeForFilesException.ToString: string;
begin
  result := InstanceType.FullName + ' ���������� ��� ������.';
end;

function RuntimeDetermineType(T: System.Type): byte;
begin
  result := 0;
  if T.IsValueType and (T.GetMethod('$Init$') <> nil) then
  begin
    result := 1;
    exit;
  end;
  if T = typeof(string) then
  begin
    result := 2;
    exit;
  end;
  if T = typeof(TypedSet) then
  begin
    result := 3;
    exit;
  end;
  if T = typeof(Text) then
  begin
    result := 4;
    exit;
  end;
  if T = typeof(BinaryFile) then
  begin
    result := 5;
    exit;
  end;
end;

function RuntimeInitialize(kind: byte; variable: object): object;
begin
  case kind of
    1: 
      begin
        variable.GetType.InvokeMember('$Init$',
        System.Reflection.BindingFlags.InvokeMethod or
        System.Reflection.BindingFlags.Instance or
        System.Reflection.BindingFlags.Public, nil, variable, nil);
        result := variable;
      end;
    2: result := '';
    3: result := new TypedSet;
    4: result := new Text;
    5: result := new BinaryFile;
  end;
end;

function GetRuntimeSize<T>: integer;
var
  val: T;
begin
  result := System.Runtime.InteropServices.Marshal.SizeOf(val);
end;

function get_sizes(a: &Array): array of integer;
begin
  var rank := a.Rank;
  Result := Result;
  SetLength(Result, rank);
  for var i := 0 to rank - 1 do
    Result[i] := a.GetLength(i);  
end;

procedure internal_copy(source, dest: &Array; source_sizes, dest_sizes: array of integer; i: integer; var src_ind, dest_ind: integer; flag: byte);
begin
  if i <> source_sizes.Length - 1 then
  begin
    for var j := 0 to min(source_sizes[i], dest_sizes[i]) - 1 do
      internal_copy(source, dest, source_sizes, dest_sizes, i + 1, src_ind, dest_ind, flag);
    if dest_sizes[i] > source_sizes[i] then
      for var j := source_sizes[i] to dest_sizes[i] - 1 do
      begin
        internal_copy(source, dest, source_sizes, dest_sizes, i + 1, src_ind, dest_ind, 1);
      end
    else
    if dest_sizes[i] < source_sizes[i] then
      for var j := dest_sizes[i] to source_sizes[i] - 1 do
      begin
        internal_copy(source, dest, source_sizes, dest_sizes, i + 1, src_ind, dest_ind, 2);
      end
  end
  else
  begin
    if flag = 0 then
    begin
      System.Array.Copy(source, src_ind, dest, dest_ind, min(source_sizes[source_sizes.Length - 1], dest_sizes[source_sizes.Length - 1]));
      src_ind += source_sizes[source_sizes.Length - 1];
      dest_ind += dest_sizes[source_sizes.Length - 1];
    end
    else if flag = 1 then
      dest_ind += dest_sizes[source_sizes.Length - 1]
    else
      src_ind += source_sizes[source_sizes.Length - 1];
  end;
end;

function CopyWithSize(source, dest: &Array): &Array;
begin
  if source <> nil then
  begin
    //System.Array.Copy(source,dest,min(source.Length,dest.Length));
    var source_sizes := get_sizes(source);
    var dest_sizes := get_sizes(dest);
    var src_ind := 0;
    var dest_ind := 0;
    internal_copy(source, dest, source_sizes, dest_sizes, 0, src_ind, dest_ind, 0);
    Result := dest;
  end
  else
    Result := dest;
end;

function Copy(a: &Array): &Array;
begin
  Result := &Array(a.Clone());
end;
{function Copy<T>(a: array of T): array of T;
begin
Result := Result;
SetLength(Result,a.Length);
System.Array.Copy(a,Result,a.Length);
end;}

procedure Swap<T>(var a, b: T);
begin
  var v := a;
  a := b;
  b := v;
end;

procedure Exec(filename: string);
begin
  System.Diagnostics.Process.Start(filename)
end;

procedure Exec(filename: string; args: string);
begin
  System.Diagnostics.Process.Start(filename,args)
end;

procedure Execute(filename: string);
begin
  System.Diagnostics.Process.Start(filename)
end;

procedure Execute(filename: string; args: string);
begin
  System.Diagnostics.Process.Start(filename,args)
end;

function TypedSetComparer.Equals(x: System.Object; y: System.Object): boolean;
begin
  //Result := object.Equals(x,y);
  Result := object.Equals(x, y);
  if not Result then
  begin
    var left_type := x.GetType;
    var right_type := y.GetType;
    case System.Type.GetTypeCode(left_type) of
      TypeCode.Byte:
        begin
          case System.Type.GetTypeCode(right_type) of
            TypeCode.Byte: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.SByte: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.Int16: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.UInt16: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.Int32: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.UInt32: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.Int64: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.UInt64: Result := Convert.ToUInt64(x) = Convert.ToUInt64(y);
          end;
        end;
      TypeCode.SByte:
        begin
          case System.Type.GetTypeCode(right_type) of
            TypeCode.Byte: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.SByte: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.Int16: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.UInt16: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.Int32: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.UInt32: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.Int64: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.UInt64: Result := Convert.ToUInt64(x) = Convert.ToUInt64(y);
          end;
        end;
      TypeCode.UInt16:
        begin
          case System.Type.GetTypeCode(right_type) of
            TypeCode.Byte: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.SByte: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.Int16: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.UInt16: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.Int32: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.UInt32: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.Int64: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.UInt64: Result := Convert.ToUInt64(x) = Convert.ToUInt64(y);
          end;
        end;
      TypeCode.Int16:
        begin
          case System.Type.GetTypeCode(right_type) of
            TypeCode.Byte: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.SByte: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.Int16: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.UInt16: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.Int32: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.UInt32: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.Int64: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.UInt64: Result := Convert.ToUInt64(x) = Convert.ToUInt64(y);
          end;
        end;
      TypeCode.Int32:
        begin
          case System.Type.GetTypeCode(right_type) of
            TypeCode.Byte: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.SByte: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.Int16: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.UInt16: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.Int32: Result := Convert.ToInt32(x) = Convert.ToInt32(y);
            TypeCode.UInt32: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.Int64: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.UInt64: Result := Convert.ToUInt64(x) = Convert.ToUInt64(y);
          end;
        end;
      TypeCode.UInt32:
        begin
          case System.Type.GetTypeCode(right_type) of
            TypeCode.Byte: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.SByte: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.Int16: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.UInt16: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.Int32: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.UInt32: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.Int64: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.UInt64: Result := Convert.ToUInt64(x) = Convert.ToUInt64(y);
          end;
        end;
      TypeCode.Int64:
        begin
          case System.Type.GetTypeCode(right_type) of
            TypeCode.Byte: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.SByte: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.Int16: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.UInt16: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.Int32: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.UInt32: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.Int64: Result := Convert.ToInt64(x) = Convert.ToInt64(y);
            TypeCode.UInt64: Result := Convert.ToUInt64(x) = Convert.ToUInt64(y);
          end;
        end;
      TypeCode.UInt64:
        begin
          case System.Type.GetTypeCode(right_type) of
            TypeCode.Byte: Result := Convert.ToUInt64(x) = Convert.ToInt64(y);
            TypeCode.SByte: Result := Convert.ToUInt64(x) = Convert.ToInt64(y);
            TypeCode.Int16: Result := Convert.ToUInt64(x) = Convert.ToInt64(y);
            TypeCode.UInt16: Result := Convert.ToUInt64(x) = Convert.ToInt64(y);
            TypeCode.Int32: Result := Convert.ToUInt64(x) = Convert.ToInt64(y);
            TypeCode.UInt32: Result := Convert.ToUInt64(x) = Convert.ToInt64(y);
            TypeCode.Int64: Result := Convert.ToUInt64(x) = Convert.ToInt64(y);
            TypeCode.UInt64: Result := Convert.ToUInt64(x) = Convert.ToUInt64(y);
          end;
        end;
    end;
  end;
end;

function TypedSetComparer.GetHashCode(obj: System.Object): integer;
begin
  case System.Type.GetTypeCode(obj.GetType) of
    TypeCode.Byte: Result := Convert.ToByte(obj);
    TypeCode.SByte: Result := Convert.ToSByte(obj);
    TypeCode.UInt16: Result := Convert.ToUInt16(obj);
    TypeCode.Int16: Result := Convert.ToInt16(obj);
    TypeCode.Int32: Result := Convert.ToInt32(obj);
    TypeCode.UInt32: Result := Convert.ToUInt32(obj).GetHashCode();
    TypeCode.Int64: Result := Convert.ToInt64(obj).GetHashCode();
    TypeCode.UInt64: Result := Convert.ToUInt64(obj).GetHashCode();
  else
    Result := obj.GetHashCode();
  end;
end;

function check_in_range(val: int64; low, up: int64): int64;
begin
  if (val < low) or (val > up) then
    raise new RangeException(RANGE_ERROR_MESSAGE);
  Result := val;
end;

function check_in_range_char(val: char; low, up: char): char;
begin
  if (val < low) or (val > up) then
    raise new RangeException(RANGE_ERROR_MESSAGE);
  Result := val;
end;

var __from_dll := false;

function ExecuteAssemlyIsDll: boolean;
begin
  Result := not __from_dll and (IO.Path.GetExtension(System.Reflection.Assembly.GetExecutingAssembly.ManifestModule.FullyQualifiedName).ToLower = '.dll');
end;


//------------------------------------------------------------------------------
//OMP

procedure omp_set_nested(nested:integer);
begin
  OMP_NESTED := nested <> 0;
end;

function omp_get_nested:integer;
begin
  if OMP_NESTED then
    result := 1
  else
    result := 0;
end;

//------------------------------------------------------------------------------

var 
  __initialized := false;
  
  
procedure __InitModule;
begin
  var arg := Environment.GetCommandLineArgs();
  if arg.Length > 1 then begin
    CommandLineArgs := new string[arg.Length - 1];
    for var i := 1 to arg.Length - 1 do
      CommandLineArgs[i - 1] := arg[i];
  end else
    CommandLineArgs := new string[0];
  CurrentIOSystem := new IOStandardSystem;
  //  ENCultureInfo := new System.Globalization.CultureInfo('en-US');
  System.Threading.Thread.CurrentThread.CurrentUICulture := System.Globalization.CultureInfo.GetCultureInfo('ru-RU');
  nfi := new System.Globalization.NumberFormatInfo();
  nfi.NumberGroupSeparator := '.';
  //  System.Threading.Thread.CurrentThread.CurrentCulture := new System.Globalization.CultureInfo('en-US');
  rnd := new System.Random;
  StartTime := DateTime.Now;
  output := new TextFile();
  input := new TextFile();
end;

procedure __InitModule__;
begin
  if not __initialized then
  begin
    __initialized := true;
    __from_dll := true;
    __InitModule;
  end;
end;

procedure __FinalizeModule__;
begin
  if (output.sw <> nil) and (output.sw.BaseStream <> nil) then
    output.sw.Close;
  if (input.sr <> nil) and (input.sr.BaseStream <> nil) then
    input.sr.Close;
end;

initialization
  __InitModule;
finalization
  __FinalizeModule__;
end.