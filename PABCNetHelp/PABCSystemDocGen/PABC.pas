
// -----------------------------------------------------
//>>     ����������� ��������� # Standard constants
// -----------------------------------------------------
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
  /// !! Pi constant
  Pi = 3.141592653589793;
  /// ��������� E
  /// !! E constant
  E = 2.718281828459045;
  /// ��������� �������� �� ����� ������
  /// !! The newline string defined for this environment.
  NewLine = System.Environment.NewLine;
// -----------------------------------------------------
//>>     ����������� ���� # Standard types
// -----------------------------------------------------
type
  /// ������� ��� ��������
  Object = System.Object;
  
  /// ������� ��� ����������
  Exception = System.Exception;
  
  /// double = real
  double = System.Double;
  
  /// longint = integer
  longint = System.Int32;
  
  /// cardinal = longword
  cardinal = System.UInt32;
  
  /// ������������ 128-������ ������������ �����
  /// !! Represents a decimal number
  decimal = System.Decimal;
  
  /// ������������ ����������� ������� ����� �����
  BigInteger = System.Numerics.BigInteger;

  /// ������������ ���� � �����
  DateTime = System.DateTime;
  
  /// ������������ ����������� �����
  Complex = System.Numerics.Complex;
  
  /// ������������ ������
  Tuple = System.Tuple;
  
  /// ������������ ������ �� ���� ������������� �������
  List<T> = System.Collections.Generic.List<T>;
  
  /// ������������ ������� ����� ��� ���������� ���������� IComparer
  Comparer<T> = System.Collections.Generic.Comparer<T>;
  
  /// ������������ ������� ����� ��� ���������� ���������� IComparer
  IComparable<T> = System.IComparable<T>;
  
  /// ������������ ��������� ��������, ������������� �� ���� ���-�������
  HashSet<T> = System.Collections.Generic.HashSet<T>;
  
  /// ������������ ��������� ��������, ������������� �� ���� ��������� ������ ������
  SortedSet<T> = System.Collections.Generic.SortedSet<T>;
  
  /// ������������ ������������� ������ (����� ��� ����-��������), ������������� �� ���� ���-�������
  Dictionary<Key, Value> = System.Collections.Generic.Dictionary<Key, Value>;
  
  /// ������������ ������������� ������, ������������� �� ���� ��������� ������ ������
  SortedDictionary<Key, Value> = System.Collections.Generic.SortedDictionary<Key, Value>;
  
  /// ������������ ������������� ������ (����� ��� ����-��������), ������������� �� ���� ������������� ������� ���
  SortedList<Key, Value> = System.Collections.Generic.SortedList<Key, Value>;
  
  /// ������������ ���� ����-�������� ��� �������������� ������� 
  KeyValuePair<Key, Value> = System.Collections.Generic.KeyValuePair<Key, Value>;
  
  /// ������������ ���������� ������
  LinkedList<T> = System.Collections.Generic.LinkedList<T>;
  
  /// ������������ ���� ����������� ������
  LinkedListNode<T> = System.Collections.Generic.LinkedListNode<T>;
  
  /// ������������ ������� - ����� ���������, ������������� �� �������� "������ �����-������ �����"
  Queue<T> = System.Collections.Generic.Queue<T>;
  
  /// ������������ ���� - ����� ���������, ������������� �� �������� "��������� �����-������ �����"
  Stack<T> = System.Collections.Generic.Stack<T>;
  
  /// ������������ ��������� ��� ���������
  ICollection<T> = System.Collections.Generic.ICollection<T>;
  
  /// ������������ ��������� ��� ��������� ���� ���������
  IComparer<T> = System.Collections.Generic.IComparer<T>;
  
  /// ������������ ��������� ��� ������ ��� ����-��������
  IDictionary<Key, Value> = System.Collections.Generic.IDictionary<Key, Value>;
  
  /// ������������ ���������, ��������������� ������������� ��� �������� ��������� ���������
  IEnumerable<T> = System.Collections.Generic.IEnumerable<T>;
  
  /// ������������ ��������� ��� �������� ��������� ���������
  IEnumerator<T> = System.Collections.Generic.IEnumerator<T>;
  
  /// ������������ ��������� ��� ��������� ��������� �� ���������
  IEqualityComparer<T> = System.Collections.Generic.IEqualityComparer<T>;
  
  /// ������������ ��������� ��� ��������� � �������� �� �������
  IList<T> = System.Collections.Generic.IList<T>;
  
  /// ������������ ��������� ��� ���������
  ISet<T> = System.Collections.Generic.ISet<T>;
  
  /// ������������ ���������� ������ ��������
  StringBuilder = System.Text.StringBuilder;
  
  /// ��� ��������� ��������  
  Encoding = System.Text.Encoding;
  
  /// ������������ �������� ��� ����������
  Action0 = System.Action;
  
  /// ������������ �������� � ����� ����������
  Action<T> = System.Action<T>;
  
  /// ������������ �������� � ����� �����������
  Action2<T1, T2> = System.Action<T1, T2>;
  
  /// ������������ �������� � ����� �����������
  Action3<T1, T2, T3> = System.Action<T1, T2, T3>;
  
  /// ������������ ������� ��� ����������
  Func0<Res> = System.Func<Res>;
  
  /// ������������ ������� � ����� ����������
  Func<T, Res> = System.Func<T, Res>;
  
  /// ������������ ������� � ����� �����������
  Func2<T1, T2, Res> = System.Func<T1, T2, Res>;
  
  /// ������������ ������� � ����� �����������
  Func3<T1, T2, T3, Res> = System.Func<T1, T2, T3, Res>;
  
  /// ������������ ������� � ����� ���������� ������ ����, ������������ �����
  IntFunc = Func<integer, integer>;
  
  /// ������������ ������� � ����� ���������� ������������� ����, ������������ ������������
  RealFunc = Func<real, real>;
  
  /// ������������ ������� � ����� ���������� ���������� ����, ������������ ������
  StringFunc = Func<string, string>;
  
  /// ������������ ������� � ����� ����������, ������������ boolean 
  Predicate<T> = System.Predicate<T>;
  
  /// ������������ ������� � ����� �����������, ������������ boolean 
  Predicate2<T1, T2> = function(x1: T1; x2: T2): boolean;
  
  /// ������������ ������� � ����� �����������, ������������ boolean 
  Predicate3<T1, T2, T3> = function(x1: T1; x2: T2; x3: T3): boolean;
  
  /// ������������ ���������� ���������
  Regex = System.Text.RegularExpressions.Regex;
  
  /// ������������ ���������� �� ���������� ���������� ����������� ���������
  Match = System.Text.RegularExpressions.Match;
  
  /// ������������ �����, ���������� ��� ����������� ���������� � Regex.Replace
  MatchEvaluator = System.Text.RegularExpressions.MatchEvaluator;
  
  /// ������������ ����� �������� ���������� ����������� ���������
  MatchCollection = System.Text.RegularExpressions.MatchCollection;
  
  /// ������������ ��������� ����������� ���������
  RegexOptions = System.Text.RegularExpressions.RegexOptions;
  
  /// ������������ ���������� �� ����� ������ ��� ���������� Regex.Match
  RegexGroup = System.Text.RegularExpressions.Group;
  
  /// ������������ ���������� �� ������ ����� ��� ���������� Regex.Match
  RegexGroupCollection = System.Text.RegularExpressions.GroupCollection;
  
  /// ������������ ��� �������� ������ ������������� ����� 255 ��������
  ShortString = string[255];
  

// -----------------------------------------------------
//>>     ������������ ����� # Read subroutines
// -----------------------------------------------------
///- procedure Read(a,b,...);
/// ������ �������� a,b,... � ����������
procedure Read;
///--
procedure Read(var x: integer);
///--
procedure Read(var x: real);
///--
procedure Read(var x: char);
///--
procedure Read(var x: string);
///--
procedure Read(var x: byte);
///--
procedure Read(var x: shortint);
///--
procedure Read(var x: smallint);
///--
procedure Read(var x: word);
///--
procedure Read(var x: longword);
///--
procedure Read(var x: int64);
///--
procedure Read(var x: uint64);
///--
procedure Read(var x: single);
///--
procedure Read(var x: boolean);
///- procedure Readln(a,b,...);
/// ������ �������� a,b,... � ���������� � ������������ ������� �� ��������� ������
procedure Readln;

/// ������ �������� �������� x ����������. ���������� False ���� ��� ����� ��������� ������
function TryRead(var x: integer): boolean;
///--
function TryRead(var x: real): boolean;
///--
function TryRead(var x: byte): boolean;
///--
function TryRead(var x: shortint): boolean;
///--
function TryRead(var x: smallint): boolean;
///--
function TryRead(var x: word): boolean;
///--
function TryRead(var x: longword): boolean;
///--
function TryRead(var x: int64): boolean;
///--
function TryRead(var x: uint64): boolean;
///--
function TryRead(var x: single): boolean;

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

/// ���������� ������ �� ���� �������� ���� integer, ��������� � ����������
function ReadInteger2: (integer, integer);
/// ���������� ������ �� ���� �������� ���� real, ��������� � ����������
function ReadReal2: (real, real);
/// ���������� ������ �� ���� �������� ���� char, ��������� � ����������
function ReadChar2: (char, char);
/// ���������� ������ �� ���� �������� ���� string, ��������� � ����������
function ReadString2: (string, string);
/// ���������� ������ �� ���� �������� ���� integer, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnInteger2: (integer, integer);
/// ���������� ������ �� ���� �������� ���� real, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnReal2: (real, real);
/// ���������� ������ �� ���� �������� ���� char, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnChar2: (char, char);
/// ���������� ������ �� ���� �������� ���� string, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnString2: (string, string);

/// ���������� ������ �� ��� �������� ���� integer, ��������� � ����������
function ReadInteger3: (integer, integer, integer);
/// ���������� ������ �� ��� �������� ���� real, ��������� � ����������
function ReadReal3: (real, real, real);
/// ���������� ������ �� ��� �������� ���� char, ��������� � ����������
function ReadChar3: (char, char, char);
/// ���������� ������ �� ��� �������� ���� string, ��������� � ����������
function ReadString3: (string, string, string);
/// ���������� ������ �� ���� �������� ���� integer, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnInteger3: (integer, integer, integer);
/// ���������� ������ �� ���� �������� ���� real, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnReal3: (real, real, real);
/// ���������� ������ �� ���� �������� ���� char, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnChar3: (char, char, char);
/// ���������� ������ �� ���� �������� ���� string, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnString3: (string, string, string);

/// ���������� ������ �� ���� �������� ���� integer, ��������� � ����������
function ReadInteger2(prompt: string): (integer, integer);
/// ���������� ������ �� ���� �������� ���� real, ��������� � ����������
function ReadReal2(prompt: string): (real, real);
/// ���������� ������ �� ���� �������� ���� char, ��������� � ����������
function ReadChar2(prompt: string): (char, char);
/// ���������� ������ �� ���� �������� ���� string, ��������� � ����������
function ReadString2(prompt: string): (string, string);
/// ���������� ������ �� ���� �������� ���� integer, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnInteger2(prompt: string): (integer, integer);
/// ���������� ������ �� ���� �������� ���� real, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnReal2(prompt: string): (real, real);
/// ���������� ������ �� ���� �������� ���� char, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnChar2(prompt: string): (char, char);
/// ���������� ������ �� ���� �������� ���� string, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnString2(prompt: string): (string, string);

/// ���������� ������ �� ��� �������� ���� integer, ��������� � ����������
function ReadInteger3(prompt: string): (integer, integer, integer);
/// ���������� ������ �� ��� �������� ���� real, ��������� � ����������
function ReadReal3(prompt: string): (real, real, real);
/// ���������� ������ �� ��� �������� ���� char, ��������� � ����������
function ReadChar3(prompt: string): (char, char, char);
/// ���������� ������ �� ��� �������� ���� string, ��������� � ����������
function ReadString3(prompt: string): (string, string, string);
/// ���������� ������ �� ���� �������� ���� integer, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnInteger3(prompt: string): (integer, integer, integer);
/// ���������� ������ �� ���� �������� ���� real, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnReal3(prompt: string): (real, real, real);
/// ���������� ������ �� ���� �������� ���� char, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnChar3(prompt: string): (char, char, char);
/// ���������� ������ �� ���� �������� ���� string, ��������� � ����������, � ��������� �� ��������� ������ �����
function ReadlnString3(prompt: string): (string, string, string);


/// ������� ����������� � ����� � ���������� �������� ���� integer, ��������� � ����������
function ReadInteger(prompt: string): integer;
/// ������� ����������� � ����� � ���������� �������� ���� real, ��������� � ����������
function ReadReal(prompt: string): real;
/// ������� ����������� � ����� � ���������� �������� ���� char, ��������� � ����������
function ReadChar(prompt: string): char;
/// ������� ����������� � ����� � ���������� �������� ���� string, ��������� � ����������
function ReadString(prompt: string): string;
/// ������� ����������� � ����� � ���������� �������� ���� boolean, ��������� � ����������
function ReadBoolean(prompt: string): boolean;

/// ������� ����������� � ����� � ���������� �������� ���� integer, ��������� � ����������, 
///� ������������ ������� �� ��������� ������ �����
function ReadlnInteger(prompt: string): integer;
/// ������� ����������� � ����� � ���������� �������� ���� real, ��������� � ����������, 
///� ������������ ������� �� ��������� ������ �����
function ReadlnReal(prompt: string): real;
/// ������� ����������� � ����� � ���������� �������� ���� char, ��������� � ����������, 
///� ������������ ������� �� ��������� ������ �����
function ReadlnChar(prompt: string): char;
/// ������� ����������� � ����� � ���������� �������� ���� string, ��������� � ����������, 
///� ������������ ������� �� ��������� ������ �����
function ReadlnString(prompt: string): string;
/// ������� ����������� � ����� � ���������� �������� ���� boolean, ��������� � ����������, 
///� ������������ ������� �� ��������� ������ �����
function ReadlnBoolean(prompt: string): boolean;


///--
procedure ReadShortString(var s: string; n: integer);
///--
procedure ReadShortStringFromFile(f: Text; var s: string; n: integer);

///- procedure Read(f: ����; a,b,...);
/// ������ �������� a,b,... �� ����� f
procedure Read(f: Text);
///--
procedure Read(f: Text; var x: integer);
///--
procedure Read(f: Text; var x: real);
///--
procedure Read(f: Text; var x: char);
///--
procedure Read(f: Text; var x: string);
///--
procedure Read(f: Text; var x: byte);
///--
procedure Read(f: Text; var x: shortint);
///--
procedure Read(f: Text; var x: smallint);
///--
procedure Read(f: Text; var x: word);
///--
procedure Read(f: Text; var x: longword);
///--
procedure Read(f: Text; var x: int64);
///--
procedure Read(f: Text; var x: uint64);
///--
procedure Read(f: Text; var x: single);
///--
procedure Read(f: Text; var x: boolean);

///- procedure Readln(f: Text; a,b,...);
/// ������ �������� a,b,... �� ���������� ����� f � ������������ ������� �� ��������� ������
procedure Readln(f: Text);
///--
procedure Readln(f: Text; var x: string);

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

/// ���������� �������� ���� integer, ��������� �� ���������� ����� f, 
///� ������������ ������� �� ��������� ������
function ReadlnInteger(f: Text): integer;
/// ���������� �������� ���� real, ��������� �� ���������� ����� f, 
///� ������������ ������� �� ��������� ������
function ReadlnReal(f: Text): real;
/// ���������� �������� ���� char, ��������� �� ���������� ����� f, 
///� ������������ ������� �� ��������� ������
function ReadlnChar(f: Text): char;
/// ���������� �������� ���� string, ��������� �� ���������� ����� f, 
///� ������������ ������� �� ��������� ������
function ReadlnString(f: Text): string;
/// ���������� �������� ���� boolean, ��������� �� ���������� ����� f, 
///� ������������ ������� �� ��������� ������
function ReadlnBoolean(f: Text): boolean;

// -----------------------------------------------------
//>>     ������������ ������ # Write subroutines
// -----------------------------------------------------
///- procedure Write(a,b,...);
/// ������� �������� a,b,... �� �����
procedure Write;
///--
procedure Write(obj: object);
///--
procedure Write(obj1, obj2: object);
///--
procedure Write(params args: array of object);

///- procedure Writeln(a,b,...);
/// ������� �������� a,b,... �� ����� � ������������ ������� �� ����� ������
///!!- Writeln(a,b,...)
/// Writes a,b,... to standart output stream and appends newline
procedure Writeln;
///--
procedure Writeln(obj: object);
///--
//procedure writeln(ptr: pointer); 
///--
procedure Writeln(obj1, obj2: object);
///--
procedure Writeln(params args: array of object);

///- procedure Write(f: ����; a,b,...);
/// ������� �������� a,b,... � ���� f
procedure Write(f: Text);
///--
procedure Write(f: Text; val: object);
///--
procedure Write(f: Text; params args: array of object);

///- procedure Writeln(f: Text; a,b,...);
/// ������� �������� a,b,... � ��������� ���� f � ������������ ������� �� ����� ������
procedure Writeln(f: Text);
///--
procedure Writeln(f: Text; val: object);
///--
procedure Writeln(f: Text; params args: array of object);

/// ������� �������� args �������� ��������� ������ formatstr
procedure WriteFormat(formatstr: string; params args: array of object);
/// ������� �������� args �������� ��������� ������ formatstr � ������������ ������� �� ����� ������
procedure WritelnFormat(formatstr: string; params args: array of object);
/// ������� �������� args � ��������� ���� f �������� ��������� ������ formatstr
procedure WriteFormat(f: Text; formatstr: string; params args: array of object);
/// ������� �������� args � ��������� ���� f �������� ��������� ������ formatstr
///� ������������ ������� �� ����� ������
procedure WritelnFormat(f: Text; formatstr: string; params args: array of object);

///- procedure Print(a,b,...);
/// ������� �������� a,b,... �� �����, ����� ������� �������� ������� ������
procedure Print(s: string);
///--
procedure Print(params args: array of object);
///- procedure Print(f: Text; a,b,...);
/// ������� �������� a,b,... � ��������� ���� f, ����� ������� �������� ������� ������
procedure Print(f: Text; params args: array of object);
///- procedure Println(a,b,...);
/// ������� �������� a,b,... �� �����, ����� ������� �������� ������� ������ � ��������� �� ����� ������
procedure Println(params args: array of object);
///- procedure Println(f: Text; a,b,...);
/// ������� �������� a,b,... � ��������� ���� f, ����� ������� �������� ������� ������ � ��������� �� ����� ������
procedure Println(f: Text; params args: array of object);

// -----------------------------------------------------
//>>     ����� ������������ ��� ������ � ������� # Common subroutines for files
// -----------------------------------------------------
///- procedure Assign(f: ����; name: string);
/// ��������� �������� ���������� � ������ �� �����
procedure Assign(f: AbstractBinaryFile; name: string);
///- procedure AssignFile(f: ����; name: string);
/// ��������� �������� ���������� � ������ �� �����
procedure AssignFile(f: AbstractBinaryFile; name: string);
///- procedure Close(f: ����);
/// ��������� ����
procedure Close(f: AbstractBinaryFile);
///- procedure CloseFile(f: ����);
/// ��������� ����
procedure CloseFile(f: AbstractBinaryFile);
///- function Eof(f: ����): boolean;
/// ���������� True, ���� ��������� ����� ����� 
function Eof(f: AbstractBinaryFile): boolean;
///- procedure Erase(f: ����);
/// ������� ����, ��������� � �������� ���������� 
procedure Erase(f: AbstractBinaryFile);
///- procedure Rename(f: ����; newname: string);
/// ��������������� ����, �������� � �������� ����������, ����� ��� ��� newname. 
procedure Rename(f: AbstractBinaryFile; newname: string);

// -----------------------------------------------------
//>>     ������������ ��� ������ � ���������� ������� # Subroutines for text files
// -----------------------------------------------------
///--
procedure Assign(f: Text; name: string);
///--
procedure AssignFile(f: Text; name: string);
///--
procedure Close(f: Text);
///--
procedure CloseFile(f: Text);
/// ��������� ��������� ���� �� ������ � ��������� Windows
procedure Reset(f: Text);
/// ��������� ��������� ���� �� ������ � ��������� ���������
procedure Reset(f: Text; en: Encoding);
/// ��������� �������� ���������� f � ������ ����� name � ��������� ��������� ���� �� ������ � ��������� Windows
procedure Reset(f: Text; name: string);
/// ��������� �������� ���������� f � ������ ����� name � ��������� ��������� ���� �� ������ � ��������� ���������
procedure Reset(f: Text; name: string; en: Encoding);
/// ��������� ��������� ���� �� ������ � ��������� Windows. 
///���� ���� ����������� - �� ����������, ���� ��� - ��������� ������
procedure Rewrite(f: Text);
/// ��������� ��������� ���� �� ������ � ��������� ���������. 
///���� ���� ����������� - �� ����������, ���� ��� - ��������� ������
procedure Rewrite(f: Text; en: Encoding);
/// ��������� �������� ���������� � ������ ����� name � ��������� ��������� ���� f �� ������ � ��������� Windows. 
///���� ���� ����������� - �� ����������, ���� ��� - ��������� ������
procedure Rewrite(f: Text; name: string);
/// ��������� �������� ���������� f � ������ ����� name � ��������� ��������� ���� f �� ������ � ��������� ���������. 
///���� ���� ����������� - �� ����������, ���� ��� - ��������� ������
procedure Rewrite(f: Text; name: string; en: Encoding);
/// ��������� ��������� ���� �� ���������� � ��������� Windows
procedure Append(f: Text);
/// ��������� ��������� ���� �� ���������� � ��������� ���������
procedure Append(f: Text; en: Encoding);
/// ��������� �������� ���������� f � ������ ����� name � ��������� ��������� ���� �� ���������� � ��������� Windows
procedure Append(f: Text; name: string);
/// ��������� �������� ���������� f � ������ ����� name � ��������� ��������� ���� �� ���������� � ��������� ���������
procedure Append(f: Text; name: string; en: Encoding);
/// ���������� ��������� ���� � ������ fname, �������� �� ������ � ��������� Windows
function OpenRead(fname: string): Text;
/// ���������� ��������� ���� � ������ fname, �������� �� ������ � ��������� ��������� 
function OpenRead(fname: string; en: Encoding): Text;
/// ���������� ��������� ���� � ������ fname, �������� �� ������ � ��������� Windows
function OpenWrite(fname: string): Text;
/// ���������� ��������� ���� � ������ fname, �������� �� ������ � ��������� ���������
function OpenWrite(fname: string; en: Encoding): Text;
/// ���������� ��������� ���� � ������ fname, �������� �� ���������� � ��������� Windows
function OpenAppend(fname: string): Text;
/// ���������� ��������� ���� � ������ fname, �������� �� ���������� � ��������� ��������� 
function OpenAppend(fname: string; en: Encoding): Text;

///--
function Eof(f: Text): boolean;
/// ���������� True, ���� � ����� ��������� ����� ������ 
function Eoln(f: Text): boolean;
/// ���������� ���������� �������, ����� ���� ���������� True, ���� ��������� ����� �����
function SeekEof(f: Text): boolean;
/// ���������� ���������� �������, ����� ���� ���������� True, ���� � ����� ��������� ����� ������
function SeekEoln(f: Text): boolean;
/// ���������� ���������� ������ ����� �� ����
procedure Flush(f: Text);
///--
procedure Erase(f: Text);
///--
procedure Rename(f: Text; newname: string);
///--
procedure TextFileInit(var f: Text);

/// ��������� ����, ��������� �� ���� ������ � ��������� Windows � ��������� ����. � ������ ������ � ������ �������� ������ ������� ������
function ReadLines(path: string): sequence of string;
/// ��������� ����, ��������� �� ���� ������ � �������� ��������� � ��������� ����. � ������ ������ � ������ �������� ������ ������� ������ 
function ReadLines(path: string; en: Encoding): sequence of string;
/// ��������� ����, ��������� �� ���� ������ � ��������� Windows � ���� ������� �����, ����� ���� ��������� ����
function ReadAllLines(path: string): array of string;
/// ��������� ����, ��������� �� ���� ������ � �������� ��������� � ���� ������� �����, ����� ���� ��������� ����
function ReadAllLines(path: string; en: Encoding): array of string;
/// ��������� ����, ��������� ��� ���������� � ��������� Windows � ���� ������, ����� ���� ��������� ����
function ReadAllText(path: string): string;
/// ��������� ����, ��������� ��� ���������� � �������� ��������� � ���� ������, ����� ���� ��������� ����
function ReadAllText(path: string; en: Encoding): string;
/// ������� ����� ����, ���������� � ���� ������ �� ������������������ � ��������� Windows, ����� ���� ��������� ����
procedure WriteLines(path: string; ss: sequence of string);
/// ������� ����� ����, ���������� � ���� ������ �� ������������������ � ��������� ���������, ����� ���� ��������� ����
procedure WriteLines(path: string; ss: sequence of string; en: Encoding);
/// ������� ����� ����, ���������� � ���� ������ �� ������� � ��������� Windows, ����� ���� ��������� ����
procedure WriteAllLines(path: string; ss: array of string);
/// ������� ����� ����, ���������� � ���� ������ �� ������� � ��������� ���������, ����� ���� ��������� ����
procedure WriteAllLines(path: string; ss: array of string; en: Encoding);
/// ������� ����� ����, ���������� � ���� ������ � ��������� Windows, ����� ���� ��������� ����
procedure WriteAllText(path: string; s: string);
/// ������� ����� ����, ���������� � ���� ������ � ��������� ���������, ����� ���� ��������� ����
procedure WriteAllText(path: string; s: string; en: Encoding);

// -----------------------------------------------------
//>>     ������������ ��� ������ � ��������� ������� # Subroutines for binary files
// -----------------------------------------------------
///- procedure Reset(f: �������� ����);
/// ��������� �������� ���� �� ������ � ������.
///�������� ���� - ��� ���� �������������� ���� file of T, ���� ���������� ���� file
procedure Reset(f: AbstractBinaryFile);
///- procedure Reset(f: �������� ����; name: string);
/// ��������� �������� ���������� f � ������ name �� ����� � ��������� �������� ���� �� ������ � ������.
///�������� ���� - ��� ���� �������������� ���� file of T, ���� ���������� ���� file
procedure Reset(f: AbstractBinaryFile; name: string);
///- procedure Rewrite(f: �������� ����);
/// ��������� �������� ���� �� ������ � ������, ��� ���� ������� ��� ����������. ���� ���� �����������, �� ����������.
///�������� ���� - ��� ���� �������������� ���� file of T, ���� ���������� ���� file
procedure Rewrite(f: AbstractBinaryFile);
///- procedure Rewrite(f: �������� ����; name: string);
/// ��������� �������� ���������� f � ������ name �� ����� � ��������� �������� ���� �� ������ � ������, ��� ���� ������� ��� ����������.
///�������� ���� - ��� ���� �������������� ���� file of T, ���� ���������� ���� file
procedure Rewrite(f: AbstractBinaryFile; name: string);
///- procedure Truncate(f: �������� ����);
/// ������� �������� ����, ���������� ��� �������� � ������� ��������� ���������.
///�������� ���� - ��� ���� �������������� ���� file of T, ���� ���������� ���� file
procedure Truncate(f: AbstractBinaryFile);

///--
procedure Write(f: AbstractBinaryFile; params vals: array of object);
///--
procedure Writeln(f: AbstractBinaryFile);
///--
procedure Writeln(f: AbstractBinaryFile; val: object);
///--
procedure Writeln(f: AbstractBinaryFile; params vals: array of object);

///- function FilePos(f: �������� ����): int64;
/// ���������� ������� ������� ��������� ��������� � �������� ����� 
function FilePos(f: TypedFile): int64;
///- function FileSize(f: �������� ����): int64;
/// ���������� ���������� ��������� � �������� �����
function FileSize(f: TypedFile): int64;
///- procedure Seek(f: �������� ����; n: int64);
/// ������������� ������� ������� ��������� ��������� � �������� ����� �� ������� � ������ �������  
procedure Seek(f: TypedFile; n: int64);
///--
procedure TypedFileInit(var f: TypedFile; ElementType: System.Type);
///--
procedure TypedFileInit(var f: TypedFile; ElementType: System.Type; off: integer; params offs: array of integer);
///--
procedure TypedFileInitWithShortString(var f: TypedFile; ElementType: System.Type; off: integer; params offs: array of integer);
///--
function TypedFileRead(f: TypedFile): object;

///--
function FilePos(f: BinaryFile): int64;
///--
function FileSize(f: BinaryFile): int64;
///--
procedure Seek(f: BinaryFile; n: int64);
///--
procedure BinaryFileInit(var f: BinaryFile);
///--
function BinaryFileRead(var f: BinaryFile; ElementType: System.Type): object;

// -----------------------------------------------------
//>>     C�������� ������������ # System subroutines
// -----------------------------------------------------
/// ���������� ������ PascalABC.NET
function PascalABCVersion: string;
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
/// ������������� ������� �������. ���������� True, ���� ������� ������� ������
function SetCurrentDir(s: string): boolean;

/// �������� ���������� ����� � ������ name �� newext
function ChangeFileNameExtension(name, newext: string): string;
/// ���������� True, ���� ���� � ������ name ����������
function FileExists(name: string): boolean;

/// ������� � ����������� ���� ���� ������� ����������� ���� ������� �� �����������
procedure Assert(cond: boolean; sourceFile: string := ''; line: integer := 0);
/// ������� � ����������� ���� ��������������� ��������� � ���� ������� ����������� ���� ������� �� �����������
procedure Assert(cond: boolean; message: string; sourceFile: string := ''; line: integer := 0);

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
/// ���������� ���������� ����������� � ������� ���������� ������ Milliseconds ��� MillisecondsDelta 
function MillisecondsDelta: integer;

/// ��������� ������ ���������
procedure Halt;
/// ��������� ������ ���������, ��������� ��� ������ exitCode
procedure Halt(exitCode: integer);

/// ������ ����� �� ms �����������
procedure Sleep(ms: integer);
/// ��������� ��� ����������� .exe-�����
function GetEXEFileName: string;
/// ����������� ��������� � ���������� �������������
function PointerToString(p: pointer): string;

/// ��������� ��������� ��� �������� � ������ filename 
procedure Exec(filename: string);
/// ��������� ��������� ��� �������� � ������ filename � ����������� ��������� ������ args
procedure Exec(filename: string; args: string);
/// ��������� ��������� ��� �������� � ������ filename 
procedure Execute(filename: string);
/// ��������� ��������� ��� �������� � ������ filename � ����������� ��������� ������ args
procedure Execute(filename: string; args: string);

/// ���������� ������������������ ���� ������ �� ��������� ����, ��������������� ������� ������ 
function EnumerateFiles(path: string; searchPattern: string := '*.*'): sequence of string;
/// ���������� ������������������ ���� ������ �� ��������� ����, ��������������� ������� ������, ������� ����������� 
function EnumerateAllFiles(path: string; searchPattern: string := '*.*'): sequence of string;
/// ���������� ������������������ ���� ��������� �� ��������� ����
function EnumerateDirectories(path: string): sequence of string;
/// ���������� ������������������ ���� ��������� �� ��������� ����, ������� �����������
function EnumerateAllDirectories(path: string): sequence of string;

///-procedure New<T>(var p: ^T); 
/// �������� ������������ ������ ������� sizeof(T) � ���������� � ���������� p ��������� �� ���. ��� T ������ ���� ��������� 
//procedure New<T>(var p: ^T); 

///-procedure Dispose<T>(var p: ^T); 
/// ����������� ������������ ������, �� ������� ��������� p 
//procedure Dispose<T>(var p: ^T); 


// -----------------------------------------------------
//>>     ������������ ��� ������ � ������� ������ # Functions for file names
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
//>>     �������������� ������������ # Math subroutines
// -----------------------------------------------------
///-function Sign(x: �����): �����;
/// ���������� ���� ����� x
function Sign(x: shortint): integer;
///--
function Sign(x: smallint): integer;
///--
function Sign(x: integer): integer;
///--
function Sign(x: BigInteger): integer;
///--
function Sign(x: longword): integer;
///--
function Sign(x: int64): integer;
///--
function Sign(x: uint64): integer;
///--
function Sign(x: real): integer;
///-function Abs(x: �����): �����;
/// ���������� ������ ����� x
function Abs(x: integer): integer;
///--
function Abs(x: shortint): shortint;
///--
function Abs(x: smallint): smallint;
///--
function Abs(x: BigInteger): BigInteger;
///--
function Abs(x: longword): longword;
///--
function Abs(x: int64): int64;
///--
function Abs(x: uint64): uint64;
///--
function Abs(x: real): real;
///--
function Abs(x: single): single;
/// ���������� ����� ����� x
function Sin(x: real): real;
/// ���������� ��������������� ����� ����� x
function Sinh(x: real): real;
/// ���������� ������� ����� x
/// !! Returns the cosine of number x
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
/// ���������� ����������� �������� ����� x
function Log(x: real): real;
/// ���������� �������� ����� x �� ��������� 2
function Log2(x: real): real;
/// ���������� ���������� �������� ����� x
function Log10(x: real): real;
/// ���������� �������� ����� x �� ��������� base
function LogN(base, x: real): real;
/// ���������� ���������� ������ ����� x
function Sqrt(x: real): real;
///-function Sqr(x: �����): �����;
/// ���������� ������� ����� x
function Sqr(x: integer): int64;
///--
function Sqr(x: shortint): integer;
///--
function Sqr(x: smallint): integer;
///--
function Sqr(x: BigInteger): BigInteger;
///--
function Sqr(x: longword): uint64;
///--
function Sqr(x: int64): int64;
///--
function Sqr(x: uint64): uint64;
///--
function Sqr(x: real): real;
/// ���������� x � ������� y
function Power(x, y: real): real;
/// ���������� x � ����� ������� n
function Power(x: real; n: integer): real;
/// ���������� x � ������� y
function Power(x: BigInteger; y: integer): BigInteger;
/// ���������� x, ����������� �� ���������� ������. ���� ������������ ��������� ���������� ����� ����� ������, 
///�� ���������� �������������� � ���������� ������� (���������� ����������): Round(2.5)=2, Round(3.5)=4
function Round(x: real): integer;
/// ���������� x, ����������� �� ���������� ������������� � digits ������� ����� ���������� �����
function Round(x: real; digits: integer): real;
/// ���������� x, ����������� �� ���������� �������� ������
function RoundBigInteger(x: real): BigInteger;
/// ���������� ����� ����� ������������� ����� x
function Trunc(x: real): integer;
/// ���������� ����� ����� ������������� ����� x ��� ������� �����
function TruncBigInteger(x: real): BigInteger;
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
/// ���������� ������ �� ���� ��������� ����� � ��������� �� 0 �� maxValue-1
function Random2(maxValue: integer): (integer, integer);
/// ���������� ������ �� ���� ��������� ����� � ��������� �� a �� b
function Random2(a, b: integer): (integer, integer);
/// ���������� ������ �� ���� ��������� ������������ � ��������� [0..1)
function Random2: (real, real);
/// ���������� ������ �� ���� ��������� ����� � ��������� �� 0 �� maxValue-1
function Random3(maxValue: integer): (integer, integer, integer);
/// ���������� ������ �� ���� ��������� ����� � ��������� �� a �� b
function Random3(a, b: integer): (integer, integer, integer);
/// ���������� ������ �� ���� ��������� ������������ � ��������� [0..1)
function Random3: (real, real, real);

///-function Max(a: �����, b: �����): �����;
/// ���������� ������������ �� ����� a,b
function Max(a, b: byte): byte;
///--
function Max(a, b: shortint): shortint;
///--
function Max(a, b: smallint): smallint;
///--
function Max(a, b: word): word;
///--
function Max(a, b: integer): integer;
///--
function Max(a, b: BigInteger): BigInteger;
///--
function Max(a, b: longword): longword;
///--
function Max(a, b: int64): int64;
///--
function Max(a, b: uint64): uint64;
///--
function Max(a, b: real): real;
///-function Min(a: �����, b: �����): �����;
/// ���������� ����������� �� ����� a,b
function Min(a, b: byte): byte;
///--
function Min(a, b: shortint): shortint;
///--
function Min(a, b: word): word;
///--
function Min(a, b: smallint): smallint;
///--
function Min(a, b: integer): integer;
///--
function Min(a, b: BigInteger): BigInteger;
///--
function Min(a, b: longword): longword;
///--
function Min(a, b: int64): int64;
///--
function Min(a, b: uint64): uint64;
///--
function Min(a, b: real): real;
///-function Odd(i: �����): boolean;
/// ���������� True, ���� i �������, � False � ��������� ������
function Odd(i: byte): boolean;
///--
function Odd(i: shortint): boolean;
///--
function Odd(i: word): boolean;
///--
function Odd(i: smallint): boolean;
///--
function Odd(i: integer): boolean;
///--
function Odd(i: BigInteger): boolean;
///--
function Odd(i: longword): boolean;
///--
function Odd(i: int64): boolean;
///--
function Odd(i: uint64): boolean;

// -----------------------------------------------------
//>>     ������������ ��� ������ � ������������ ������� # Functions for Complex numbers
// -----------------------------------------------------
/// ������������ ����������� ����� � ������������ ������ re � ������ ������ im
function Cplx(re, im: real): Complex;
/// ������������ ����������� ����� �� �������� �����������
function CplxFromPolar(magnitude, phase: real): Complex;
/// ���������� ���������� ������ �� ������������ �����
function Sqrt(c: Complex): Complex;
/// ���������� ������ ������������ �����
function Abs(c: Complex): Complex;
/// ���������� ���������� ����������� �����
function Conjugate(c: Complex): Complex;
/// ���������� ������� ������������ �����
function Cos(c: Complex): Complex;
/// ���������� ���������� ������������ �����
function Exp(c: Complex): Complex;
/// ���������� ����������� �������� ������������ �����
function Ln(c: Complex): Complex;
/// ���������� ����������� �������� ������������ �����
function Log(c: Complex): Complex;
/// ���������� ���������� �������� ������������ �����
function Log10(c: Complex): Complex;
/// ���������� ������� ������������ �����
function Power(c, power: Complex): Complex;
/// ���������� ����� ������������ �����
function Sin(c: Complex): Complex;

// -----------------------------------------------------
//>>     ������������ ��� ������ �� ������������ ����������� # Subroutines for set of T
// -----------------------------------------------------
///- procedure Include(var s: set of T; element: T);
///��������� ������� element �� ��������� s
procedure Include(var s: TypedSet; el: object);
///- procedure Exclude(var s: set of T; element: T);
///������� ������� element �� ��������� s
procedure Exclude(var s: TypedSet; el: object);

// -----------------------------------------------------
//>>     ������������ ��� ������ � ��������� # Subroutines for char
// -----------------------------------------------------
/// ����������� ��� ������� c �� 1
procedure Inc(var c: char);
/// ����������� ��� ������� c �� n
procedure Inc(var c: char; n: integer);
/// ��������� ��� ������� c �� 1
procedure Dec(var c: char);
/// ��������� ��� ������� c �� n
procedure Dec(var c: char; n: integer);
/// ���������� �������������� x ������
function Pred(x: char): char;
/// ���������� ��������� �� x ������
function Succ(x: char): char;
/// ����������� ��� � ������ � ��������� Windows
function ChrAnsi(a: byte): char;
/// ����������� ������ � ��� � ��������� Windows
function OrdAnsi(a: char): byte;
/// ����������� ��� � ������ � ��������� Unicode 
function Chr(a: word): char;
/// ����������� ������ � ��� � ��������� Unicode 
function Ord(a: char): word;
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

// -----------------------------------------------------
//>>     ������������ ��� ������ �� �������� # Subroutines for string
// -----------------------------------------------------
///-procedure Str(i: �����; var s: string);
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
function Pos(subs, s: string; from: integer := 1): integer;
/// ���������� ������� ��������� subs � ������ s ������� � ������� from. ���� �� �������, ���������� 0 
function PosEx(subs, s: string; from: integer := 1): integer;
/// ���������� ������� ���������� ��������� ��������� subs � ������ s. ���� �� �������, ���������� 0 
function LastPos(subs, s: string): integer;
/// ���������� ������� ���������� ��������� ��������� subs � ������ s ������� � ������� from. ���� �� �������, ���������� 0 
function LastPos(subs, s: string; from: integer): integer;

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
///-function Concat(s1,s2,...): string; 
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
/// ���������� ��������������� ������ � ��������� ����� length ������� � ������� index
function ReverseString(s: string; index,length: integer): string;
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
/// ����������� ��������� ������������� ������������� ����� � ��������� ��������
function StrToReal(s: string): real;
/// ����������� ��������� ������������� s ������ ����� � ��������� �������� � ���������� ��� � value. 
///��� ������������� �������������� ������������ False
function TryStrToInt(s: string; var value: integer): boolean;
/// ����������� ��������� ������������� s ������ ����� � ��������� �������� � ���������� ��� � value. 
///��� ������������� �������������� ������������ False
function TryStrToInt64(s: string; var value: int64): boolean;
/// ����������� ��������� ������������� s ������������� ����� � ��������� �������� � ���������� ��� � value. 
///��� ������������� �������������� ������������ False
function TryStrToFloat(s: string; var value: real): boolean;
/// ����������� ��������� ������������� s ������������� ����� � ��������� �������� � ���������� ��� � value. 
///��� ������������� �������������� ������������ False
function TryStrToFloat(s: string; var value: single): boolean;
/// ����������� ��������� ������������� s ������������� ����� � ��������� �������� � ���������� ��� � value. 
///��� ������������� �������������� ������������ False
function TryStrToReal(s: string; var value: real): boolean;
/// ����������� ��������� ������������� s ������������� ����� � ��������� �������� � ���������� ��� � value. 
///��� ������������� �������������� ������������ False
function TryStrToSingle(s: string; var value: single): boolean;
/// ��������� ����� �� ������ ������� � ������� from � ������������� from �� ��������� ���������
function ReadIntegerFromString(s: string; var from: integer): integer;
/// ��������� ������������ �� ������ ������� � ������� from � ������������� from �� ��������� ���������
function ReadRealFromString(s: string; var from: integer): real;
/// ��������� �� ������ ������������������ �������� �� ����������� ������� ������� � ������� from � ������������� from �� ��������� ���������
function ReadWordFromString(s: string; var from: integer): string;
/// ���������� True ���� ��������� ����� ������ ��� � ������ �������� ������ ���������� ������� � False � ��������� ������
function StringIsEmpty(s: string; var from: integer): boolean;
/// ��������� ����� �� ������ ������� � ������� from � ������������� from �� ��������� ���������. 
///���������� True ���� ���������� ������ � False � ��������� ������
function TryReadIntegerFromString(s: string; var from: integer; var res: integer): boolean;
/// ��������� ������������ �� ������ ������� � ������� from � ������������� from �� ��������� ���������. 
///���������� True ���� ���������� ������ � False � ��������� ������
function TryReadRealFromString(s: string; var from: integer; var res: real): boolean;

///-procedure Val(s: string; var value: �����; var err: integer);
/// ����������� ��������� ������������� s ������ ����� � ��������� �������� � ���������� ��� � ���������� value. 
///���� �������������� �������, �� err=0, ����� err>0
procedure Val(s: string; var value: integer; var err: integer);
///--
procedure Val(s: string; var value: shortint; var err: integer);
///--
procedure Val(s: string; var value: smallint; var err: integer);
///--
procedure Val(s: string; var value: int64; var err: integer);
///--
procedure Val(s: string; var value: byte; var err: integer);
///--
procedure Val(s: string; var value: word; var err: integer);
///--
procedure Val(s: string; var value: longword; var err: integer);
///--
procedure Val(s: string; var value: uint64; var err: integer);
///--
procedure Val(s: string; var value: real; var err: integer);
///--
procedure Val(s: string; var value: single; var err: integer);

/// ����������� ����� ����� � ���������� �������������
function IntToStr(a: integer): string;
/// ����������� ����� ����� � ���������� �������������
function IntToStr(a: int64): string;
/// ����������� ������������ ����� � ���������� �������������
function FloatToStr(a: real): string;

/// ���������� ����������������� ������, ����������� �� ��������� ������ � ������ ������������� ���������� 
function Format(formatstring: string; params pars: array of object): string;

// -----------------------------------------------------
//>>     ����� ������������ # Common subroutines
// -----------------------------------------------------
/// ����������� �������� ���������� i �� 1
procedure Inc(var i: integer);
/// ����������� �������� ���������� i �� n
procedure Inc(var i: integer; n: integer);
/// ��������� �������� ���������� i �� 1
procedure Dec(var i: integer);
/// ��������� �������� ���������� i �� n
procedure Dec(var i: integer; n: integer);
///-procedure Inc(var e: ������������ ���);
/// ����������� �������� ������������� ���� �� 1
procedure Inc(var b: byte);
///-procedure Inc(var e: ������������ ���; n: integer);
/// ����������� �������� ������������� ���� �� n
procedure Inc(var b: byte; n: integer);
///-procedure Dec(var e: ������������ ���);
/// ��������� �������� ������������� ���� �� 1
procedure Dec(var b: byte);
///-procedure Dec(var e: ������������ ���; n: integer);
/// ��������� �������� ������������� ���� �� n
procedure Dec(var b: byte; n: integer);
///--
procedure Inc(var f: boolean);
///--
procedure Dec(var f: boolean);
///-function Ord(a: �����): �����;
/// ���������� ���������� ����� �������� a
function Ord(a: integer): integer;
///-function Ord(a: ������������ ���): integer;
/// ���������� ���������� ����� �������� a
function Ord(a: longword): longword;
///--
function Ord(a: int64): int64;
///--
function Ord(a: uint64): uint64;
///--
function Ord(a: boolean): integer;

///-function Succ(x: �����): �����;
/// ���������� ��������� �� x ��������
function Succ(x: integer): integer;
///-function Succ(x: ������������ ���): ������������ ���;
/// ���������� ��������� �� x ��������
function Succ(x: byte): byte;
///--
function Succ(x: shortint): shortint;
///--
function Succ(x: smallint): smallint;
///--
function Succ(x: word): word;
///--
function Succ(x: longword): longword;
///--
function Succ(x: int64): int64;
///--
function Succ(x: uint64): uint64;
///--
function Succ(x: boolean): boolean;

///-function Pred(x: �����): �����;
/// ���������� �������������� x ��������
function Pred(x: integer): integer;
///-function Pred(x: ������������ ���): ������������ ���;
/// ���������� �������������� x ��������
function Pred(x: byte): byte;
///--
function Pred(x: shortint): shortint;
///--
function Pred(x: smallint): smallint;
///--
function Pred(x: word): word;
///--
function Pred(x: longword): longword;
///--
function Pred(x: int64): int64;
///--
function Pred(x: uint64): uint64;
///--
function Pred(x: boolean): boolean;

/// ������ ������� �������� ���� ����������
procedure Swap<T>(var a, b: T);
/// ���������� True, ���� ��������� ����� ������
function Eoln: boolean;
/// ���������� True, ���� ��������� ����� ������ �����
function Eof: boolean;

// -----------------------------------------------------
//>>     ������������ ��� ������ � ������������� ��������� # Subroutines for array of T
// -----------------------------------------------------
///- function Low(a: array of T): integer;
/// ���������� 0
function Low(i: System.Array): integer;
///- function High(a: array of T): integer;
/// ���������� ������� ������� ������������� �������
function High(i: System.Array): integer;
///- function Length(a: array of T): integer;
/// ���������� ����� ������������� �������
function Length(a: System.Array): integer;
///- function Length(a: array of T; dim: integer): integer;
/// ���������� ����� ������������� ������� �� ����������� dim
function Length(a: System.Array; dim: integer): integer;
///- procedure SetLength(var a: array of T);
/// ������������� ����� ����������� ������������� �������. ������ ���������� �����������
//procedure SetLength(var a: System.Array);
///- procedure SetLength(var a: array of T; n1,n2,...: integer);
/// ������������� ������� n-������� ������������� �������. ������ ���������� �����������
//procedure SetLength(var a: System.Array);
///- function Copy(a: array of T): array of T;
/// ������ ����� ������������� �������
function Copy(a: System.Array): System.Array;
/// ��������� ������������ ������ �� �����������
procedure Sort<T>(a: array of T);
/// ��������� ������������ ������ �� �������� ����������, ����������� �������� ��������� cmp
procedure Sort<T>(a: array of T; cmp: (T,T)->integer);
/// ��������� ������������ ������ �� �������� ����������, ����������� �������� ��������� less
procedure Sort<T>(a: array of T; less: (T,T)->boolean);
/// ��������� ������ �� �����������
procedure Sort<T>(l: List<T>);
/// ��������� ������ �� �������� ����������, ����������� �������� ��������� cmp
procedure Sort<T>(l: List<T>; cmp: (T,T)->integer);
/// ��������� ������ �� �������� ����������, ����������� �������� ��������� less
procedure Sort<T>(l: List<T>; less: (T,T)->boolean);
/// �������� ������� ��������� � ������������ ������� �� ���������������
procedure Reverse<T>(a: array of T);
/// �������� ������� ��������� �� ��������������� � ��������� ������������� ������� ����� count, ������� � ������� index
procedure Reverse<T>(a: array of T; index, count: integer);
/// �������� ������� ��������� � ������ �� ���������������
procedure Reverse<T>(a: List<T>);
/// �������� ������� ��������� �� ��������������� � ��������� ������ ����� count, ������� � ������� index
procedure Reverse<T>(a: List<T>; index, count: integer);
/// ������������ ������������ ������ ��������� �������
procedure Shuffle<T>(a: array of T);
/// ������������ ������ ��������� �������
procedure Shuffle<T>(l: List<T>);

// -----------------------------------------------------
//>>     ������������ ��� ��������� ������������������� # Subroutines for sequence generation
// -----------------------------------------------------
/// ���������� ������������������ ����� �� a �� b
function Range(a, b: integer): sequence of integer;
/// ���������� ������������������ �������� �� c1 �� c2
function Range(c1, c2: char): sequence of char;
/// ���������� ������������������ ������������ � ������ ��������� ������� [a,b] �� n ������ ������ (����������� Partition)
function Range(a, b: real; n: integer): sequence of real;
/// ���������� ������������������ ������������ � ������ ��������� ������� [a,b] �� n ������ ������
function Partition(a, b: real; n: integer): sequence of real;
/// ���������� ������������������ ����� �� a �� b � ����� step
function Range(a, b, step: integer): sequence of integer;
/// ���������� ������������������ ��������� ���������
function Seq<T>(params a: array of T): sequence of T;
/// ���������� ������������������ �� n ��������� ����� ���������
function SeqRandom(n: integer := 10; a: integer := 0; b: integer := 100): sequence of integer;
/// ���������� ������������������ �� n ��������� ����� ���������
function SeqRandomInteger(n: integer := 10; a: integer := 0; b: integer := 100): sequence of integer;
/// ���������� ������������������ �� n ��������� ������������ ���������
function SeqRandomReal(n: integer := 10; a: real := 0; b: real := 10): sequence of real;
/// ���������� ������������������ �� count ���������, ����������� ���������� f(i)
function SeqGen<T>(count: integer; f: integer->T): sequence of T;
/// ���������� ������������������ �� count ���������, ����������� ���������� f(i), ������� � i=from
function SeqGen<T>(count: integer; f: integer->T; from: integer): sequence of T;
/// ���������� ������������������ �� count ���������, ������������ � first, � �������� next �������� �� ����������� � ���������� 
function SeqGen<T>(count: integer; first: T; next: T->T): sequence of T;
/// ���������� ������������������ �� count ���������, ������������ � first � second, 
///� �������� next �������� �� ���� ���������� � ���������� 
function SeqGen<T>(count: integer; first, second: T; next: (T,T) ->T): sequence of T;
/// ���������� ������������������ ��������� � ��������� ��������� first, 
///�������� next �������� �� ����������� � ���������� � �������� pred ����������� ������������������ 
function SeqWhile<T>(first: T; next: T->T; pred: T->boolean): sequence of T;
/// ���������� ������������������ ���������, ������������ � first � second, 
///� �������� next �������� �� ���� ���������� � ���������� � �������� pred ����������� ������������������ 
function SeqWhile<T>(first, second: T; next: (T,T) ->T; pred: T->boolean): sequence of T;
/// ���������� ������������������ �� count ��������� x 
function SeqFill<T>(count: integer; x: T): sequence of T;

/// ���������� ������������������ �� n �����, ��������� � ����������
function ReadSeqInteger(n: integer): sequence of integer;
/// ���������� ������������������ �� n ������������, ��������� � ����������
function ReadSeqReal(n: integer): sequence of real;
/// ���������� ������������������ �� n �����, ��������� � ����������
function ReadSeqString(n: integer): sequence of string;

/// ������� ����������� � ����� � ���������� ������������������ �� n �����, ��������� � ����������
function ReadSeqInteger(prompt: string; n: integer): sequence of integer;
/// ������� ����������� � ����� � ���������� ������������������ �� n ������������, ��������� � ����������
function ReadSeqReal(prompt: string; n: integer): sequence of real;
/// ������� ����������� � ����� � ���������� ������������������ �� n �����, ��������� � ����������
function ReadSeqString(prompt: string; n: integer): sequence of string;

/// ���������� ������������������ �����, �������� � ���������� ���� ����������� ������������ �������
function ReadSeqIntegerWhile(cond: integer->boolean): sequence of integer;
/// ���������� ������������������ ������������, �������� � ���������� ���� ����������� ������������ �������
function ReadSeqRealWhile(cond: real->boolean): sequence of real;
/// ���������� ������������������ �����, �������� � ���������� ���� ����������� ������������ �������
function ReadSeqStringWhile(cond: string->boolean): sequence of string;

/// ������� ����������� � ����� � ���������� ������������������ �����, �������� � ���������� ���� ����������� ������������ �������
function ReadSeqIntegerWhile(prompt: string; cond: integer->boolean): sequence of integer;
/// ������� ����������� � ����� � ���������� ������������������ ������������, �������� � ���������� ���� ����������� ������������ �������
function ReadSeqRealWhile(prompt: string; cond: real->boolean): sequence of real;
/// ������� ����������� � ����� � ���������� ������������������ �����, �������� � ���������� ���� ����������� ������������ �������
function ReadSeqStringWhile(prompt: string; cond: string->boolean): sequence of string;

// -----------------------------------------------------
//>>     ������������ ��� �������� ������������ �������� # Subroutines for array of T generation
// -----------------------------------------------------
/// ���������� ������, ����������� ���������� ����������
function Arr<T>(params a: array of T): array of T;
/// ���������� ������, ����������� ���������� �� �����������������
function Arr<T>(a: sequence of T): array of T;
/// ���������� ������ ������� n, ����������� ���������� ������ ����������
function ArrRandom(n: integer := 10; a: integer := 0; b: integer := 100): array of integer;
/// ���������� ������ ������� n, ����������� ���������� ������ ����������
function ArrRandomInteger(n: integer := 10; a: integer := 0; b: integer := 100): array of integer;
/// ���������� ������ ������� n, ����������� ���������� ������������� ����������
function ArrRandomReal(n: integer := 10; a: real := 0; b: real := 10): array of real;
/// ���������� ������ �� count ���������, ����������� ���������� gen(i)
function ArrGen<T>(count: integer; gen: integer->T): array of T;
/// ���������� ������ �� count ���������, ����������� ���������� gen(i), ������� � i=from
function ArrGen<T>(count: integer; gen: integer->T; from: integer): array of T;
/// ���������� ������ �� count ���������, ������������ � first, � �������� next �������� �� ����������� � ���������� 
function ArrGen<T>(count: integer; first: T; next: T->T): array of T;
/// ���������� ������ �� count ���������, ������������ � first � second, � �������� next �������� �� ���� ���������� � ���������� 
function ArrGen<T>(count: integer; first, second: T; next: (T,T) ->T): array of T;
/// ���������� ������ �� count ��������� x 
function ArrFill<T>(count: integer; x: T): array of T;

/// ���������� ������ �� n �����, ��������� � ����������
function ReadArrInteger(n: integer): array of integer;
/// ���������� ������ �� n ������������, ��������� � ����������
function ReadArrReal(n: integer): array of real;
/// ���������� ������ �� n �����, ��������� � ����������
function ReadArrString(n: integer): array of string;

/// ������� ����������� � ����� � ���������� ������ �� n �����, ��������� � ����������
function ReadArrInteger(prompt: string; n: integer): array of integer;
/// ������� ����������� � ����� � ���������� ������ �� n ������������, ��������� � ����������
function ReadArrReal(prompt: string; n: integer): array of real;
/// ������� ����������� � ����� � ���������� ������ �� n �����, ��������� � ����������
function ReadArrString(prompt: string; n: integer): array of string;

// -----------------------------------------------------
//>>     ������������ ��� �������� ��������� ������������ �������� # Subroutines for matrixes 
// -----------------------------------------------------
/// ���������� ��������� ������ ������� m x n, ����������� ���������� ���������� �� �������
function Matr<T>(m,n: integer; params data: array of T): array [,] of T;
/// ���������� ��������� ������ ������� m x n, ����������� ���������� ������ ����������
function MatrRandom(m: integer := 5; n: integer := 5; a: integer := 0; b: integer := 100): array [,] of integer;
/// ���������� ��������� ������ ������� m x n, ����������� ���������� ������ ����������
function MatrRandomInteger(m: integer := 5; n: integer := 5; a: integer := 0; b: integer := 100): array [,] of integer;
/// ���������� ��������� ������ ������� m x n, ����������� ���������� ������������� ����������
function MatrRandomReal(m: integer := 5; n: integer := 5; a: real := 0; b: real := 10): array [,] of real;
/// ���������� ��������� ������ ������� m x n, ����������� ���������� x 
function MatrFill<T>(m, n: integer; x: T): array [,] of T;
/// ���������� ��������� ������ ������� m x n, ����������� ���������� x 
function MatrGen<T>(m, n: integer; gen: (integer,integer)->T): array [,] of T;
/// ������������� ��������� ������ 
function Transpose<T>(a: array [,] of T): array [,] of T;
/// ���������� ������� m �� n �����, ��������� � ����������
function ReadMatrInteger(m, n: integer): array [,] of integer;
/// ���������� ������� m �� n ������������, ��������� � ����������
function ReadMatrReal(m, n: integer): array [,] of real;


// -----------------------------------------------------
//>>     ������������ ��� �������� �������� # Subroutines for tuple generation
// -----------------------------------------------------
///- function Rec(x1: T1, x2: T2,...): (T1,T2,...);
/// ���������� ������ �� ��������� ������ �����
function Rec<T1, T2>(x1: T1; x2: T2): System.Tuple<T1, T2>;
///--
function Rec<T1, T2, T3>(x1: T1; x2: T2; x3: T3): (T1, T2, T3);
///--
function Rec<T1, T2, T3, T4>(x1: T1; x2: T2; x3: T3; x4: T4): (T1, T2, T3, T4);
///--
function Rec<T1, T2, T3, T4, T5>(x1: T1; x2: T2; x3: T3; x4: T4; x5: T5): (T1, T2, T3, T4, T5);
///--
function Rec<T1, T2, T3, T4, T5, T6>(x1: T1; x2: T2; x3: T3; x4: T4; x5: T5; x6: T6): (T1, T2, T3, T4, T5, T6);
///--
function Rec<T1, T2, T3, T4, T5, T6, T7>(x1: T1; x2: T2; x3: T3; x4: T4; x5: T5; x6: T6; x7: T7): (T1, T2, T3, T4, T5, T6, T7);

// -----------------------------------------------------
//>>     �������� ������� Lst, LLst, HSet, SSet, Dict, KV # Short functions Lst, HSet, SSet, Dict, KV
// -----------------------------------------------------
/// ���������� ������, ����������� ���������� ����������
function Lst<T>(params a: array of T): List<T>;
/// ���������� ������, ����������� ���������� �� ������������������
function Lst<T>(a: sequence of T): List<T>;
/// ���������� ���������� ������, ����������� ���������� ����������
function LLst<T>(params a: array of T): LinkedList<T>;
/// ���������� ���������� ������, ����������� ���������� �� ������������������
function LLst<T>(a: sequence of T): LinkedList<T>;
/// ���������� ��������� �� ���� ��� �������, ����������� ���������� ����������
function HSet<T>(params a: array of T): HashSet<T>;
/// ���������� ��������� �� ���� ��� �������, ����������� ���������� �� ������������������
function HSet<T>(a: sequence of T): HashSet<T>;
/// ���������� ��������� �� ���� ��������� ������ ������, ����������� ���������� �� ������������������
function SSet<T>(params a: array of T): SortedSet<T>;
/// ���������� ��������� �� ���� ��������� ������ ������, ����������� ���������� �� ������������������
function SSet<T>(a: sequence of T): SortedSet<T>;
/// ���������� ������� ��� ��������� (����, ��������)
function Dict<TKey, TVal>(params pairs: array of KeyValuePair<TKey, TVal>): Dictionary<TKey, TVal>;
/// ���������� ������� ��� ��������� (����, ��������)
function Dict<TKey, TVal>(params pairs: array of (TKey, TVal)): Dictionary<TKey, TVal>;
/// ���������� ���� ��������� (����, ��������)
function KV<TKey, TVal>(key: TKey; value: TVal): KeyValuePair<TKey, TVal>;


// -----------------------------------------------------
//>>     ��������� ����������� ������������������� # Infinite sequences
// -----------------------------------------------------
// ���������� ������� 2016: Iterate, Step, Repeat, Cycle

// ���������� ����������� ������������ ������������������ ���������, ���������� ��������� ��������� � �������� next
///--
function Iterate<T>(Self: T; next: T->T): sequence of T; extensionmethod;
begin
  Result := Iterate<T>(Self, next);
end;

// ���������� ����������� ������������ ������������������ ���������, ���������� ��������� ���������, ��������� �� ��� ��������� � �������� next
///--
function Iterate<T>(Self, second: T; next: (T,T) ->T): sequence of T; extensionmethod;
begin
  Result := Iterate<T>(Self, second, next);
end;

/// ���������� ����������� ������������������ ����� �� �������� �������� � ����� 1
function Step(Self: integer): sequence of integer; extensionmethod;
begin
  while True do
  begin
    yield Self;
    Self += 1;
  end;
end;

/// ���������� ����������� ������������������ ����� �� �������� �������� � ����� step
function Step(Self: integer; step: integer): sequence of integer; extensionmethod;
begin
  while True do
  begin
    yield Self;
    Self += step;
  end;
end;

/// ���������� ����������� ������������������ ������������ �� �������� �������� � ����� step
function Step(Self: real; step: real): sequence of real; extensionmethod;
begin
  while True do
  begin
    yield Self;
    Self += step;
  end;
end;

// ���������� ����������� ������������������ ���������, ����������� � ������
///--
function Repeat<T>(Self: T): sequence of T; extensionmethod;
begin
  while True do
    yield Self;
end;

/// ��������� ������������������ ����������� ����� ���
function Cycle<T>(Self: sequence of T): sequence of T; extensionmethod;
begin
  while True do
  begin
    foreach var x in Self do
      yield x;
  end;
end;

// -----------------------------------------------------
//>>     ��������� ������ XXX - �� �������! # XXX
// -----------------------------------------------------
type
  AdjGroupClass<T> = class
  private 
    cur: T;
    enm: IEnumerator<T>;
    fin: boolean;
  public 
    constructor Create(a: sequence of T);
    begin
      enm := a.GetEnumerator();
      fin := enm.MoveNext;
      if fin then
        cur := enm.Current;
    end;
    
    function TakeGroup: sequence of T;
    begin
      yield cur;
      fin := enm.movenext;
      while fin do
      begin
        if enm.current = cur then
          yield enm.current
        else
        begin
          cur := enm.Current;
          break;
        end;
        fin := enm.movenext;
      end;  
    end;
  end;

//------------------------------------------------------------------------------
//>>     ����� ���������� Print ��� ������������ ����� # Print for elementary types
//------------------------------------------------------------------------------
function Print(Self: integer): integer; extensionmethod;
begin
  PABCSystem.Print(Self);
  Result := Self;
end;

function Print(Self: real): real; extensionmethod;
begin
  PABCSystem.Print(Self);
  Result := Self;
end;

function Print(Self: char): char; extensionmethod;
begin
  PABCSystem.Print(Self);
  Result := Self;
end;

function Print(Self: boolean): boolean; extensionmethod;
begin
  PABCSystem.Print(Self);
  Result := Self;
end;

function Print(Self: BigInteger): BigInteger; extensionmethod;
begin
  PABCSystem.Print(Self);
  Result := Self;
end;

function Println(Self: integer): integer; extensionmethod;
begin
  PABCSystem.Println(Self);
  Result := Self;
end;

function Println(Self: real): real; extensionmethod;
begin
  PABCSystem.Println(Self);
  Result := Self;
end;

function Println(Self: char): char; extensionmethod;
begin
  PABCSystem.Println(Self);
  Result := Self;
end;

function Println(Self: boolean): boolean; extensionmethod;
begin
  PABCSystem.Println(Self);
  Result := Self;
end;

function Println(Self: BigInteger): BigInteger; extensionmethod;
begin
  PABCSystem.Println(Self);
  Result := Self;
end;



//------------------------------------------------------------------------------
//>>     ������ ���������� ������������������� # Extension methods for sequence of T
//------------------------------------------------------------------------------
/// ������� ������������������ �� �����, ��������� delim � �������� �����������
function Print<T>(Self: sequence of T; delim: string): sequence of T; extensionmethod;
begin
  var g := Self.GetEnumerator();
  if g.MoveNext() then
    Write(g.Current);
  while g.MoveNext() do
    if delim <> '' then
      Write(delim, g.Current)
    else Write(g.Current);
  Result := Self; 
end;

/// ������� ������������������ �� �����, ��������� ������ � �������� �����������
function Print<T>(Self: sequence of T): sequence of T; extensionmethod;
begin
  if typeof(T) = typeof(char) then 
    Result := Self.Print('')
  else  
    Result := Self.Print(PrintDelimDefault);  
end;

/// ������� ������������������ �� �����, ��������� delim � �������� �����������, � ��������� �� ����� ������
function Println<T>(Self: sequence of T; delim: string): sequence of T; extensionmethod;
begin
  Self.Print(delim);
  Writeln;
  Result := Self;  
end;

/// ������� ������������������ �� �����, ��������� ������ �������� �����������, � ��������� �� ����� ������
function Println<T>(Self: sequence of T): sequence of T; extensionmethod;
begin
  if typeof(T) = typeof(char) then 
    Result := Self.Println('')
  else  
    Result := Self.Println(PrintDelimDefault);  
end;

/// ������� ������������������ ����� � ����
function WriteLines(Self: sequence of string; fname: string): sequence of string; extensionmethod;
begin
  WriteLines(fname, Self);
  Result := Self
end;

/// ������� ������������������, ������ ������� ��������� �� ����� ������
function PrintLines<T>(Self: sequence of T): sequence of T; extensionmethod;
begin
  Self.Println(NewLine);
  Result := Self
end;

/// ������� ������������������, ������ ������� ������������ � ������� ������� map � ��������� �� ����� ������
function PrintLines<T,T1>(Self: sequence of T; map: T->T1): sequence of T; extensionmethod;
begin
  Self.Select(map).Println(NewLine);
  Result := Self
end;

/// ����������� �������� ������������������ � ��������� �������������, ����� ���� ���������� �� � ������, ��������� delim � �������� �����������
function JoinIntoString<T>(Self: sequence of T; delim: string): string; extensionmethod;
begin
  var g := Self.GetEnumerator();
  var sb := new System.Text.StringBuilder('');
  if g.MoveNext() then
    sb.Append(g.Current.ToString());
  while g.MoveNext() do 
    sb.Append(delim + g.Current.ToString());
  Result := sb.ToString;  
end;

/// ����������� �������� ������������������ � ��������� �������������, ����� ���� ���������� �� � ������, ��������� ������ � �������� �����������
function JoinIntoString<T>(Self: sequence of T): string; extensionmethod;
begin
  if typeof(T) = typeof(char) then
    Result := Self.JoinIntoString('') 
  else Result := Self.JoinIntoString(' ');  
end;

/// ��������� �������� � ������� �������� ������������������
procedure ForEach<T>(Self: sequence of T; action: T -> ()); extensionmethod;
begin
  foreach x: T in Self do
    action(x);
end;

/// ��������� �������� � ������� �������� ������������������, ��������� �� ������ ��������
procedure ForEach<T>(Self: sequence of T; action: (T,integer) -> ()); extensionmethod;
begin
  var i := 0;
  foreach x: T in Self do
  begin
    action(x, i);
    i += 1;
  end;
end;

/// ���������� ��������������� �� ����������� ������������������
function Sorted<T>(Self: sequence of T): sequence of T; extensionmethod;
begin
  Result := Self.OrderBy(x -> x);
end;

/// ���������� ��������������� �� �������� ������������������
function SortedDescending<T>(Self: sequence of T): sequence of T; extensionmethod;
begin
  Result := Self.OrderByDescending(x -> x);
end;

/// ���������� ��������������� �� ����������� ������������������
function Order<T>(Self: sequence of T): sequence of T; extensionmethod;
begin
  Result := Self.OrderBy(x -> x);
end;

/// ���������� ��������������� �� �������� ������������������
function OrderDescending<T>(Self: sequence of T): sequence of T; extensionmethod;
begin
  Result := Self.OrderByDescending(x -> x);
end;

/// ���������� ��������� HashSet �� ������ ������������������
function ToHashSet<T>(Self: sequence of T): HashSet<T>; extensionmethod;
begin
  Result := new HashSet<T>(Self);
end;

/// ���������� ��������� SortedSet �� ������ ������������������
function ToSortedSet<T>(Self: sequence of T): SortedSet<T>; extensionmethod;
begin
  Result := new SortedSet<T>(Self);
end;

/// ���������� LinkedList �� ������ ������������������
function ToLinkedList<T>(Self: sequence of T): LinkedList<T>; extensionmethod;
begin
  Result := new LinkedList<T>(Self);
end;

// ���������� ������� 2016: MinBy, MaxBy, TakeLast, Slice, Cartesian, SplitAt, 
//   Partition, ZipTuple, UnZipTuple, Interleave, Numerate, Tabulate, Pairwise, Batch 

/// ���������� ������ ������� ������������������ � ����������� ��������� �����
function MinBy<T, TKey>(Self: sequence of T; selector: T->TKey): T; extensionmethod;
begin
  if selector = nil then
    raise new ArgumentNullException('selector');
  if not Self.Any() then
    raise new InvalidOperationException('Empty sequence');
  
  var comp := Comparer<TKey>.Default;
  Result := Self.Aggregate((min, x)-> comp.Compare(selector(x), selector(min)) < 0 ? x : min);
end;

/// ���������� ������ ������� ������������������ � ������������ ��������� �����
function MaxBy<T, TKey>(Self: sequence of T; selector: T->TKey): T; extensionmethod;
begin
  if selector = nil then
    raise new ArgumentNullException('selector');
  if not Self.Any() then
    raise new InvalidOperationException('Empty sequence');
  
  var comp := Comparer<TKey>.Default;
  Result := Self.Aggregate((max, x)-> comp.Compare(selector(x), selector(max)) > 0 ? x : max);
end;

/// ���������� ��������� ������� ������������������ � ����������� ��������� �����
function LastMinBy<T, TKey>(Self: sequence of T; selector: T->TKey): T; extensionmethod;
begin
  if selector = nil then
    raise new ArgumentNullException('selector');
  if not Self.Any() then
    raise new InvalidOperationException('Empty sequence');
  
  var comp := Comparer<TKey>.Default;
  Result := Self.Aggregate((min, x)-> comp.Compare(selector(x), selector(min)) <= 0 ? x : min);
end;

/// ���������� ��������� ������� ������������������ � ������������ ��������� �����
function LastMaxBy<T, TKey>(Self: sequence of T; selector: T->TKey): T; extensionmethod;
begin
  if selector = nil then
    raise new ArgumentNullException('selector');
  if not Self.Any() then
    raise new InvalidOperationException('Empty sequence');
  
  var comp := Comparer<TKey>.Default;
  Result := Self.Aggregate((max, x)-> comp.Compare(selector(x), selector(max)) >= 0 ? x : max);
end;

/// ���������� ��������� count ��������� ������������������
function TakeLast<T>(Self: sequence of T; count: integer): sequence of T; extensionmethod;
begin
  Result := Self.Reverse.Take(count).Reverse;
end;

/// ���������� ������������������ ��� ��������� count ��������� 
function SkipLast<T>(self: sequence of T; count: integer := 1): sequence of T; extensionmethod;
begin
  Result := Self.Reverse.Skip(count).Reverse;
end;

/// ��������� ������������ �������������������
function Cartesian<T, T1>(Self: sequence of T; b: sequence of T1): sequence of (T, T1); extensionmethod;
begin
  if b = nil then
    raise new System.ArgumentNullException('b');
  
  foreach var x in Self do
    foreach var y in b do
      yield (x, y)
end;

/// ��������� ������������ �������������������
function Cartesian<T, T1, T2>(Self: sequence of T; b: sequence of T1; func: (T,T1)->T2): sequence of T2; extensionmethod;
begin
  if b = nil then
    raise new System.ArgumentNullException('b');
  
  foreach var x in Self do
    foreach var y in b do
      yield func(x, y)
end;

/// ��������� ������������������ �� ��� � ������� ind
function SplitAt<T>(Self: sequence of T; ind: integer): (sequence of T, sequence of T); extensionmethod;
begin
  Result := (Self.Take(ind), Self.Skip(ind));
end;

// ToDo: �� �� ��� TakeWhile

// ToDo: SequenceCompare

/// ��������� ������������������ �� ��� �� ��������� �������
function Partition<T>(Self: sequence of T; cond: T->boolean): (sequence of T, sequence of T); extensionmethod;
begin
  Result := (Self.Where(cond), Self.Where(x -> not cond(x)));
end;

/// ��������� ������������������ �� ��� �� ��������� �������, � ������� ��������� ������
function Partition<T>(Self: sequence of T; cond: (T,integer)->boolean): (sequence of T, sequence of T); extensionmethod;
begin
  Result := (Self.Where(cond), Self.Where((x, i)-> not cond(x, i)));
end;

/// ���������� ��� ������������������ � ������������������ �������������� ��������
function ZipTuple<T, T1>(Self: sequence of T; a: sequence of T1): sequence of (T, T1); extensionmethod;
begin
  if a = nil then
    raise new System.ArgumentNullException('a');
  Result := Self.Zip(a, (x, y)-> (x, y));
end;

/// ���������� ��� ������������������ � ������������������ �������������� ��������
function ZipTuple<T, T1, T2>(Self: sequence of T; a: sequence of T1; b: sequence of T2): sequence of (T, T1, T2); extensionmethod;
begin
  if a = nil then
    raise new System.ArgumentNullException('a');
  if b = nil then
    raise new System.ArgumentNullException('b');
  Result := Self.Zip(a, (x, y)-> (x, y)).Zip(b, (p, z)-> (p[0], p[1], z));
end;

/// ���������� ������ ������������������ � ������������������ ����������������� ��������
function ZipTuple<T, T1, T2, T3>(Self: sequence of T; a: sequence of T1; b: sequence of T2; c: sequence of T3): sequence of (T, T1, T2, T3); extensionmethod;
begin
  if a = nil then
    raise new System.ArgumentNullException('a');
  if b = nil then
    raise new System.ArgumentNullException('b');
  if c = nil then
    raise new System.ArgumentNullException('c');
  Result := Self.Zip(a, (x, y)-> (x, y)).Zip(b, (p, z)-> (p[0], p[1], z)).Zip(c, (p, z)-> (p[0], p[1], p[2], z));
end;

/// ����������� ������������������ �������������� �������� �� ��� ������������������
function UnZipTuple<T, T1>(Self: sequence of (T, T1)): (sequence of T, sequence of T1); extensionmethod;
begin
  Result := (Self.Select(x -> x[0]), Self.Select(x -> x[1]))
end;

/// ����������� ������������������ �������������� �������� �� ��� ������������������
function UnZipTuple<T, T1, T2>(Self: sequence of (T, T1, T2)): (sequence of T, sequence of T1, sequence of T2); extensionmethod;
begin
  Result := (Self.Select(x -> x[0]), Self.Select(x -> x[1]), Self.Select(x -> x[2]))
end;

/// ����������� ������������������ ����������������� �������� �� ������ ������������������
function UnZipTuple<T, T1, T2, T3>(Self: sequence of (T, T1, T2, T3)): (sequence of T, sequence of T1, sequence of T2, sequence of T3); extensionmethod;
begin
  Result := (Self.Select(x -> x[0]), Self.Select(x -> x[1]), Self.Select(x -> x[2]), Self.Select(x -> x[3]))
end;

// ToDo - ������� UnZipTuple � ��������-���������

/// �������� �������� ���� �������������������
function Interleave<T>(Self: sequence of T; a: sequence of T): sequence of T; extensionmethod;
begin
  if a = nil then
    raise new System.ArgumentNullException('a');
  Result := Self.ZipTuple(a).SelectMany(x -> Seq(x[0], x[1]))
end;

/// �������� �������� ���� �������������������
function Interleave<T>(Self: sequence of T; a, b: sequence of T): sequence of T; extensionmethod;
begin
  if a = nil then
    raise new System.ArgumentNullException('a');
  if b = nil then
    raise new System.ArgumentNullException('b');
  Result := Self.ZipTuple(a, b).SelectMany(x -> Seq(x[0], x[1], x[2]))
end;

/// �������� �������� ������� �������������������
function Interleave<T>(Self: sequence of T; a, b, c: sequence of T): sequence of T; extensionmethod;
begin
  if a = nil then
    raise new System.ArgumentNullException('a');
  if b = nil then
    raise new System.ArgumentNullException('b');
  if c = nil then
    raise new System.ArgumentNullException('c');
  Result := Self.ZipTuple(a, b, c).SelectMany(x -> Seq(x[0], x[1], x[2], x[3]))
end;

/// �������� ������������������ � �������
function Numerate<T>(Self: sequence of T): sequence of (integer, T); extensionmethod;
begin
  Result := 1.Step.ZipTuple(Self);
end;

/// �������� ������������������ � ������ from
function Numerate<T>(Self: sequence of T; from: integer): sequence of (integer, T); extensionmethod;
begin
  Result := from.Step.ZipTuple(Self);
end;

/// ���������� ������� �������������������
function Tabulate<T, T1>(Self: sequence of T; F: T->T1): sequence of (T, T1); extensionmethod;
begin
  Result := Self.Select(x -> (x, f(x)));
end;

/// ���������� ������������������ � ������������������ ��� �������� ���������
function Pairwise<T>(Self: sequence of T): sequence of (T, T); extensionmethod;
begin
  var previous: T;
  var it := Self.GetEnumerator();
  if (it.MoveNext()) then
    previous := it.Current;
  
  while (it.MoveNext()) do
  begin
    yield (previous, it.Current);
    previous := it.Current;
  end
end;

/// ���������� ������������������ � ������������������ ��� �������� ���������, ��������� func � ������ ���� ���������� ��������� � �������� ����� ������������������ 
function Pairwise<T, Res>(Self: sequence of T; func: (T,T)->Res): sequence of Res; extensionmethod;
begin
  var previous: T;
  var it := Self.GetEnumerator();
  if (it.MoveNext()) then
    previous := it.Current;
  
  while (it.MoveNext()) do
  begin
    yield func(previous, it.Current);
    previous := it.Current;
  end
  //  Result := Self.ZipTuple(Self.Skip(1)).Select(x->func(x[0],x[1]));
end;

/// ��������� ������������������ �� ����� ����� size
function Batch<T>(Self: sequence of T; size: integer): sequence of sequence of T; extensionmethod;
begin
  Result := SeqWhile(Self, v -> v.Skip(size), v -> v.Count > 0).Select(v -> v.Take(size))
end;

/// ��������� ������������������ �� ����� ����� size � ��������� �������� � ������ �����
function Batch<T, Res>(Self: sequence of T; size: integer; proj: Func<IEnumerable<T>, Res>): sequence of Res; extensionmethod;
begin
  Result := SeqWhile(Self, v -> v.Skip(size), v -> v.Count > 0).Select(v -> v.Take(size)).Select(ss -> proj(ss));
end;

///--
function SliceSeqImpl<T>(Self: sequence of T; from, step, count: integer): sequence of T;
begin
  if step <= 0 then
    raise new ArgumentException(GetTranslation(PARAMETER_STEP_MUST_BE_GREATER_0));
  
  if from < 0 then
    raise new ArgumentException(GetTranslation(PARAMETER_FROM_OUT_OF_RANGE));
  
  Result := Self.Skip(from).Where((x, i)-> i mod step = 0)
end;

/// ���������� ���� ������������������ �� ������ from � ����� step > 0
function Slice<T>(Self: sequence of T; from, step: integer): sequence of T; extensionmethod;
begin
  if step <= 0 then
    raise new ArgumentException(GetTranslation(PARAMETER_STEP_MUST_BE_GREATER_0));
  
  if from < 0 then
    raise new ArgumentException(GetTranslation(PARAMETER_FROM_OUT_OF_RANGE));
  
  Result := Self.Skip(from).Where((x, i)-> i mod step = 0)
end;

/// ���������� ���� ������������������ �� ������ from � ����� step > 0 ����� �� ����� count
function Slice<T>(Self: sequence of T; from, step, count: integer): sequence of T; extensionmethod;
begin
  if step <= 0 then
    raise new ArgumentException(GetTranslation(PARAMETER_STEP_MUST_BE_GREATER_0));
  
  if from < 0 then
    raise new ArgumentException(GetTranslation(PARAMETER_FROM_OUT_OF_RANGE));
  
  Result := Self.Skip(from).Where((x, i)-> i mod step = 0).Take(count)
end;

// ���������� ���� 2016: Incremental
///--
{function IncrementalSeq(Self: sequence of integer): sequence of integer; 
begin
  var iter := Self.GetEnumerator();
  if iter.MoveNext() then
  begin
    var prevItem := iter.Current;
    while iter.MoveNext() do
    begin
      var nextItem := iter.Current;
      yield nextItem - prevItem;
      prevItem := nextItem;
    end
  end
end;

///--
function IncrementalSeq(Self: sequence of real): sequence of real;
begin
  var iter := Self.GetEnumerator();
  if iter.MoveNext() then
  begin
    var prevItem := iter.Current;
    while iter.MoveNext() do
    begin
      var nextItem := iter.Current;
      yield nextItem - prevItem;
      prevItem := nextItem;
    end
  end
end;

/// ���������� ������������������ ��������� �������� ��������� �������� ������������������
function Incremental(Self: sequence of integer): sequence of integer; extensionmethod;
begin
  Result := IncrementalSeq(Self);
end;

/// ���������� ������������������ ��������� �������� ��������� �������� ������������������
function Incremental(Self: array of integer): sequence of integer; extensionmethod;
begin
  Result := IncrementalSeq(Self);
end;

/// ���������� ������������������ ��������� �������� ��������� �������� ������������������
function Incremental(Self: List<integer>): sequence of integer; extensionmethod;
begin
  Result := IncrementalSeq(Self);
end;

/// ���������� ������������������ ��������� �������� ��������� �������� ������������������
function Incremental(Self: LinkedList<integer>): sequence of integer; extensionmethod;
begin
  Result := IncrementalSeq(Self);
end;

/// ���������� ������������������ ��������� �������� ��������� �������� ������������������
function Incremental(Self: sequence of real): sequence of real; extensionmethod;
begin
  Result := IncrementalSeq(Self);
end;

/// ���������� ������������������ ��������� �������� ��������� �������� ������������������
function Incremental(Self: array of real): sequence of real; extensionmethod;
begin
  Result := IncrementalSeq(Self);
end;

/// ���������� ������������������ ��������� �������� ��������� �������� ������������������
function Incremental(Self: List<real>): sequence of real; extensionmethod;
begin
  Result := IncrementalSeq(Self);
end;

/// ���������� ������������������ ��������� �������� ��������� �������� ������������������
function Incremental(Self: LinkedList<real>): sequence of real; extensionmethod;
begin
  Result := IncrementalSeq(Self);
end;}

/// ���������� ������������������ ��������� �������� ��������� �������� ������������������. � �������� ������� �������� ������������ func
function Incremental<T, T1>(Self: sequence of T; func: (T,T)->T1): sequence of T1; extensionmethod;
begin
  var iter := Self.GetEnumerator();
  if iter.MoveNext() then
  begin
    var prevItem := iter.Current;
    while iter.MoveNext() do
    begin
      var nextItem := iter.Current;
      yield func(prevItem, nextItem);
      prevItem := nextItem;
    end
  end
end;

/// ���������� ������������������ ��������� �������� ��������� �������� ������������������. � �������� ������� �������� ������������ func
function Incremental<T, T1>(Self: sequence of T; func: (T,T,integer)->T1): sequence of T1; extensionmethod;
begin
  var iter := Self.GetEnumerator();
  if iter.MoveNext() then
  begin
    var ind := 0;
    var prevItem := iter.Current;
    while iter.MoveNext() do
    begin
      var nextItem := iter.Current;
      ind += 1;
      yield func(prevItem, nextItem, ind);
      prevItem := nextItem;
    end
  end
end;

/// ���������� ���������� ������ ������ ��������, ������� ������������������ �������� 
function AdjacentGroup<T>(Self: sequence of T): sequence of array of T; extensionmethod;
begin
  var c := new AdjGroupClass<T>(Self);
  while c.fin do
    yield c.TakeGroup().ToArray;
end;

// ToDo ������� AdjacentGroup � �������� ���������

// -----------------------------------------------------
//>>     ������ ���������� ������� # Extension methods for List T
// -----------------------------------------------------

/// ������������ �������� ������ ��������� �������
function Shuffle<T>(Self: List<T>): List<T>; extensionmethod;
begin
  var n := Self.Count;
  for var i := 0 to n - 1 do
  begin
    var r := PABCSystem.Random(n);
    var v := Self[i];
    Self[i] := Self[r];
    Self[r] := v;
  end;
  Result := Self;  
end;

/// ������� ������ ���� ������ ������ ���������� ��������� � ���������� ������ ������� �������� ����. ���� �� ������, ������������ -1
function AdjacentFind<T>(Self: IList<T>; start: integer := 0): integer; extensionmethod;
begin
  Result := -1;
  for var i := start to Self.Count - 2 do
    if Self[i] = Self[i + 1] then 
    begin
      Result := i;
      exit;
    end;
end;

/// ������� ������ ���� ������ ������ ���������� ���������, ��������� ������� ��������� eq, � ���������� ������ ������� �������� ����. ���� �� ������, ������������ -1
function AdjacentFind<T>(Self: IList<T>; eq: (T,T)->boolean; start: integer := 0): integer; extensionmethod;
begin
  Result := -1;
  for var i := start to Self.Count - 2 do
    if eq(Self[i], Self[i + 1]) then 
    begin
      Result := i;
      exit;
    end;
end;

/// ���������� ������ ������� ������������ �������� ������� � ������� index
function IndexMin<T>(Self: IList<T>; index: integer := 0): integer; extensionmethod;where T: IComparable<T>;
begin
  var min := Self[index];
  Result := index;
  for var i := index + 1 to Self.Count - 1 do
    if Self[i].CompareTo(min) < 0 then 
    begin
      Result := i;
      min := Self[i];
    end;
end;

/// ���������� ������ ������� ������������� �������� ������� � ������� index
function IndexMax<T>(self: IList<T>; index: integer := 0): integer; extensionmethod;where T: System.IComparable<T>;
begin
  var max := Self[index];
  Result := index;
  for var i := index + 1 to Self.Count - 1 do
    if Self[i].CompareTo(max) > 0 then 
    begin
      Result := i;
      max := Self[i];
    end;
end;

/// ���������� ������ ���������� ������������ ��������
function LastIndexMin<T>(Self: IList<T>): integer; extensionmethod;where T: System.IComparable<T>;
begin
  var min := Self[Self.Count - 1];
  Result := Self.Count - 1;
  for var i := Self.Count - 2 downto 0 do
    if Self[i].CompareTo(min) < 0 then 
    begin
      Result := i;
      min := Self[i];
    end;
end;

/// ���������� ������ ���������� ������������ �������� � ��������� [0,index-1] 
function LastIndexMin<T>(Self: IList<T>; index: integer): integer; extensionmethod;where T: System.IComparable<T>;
begin
  var min := Self[index];
  Result := index;
  for var i := index - 1 downto 0 do
    if Self[i].CompareTo(min) < 0 then 
    begin
      Result := i;
      min := Self[i];
    end;
end;

/// ���������� ������ ���������� ������������� ��������
function LastIndexMax<T>(Self: IList<T>): integer; extensionmethod;where T: System.IComparable<T>;
begin
  var max := Self[Self.Count - 1];
  Result := Self.Count - 1;
  for var i := Self.Count - 2 downto 0 do
    if Self[i].CompareTo(max) > 0 then 
    begin
      Result := i;
      max := Self[i];
    end;
end;

/// ���������� ������ ���������� ������������ �������� � ��������� [0,index-1]
function LastIndexMax<T>(Self: IList<T>; index: integer): integer; extensionmethod;where T: System.IComparable<T>;
begin
  var max := Self[index];
  Result := index;
  for var i := index - 1 downto 0 do
    if Self[i].CompareTo(max) > 0 then 
    begin
      Result := i;
      max := Self[i];
    end;
end;

/// �������� � ������� ��� ������ ��� ��������� ������ �������� �� ������
procedure Replace<T>(Self: IList<T>; oldValue, newValue: T); extensionmethod;
begin
  for var i := 0 to Self.Count - 1 do
    if Self[i] = oldValue then
      Self[i] := newValue;
end;

/// ����������� �������� ������� ��� ������ �� ��������� �������
procedure Transform<T>(Self: IList<T>; f: T->T); extensionmethod;
begin
  for var i := 0 to Self.Count - 1 do
    Self[i] := f(Self[i]);
end;

/// ��������� �������� ������� ��� ������ ����������, ������������ �� ���������� �������
procedure Fill<T>(Self: IList<T>; f: integer->T); extensionmethod;
begin
  for var i := 0 to Self.Count - 1 do
    Self[i] := f(i);
end;

///-- 
function CreateSliceFromListInternal<T>(Self: List<T>; from, step, count: integer): List<T>;
begin
  Result := new List<T>(count);
  
  var f := from;
  loop count do
  begin
    Result.Add(Self[f]);
    f += step;
  end;
end;

///-- 
procedure CorrectCountForSlice(Len, from, step: integer; var count: integer);
begin
  if step = 0 then
    raise new ArgumentException(GetTranslation(PARAMETER_STEP_MUST_BE_NOT_EQUAL_0));
  
  if count < 0 then
    raise new ArgumentException(GetTranslation(PARAMETER_COUNT_MUST_BE_GREATER_0));
  
  if (from < 0) or (from > Len - 1) then
    raise new ArgumentException(GetTranslation(PARAMETER_FROM_OUT_OF_RANGE));
  
  var cnt := step > 0 ? Len - from : from + 1; 
  var cntstep := (cnt - 1) div abs(step) + 1;
  if count > cntstep then 
    count := cntstep;
end;

///-- 
function SliceListImpl<T>(Self: List<T>; from, step, count: integer): List<T>;
begin
  CorrectCountForSlice(Self.Count, from, step, count);
  Result := CreateSliceFromListInternal(Self, from, step, count);
end;

/// ���������� ���� ������ �� ������� from � ����� step
function Slice<T>(Self: List<T>; from, step: integer): List<T>; extensionmethod;
begin
  Result := SliceListImpl(Self, from, step, integer.MaxValue);
end;

/// ���������� ���� ������ �� ������� from � ����� step ����� �� ����� count
function Slice<T>(Self: List<T>; from, step, count: integer): List<T>; extensionmethod;
begin
  Result := SliceListImpl(Self, from, step, count);
end;

/// ������� ��������� �������. ���� ��������� ���, ���������� ����������
function RemoveLast<T>(Self: List<T>): List<T>; extensionmethod;
begin
  Self.RemoveAt(Self.Count - 1);
  Result := Self;
end;

procedure CorrectFromTo(situation: integer; Len: integer; var from, to: integer; step: integer);
begin
  if step > 0 then
  begin
    case situation of
      1: from := 0;
      2: to := Len;
      3: (from, to) := (0, Len)
    end;  
  end
  else
  begin
    case situation of
      1: from := Len - 1;
      2: to := -1;
      3: (from, to) := (Len - 1, -1);
    end;
  end;
end;

///--
function CorrectFromToAndCalcCountForSystemSliceQuestion(situation: integer; Len: integer; var from, to: integer; step: integer): integer;
begin
  if step = 0 then
    raise new ArgumentException(GetTranslation(PARAMETER_STEP_MUST_BE_NOT_EQUAL_0));
  
  CorrectFromTo(situation, Len, from, to, step);
  
  if step > 0 then
  begin
    if from < 0 then
      from += (step - from - 1) div step * step;
    // from ����� ��������� > Len - 1
    var m := Min(Len,to);
    if from >= m then 
      Result := 0
    else Result := (m - from - 1) div step + 1
  end
  else
  begin
    if from > Len - 1 then
      from -= (from - Len - step) div step * step;
    // from ����� ��������� < 0   
    var m := Max(to,-1);
    if from <= m then
      Result := 0
    else Result := (from - m - 1) div (-step) + 1
  end;
end;

///--
function CheckAndCorrectFromToAndCalcCountForSystemSlice(situation: integer; Len: integer; var from, to: integer; step: integer): integer;
begin
  // situation = 0 - ��� ��������� ������������
  // situation = 1 - from �����������
  // situation = 2 - to �����������
  // situation = 3 - from � to �����������
  if step = 0 then
    raise new ArgumentException(GetTranslation(PARAMETER_STEP_MUST_BE_NOT_EQUAL_0));
  
  if (situation = 0) or (situation = 2) then
    if (from < 0) or (from > Len - 1) then
      raise new ArgumentException(GetTranslation(PARAMETER_FROM_OUT_OF_RANGE));
  
  if (situation = 0) or (situation = 1) then
    if (to < -1) or (to > Len) then
      raise new ArgumentException(GetTranslation(PARAMETER_TO_OUT_OF_RANGE));
  
  CorrectFromTo(situation, Len, from, to, step);
  
  var count: integer;
  
  if step > 0 then
  begin
    var cnt := to - from;
    if cnt <= 0 then 
      count := 0
    else count := (cnt - 1) div step + 1;
  end
  else
  begin
    var cnt := from - to;
    if cnt <= 0 then 
      count := 0
    else count := (cnt - 1) div (-step) + 1;
  end;
  
  Result := count;
end;

///--
procedure CheckStepAndCorrectFromTo(situation: integer; Len: integer; var from, to: integer; step: integer);
begin
  // situation = 0 - ��� ��������� ������������
  // situation = 1 - from �����������
  // situation = 2 - to �����������
  // situation = 3 - from � to �����������
  if step = 0 then
    raise new ArgumentException(GetTranslation(PARAMETER_STEP_MUST_BE_NOT_EQUAL_0));
  
  {if (situation=0) or (situation=2) then
    if (from < 0) or (from > Len - 1) then
      raise new ArgumentException(GetTranslation(PARAMETER_FROM_OUT_OF_RANGE));
  
  if (situation=0) or (situation=1) then
    if (to < -1) or (to > Len) then
      raise new ArgumentException(GetTranslation(PARAMETER_TO_OUT_OF_RANGE));}
  
  CorrectFromTo(situation, Len, from, to, step);
end;

///-- 
function SystemSliceListImpl<T>(Self: List<T>; situation: integer; from, to: integer; step: integer := 1): List<T>;
begin
  var count := CheckAndCorrectFromToAndCalcCountForSystemSlice(situation, Self.Count, from, to, step);
  
  Result := CreateSliceFromListInternal(Self, from, step, count);
end;

///--
function SystemSlice<T>(Self: List<T>; situation: integer; from, to: integer): List<T>; extensionmethod;
begin
  Result := SystemSliceListImpl(Self, situation, from, to, 1);
end;

///--
function SystemSlice<T>(Self: List<T>; situation: integer; from, to, step: integer): List<T>; extensionmethod;
begin
  Result := SystemSliceListImpl(Self, situation, from, to, step);
end;

///-- 
function SystemSliceListImplQuestion<T>(Self: List<T>; situation: integer; from, to: integer; step: integer := 1): List<T>;
begin
  var count := CorrectFromToAndCalcCountForSystemSliceQuestion(situation, Self.Count, from, to, step);
  
  Result := CreateSliceFromListInternal(Self, from, step, count);
end;

///--
function SystemSliceQuestion<T>(Self: List<T>; situation: integer; from, to: integer): List<T>; extensionmethod;
begin
  Result := SystemSliceListImplQuestion(Self, situation, from, to, 1);
end;

///--
function SystemSliceQuestion<T>(Self: List<T>; situation: integer; from, to, step: integer): List<T>; extensionmethod;
begin
  Result := SystemSliceListImplQuestion(Self, situation, from, to, step);
end;

// -----------------------------------------------------
//>>     ������ ���������� ��������� ������������ �������� # Extension methods for array [,] of T
// -----------------------------------------------------
/// ���������� ����� � ��������� �������
function RowCount<T>(Self: array [,] of T): integer; extensionmethod;
begin
  Result := Self.GetLength(0);
end;

/// ���������� �������� � ��������� �������
function ColCount<T>(Self: array [,] of T): integer; extensionmethod;
begin
  Result := Self.GetLength(1);
end;

/// ����� ���������� �������, w - ������ ���� ������
function Print<T>(Self: array [,] of T; w: integer := 4): array [,] of T; extensionmethod;
begin
  for var i := 0 to Self.RowCount - 1 do
  begin
    for var j := 0 to Self.ColCount - 1 do
    begin
      var elem := Self[i, j];
      var s := StructuredObjectToString(elem);
      Write(s.PadLeft(w));
    end;
    Writeln;  
  end;
  Result := Self;  
end;

/// ����� ���������� ������������� ������� �� ������� :w:f
function Print(Self: array [,] of real; w: integer := 7; f: integer := 2): array [,] of real; extensionmethod;
begin
  for var i := 0 to Self.RowCount - 1 do
  begin
    for var j := 0 to Self.ColCount - 1 do
      Write(FormatValue(Self[i, j], w, f));
    Writeln;  
  end;
  Result := Self;  
end;

/// ����� ���������� ������� � ������� �� ��������� ������, w - ������ ���� ������
function Println<T>(Self: array [,] of T; w: integer := 4): array [,] of T; extensionmethod;
begin
  Self.Print(w);
  Result := Self;  
end;

/// ����� ���������� ������������� ������� �� ������� :w:f � ������� �� ��������� ������ 
function Println(Self: array [,] of real; w: integer := 7; f: integer := 2): array [,] of real; extensionmethod;
begin
  Self.Print(w, f);
  Result := Self;  
end;

/// k-��� ������ ���������� �������
function Row<T>(Self: array [,] of T; k: integer): array of T; extensionmethod;
begin
  var n := Self.ColCount;
  var res := new T[n];
  for var j := 0 to n - 1 do
    res[j] := Self[k, j];
  Result := res;
end;

/// k-��� ������� ���������� �������
function Col<T>(Self: array [,] of T; k: integer): array of T; extensionmethod;
begin
  var m := Self.RowCount;
  var res := new T[m];
  for var i := 0 to m - 1 do
    res[i] := Self[i, k];
  Result := res;
end;

/// k-��� ������ ���������� ������� ��� ������������������
function RowSeq<T>(Self: array [,] of T; k: integer): sequence of T; extensionmethod;
begin
  for var j := 0 to Self.ColCount - 1 do
    yield Self[k, j];
end;

/// k-��� ������� ���������� ������� ��� ������������������
function ColSeq<T>(Self: array [,] of T; k: integer): sequence of T; extensionmethod;
begin
  for var i := 0 to Self.RowCount - 1 do
    yield Self[i, k];
end;

/// ���������� ������������������ ����� ���������� ������� 
function Rows<T>(Self: array [,] of T): sequence of sequence of T; extensionmethod;
begin
  for var i := 0 to Self.RowCount - 1 do
    yield Self.RowSeq(i);
end;

/// ���������� ������������������ �������� ���������� ������� 
function Cols<T>(Self: array [,] of T): sequence of sequence of T; extensionmethod;
begin
  for var j := 0 to Self.ColCount - 1 do
    yield Self.ColSeq(j);
end;

/// ������ ������� ��� ������ ���������� ������� � �������� k1 � k2
procedure SwapRows<T>(Self: array [,] of T; k1, k2: integer); extensionmethod;
begin
  for var j := 0 to Self.ColCount - 1 do
    Swap(Self[k1, j], Self[k2, j])
end;

/// ������ ������� ��� ������� ���������� ������� � �������� k1 � k2
procedure SwapCols<T>(Self: array [,] of T; k1, k2: integer); extensionmethod;
begin
  for var i := 0 to Self.RowCount - 1 do
    Swap(Self[i, k1], Self[i, k2])
end;

/// ������ ������ k ���������� ������� �� ������ ������
procedure SetRow<T>(Self: array [,] of T; k: integer; a: array of T); extensionmethod;
begin
  if a.Length <> Self.ColCount then
    raise new System.ArgumentException(GetTranslation(ARR_LENGTH_MUST_BE_MATCH_TO_MATR_SIZE));
  for var j := 0 to Self.ColCount - 1 do
    Self[k, j] := a[j]
end;

/// ������ ������ k ���������� ������� �� ������ ������
procedure SetRow<T>(Self: array [,] of T; k: integer; a: sequence of T); extensionmethod := Self.SetRow(k,a.ToArray);

/// ������ ������� k ���������� ������� �� ������ �������
procedure SetCol<T>(Self: array [,] of T; k: integer; a: array of T); extensionmethod;
begin
  if a.Length <> Self.RowCount then
    raise new System.ArgumentException(GetTranslation(ARR_LENGTH_MUST_BE_MATCH_TO_MATR_SIZE));
  for var i := 0 to Self.RowCount - 1 do
    Self[i, k] := a[i]
end;

/// ������ ������� k ���������� ������� �� ������ �������
procedure SetCol<T>(Self: array [,] of T; k: integer; a: sequence of T); extensionmethod := Self.SetCol(k,a.ToArray);

/// ���������� �� ��������� ���������� ������� ������������������ (a[i,j],i,j)
function ElementsWithIndexes<T>(Self: array [,] of T): sequence of (T, integer, integer); extensionmethod;
begin
  for var i := 0 to Self.RowCount - 1 do
    for var j := 0 to Self.ColCount - 1 do
      yield (Self[i, j], i, j)
end;

/// ���������� �� ��������� ���������� ������� ������������������ ��� ��������� �� �������
function ElementsByRow<T>(Self: array [,] of T): sequence of T; extensionmethod;
begin
  for var i := 0 to Self.RowCount - 1 do
    for var j := 0 to Self.ColCount - 1 do
      yield Self[i, j]
end;

/// ���������� �� ��������� ���������� ������� ������������������ ��� ��������� �� ��������
function ElementsByCol<T>(Self: array [,] of T): sequence of T; extensionmethod;
begin
  for var j := 0 to Self.ColCount - 1 do
    for var i := 0 to Self.RowCount - 1 do
      yield Self[i, j]
end;

/// ����������� �������� ���������� ������� � ���������� ��������������� ������
function ConvertAll<T, T1>(Self: array [,] of T; converter: T->T1): array [,] of T1; extensionmethod;
begin
  Result := new T1[Self.RowCount, Self.ColCount];
  for var i := 0 to Self.RowCount - 1 do
    for var j := 0 to Self.ColCount - 1 do
      Result[i, j] := converter(Self[i, j]);  
end;

/// ����������� �������� ���������� ������� �� ��������� �������
procedure Transform<T>(Self: array [,] of T; f: T->T); extensionmethod;
begin
  for var i := 0 to Self.RowCount - 1 do
    for var j := 0 to Self.ColCount - 1 do
      Self[i, j] := f(Self[i, j]);
end;

/// ��������� �������� ���������� ������� ����������, ������������ �� ���������� �������
procedure Fill<T>(Self: array [,] of T; f: (integer,integer) ->T); extensionmethod;
begin
  for var i := 0 to Self.RowCount - 1 do
    for var j := 0 to Self.ColCount - 1 do
      Self[i, j] := f(i, j);
end;

// -----------------------------------------------------
//>>     ��������� ������ YYY - �� �������! # YYY
// -----------------------------------------------------

function Matr<T>(m,n: integer; params data: array of T): array [,] of T;
begin
  if data.Length<>m*n then
    raise new System.ArgumentException(GetTranslation(INITELEM_COUNT_MUST_BE_EQUAL_TO_MATRIX_ELEMS_COUNT));
  
  Result := new T[m, n];
  var k := 0;
  for var i:=0 to Result.RowCount-1 do
  for var j:=0 to Result.ColCount-1 do
  begin
    Result[i,j] := data[k];
    k += 1;
  end;
end;

// ���������� �������� � ��������� - ������ ����� �������� RowCount � ColCount
function MatrRandom(m: integer; n: integer; a, b: integer): array [,] of integer;
begin
  Result := new integer[m, n];
  for var i := 0 to Result.RowCount - 1 do
    for var j := 0 to Result.ColCount - 1 do
      Result[i, j] := Random(a, b);
end;

function MatrRandomInteger(m: integer; n: integer; a, b: integer): array [,] of integer;
begin
  Result := new integer[m, n];
  for var i := 0 to Result.RowCount - 1 do
    for var j := 0 to Result.ColCount - 1 do
      Result[i, j] := Random(a, b);
end;

function MatrRandomReal(m: integer; n: integer; a, b: real): array [,] of real;
begin
  Result := new real[m, n];
  for var i := 0 to Result.RowCount - 1 do
    for var j := 0 to Result.ColCount - 1 do
      Result[i, j] := Random() * (b - a) + a;
end;

function MatrFill<T>(m, n: integer; x: T): array [,] of T;
begin
  Result := new T[m, n];
  for var i := 0 to Result.RowCount - 1 do
    for var j := 0 to Result.ColCount - 1 do
      Result[i, j] := x;
end;

function MatrGen<T>(m, n: integer; gen: (integer,integer)->T): array [,] of T;
begin
  Result := new T[m, n];
  for var i := 0 to Result.RowCount - 1 do
    for var j := 0 to Result.ColCount - 1 do
      Result[i, j] := gen(i, j);
end;

function Transpose<T>(a: array [,] of T): array [,] of T;
begin
  var m := a.RowCount;
  var n := a.ColCount;
  Result := new T[n, m];
  for var i := 0 to Result.RowCount - 1 do
    for var j := 0 to Result.ColCount - 1 do
      Result[i, j] := a[j, i]
end;

function ReadMatrInteger(m, n: integer): array [,] of integer;
begin
  Result := new integer[m, n];
  for var i := 0 to m - 1 do
    for var j := 0 to n - 1 do
      Result[i, j] := ReadInteger;
end;

function ReadMatrReal(m, n: integer): array [,] of real;
begin
  Result := new real[m, n];
  for var i := 0 to m - 1 do
    for var j := 0 to n - 1 do
      Result[i, j] := ReadReal;
end;

// -----------------------------------------------------
//>>     ������ ���������� ���������� ������������ �������� # Extension methods for array of T
// -----------------------------------------------------

// ���������� ������� 2016: Shuffle, AdjacentFind, IndexMin, IndexMax, Replace, Transform
//   ����������� ������ - � ������ ����������: BinarySearch, ConvertAll, Find, FindIndex, FindAll,  
//   FindLast, FindLastIndex, IndexOf, Contains, LastIndexOf, Reverse, Sort

/// ������������ �������� ������� ��������� �������
function Shuffle<T>(Self: array of T): array of T; extensionmethod;
begin
  var n := Self.Length;
  for var i := 0 to n - 1 do
    Swap(Self[i], Self[Random(n)]);
  Result := Self;  
end;

{/// ������� ������ ���� ������ ������ ���������� ��������� � ���������� ������ ������� �������� ����. ���� �� ������, ������������ -1
function AdjacentFind<T>(Self: array of T; start: integer := 0): integer; extensionmethod;
begin
  Result := -1;
  for var i:=start to Self.Length-2 do
    if Self[i]=Self[i+1] then 
    begin
      Result := i;
      exit;
    end;
end;

/// ������� ������ ���� ������ ������ ���������� ���������, ��������� ������� ��������� eq, � ���������� ������ ������� �������� ����. ���� �� ������, ������������ -1
function AdjacentFind<T>(Self: array of T; eq: (T,T)->boolean; start: integer := 0): integer; extensionmethod;
begin
  Result := -1;
  for var i:=start to Self.Length-2 do
    if eq(Self[i],Self[i+1]) then 
    begin
      Result := i;
      exit;
    end;
end;}

/// ���������� ����������� ������� 
function Min<T>(Self: array of T): T; extensionmethod;where T: System.IComparable<T>;
begin
  Result := Self[0];
  for var i := 1 to Self.Length - 1 do
    if Self[i].CompareTo(Result) < 0 then 
      Result := Self[i];
end;

/// ���������� ������������ ������� 
function Max<T>(Self: array of T): T; extensionmethod;where T: System.IComparable<T>;
begin
  Result := Self[0];
  for var i := 1 to Self.Length - 1 do
    if Self[i].CompareTo(Result) > 0 then 
      Result := Self[i];
end;

/// ���������� ����������� ������� 
function Min(Self: array of integer): integer; extensionmethod;
begin
  Result := Self[0];
  for var i := 1 to Self.Length - 1 do
    if Self[i] < Result then 
      Result := Self[i];
end;

/// ���������� ����������� ������� 
function Min(Self: array of real): real; extensionmethod;
begin
  Result := Self[0];
  for var i := 1 to Self.Length - 1 do
    if Self[i] < Result then 
      Result := Self[i];
end;

/// ���������� ������������ ������� 
function Max(Self: array of integer): integer; extensionmethod;
begin
  Result := Self[0];
  for var i := 1 to Self.Length - 1 do
    if Self[i] > Result then 
      Result := Self[i];
end;

/// ���������� ������������ ������� 
function Max(Self: array of real): real; extensionmethod;
begin
  Result := Self[0];
  for var i := 1 to Self.Length - 1 do
    if Self[i] > Result then 
      Result := Self[i];
end;

{/// ���������� ������ ������� ������������ �������� ������� � ������� index
function IndexMin<T>(Self: array of T; index: integer := 0): integer; extensionmethod; where T: System.IComparable<T>;
begin
  var min := Self[index];
  Result := index;
  for var i:=index+1 to Self.Length-1 do
    if Self[i].CompareTo(min)<0 then 
    begin
      Result := i;
      min := Self[i];
    end;
end;

/// ���������� ������ ������� ������������� �������� ������� � ������� index
function IndexMax<T>(self: array of T; index: integer := 0): integer; extensionmethod; where T: System.IComparable<T>;
begin
  var max := Self[index];
  Result := index;
  for var i:=index+1 to Self.Length-1 do
    if Self[i].CompareTo(max)>0 then 
    begin
      Result := i;
      max := Self[i];
    end;
end;

/// ���������� ������ ���������� ������������ ��������
function LastIndexMin<T>(Self: array of T): integer; extensionmethod; where T: System.IComparable<T>;
begin
  var min := Self[Self.Length-1];
  Result := Self.Length-1;
  for var i:=Self.Length-2 downto 0 do
    if Self[i].CompareTo(min)<0 then 
    begin
      Result := i;
      min := Self[i];
    end;
end;

/// ���������� ������ ���������� ������������ �������� � ��������� [0,index] 
function LastIndexMin<T>(Self: array of T; index: integer): integer; extensionmethod; where T: System.IComparable<T>;
begin
  var min := Self[index];
  Result := index;
  for var i:=index-1 downto 0 do
    if Self[i].CompareTo(min)<0 then 
    begin
      Result := i;
      min := Self[i];
    end;
end;

/// ���������� ������ ���������� ������������ ��������
function LastIndexMax<T>(Self: array of T): integer; extensionmethod; where T: System.IComparable<T>;
begin
  var max := Self[Self.Length-1];
  Result := Self.Length-1;
  for var i:=Self.Length-2 downto 0 do
    if Self[i].CompareTo(max)>0 then 
    begin
      Result := i;
      max := Self[i];
    end;
end;

/// ���������� ������ ���������� ������������ �������� � ��������� [0,index]
function LastIndexMax<T>(Self: array of T; index: integer): integer; extensionmethod; where T: System.IComparable<T>;
begin
  var max := Self[index];
  Result := index;
  for var i:=index-1 downto 0 do
    if Self[i].CompareTo(max)>0 then 
    begin
      Result := i;
      max := Self[i];
    end;
end;

/// �������� � ������� ��� ��������� ������ �������� �� ������
procedure Replace<T>(Self: array of T; oldValue,newValue: T); extensionmethod;
begin
  for var i:=0 to Self.Length-1 do
    if Self[i] = oldValue then
      Self[i] := newValue;
end;

/// ����������� �������� ������� �� ��������� �������
procedure Transform<T>(self: array of T; f: T -> T); extensionmethod;
begin
  for var i:=0 to Self.Length-1 do
    Self[i] := f(Self[i]);
end;

/// ��������� �������� ������� ����������, ������������ �� ���������� �������
procedure Fill<T>(Self: array of T; f: integer -> T); extensionmethod;
begin
  for var i:=0 to Self.Length-1 do
    Self[i] := f(i);
end;}

/// ��������� �������� ����� � ��������������� �������
function BinarySearch<T>(Self: array of T; x: T): integer; extensionmethod;
begin
  Result := System.Array.BinarySearch(self, x);  
end;

/// ����������� �������� ������� � ���������� ��������������� ������
function ConvertAll<T, T1>(Self: array of T; converter: T->T1): array of T1; extensionmethod;
begin
  Result := System.Array.ConvertAll(self, t -> converter(t));  
end;

/// ��������� ����� ������� �������� � �������, ���������������� ���������. ���� �� ������, ������������ ������� �������� ���������������� ����
function Find<T>(Self: array of T; p: T->boolean): T; extensionmethod;
begin
  Result := System.Array.Find(self, p);  
end;

/// ��������� ����� ������� ������� �������� � �������, ���������������� ���������. ���� �� ������, ������������ -1
function FindIndex<T>(Self: array of T; p: T->boolean): integer; extensionmethod;
begin
  Result := System.Array.FindIndex(self, p);  
end;

/// ��������� ����� ������� ������� �������� � �������, ���������������� ���������, ������� � ������� start. ���� �� ������, ������������ -1
function FindIndex<T>(Self: array of T; start: integer; p: T->boolean): integer; extensionmethod;
begin
  Result := System.Array.FindIndex(self, start, p);  
end;

/// ���������� � ���� ������� ��� ��������, ��������������� ���������
function FindAll<T>(Self: array of T; p: T->boolean): array of T; extensionmethod;
begin
  Result := System.Array.FindAll(self, p);  
end;

/// ��������� ����� ���������� �������� � �������, ���������������� ���������. ���� �� ������, ������������ ������� �������� ���������������� ����
function FindLast<T>(Self: array of T; p: T->boolean): T; extensionmethod;
begin
  Result := System.Array.FindLast(self, p);  
end;

/// ��������� ����� ������� ���������� �������� � �������, ���������������� ���������. ���� �� ������, ������������ ������� �������� ���������������� ����
function FindLastIndex<T>(Self: array of T; p: T->boolean): integer; extensionmethod;
begin
  Result := System.Array.FindLastIndex(self, p);  
end;

/// ��������� ����� ������� ���������� �������� � �������, ���������������� ���������, ������� � ������� start. ���� �� ������, ������������ ������� �������� ���������������� ����
function FindLastIndex<T>(self: array of T; start: integer; p: T->boolean): integer; extensionmethod;
begin
  Result := System.Array.FindLastIndex(Self, start, p);  
end;

/// ���������� ������ ������� ��������� �������� ��� -1 ���� ������� �� ������
function IndexOf<T>(Self: array of T; x: T): integer; extensionmethod;
begin
  Result := System.Array.IndexOf(Self, x);  
end;

/// ���������� ������ ������� ��������� �������� ������� � ������� start ��� -1 ���� ������� �� ������
function IndexOf<T>(Self: array of T; x: T; start: integer): integer; extensionmethod;
begin
  Result := System.Array.IndexOf(Self, x, start);  
end;

/// ���������� ������ ���������� ��������� �������� ��� -1 ���� ������� �� ������
function LastIndexOf<T>(Self: array of T; x: T): integer; extensionmethod;
begin
  Result := System.Array.LastIndexOf(Self, x);  
end;

/// ���������� ������ ���������� ��������� �������� ������� � ������� start ��� -1 ���� ������� �� ������
function LastIndexOf<T>(Self: array of T; x: T; start: integer): integer; extensionmethod;
begin
  Result := System.Array.LastIndexOf(Self, x, start);  
end;

/// ��������� ������ �� �����������
procedure Sort<T>(Self: array of T); extensionmethod;
begin
  System.Array.Sort(Self);  
end;

/// ��������� ������ �� �����������, ��������� cmp � �������� ������� ��������� ���������
procedure Sort<T>(Self: array of T; cmp: (T,T) ->integer); extensionmethod;
begin
  System.Array.Sort(Self, cmp);  
end;

/// ���������� ������ ���������� �������� �������
function High(Self: System.Array); extensionmethod := High(Self);

/// ���������� ������ ������� �������� �������
function Low(Self: System.Array); extensionmethod := Low(Self);

/// ���������� ������������������ �������� ����������� �������
function Indexes<T>(Self: array of T): sequence of integer; extensionmethod := Range(0, Self.Length - 1);

/// ���������� ������������������ �������� ��������� ����������� �������, ��������������� �������
function IndexesOf<T>(Self: array of T; cond: T->boolean): sequence of integer; extensionmethod;
begin
  for var i := 0 to Self.High do
    if cond(Self[i]) then
      yield i;
end;

/// ���������� ������������������ �������� ��������� ����������� �������, ��������������� �������
function IndexesOf<T>(Self: array of T; cond: (T,integer) ->boolean): sequence of integer; extensionmethod;
begin
  for var i := 0 to Self.High do
    if cond(Self[i], i) then
      yield i;
end;

///-- 
function CreateSliceFromArrayInternal<T>(Self: array of T; from, step, count: integer): array of T;
begin
  Result := new T[count];
  
  var f := from;
  for var i := 0 to count - 1 do
  begin
    Result[i] := Self[f];
    f += step;
  end;
end;

///-- 
function SliceArrayImpl<T>(Self: array of T; from, step, count: integer): array of T;
begin
  {if step = 0 then
    raise new ArgumentException(GetTranslation(PARAMETER_STEP_MUST_BE_NOT_EQUAL_0));
  
  if (from < 0) or (from > Self.Length - 1) then
    raise new ArgumentException(GetTranslation(PARAMETER_FROM_OUT_OF_RANGE));
  
  var cnt := step > 0 ? Self.Length - from : from + 1; 
  var cntstep := (cnt-1) div abs(step) + 1;
  if count > cntstep then 
    count := cntstep;}
  
  CorrectCountForSlice(Self.Length, from, step, count);  
  
  Result := CreateSliceFromArrayInternal(Self, from, step, count)
end;

/// ���������� ���� ������� �� ������� from � ����� step
function Slice<T>(Self: array of T; from, step: integer): array of T; extensionmethod;
begin
  Result := SliceArrayImpl(Self, from, step, integer.MaxValue);
end;

/// ���������� ���� ������� �� ������� from � ����� step ����� �� ����� count
function Slice<T>(Self: array of T; from, step, count: integer): array of T; extensionmethod;
begin
  Result := SliceArrayImpl(Self, from, step, count);
end;

///-- 
function SystemSliceArrayImpl<T>(Self: array of T; situation: integer; from, to: integer; step: integer := 1): array of T;
begin
  var count := CheckAndCorrectFromToAndCalcCountForSystemSlice(situation, Self.Length, from, to, step);
  
  Result := CreateSliceFromArrayInternal(Self, from, step, count)
end;

///--
function SystemSlice<T>(Self: array of T; situation: integer; from, to: integer): array of T; extensionmethod;
begin
  Result := SystemSliceArrayImpl(Self, situation, from, to, 1);
end;

///--
function SystemSlice<T>(Self: array of T; situation: integer; from, to, step: integer): array of T; extensionmethod;
begin
  Result := SystemSliceArrayImpl(Self, situation, from, to, step);
end;

///-- 
function SystemSliceArrayImplQuestion<T>(Self: array of T; situation: integer; from, to: integer; step: integer := 1): array of T;
begin
  var count := CorrectFromToAndCalcCountForSystemSliceQuestion(situation, Self.Length, from, to, step);
  
  Result := CreateSliceFromArrayInternal(Self, from, step, count);
end;

///--
function SystemSliceQuestion<T>(Self: array of T; situation: integer; from, to: integer): array of T; extensionmethod;
begin
  Result := SystemSliceArrayImplQuestion(Self, situation, from, to, 1);
end;

///--
function SystemSliceQuestion<T>(Self: array of T; situation: integer; from, to, step: integer): array of T; extensionmethod;
begin
  Result := SystemSliceArrayImplQuestion(Self, situation, from, to, step);
end;

// -----------------------------------------------------
//>>     ������ ���������� ���� integer # Extension methods for integer
// -----------------------------------------------------
/// ���������� ���������� ������ �����
function Sqrt(Self: integer): real; extensionmethod;
begin
  Result := Sqrt(Self);
end;

/// ���������� ������� �����
function Sqr(Self: integer): integer; extensionmethod;
begin
  Result := Sqr(Self);
end;

/// ���������� True ���� �������� ��������� ����� ����� �������
function Between(Self: integer; a, b: integer): boolean; extensionmethod;
begin
  Result := (a <= Self) and (Self <= b) or (b <= Self) and (Self <= a);
end;

/// ���������� True ���� �������� ��������� ����� ����� �������
function InRange(Self: integer; a,b: integer): boolean; extensionmethod;
begin
  Result := (a <= Self) and (Self <= b) or (b <= Self) and (Self <= a);
end;


// ���������� ������� 2016: IsEven, IsOdd

/// ����������, �������� �� ����� ������
function IsEven(Self: integer): boolean; extensionmethod;
begin
  Result := Self mod 2 = 0;
end;

/// ����������, �������� �� ����� ��������
function IsOdd(Self: integer): boolean; extensionmethod;
begin
  Result := Self mod 2 <> 0;
end;

/// ���������� ������������������ ����� �� 1 �� �������
function Range(Self: integer): sequence of integer; extensionmethod;
begin
  Result := Range(1, Self);  
end;

// ���������� ������� 2016: To, Downto, Times

/// ���������� ������������������ ����� �� �������� �������� �� n
function To(Self: integer; n: integer): sequence of integer; extensionmethod;
begin
  Result := Range(Self, n);
end;

/// ���������� ������������������ ����� �� �������� �������� �� n � ��������� �������
function Downto(Self: integer; n: integer): sequence of integer; extensionmethod;
begin
  Result := Range(Self, n, -1); 
end;

/// ���������� ������������������ ����� 0,1,...n-1
function Times(Self: integer): sequence of integer; extensionmethod;
begin
  Result := Range(0, Self - 1);
end;

// -----------------------------------------------------
//>>     ������ ���������� ���� BigInteger # Extension methods for BigInteger
// -----------------------------------------------------
/// ���������� ���������� ������ �����
function Sqrt(Self: BigInteger): real; extensionmethod;
begin
  Result := Sqrt(real(Self));
end;

// -----------------------------------------------------
//>>     ������ ���������� ���� real # Extension methods for real
// -----------------------------------------------------
/// ���������� True ���� �������� ��������� ����� ����� �������
function Between(Self: real; a, b: real): boolean; extensionmethod;
begin
  Result := (a <= Self) and (Self <= b) or (b <= Self) and (Self <= a);
end;

/// ���������� True ���� �������� ��������� ����� ����� �������
function InRange(Self: real; a,b: real): boolean; extensionmethod;
begin
  Result := (a <= Self) and (Self <= b) or (b <= Self) and (Self <= a);
end;

/// ���������� ���������� ������ �����
function Sqrt(Self: real): real; extensionmethod;
begin
  Result := Sqrt(Self);
end;

/// ���������� ������� �����
function Sqr(Self: real): real; extensionmethod;
begin
  Result := Sqr(Self);
end;

/// ���������� �����, ����������� �� ���������� ������
function Round(Self: real): integer; extensionmethod;
begin
  Result := Round(Self);
end;

/// ���������� x, ����������� �� ���������� ������������� � digits ������� ����� ���������� �����
function Round(Self: real; digits: integer): real; extensionmethod;
begin
  Result := Round(Self,digits);
end;

/// ���������� �����, ����������� �� ���������� �������� ������
function RoundBigInteger(Self: real): BigInteger; extensionmethod;
begin
  Result := RoundBigInteger(Self);
end;

/// ���������� ����� ����� ������������� �����
function Trunc(Self: real): integer; extensionmethod;
begin
  Result := Trunc(Self);
end;

/// ���������� ����� ����� ������������� ����� ��� ������� �����
function TruncBigInteger(Self: real): BigInteger; extensionmethod;
begin
  Result := TruncBigInteger(Self);
end;

/// ���������� ������������, ����������������� � ������ � frac ������� ����� ���������� �����
function ToString(Self: real; frac: integer): string; extensionmethod;
begin
  if frac < 0 then
    raise new System.ArgumentOutOfRangeException('frac', 'frac<0');
  if frac >= 100 then
    raise new System.ArgumentOutOfRangeException('frac', 'frac>=100');
  Result := Format('{0:f' + frac + '}', Self)
end;


//------------------------------------------------------------------------------
//>>     ������ ���������� ���� char # Extension methods for char
//------------------------------------------------------------------------------
/// ���������� True ���� �������� ��������� ����� ����� �������
function Between(Self: char; a, b: char): boolean; extensionmethod;
begin
  Result := (a <= Self) and (Self <= b) or (b <= Self) and (Self <= a);
end;

/// ���������� True ���� �������� ��������� ����� ����� �������
function InRange(Self: char; a,b: char): boolean; extensionmethod;
begin
  Result := (a <= Self) and (Self <= b) or (b <= Self) and (Self <= a);
end;

/// ���������� ������
function Pred(Self: char); extensionmethod := PABCSystem.Pred(Self);

/// ��������� ������
function Succ(Self: char); extensionmethod := PABCSystem.Succ(Self);

/// ��� ������� � ��������� Unicode
function Code(Self: char): integer; extensionmethod := word(Self);

/// �������� �� ������ ������
function IsDigit(Self: char); extensionmethod := char.IsDigit(Self);

/// �������� �� ������ ������
function IsLetter(Self: char): boolean; extensionmethod;
begin
  Result := char.IsLetter(Self);
end;

/// ����������� �� ������ � ��������� ���� ������� ��������
function IsLower(Self: char): boolean; extensionmethod;
begin
  Result := char.IsLower(Self);
end;

/// ����������� �� ������ � ��������� ���� �������� ��������
function IsUpper(Self: char): boolean; extensionmethod;
begin
  Result := char.IsUpper(Self);
end;

/// ����������� ������ � �����
function ToDigit(Self: char): integer; extensionmethod;
begin
  Result := OrdUnicode(Self) - OrdUnicode('0');
  if (Result < 0) or (Result >= 10) then
    raise new System.FormatException('not a Digit');
end;

/// ����������� ������ � ������ �������
function ToLower(Self: char): char; extensionmethod;
begin
  Result := char.ToLower(Self);
end;

/// ����������� ������ � ������� �������
function ToUpper(Self: char): char; extensionmethod;
begin
  Result := char.ToUpper(Self);
end;

//------------------------------------------------------------------------------
//>>     ������ ���������� ���� string # Extension methods for string
//------------------------------------------------------------------------------
/// ���������� True ���� �������� ��������� ����� ����� �������
function Between(Self: string; a, b: string): boolean; extensionmethod;
begin
  Result := (a <= Self) and (Self <= b) or (b <= Self) and (Self <= a);
end;

/// ���������� True ���� �������� ��������� ����� ����� �������
function InRange(Self: string; a,b: string): boolean; extensionmethod;
begin
  Result := (a <= Self) and (Self <= b) or (b <= Self) and (Self <= a);
end;

/// ��������� ����� �� ������ ������� � ������� from � ������������� from �� ��������� ���������
function ReadInteger(Self: string; var from: integer): integer; extensionmethod;
begin
  Result := ReadIntegerFromString(Self, from);
end;

/// ��������� ������������ �� ������ ������� � ������� from � ������������� from �� ��������� ���������
function ReadReal(Self: string; var from: integer): real; extensionmethod;
begin
  Result := ReadRealFromString(Self, from);
end;

/// ��������� ����� �� ������ ������� � ������� from � ������������� from �� ��������� ���������
function ReadWord(Self: string; var from: integer): string; extensionmethod;
begin
  Result := ReadwordFromString(Self, from);
end;

/// ����������� ������ � �����
function ToInteger(Self: string): integer; extensionmethod := integer.Parse(Self);

/// ����������� ������ � BigInteger
function ToBigInteger(Self: string): BigInteger; extensionmethod := BigInteger.Parse(Self);

/// ����������� ������ � ������������
function ToReal(Self: string): real; extensionmethod := real.Parse(Self, nfi);

/// ����������� ������ � ����� � ���������� ��� � value. 
///��� ������������� �������������� ������������ False
function TryToInteger(Self: string; var value: integer): boolean; extensionmethod := TryStrToInt(Self,value);

/// ����������� ������ � ������������ � ���������� ��� � value. 
///��� ������������� �������������� ������������ False
function TryToReal(Self: string; var value: real): boolean; extensionmethod := TryStrToReal(Self,value);

/// ����������� ������ � �����
///��� ������������� �������������� ������������ defaultvalue
function ToInteger(Self: string; defaultvalue: integer): integer; extensionmethod;
begin
  var b := TryStrToInt(Self,Result);
  if not b then
    Result := defaultvalue
end;

/// ����������� ������ � ������������
///��� ������������� �������������� ������������ defaultvalue
function ToReal(Self: string; defaultvalue: real): real; extensionmethod;
begin
  var b := TryStrToReal(Self,Result);
  if not b then
    Result := defaultvalue
end;

/// ����������� ������ � ������ ����
function ToWords(Self: string; params delim: array of char): array of string; extensionmethod;
begin
  Result := Self.Split(delim, System.StringSplitOptions.RemoveEmptyEntries);
end;

/// ����������� ������ � ������ �����
function ToIntegers(Self: string): array of integer; extensionmethod;
begin
  Result := Self.ToWords().Select(s -> StrToInt(s)).ToArray();
end;

/// ����������� ������ � ������ ������������
function ToReals(Self: string): array of real; extensionmethod;
begin
  Result := Self.ToWords().Select(s -> StrToFloat(s)).ToArray();
end;

/// ���������� �������� ������
function Inverse(Self: string): string; extensionmethod;
begin
  var sb := new System.Text.StringBuilder(Self.Length);
  for var i := Self.Length downto 1 do
    sb.Append(Self[i]);
  Result := sb.ToString;
end;

// ���������� ������� 2016: Matches, MatchValue, MatchValues, IsMatch, RegexReplace, Remove, Right, Left

/// �������� � ��������� ������ ��� ��������� ����������� ��������� ��������� ������� ������ � ���������� ��������������� ������
function RegexReplace(Self: string; reg, repl: string; options: RegexOptions := RegexOptions.None): string; extensionmethod;
begin
  Result := Regex.Replace(Self, reg, repl, options)
end;

/// �������� � ��������� ������ ��� ��������� ����������� ��������� ��������� ��������������� ������ � ���������� ��������������� ������
function RegexReplace(Self: string; reg: string; repl: Match->string; options: RegexOptions := RegexOptions.None): string; extensionmethod;
begin
  Result := Regex.Replace(Self, reg, repl, options)
end;

/// ���� � ��������� ������ ��� ��������� ����������� ��������� � ���������� �� � ���� ������������������ ��������� ���� Match
function Matches(Self: string; reg: string; options: RegexOptions := RegexOptions.None): sequence of Match; extensionmethod;
begin
  Result := (new Regex(reg, options)).Matches(Self).Cast<Match>();
end;

/// ���� � ��������� ������ ������ ��������� ����������� ��������� � ���������� ��� � ���� ������
function MatchValue(Self: string; reg: string; options: RegexOptions := RegexOptions.None): string; extensionmethod;
begin
  Result := (new Regex(reg, options)).Match(Self).Value;
end;

/// ���� � ��������� ������ ��� ��������� ����������� ��������� � ���������� �� � ���� ������������������ �����
function MatchValues(Self: string; reg: string; options: RegexOptions := RegexOptions.None): sequence of string; extensionmethod;
begin
  Result := Self.Matches(reg, options).Select(m -> m.Value);
end;

/// ������������� �� ������ ����������� ���������
function IsMatch(Self: string; reg: string; options: RegexOptions := RegexOptions.None): boolean; extensionmethod := Regex.IsMatch(Self, reg, options);

/// ������� � ������ ��� ��������� ��������� �����
function Remove(Self: string; params targets: array of string): string; extensionmethod;
begin
  var builder := new StringBuilder(Self);
  
  for var i := 0 to targets.Length - 1 do
    builder.Replace(targets[i], String.Empty);
  
  Result := builder.ToString();
end;

/// ���������� ���������, ���������� ���������� �� ������ length ����� ������ ��������
function Right(Self: string; length: integer): string; extensionmethod;
begin
  length := Max(length, 0);
  
  if Self.Length > length then
    Result := Self.Substring(Self.Length - length, length)
  else Result := Self;
end;

/// ���������� ���������, ���������� ���������� �� ������ length ����� ����� ��������
function Left(Self: string; length: integer): string; extensionmethod;
begin
  length := Max(length, 0);
  
  if Self.Length > length then
    Result := Self.Substring(0, length)
  else Result := Self;
end;

///-- 
function CreateSliceFromStringInternal(Self: string; from, step, count: integer): string;
begin
  var res := new StringBuilder(count);
  
  loop count do
  begin
    res.Append(Self[from]);
    from += step;
  end;
  Result := res.ToString;
end;

///-- 
function SliceStringImpl(Self: string; from, step, count: integer): string;
begin
  {if step = 0 then
    raise new ArgumentException(GetTranslation(PARAMETER_STEP_MUST_BE_NOT_EQUAL_0));
  
  if (from < 0) or (from > Self.Length - 1) then
    raise new ArgumentException(GetTranslation(PARAMETER_FROM_OUT_OF_RANGE));
  
  var cnt := step > 0 ? Self.Length - from : from + 1; 
  var cntstep := (cnt-1) div abs(step) + 1;
  if count > cntstep then 
    count := cntstep;}
  
  CorrectCountForSlice(Self.Length, from, step, count);
  
  Result := CreateSliceFromStringInternal(Self, from + 1, step, count);
end;

/// ���������� ���� ������ �� ������� from � ����� step
function Slice(Self: string; from, step: integer): string; extensionmethod;
begin
  Result := SliceStringImpl(Self, from, step, integer.MaxValue);
end;

/// ���������� ���� ������ �� ������� from � ����� step ����� �� ����� count
function Slice(Self: string; from, step, count: integer): string; extensionmethod;
begin
  Result := SliceStringImpl(Self, from, step, count);
end;

///-- 
function SystemSliceStringImpl(Self: string; situation: integer; from, to: integer; step: integer := 1): string;
begin
  var fromv := from - 1;
  var tov := to - 1;
  var count := CheckAndCorrectFromToAndCalcCountForSystemSlice(situation, Self.Length, fromv, tov, step);
  
  Result := CreateSliceFromStringInternal(Self, fromv + 1, step, count)
end;

///--
function SystemSlice(Self: string; situation: integer; from, to: integer): string; extensionmethod;
begin
  Result := SystemSliceStringImpl(Self, situation, from, to, 1);
end;

///--
function SystemSlice(Self: string; situation: integer; from, to, step: integer): string; extensionmethod;
begin
  Result := SystemSliceStringImpl(Self, situation, from, to, step);
end;

///-- 
function SystemSliceStringImplQuestion(Self: string; situation: integer; from, to: integer; step: integer := 1): string;
begin
  var fromv := from - 1;
  var tov := to - 1;
  
  var count := CorrectFromToAndCalcCountForSystemSliceQuestion(situation, Self.Length, fromv, tov, step);
  
  Result := CreateSliceFromStringInternal(Self, fromv + 1, step, count);
end;

///--
function SystemSliceQuestion(Self: string; situation: integer; from, to: integer): string; extensionmethod;
begin
  Result := SystemSliceStringImplQuestion(Self, situation, from, to, 1);
end;

///--
function SystemSliceQuestion(Self: string; situation: integer; from, to, step: integer): string; extensionmethod;
begin
  Result := SystemSliceStringImplQuestion(Self, situation, from, to, step);
end;
//--------------------------------------------
//>>     ������ ���������� ���� Func # Extension methods for Func
//--------------------------------------------
/// ������������ �������
function Compose<T1, T2, TResult>(Self: T2->TResult; composer: T1->T2): T1->TResult; extensionmethod;
begin
  if composer = nil then
    raise new System.ArgumentNullException('composer');
  var Slf := Self;
  Result := x -> Slf(composer(x));
end;

//------------------------------------------------------------------------------
//>>     ������ ���������� ���� Complex # Extension methods for Complex
//------------------------------------------------------------------------------
/// ���������� ���������� ����������� ��������
function Conjugate(Self: Complex): Complex; extensionmethod;
begin
  Result := Complex.Conjugate(Self);
end;

// -----------------------------------------------------------------------------
//>>     ������ ���������� �������� # Extension methods for IDictionary
// -----------------------------------------------------------------------------
/// ���������� � ������� ��������, ��������� � ��������� ������, � ���� ������ ����� ���, �� �������� �� ���������
function Get<Key, Value>(Self: IDictionary<Key, Value>; K: Key): Value; extensionmethod;
begin
  var b := Self.TryGetValue(K, Result);
  if not b then 
    Result := default(Value);
end;



// -----------------------------------------------------
//>>     ������������ ��� ������ � ��������������� ������� # Subroutines for typed files
// -----------------------------------------------------

/// ��������� �������������� ���� � ���������� �������� ��� ������������� �������� ����������
function OpenBinary<T>(fname: string): file of T;
begin
  PABCSystem.Reset(Result, fname);
end;

/// ������ ��� �������� �������������� ���� � ���������� �������� ��� ������������� �������� ����������
function CreateBinary<T>(fname: string): file of T;
begin
  PABCSystem.Rewrite(Result, fname);
end;

/// ��������� �������������� ���� � ���������� �������� ��� ������������� �������� ����������
function OpenFile<T>(fname: string): file of T;
begin
  PABCSystem.Reset(Result, fname);
end;

/// ������ ��� �������� �������������� ���� � ���������� �������� ��� ������������� �������� ����������
function CreateFile<T>(fname: string): file of T;
begin
  PABCSystem.Rewrite(Result, fname);
end;

/// ��������� �������������� ���� ����� � ���������� �������� ��� ������������� �������� ����������
function OpenFileInteger(fname: string): file of integer;
begin
  Result := OpenFile<integer>(fname);
end;

/// ��������� �������������� ���� ������������ � ���������� �������� ��� ������������� �������� ����������
function OpenFileReal(fname: string): file of real;
begin
  Result := OpenFile<real>(fname);
end;

/// ������ ��� �������� �������������� ���� ����� � ���������� �������� ��� ������������� �������� ����������
function CreateFileInteger(fname: string): file of integer;
begin
  Result := CreateFile<integer>(fname);
end;

/// ������ ��� �������� �������������� ���� ������������ � ���������� �������� ��� ������������� �������� ����������
function CreateFileReal(fname: string): file of real;
begin
  Result := CreateFile<real>(fname);
end;

/// ��������� �������������� ����, ���������� ������������������ ��� ��������� � ��������� ���
procedure WriteElements<T>(fname: string; ss: sequence of T);
begin
  var f := CreateBinary<T>(fname);
  foreach var x in ss do
    f.Write(x);
  f.Close
end;

// -----------------------------------------------------
//>>     ������ ���������� �������������� ������ # Extension methods for typed files
// -----------------------------------------------------

/// ������������� ������� ������� ��������� ��������� � �������������� ����� �� ������� � ������� n
function Seek<T>(Self: file of T; n: int64): file of T; extensionmethod;
begin
  PABCSystem.Seek(Self, n);
  Result := Self;
end;

/// ��������� � ���������� ��������� ������� ��������������� �����
function Read<T>(Self: file of T): T; extensionmethod;
begin
  PABCSystem.Read(Self, Result);
end;

/// ��������� � ���������� ��� ��������� �������� ��������������� ����� � ���� �������
function Read2<T>(Self: file of T): (T,T); extensionmethod;
begin
  var a,b: T;
  PABCSystem.Read(Self, a);
  PABCSystem.Read(Self, b);
  Result := (a,b);
end;

/// ��������� � ���������� ��� ��������� �������� ��������������� ����� � ���� �������
function Read3<T>(Self: file of T): (T,T,T); extensionmethod;
begin
  var a,b,c: T;
  PABCSystem.Read(Self, a);
  PABCSystem.Read(Self, b);
  PABCSystem.Read(Self, c);
  Result := (a,b,c);
end;

/// ���������� ������������������ ��������� ��������� ��������������� ����� �� �������� �������� �� ���������
function ReadElements<T>(Self: file of T): sequence of T; extensionmethod;
begin
  while not Self.Eof do
  begin
    var x := Self.Read;
    yield x;
  end;
end;

/// ��������� �������������� ����, ���������� ������������������ ��� ��������� � ��������� ���
function ReadElements<T>(fname: string): sequence of T;
begin
  var f := OpenBinary<T>(fname);
  while not f.Eof do
  begin
    var x := f.Read;
    yield x;
  end;
  f.Close
end;

/// ���������� ������ � �������������� ����
procedure Write<T>(Self: file of T; params vals: array of T); extensionmethod;
begin
  foreach var x in vals do
    PABCSystem.Write(Self, x);
end;

