//>>     ����������� ��������� # Standard constants
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
E = 2.718281828459045;
/// ��������� �������� �� ����� ������
NewLine = System.Environment.NewLine;
//>>     ����������� ���� # Standard types
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
//>>     ������������ ����� # Read subroutines
/// ������ �������� a,b,... � ����������
procedure Read(a,b,...);
/// ������ �������� a,b,... � ���������� � ������������ ������� �� ��������� ������
procedure Readln(a,b,...);
/// ������ �������� �������� x ����������. ���������� False ���� ��� ����� ��������� ������
function TryRead(var x: integer): boolean;
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
/// ������� ����������� � ����� � ���������� �������� ���� integer, ��������� � ����������,� ������������ ������� �� ��������� ������ �����
function ReadlnInteger(prompt: string): integer;
/// ������� ����������� � ����� � ���������� �������� ���� real, ��������� � ����������,� ������������ ������� �� ��������� ������ �����
function ReadlnReal(prompt: string): real;
/// ������� ����������� � ����� � ���������� �������� ���� char, ��������� � ����������,� ������������ ������� �� ��������� ������ �����
function ReadlnChar(prompt: string): char;
/// ������� ����������� � ����� � ���������� �������� ���� string, ��������� � ����������,� ������������ ������� �� ��������� ������ �����
function ReadlnString(prompt: string): string;
/// ������� ����������� � ����� � ���������� �������� ���� boolean, ��������� � ����������,� ������������ ������� �� ��������� ������ �����
function ReadlnBoolean(prompt: string): boolean;
/// ������ �������� a,b,... �� ����� f
procedure Read(f: ����; a,b,...);
/// ������ �������� a,b,... �� ���������� ����� f � ������������ ������� �� ��������� ������
procedure Readln(f: Text; a,b,...);
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
/// ���������� �������� ���� integer, ��������� �� ���������� ����� f,� ������������ ������� �� ��������� ������
function ReadlnInteger(f: Text): integer;
/// ���������� �������� ���� real, ��������� �� ���������� ����� f,� ������������ ������� �� ��������� ������
function ReadlnReal(f: Text): real;
/// ���������� �������� ���� char, ��������� �� ���������� ����� f,� ������������ ������� �� ��������� ������
function ReadlnChar(f: Text): char;
/// ���������� �������� ���� string, ��������� �� ���������� ����� f,� ������������ ������� �� ��������� ������
function ReadlnString(f: Text): string;
/// ���������� �������� ���� boolean, ��������� �� ���������� ����� f,� ������������ ������� �� ��������� ������
function ReadlnBoolean(f: Text): boolean;
//>>     ������������ ������ # Write subroutines
/// ������� �������� a,b,... �� �����
procedure Write(a,b,...);
/// ������� �������� a,b,... �� ����� � ������������ ������� �� ����� ������
procedure Writeln(a,b,...);
/// ������� �������� a,b,... � ���� f
procedure Write(f: ����; a,b,...);
/// ������� �������� a,b,... � ��������� ���� f � ������������ ������� �� ����� ������
procedure Writeln(f: Text; a,b,...);
/// ������� �������� args �������� ��������� ������ formatstr
procedure WriteFormat(formatstr: string; params args: array of object);
/// ������� �������� args �������� ��������� ������ formatstr � ������������ ������� �� ����� ������
procedure WritelnFormat(formatstr: string; params args: array of object);
/// ������� �������� args � ��������� ���� f �������� ��������� ������ formatstr
procedure WriteFormat(f: Text; formatstr: string; params args: array of object);
/// ������� �������� args � ��������� ���� f �������� ��������� ������ formatstr� ������������ ������� �� ����� ������
procedure WritelnFormat(f: Text; formatstr: string; params args: array of object);
/// ������� �������� a,b,... �� �����, ����� ������� �������� ������� ������
procedure Print(a,b,...);
/// ������� �������� a,b,... � ��������� ���� f, ����� ������� �������� ������� ������
procedure Print(f: Text; a,b,...);
/// ������� �������� a,b,... �� �����, ����� ������� �������� ������� ������ � ��������� �� ����� ������
procedure Println(a,b,...);
/// ������� �������� a,b,... � ��������� ���� f, ����� ������� �������� ������� ������ � ��������� �� ����� ������
procedure Println(f: Text; a,b,...);
//>>     ����� ������������ ��� ������ � ������� # Common subroutines for files
/// ��������� �������� ���������� � ������ �� �����
procedure Assign(f: ����; name: string);
/// ��������� �������� ���������� � ������ �� �����
procedure AssignFile(f: ����; name: string);
/// ��������� ����
procedure Close(f: ����);
/// ��������� ����
procedure CloseFile(f: ����);
/// ���������� True, ���� ��������� ����� �����
function Eof(f: ����): boolean;
/// ������� ����, ��������� � �������� ����������
procedure Erase(f: ����);
/// ��������������� ����, �������� � �������� ����������, ����� ��� ��� newname.
procedure Rename(f: ����; newname: string);
//>>     ������������ ��� ������ � ���������� ������� # Subroutines for text files
/// ��������� ��������� ���� �� ������ � ��������� Windows
procedure Reset(f: Text);
/// ��������� ��������� ���� �� ������ � ��������� ���������
procedure Reset(f: Text; en: Encoding);
/// ��������� �������� ���������� f � ������ ����� name � ��������� ��������� ���� �� ������ � ��������� Windows
procedure Reset(f: Text; name: string);
/// ��������� �������� ���������� f � ������ ����� name � ��������� ��������� ���� �� ������ � ��������� ���������
procedure Reset(f: Text; name: string; en: Encoding);
/// ��������� ��������� ���� �� ������ � ��������� Windows.���� ���� ����������� - �� ����������, ���� ��� - ��������� ������
procedure Rewrite(f: Text);
/// ��������� ��������� ���� �� ������ � ��������� ���������.���� ���� ����������� - �� ����������, ���� ��� - ��������� ������
procedure Rewrite(f: Text; en: Encoding);
/// ��������� �������� ���������� � ������ ����� name � ��������� ��������� ���� f �� ������ � ��������� Windows.���� ���� ����������� - �� ����������, ���� ��� - ��������� ������
procedure Rewrite(f: Text; name: string);
/// ��������� �������� ���������� f � ������ ����� name � ��������� ��������� ���� f �� ������ � ��������� ���������.���� ���� ����������� - �� ����������, ���� ��� - ��������� ������
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
/// ���������� True, ���� � ����� ��������� ����� ������
function Eoln(f: Text): boolean;
/// ���������� ���������� �������, ����� ���� ���������� True, ���� ��������� ����� �����
function SeekEof(f: Text): boolean;
/// ���������� ���������� �������, ����� ���� ���������� True, ���� � ����� ��������� ����� ������
function SeekEoln(f: Text): boolean;
/// ���������� ���������� ������ ����� �� ����
procedure Flush(f: Text);
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
//>>     ������������ ��� ������ � ��������� ������� # Subroutines for binary files
/// ��������� �������� ���� �� ������ � ������.�������� ���� - ��� ���� �������������� ���� file of T, ���� ���������� ���� file
procedure Reset(f: �������� ����);
/// ��������� �������� ���������� f � ������ name �� ����� � ��������� �������� ���� �� ������ � ������.�������� ���� - ��� ���� �������������� ���� file of T, ���� ���������� ���� file
procedure Reset(f: �������� ����; name: string);
/// ��������� �������� ���� �� ������ � ������, ��� ���� ������� ��� ����������. ���� ���� �����������, �� ����������.�������� ���� - ��� ���� �������������� ���� file of T, ���� ���������� ���� file
procedure Rewrite(f: �������� ����);
/// ��������� �������� ���������� f � ������ name �� ����� � ��������� �������� ���� �� ������ � ������, ��� ���� ������� ��� ����������.�������� ���� - ��� ���� �������������� ���� file of T, ���� ���������� ���� file
procedure Rewrite(f: �������� ����; name: string);
/// ������� �������� ����, ���������� ��� �������� � ������� ��������� ���������.�������� ���� - ��� ���� �������������� ���� file of T, ���� ���������� ���� file
procedure Truncate(f: �������� ����);
/// ���������� ������� ������� ��������� ��������� � �������� �����
function FilePos(f: �������� ����): int64;
/// ���������� ���������� ��������� � �������� �����
function FileSize(f: �������� ����): int64;
/// ������������� ������� ������� ��������� ��������� � �������� ����� �� ������� � ������ �������
procedure Seek(f: �������� ����; n: int64);
//>>     C�������� ������������ # System subroutines
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
/// �������� ������������ ������ ������� sizeof(T) � ���������� � ���������� p ��������� �� ���. ��� T ������ ���� ���������
procedure New<T>(var p: ^T);
/// ����������� ������������ ������, �� ������� ��������� p
procedure Dispose<T>(var p: ^T);
//>>     ������� ��� ������ � ������� ������ # Functions for file names
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
//>>     �������������� ������������ # Math subroutines
/// ���������� ���� ����� x
function Sign(x: �����): �����;
/// ���������� ������ ����� x
function Abs(x: �����): �����;
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
/// ���������� ������� ����� x
function Sqr(x: �����): �����;
/// ���������� x � ������� y
function Power(x, y: real): real;
/// ���������� x � ����� ������� n
function Power(x: real; n: integer): real;
/// ���������� x � ������� y
function Power(x: BigInteger; y: integer): BigInteger;
/// ���������� x, ����������� �� ���������� ������. ���� ������������ ��������� ���������� ����� ����� ������,�� ���������� �������������� � ���������� ������� (���������� ����������): Round(2.5)=2, Round(3.5)=4
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
/// ���������� ������������ �� ����� a,b
function Max(a: �����, b: �����): �����;
/// ���������� ����������� �� ����� a,b
function Min(a: �����, b: �����): �����;
/// ���������� True, ���� i �������, � False � ��������� ������
function Odd(i: �����): boolean;
//>>     ������� ��� ������ � ������������ ������� # Functions for Complex numbers
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
//>>     ��������� ��� ������ �� ������������ ����������� # Subroutines for set of T
///��������� ������� element �� ��������� s
procedure Include(var s: set of T; element: T);
///������� ������� element �� ��������� s
procedure Exclude(var s: set of T; element: T);
//>>     ������������ ��� ������ � ��������� # Subroutines for char
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
//>>     ������������ ��� ������ �� �������� # Subroutines for string
/// ����������� ����� �������� i � ���������� ������������� � ���������� ��������� � s
procedure Str(i: �����; var s: string);
/// ����������� ������������ �������� r � ���������� ������������� � ���������� ��������� � s
procedure Str(r: real; var s: string);
/// ����������� ������������ �������� r � ���������� ������������� � ���������� ��������� � s
procedure Str(r: single; var s: string);
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
/// ��������� ��������� source � ������ s � ������� index
procedure Insert(source: string; var s: string; index: integer);
/// ������� �� ������ s count �������� � ������� index
procedure Delete(var s: string; index, count: integer);
/// ���������� ��������� ������ s ����� count � ������� index
function Copy(s: string; index, count: integer): string;
/// ���������� ������, ���������� ����������� ������� ����� s1,s2,...
function Concat(s1,s2,...): string;
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
/// ����������� ��������� ������������� s ������ ����� � ��������� �������� � ���������� ��� � value.��� ������������� �������������� ������������ False
function TryStrToInt(s: string; var value: integer): boolean;
/// ����������� ��������� ������������� s ������ ����� � ��������� �������� � ���������� ��� � value.��� ������������� �������������� ������������ False
function TryStrToInt64(s: string; var value: int64): boolean;
/// ����������� ��������� ������������� s ������������� ����� � ��������� �������� � ���������� ��� � value.��� ������������� �������������� ������������ False
function TryStrToFloat(s: string; var value: real): boolean;
/// ����������� ��������� ������������� s ������������� ����� � ��������� �������� � ���������� ��� � value.��� ������������� �������������� ������������ False
function TryStrToFloat(s: string; var value: single): boolean;
/// ����������� ��������� ������������� s ������������� ����� � ��������� �������� � ���������� ��� � value.��� ������������� �������������� ������������ False
function TryStrToReal(s: string; var value: real): boolean;
/// ����������� ��������� ������������� s ������������� ����� � ��������� �������� � ���������� ��� � value.��� ������������� �������������� ������������ False
function TryStrToSingle(s: string; var value: single): boolean;
/// ��������� ����� �� ������ ������� � ������� from � ������������� from �� ��������� ���������
function ReadIntegerFromString(s: string; var from: integer): integer;
/// ��������� ������������ �� ������ ������� � ������� from � ������������� from �� ��������� ���������
function ReadRealFromString(s: string; var from: integer): real;
/// ��������� �� ������ ������������������ �������� �� ����������� ������� ������� � ������� from � ������������� from �� ��������� ���������
function ReadWordFromString(s: string; var from: integer): string;
/// ���������� True ���� ��������� ����� ������ ��� � ������ �������� ������ ���������� ������� � False � ��������� ������
function StringIsEmpty(s: string; var from: integer): boolean;
/// ��������� ����� �� ������ ������� � ������� from � ������������� from �� ��������� ���������.���������� True ���� ���������� ������ � False � ��������� ������
function TryReadIntegerFromString(s: string; var from: integer; var res: integer): boolean;
/// ��������� ������������ �� ������ ������� � ������� from � ������������� from �� ��������� ���������.���������� True ���� ���������� ������ � False � ��������� ������
function TryReadRealFromString(s: string; var from: integer; var res: real): boolean;
/// ����������� ��������� ������������� s ������ ����� � ��������� �������� � ���������� ��� � ���������� value.���� �������������� �������, �� err=0, ����� err>0
procedure Val(s: string; var value: �����; var err: integer);
/// ����������� ����� ����� � ���������� �������������
function IntToStr(a: integer): string;
/// ����������� ����� ����� � ���������� �������������
function IntToStr(a: int64): string;
/// ����������� ������������ ����� � ���������� �������������
function FloatToStr(a: real): string;
/// ���������� ����������������� ������, ����������� �� ��������� ������ � ������ ������������� ����������
function Format(formatstring: string; params pars: array of object): string;
//>>     ����� ������������ # Common subroutines
/// ����������� �������� ���������� i �� 1
procedure Inc(var i: integer);
/// ����������� �������� ���������� i �� n
procedure Inc(var i: integer; n: integer);
/// ��������� �������� ���������� i �� 1
procedure Dec(var i: integer);
/// ��������� �������� ���������� i �� n
procedure Dec(var i: integer; n: integer);
/// ����������� �������� ������������� ���� �� 1
procedure Inc(var e: ������������ ���);
/// ����������� �������� ������������� ���� �� n
procedure Inc(var e: ������������ ���; n: integer);
/// ��������� �������� ������������� ���� �� 1
procedure Dec(var e: ������������ ���);
/// ��������� �������� ������������� ���� �� n
procedure Dec(var e: ������������ ���; n: integer);
/// ���������� ���������� ����� �������� a
function Ord(a: �����): �����;
/// ���������� ���������� ����� �������� a
function Ord(a: ������������ ���): integer;
/// ���������� ��������� �� x ��������
function Succ(x: �����): �����;
/// ���������� ��������� �� x ��������
function Succ(x: ������������ ���): ������������ ���;
/// ���������� �������������� x ��������
function Pred(x: �����): �����;
/// ���������� �������������� x ��������
function Pred(x: ������������ ���): ������������ ���;
/// ������ ������� �������� ���� ����������
procedure Swap<T>(var a, b: T);
/// ���������� True, ���� ��������� ����� ������
function Eoln: boolean;
/// ���������� True, ���� ��������� ����� ������ �����
function Eof: boolean;
//>>     ������������ ��� ������ � ������������� ��������� # Subroutines for array of T
/// ���������� 0
function Low(a: array of T): integer;
/// ���������� ������� ������� ������������� �������
function High(a: array of T): integer;
/// ���������� ����� ������������� �������
function Length(a: array of T): integer;
/// ���������� ����� ������������� ������� �� ����������� dim
function Length(a: array of T; dim: integer): integer;
/// ������������� ����� ����������� ������������� �������. ������ ���������� �����������
procedure SetLength(var a: array of T);
/// ������������� ������� n-������� ������������� �������. ������ ���������� �����������
procedure SetLength(var a: array of T; n1,n2,...: integer);
/// ������ ����� ������������� �������
function Copy(a: array of T): array of T;
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
//>>     ������������ ��� ��������� ������������������� # Subroutines for sequence generation
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
/// ���������� ������������������ �� count ���������, ������������ � first � second,� �������� next �������� �� ���� ���������� � ����������
function SeqGen<T>(count: integer; first, second: T; next: (T,T) ->T): sequence of T;
/// ���������� ������������������ ��������� � ��������� ��������� first,�������� next �������� �� ����������� � ���������� � �������� pred ����������� ������������������
function SeqWhile<T>(first: T; next: T->T; pred: T->boolean): sequence of T;
/// ���������� ������������������ ���������, ������������ � first � second,� �������� next �������� �� ���� ���������� � ���������� � �������� pred ����������� ������������������
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
//>>     ������������ ��� ��������� ������������ �������� # Subroutines for array of T generation
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
//>>     ������������ ��� ������ # Subroutines for matrixes
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
//>>     ������������ ��� �������� �������� # Subroutines for tuple generation
/// ���������� ������ �� ��������� ������ �����
function Rec(x1: T1, x2: T2,...): (T1,T2,...);
//>>     �������� ������� Lst, LLst, HSet, SSet, Dict, KV # Short functions Lst, HSet, SSet, Dict, KV
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
//>>     ��������� ����������� ������������������� # Infinite sequences
/// ���������� ����������� ������������������ ����� �� �������� �������� � ����� 1
function Step(Self: integer): sequence of integer; extensionmethod;
/// ���������� ����������� ������������������ ����� �� �������� �������� � ����� step
function Step(Self: integer; step: integer): sequence of integer; extensionmethod;
/// ���������� ����������� ������������������ ������������ �� �������� �������� � ����� step
function Step(Self: real; step: real): sequence of real; extensionmethod;
/// ��������� ������������������ ����������� ����� ���
function Cycle<T>(Self: sequence of T): sequence of T; extensionmethod;
//>>     ��������� ������ XXX - �� �������! # XXX
AdjGroupClass<T> = class
private
cur: T;
enm: IEnumerator<T>;
fin: boolean;
public
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
//>>     ����� ���������� Print ��� ������������ ����� # Print for elementary types
function Print(Self: integer): integer; extensionmethod;
function Print(Self: real): real; extensionmethod;
function Print(Self: char): char; extensionmethod;
function Print(Self: boolean): boolean; extensionmethod;
function Print(Self: BigInteger): BigInteger; extensionmethod;
function Println(Self: integer): integer; extensionmethod;
function Println(Self: real): real; extensionmethod;
function Println(Self: char): char; extensionmethod;
function Println(Self: boolean): boolean; extensionmethod;
function Println(Self: BigInteger): BigInteger; extensionmethod;
//>>     ������ ���������� ��� sequence of T # Extension methods for sequence of T
/// ������� ������������������ �� �����, ��������� delim � �������� �����������
function Print<T>(Self: sequence of T; delim: string): sequence of T; extensionmethod;
/// ������� ������������������ �� �����, ��������� ������ � �������� �����������
function Print<T>(Self: sequence of T): sequence of T; extensionmethod;
/// ������� ������������������ �� �����, ��������� delim � �������� �����������, � ��������� �� ����� ������
function Println<T>(Self: sequence of T; delim: string): sequence of T; extensionmethod;
/// ������� ������������������ �� �����, ��������� ������ �������� �����������, � ��������� �� ����� ������
function Println<T>(Self: sequence of T): sequence of T; extensionmethod;
/// ������� ������������������ ����� � ����
function WriteLines(Self: sequence of string; fname: string): sequence of string; extensionmethod;
/// ������� ������������������, ������ ������� ��������� �� ����� ������
function PrintLines<T>(Self: sequence of T): sequence of T; extensionmethod;
/// ������� ������������������, ������ ������� ������������ � ������� ������� map � ��������� �� ����� ������
function PrintLines<T,T1>(Self: sequence of T; map: T->T1): sequence of T; extensionmethod;
/// ����������� �������� ������������������ � ��������� �������������, ����� ���� ���������� �� � ������, ��������� delim � �������� �����������
function JoinIntoString<T>(Self: sequence of T; delim: string): string; extensionmethod;
/// ����������� �������� ������������������ � ��������� �������������, ����� ���� ���������� �� � ������, ��������� ������ � �������� �����������
function JoinIntoString<T>(Self: sequence of T): string; extensionmethod;
/// ��������� �������� � ������� �������� ������������������
procedure ForEach<T>(Self: sequence of T; action: T -> ()); extensionmethod;
/// ��������� �������� � ������� �������� ������������������, ��������� �� ������ ��������
procedure ForEach<T>(Self: sequence of T; action: (T,integer) -> ()); extensionmethod;
/// ���������� ��������������� �� ����������� ������������������
function Sorted<T>(Self: sequence of T): sequence of T; extensionmethod;
/// ���������� ��������������� �� �������� ������������������
function SortedDescending<T>(Self: sequence of T): sequence of T; extensionmethod;
/// ���������� ��������������� �� ����������� ������������������
function Order<T>(Self: sequence of T): sequence of T; extensionmethod;
/// ���������� ��������������� �� �������� ������������������
function OrderDescending<T>(Self: sequence of T): sequence of T; extensionmethod;
/// ���������� ��������� HashSet �� ������ ������������������
function ToHashSet<T>(Self: sequence of T): HashSet<T>; extensionmethod;
/// ���������� ��������� SortedSet �� ������ ������������������
function ToSortedSet<T>(Self: sequence of T): SortedSet<T>; extensionmethod;
/// ���������� LinkedList �� ������ ������������������
function ToLinkedList<T>(Self: sequence of T): LinkedList<T>; extensionmethod;
/// ���������� ������ ������� ������������������ � ����������� ��������� �����
function MinBy<T, TKey>(Self: sequence of T; selector: T->TKey): T; extensionmethod;
/// ���������� ������ ������� ������������������ � ������������ ��������� �����
function MaxBy<T, TKey>(Self: sequence of T; selector: T->TKey): T; extensionmethod;
/// ���������� ��������� ������� ������������������ � ����������� ��������� �����
function LastMinBy<T, TKey>(Self: sequence of T; selector: T->TKey): T; extensionmethod;
/// ���������� ��������� ������� ������������������ � ������������ ��������� �����
function LastMaxBy<T, TKey>(Self: sequence of T; selector: T->TKey): T; extensionmethod;
/// ���������� ��������� count ��������� ������������������
function TakeLast<T>(Self: sequence of T; count: integer): sequence of T; extensionmethod;
/// ���������� ������������������ ��� ��������� count ���������
function SkipLast<T>(self: sequence of T; count: integer := 1): sequence of T; extensionmethod;
/// ��������� ������������ �������������������
function Cartesian<T, T1>(Self: sequence of T; b: sequence of T1): sequence of (T, T1); extensionmethod;
/// ��������� ������������ �������������������
function Cartesian<T, T1, T2>(Self: sequence of T; b: sequence of T1; func: (T,T1)->T2): sequence of T2; extensionmethod;
/// ��������� ������������������ �� ��� � ������� ind
function SplitAt<T>(Self: sequence of T; ind: integer): (sequence of T, sequence of T); extensionmethod;
/// ��������� ������������������ �� ��� �� ��������� �������
function Partition<T>(Self: sequence of T; cond: T->boolean): (sequence of T, sequence of T); extensionmethod;
/// ��������� ������������������ �� ��� �� ��������� �������, � ������� ��������� ������
function Partition<T>(Self: sequence of T; cond: (T,integer)->boolean): (sequence of T, sequence of T); extensionmethod;
/// ���������� ��� ������������������ � ������������������ �������������� ��������
function ZipTuple<T, T1>(Self: sequence of T; a: sequence of T1): sequence of (T, T1); extensionmethod;
/// ���������� ��� ������������������ � ������������������ �������������� ��������
function ZipTuple<T, T1, T2>(Self: sequence of T; a: sequence of T1; b: sequence of T2): sequence of (T, T1, T2); extensionmethod;
/// ���������� ������ ������������������ � ������������������ ����������������� ��������
function ZipTuple<T, T1, T2, T3>(Self: sequence of T; a: sequence of T1; b: sequence of T2; c: sequence of T3): sequence of (T, T1, T2, T3); extensionmethod;
/// ����������� ������������������ �������������� �������� �� ��� ������������������
function UnZipTuple<T, T1>(Self: sequence of (T, T1)): (sequence of T, sequence of T1); extensionmethod;
/// ����������� ������������������ �������������� �������� �� ��� ������������������
function UnZipTuple<T, T1, T2>(Self: sequence of (T, T1, T2)): (sequence of T, sequence of T1, sequence of T2); extensionmethod;
/// ����������� ������������������ ����������������� �������� �� ������ ������������������
function UnZipTuple<T, T1, T2, T3>(Self: sequence of (T, T1, T2, T3)): (sequence of T, sequence of T1, sequence of T2, sequence of T3); extensionmethod;
/// �������� �������� ���� �������������������
function Interleave<T>(Self: sequence of T; a: sequence of T): sequence of T; extensionmethod;
/// �������� �������� ���� �������������������
function Interleave<T>(Self: sequence of T; a, b: sequence of T): sequence of T; extensionmethod;
/// �������� �������� ������� �������������������
function Interleave<T>(Self: sequence of T; a, b, c: sequence of T): sequence of T; extensionmethod;
/// �������� ������������������ � �������
function Numerate<T>(Self: sequence of T): sequence of (integer, T); extensionmethod;
/// �������� ������������������ � ������ from
function Numerate<T>(Self: sequence of T; from: integer): sequence of (integer, T); extensionmethod;
/// ���������� ������� �������������������
function Tabulate<T, T1>(Self: sequence of T; F: T->T1): sequence of (T, T1); extensionmethod;
/// ���������� ������������������ � ������������������ ��� �������� ���������
function Pairwise<T>(Self: sequence of T): sequence of (T, T); extensionmethod;
/// ���������� ������������������ � ������������������ ��� �������� ���������, ��������� func � ������ ���� ���������� ��������� � �������� ����� ������������������
function Pairwise<T, Res>(Self: sequence of T; func: (T,T)->Res): sequence of Res; extensionmethod;
/// ��������� ������������������ �� ����� ����� size
function Batch<T>(Self: sequence of T; size: integer): sequence of sequence of T; extensionmethod;
/// ��������� ������������������ �� ����� ����� size � ��������� �������� � ������ �����
function Batch<T, Res>(Self: sequence of T; size: integer; proj: Func<IEnumerable<T>, Res>): sequence of Res; extensionmethod;
/// ���������� ���� ������������������ �� ������ from � ����� step > 0
function Slice<T>(Self: sequence of T; from, step: integer): sequence of T; extensionmethod;
/// ���������� ���� ������������������ �� ������ from � ����� step > 0 ����� �� ����� count
function Slice<T>(Self: sequence of T; from, step, count: integer): sequence of T; extensionmethod;
/// ���������� ������������������ ��������� �������� ��������� �������� ������������������
function Incremental(Self: sequence of integer): sequence of integer; extensionmethod;
/// ���������� ������������������ ��������� �������� ��������� �������� ������������������
function Incremental(Self: array of integer): sequence of integer; extensionmethod;
/// ���������� ������������������ ��������� �������� ��������� �������� ������������������
function Incremental(Self: List<integer>): sequence of integer; extensionmethod;
/// ���������� ������������������ ��������� �������� ��������� �������� ������������������
function Incremental(Self: LinkedList<integer>): sequence of integer; extensionmethod;
/// ���������� ������������������ ��������� �������� ��������� �������� ������������������
function Incremental(Self: sequence of real): sequence of real; extensionmethod;
/// ���������� ������������������ ��������� �������� ��������� �������� ������������������
function Incremental(Self: array of real): sequence of real; extensionmethod;
/// ���������� ������������������ ��������� �������� ��������� �������� ������������������
function Incremental(Self: List<real>): sequence of real; extensionmethod;
/// ���������� ������������������ ��������� �������� ��������� �������� ������������������
function Incremental(Self: LinkedList<real>): sequence of real; extensionmethod;
/// ���������� ������������������ ��������� �������� ��������� �������� ������������������. � �������� ������� �������� ������������ func
function Incremental<T, T1>(Self: sequence of T; func: (T,T)->T1): sequence of T1; extensionmethod;
/// ���������� ������������������ ��������� �������� ��������� �������� ������������������. � �������� ������� �������� ������������ func
function Incremental<T, T1>(Self: sequence of T; func: (T,T,integer)->T1): sequence of T1; extensionmethod;
/// ���������� ���������� ������ ������ ��������, ������� ������������������ ��������
function AdjacentGroup<T>(Self: sequence of T): sequence of array of T; extensionmethod;
//>>     ������ ���������� ���� List<T> # Extension methods for List T
/// ������������ �������� ������ ��������� �������
function Shuffle<T>(Self: List<T>): List<T>; extensionmethod;
/// ������� ������ ���� ������ ������ ���������� ��������� � ���������� ������ ������� �������� ����. ���� �� ������, ������������ -1
function AdjacentFind<T>(Self: IList<T>; start: integer := 0): integer; extensionmethod;
/// ������� ������ ���� ������ ������ ���������� ���������, ��������� ������� ��������� eq, � ���������� ������ ������� �������� ����. ���� �� ������, ������������ -1
function AdjacentFind<T>(Self: IList<T>; eq: (T,T)->boolean; start: integer := 0): integer; extensionmethod;
/// ���������� ������ ������� ������������ �������� ������� � ������� index
function IndexMin<T>(Self: IList<T>; index: integer := 0): integer; extensionmethod;where T: IComparable<T>;
/// ���������� ������ ������� ������������� �������� ������� � ������� index
function IndexMax<T>(self: IList<T>; index: integer := 0): integer; extensionmethod;where T: System.IComparable<T>;
/// ���������� ������ ���������� ������������ ��������
function LastIndexMin<T>(Self: IList<T>): integer; extensionmethod;where T: System.IComparable<T>;
/// ���������� ������ ���������� ������������ �������� � ��������� [0,index-1]
function LastIndexMin<T>(Self: IList<T>; index: integer): integer; extensionmethod;where T: System.IComparable<T>;
/// ���������� ������ ���������� ������������� ��������
function LastIndexMax<T>(Self: IList<T>): integer; extensionmethod;where T: System.IComparable<T>;
/// ���������� ������ ���������� ������������ �������� � ��������� [0,index-1]
function LastIndexMax<T>(Self: IList<T>; index: integer): integer; extensionmethod;where T: System.IComparable<T>;
/// �������� � ������� ��� ������ ��� ��������� ������ �������� �� ������
procedure Replace<T>(Self: IList<T>; oldValue, newValue: T); extensionmethod;
/// ����������� �������� ������� ��� ������ �� ��������� �������
procedure Transform<T>(Self: IList<T>; f: T->T); extensionmethod;
/// ��������� �������� ������� ��� ������ ����������, ������������ �� ���������� �������
procedure Fill<T>(Self: IList<T>; f: integer->T); extensionmethod;
/// ���������� ���� ������ �� ������� from � ����� step
function Slice<T>(Self: List<T>; from, step: integer): List<T>; extensionmethod;
/// ���������� ���� ������ �� ������� from � ����� step ����� �� ����� count
function Slice<T>(Self: List<T>; from, step, count: integer): List<T>; extensionmethod;
/// ������� ��������� �������. ���� ��������� ���, ���������� ����������
function RemoveLast<T>(Self: List<T>): List<T>; extensionmethod;
procedure CorrectFromTo(situation: integer; Len: integer; var from, to: integer; step: integer);
//>>     ������ ���������� ���� array [,] of T # Extension methods for array [,] of T
/// ���������� ����� � ��������� �������
function RowCount<T>(Self: array [,] of T): integer; extensionmethod;
/// ���������� �������� � ��������� �������
function ColCount<T>(Self: array [,] of T): integer; extensionmethod;
/// ����� ���������� �������, w - ������ ���� ������
function Print<T>(Self: array [,] of T; w: integer := 4): array [,] of T; extensionmethod;
/// ����� ���������� ������������� ������� �� ������� :w:f
function Print(Self: array [,] of real; w: integer := 7; f: integer := 2): array [,] of real; extensionmethod;
/// ����� ���������� ������� � ������� �� ��������� ������, w - ������ ���� ������
function Println<T>(Self: array [,] of T; w: integer := 4): array [,] of T; extensionmethod;
/// ����� ���������� ������������� ������� �� ������� :w:f � ������� �� ��������� ������
function Println(Self: array [,] of real; w: integer := 7; f: integer := 2): array [,] of real; extensionmethod;
/// k-��� ������ ���������� �������
function Row<T>(Self: array [,] of T; k: integer): array of T; extensionmethod;
/// k-��� ������� ���������� �������
function Col<T>(Self: array [,] of T; k: integer): array of T; extensionmethod;
/// k-��� ������ ���������� ������� ��� ������������������
function RowSeq<T>(Self: array [,] of T; k: integer): sequence of T; extensionmethod;
/// k-��� ������� ���������� ������� ��� ������������������
function ColSeq<T>(Self: array [,] of T; k: integer): sequence of T; extensionmethod;
/// ���������� ������������������ ����� ���������� �������
function Rows<T>(Self: array [,] of T): sequence of sequence of T; extensionmethod;
/// ���������� ������������������ �������� ���������� �������
function Cols<T>(Self: array [,] of T): sequence of sequence of T; extensionmethod;
/// ������ ������� ��� ������ ���������� ������� � �������� k1 � k2
procedure SwapRows<T>(Self: array [,] of T; k1, k2: integer); extensionmethod;
/// ������ ������� ��� ������� ���������� ������� � �������� k1 � k2
procedure SwapCols<T>(Self: array [,] of T; k1, k2: integer); extensionmethod;
/// ������ ������ k ���������� ������� �� ������ ������
procedure SetRow<T>(Self: array [,] of T; k: integer; a: array of T); extensionmethod;
/// ������ ������ k ���������� ������� �� ������ ������
procedure SetRow<T>(Self: array [,] of T; k: integer; a: sequence of T); extensionmethod := Self.SetRow(k,a.ToArray);
/// ������ ������� k ���������� ������� �� ������ �������
procedure SetCol<T>(Self: array [,] of T; k: integer; a: array of T); extensionmethod;
/// ������ ������� k ���������� ������� �� ������ �������
procedure SetCol<T>(Self: array [,] of T; k: integer; a: sequence of T); extensionmethod := Self.SetCol(k,a.ToArray);
/// ���������� �� ��������� ���������� ������� ������������������ (a[i,j],i,j)
function ElementsWithIndexes<T>(Self: array [,] of T): sequence of (T, integer, integer); extensionmethod;
/// ���������� �� ��������� ���������� ������� ������������������ ��� ��������� �� �������
function ElementsByRow<T>(Self: array [,] of T): sequence of T; extensionmethod;
/// ���������� �� ��������� ���������� ������� ������������������ ��� ��������� �� ��������
function ElementsByCol<T>(Self: array [,] of T): sequence of T; extensionmethod;
/// ����������� �������� ���������� ������� � ���������� ��������������� ������
function ConvertAll<T, T1>(Self: array [,] of T; converter: T->T1): array [,] of T1; extensionmethod;
/// ����������� �������� ���������� ������� �� ��������� �������
procedure Transform<T>(Self: array [,] of T; f: T->T); extensionmethod;
/// ��������� �������� ���������� ������� ����������, ������������ �� ���������� �������
procedure Fill<T>(Self: array [,] of T; f: (integer,integer) ->T); extensionmethod;
//>>     ��������� ������ YYY - �� �������! # YYY
function Matr<T>(m,n: integer; params data: array of T): array [,] of T;
function MatrRandom(m: integer; n: integer; a, b: integer): array [,] of integer;
function MatrRandomInteger(m: integer; n: integer; a, b: integer): array [,] of integer;
function MatrRandomReal(m: integer; n: integer; a, b: real): array [,] of real;
function MatrFill<T>(m, n: integer; x: T): array [,] of T;
function MatrGen<T>(m, n: integer; gen: (integer,integer)->T): array [,] of T;
function Transpose<T>(a: array [,] of T): array [,] of T;
function ReadMatrInteger(m, n: integer): array [,] of integer;
function ReadMatrReal(m, n: integer): array [,] of real;
//>>     ������ ���������� ���� array of T # Extension methods for array of T
/// ������������ �������� ������� ��������� �������
function Shuffle<T>(Self: array of T): array of T; extensionmethod;
{/// ������� ������ ���� ������ ������ ���������� ��������� � ���������� ������ ������� �������� ����. ���� �� ������, ������������ -1
function AdjacentFind<T>(Self: array of T; start: integer := 0): integer; extensionmethod;
/// ������� ������ ���� ������ ������ ���������� ���������, ��������� ������� ��������� eq, � ���������� ������ ������� �������� ����. ���� �� ������, ������������ -1
function AdjacentFind<T>(Self: array of T; eq: (T,T)->boolean; start: integer := 0): integer; extensionmethod;
/// ���������� ����������� �������
function Min<T>(Self: array of T): T; extensionmethod;where T: System.IComparable<T>;
/// ���������� ������������ �������
function Max<T>(Self: array of T): T; extensionmethod;where T: System.IComparable<T>;
/// ���������� ����������� �������
function Min(Self: array of integer): integer; extensionmethod;
/// ���������� ����������� �������
function Min(Self: array of real): real; extensionmethod;
/// ���������� ������������ �������
function Max(Self: array of integer): integer; extensionmethod;
/// ���������� ������������ �������
function Max(Self: array of real): real; extensionmethod;
{/// ���������� ������ ������� ������������ �������� ������� � ������� index
function IndexMin<T>(Self: array of T; index: integer := 0): integer; extensionmethod; where T: System.IComparable<T>;
/// ���������� ������ ������� ������������� �������� ������� � ������� index
function IndexMax<T>(self: array of T; index: integer := 0): integer; extensionmethod; where T: System.IComparable<T>;
/// ���������� ������ ���������� ������������ ��������
function LastIndexMin<T>(Self: array of T): integer; extensionmethod; where T: System.IComparable<T>;
/// ���������� ������ ���������� ������������ �������� � ��������� [0,index]
function LastIndexMin<T>(Self: array of T; index: integer): integer; extensionmethod; where T: System.IComparable<T>;
/// ���������� ������ ���������� ������������ ��������
function LastIndexMax<T>(Self: array of T): integer; extensionmethod; where T: System.IComparable<T>;
/// ���������� ������ ���������� ������������ �������� � ��������� [0,index]
function LastIndexMax<T>(Self: array of T; index: integer): integer; extensionmethod; where T: System.IComparable<T>;
/// �������� � ������� ��� ��������� ������ �������� �� ������
procedure Replace<T>(Self: array of T; oldValue,newValue: T); extensionmethod;
/// ����������� �������� ������� �� ��������� �������
procedure Transform<T>(self: array of T; f: T -> T); extensionmethod;
/// ��������� �������� ������� ����������, ������������ �� ���������� �������
procedure Fill<T>(Self: array of T; f: integer -> T); extensionmethod;
/// ��������� �������� ����� � ��������������� �������
function BinarySearch<T>(self: array of T; x: T): integer; extensionmethod;
/// ����������� �������� ������� � ���������� ��������������� ������
function ConvertAll<T, T1>(self: array of T; converter: T->T1): array of T1; extensionmethod;
/// ��������� ����� ������� �������� � �������, ���������������� ���������. ���� �� ������, ������������ ������� �������� ���������������� ����
function Find<T>(self: array of T; p: T->boolean): T; extensionmethod;
/// ��������� ����� ������� ������� �������� � �������, ���������������� ���������. ���� �� ������, ������������ -1
function FindIndex<T>(self: array of T; p: T->boolean): integer; extensionmethod;
/// ��������� ����� ������� ������� �������� � �������, ���������������� ���������, ������� � ������� start. ���� �� ������, ������������ -1
function FindIndex<T>(self: array of T; start: integer; p: T->boolean): integer; extensionmethod;
/// ���������� � ���� ������� ��� ��������, ��������������� ���������
function FindAll<T>(self: array of T; p: T->boolean): array of T; extensionmethod;
/// ��������� ����� ���������� �������� � �������, ���������������� ���������. ���� �� ������, ������������ ������� �������� ���������������� ����
function FindLast<T>(self: array of T; p: T->boolean): T; extensionmethod;
/// ��������� ����� ������� ���������� �������� � �������, ���������������� ���������. ���� �� ������, ������������ ������� �������� ���������������� ����
function FindLastIndex<T>(self: array of T; p: T->boolean): integer; extensionmethod;
/// ��������� ����� ������� ���������� �������� � �������, ���������������� ���������, ������� � ������� start. ���� �� ������, ������������ ������� �������� ���������������� ����
function FindLastIndex<T>(self: array of T; start: integer; p: T->boolean): integer; extensionmethod;
/// ���������� ������ ������� ��������� �������� ��� -1 ���� ������� �� ������
function IndexOf<T>(self: array of T; x: T): integer; extensionmethod;
/// ���������� ������ ������� ��������� �������� ������� � ������� start ��� -1 ���� ������� �� ������
function IndexOf<T>(self: array of T; x: T; start: integer): integer; extensionmethod;
/// ���������� ������ ���������� ��������� �������� ��� -1 ���� ������� �� ������
function LastIndexOf<T>(self: array of T; x: T): integer; extensionmethod;
/// ���������� ������ ���������� ��������� �������� ������� � ������� start ��� -1 ���� ������� �� ������
function LastIndexOf<T>(self: array of T; x: T; start: integer): integer; extensionmethod;
/// ��������� ������ �� �����������
procedure Sort<T>(self: array of T); extensionmethod;
/// ��������� ������ �� �����������, ��������� cmp � �������� ������� ��������� ���������
procedure Sort<T>(self: array of T; cmp: (T,T) ->integer); extensionmethod;
/// ���������� ������ ���������� �������� �������
function High(self: System.Array); extensionmethod := High(Self);
/// ���������� ������ ������� �������� �������
function Low(self: System.Array); extensionmethod := Low(Self);
/// ���������� ������������������ �������� ����������� �������
function Indexes<T>(Self: array of T): sequence of integer; extensionmethod := Range(0, Self.Length - 1);
/// ���������� ������������������ �������� ��������� ����������� �������, ��������������� �������
function IndexesOf<T>(Self: array of T; cond: T->boolean): sequence of integer; extensionmethod;
/// ���������� ������������������ �������� ��������� ����������� �������, ��������������� �������
function IndexesOf<T>(Self: array of T; cond: (T,integer) ->boolean): sequence of integer; extensionmethod;
/// ���������� ���� ������� �� ������� from � ����� step
function Slice<T>(Self: array of T; from, step: integer): array of T; extensionmethod;
/// ���������� ���� ������� �� ������� from � ����� step ����� �� ����� count
function Slice<T>(Self: array of T; from, step, count: integer): array of T; extensionmethod;
//>>     ������ ���������� ���� integer # Extension methods for integer
/// ���������� ���������� ������ �����
function Sqrt(Self: integer): real; extensionmethod;
/// ���������� ������� �����
function Sqr(Self: integer): integer; extensionmethod;
/// ���������� True ���� �������� ��������� ����� ����� �������
function Between(Self: integer; a, b: integer): boolean; extensionmethod;
/// ���������� True ���� �������� ��������� ����� ����� �������
function InRange(Self: integer; a,b: integer): boolean; extensionmethod;
/// ����������, �������� �� ����� ������
function IsEven(Self: integer): boolean; extensionmethod;
/// ����������, �������� �� ����� ��������
function IsOdd(Self: integer): boolean; extensionmethod;
/// ���������� ������������������ ����� �� 1 �� �������
function Range(Self: integer): sequence of integer; extensionmethod;
/// ���������� ������������������ ����� �� �������� �������� �� n
function To(Self: integer; n: integer): sequence of integer; extensionmethod;
/// ���������� ������������������ ����� �� �������� �������� �� n � ��������� �������
function Downto(Self: integer; n: integer): sequence of integer; extensionmethod;
/// ���������� ������������������ ����� 0,1,...n-1
function Times(Self: integer): sequence of integer; extensionmethod;
//>>     ������ ���������� ���� BigInteger # Extension methods for BigInteger
/// ���������� ���������� ������ �����
function Sqrt(Self: BigInteger): real; extensionmethod;
//>>     ������ ���������� ���� real # Extension methods for real
/// ���������� True ���� �������� ��������� ����� ����� �������
function Between(Self: real; a, b: real): boolean; extensionmethod;
/// ���������� True ���� �������� ��������� ����� ����� �������
function InRange(Self: real; a,b: real): boolean; extensionmethod;
/// ���������� ���������� ������ �����
function Sqrt(Self: real): real; extensionmethod;
/// ���������� ������� �����
function Sqr(Self: real): real; extensionmethod;
/// ���������� �����, ����������� �� ���������� ������
function Round(Self: real): integer; extensionmethod;
/// ���������� x, ����������� �� ���������� ������������� � digits ������� ����� ���������� �����
function Round(Self: real; digits: integer): real; extensionmethod;
/// ���������� �����, ����������� �� ���������� �������� ������
function RoundBigInteger(Self: real): BigInteger; extensionmethod;
/// ���������� ����� ����� ������������� �����
function Trunc(Self: real): integer; extensionmethod;
/// ���������� ����� ����� ������������� ����� ��� ������� �����
function TruncBigInteger(Self: real): BigInteger; extensionmethod;
/// ���������� ������������, ����������������� � ������ � frac ������� ����� ���������� �����
function ToString(Self: real; frac: integer): string; extensionmethod;
//>>     ������ ���������� ���� char # Extension methods for char
/// ���������� True ���� �������� ��������� ����� ����� �������
function Between(Self: char; a, b: char): boolean; extensionmethod;
/// ���������� True ���� �������� ��������� ����� ����� �������
function InRange(Self: char; a,b: char): boolean; extensionmethod;
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
/// ����������� �� ������ � ��������� ���� ������� ��������
function IsLower(Self: char): boolean; extensionmethod;
/// ����������� �� ������ � ��������� ���� �������� ��������
function IsUpper(Self: char): boolean; extensionmethod;
/// ����������� ������ � �����
function ToDigit(Self: char): integer; extensionmethod;
/// ����������� ������ � ������ �������
function ToLower(Self: char): char; extensionmethod;
/// ����������� ������ � ������� �������
function ToUpper(Self: char): char; extensionmethod;
//>>     ������ ���������� ���� string # Extension methods for string
/// ���������� True ���� �������� ��������� ����� ����� �������
function Between(Self: string; a, b: string): boolean; extensionmethod;
/// ���������� True ���� �������� ��������� ����� ����� �������
function InRange(Self: string; a,b: string): boolean; extensionmethod;
/// ��������� ����� �� ������ ������� � ������� from � ������������� from �� ��������� ���������
function ReadInteger(Self: string; var from: integer): integer; extensionmethod;
/// ��������� ������������ �� ������ ������� � ������� from � ������������� from �� ��������� ���������
function ReadReal(Self: string; var from: integer): real; extensionmethod;
/// ��������� ����� �� ������ ������� � ������� from � ������������� from �� ��������� ���������
function ReadWord(Self: string; var from: integer): string; extensionmethod;
/// ����������� ������ � �����
function ToInteger(Self: string): integer; extensionmethod;
/// ����������� ������ � BigInteger
function ToBigInteger(Self: string): BigInteger; extensionmethod;
/// ����������� ������ � ������������
function ToReal(Self: string): real; extensionmethod;
/// ����������� ������ � ������ ����
function ToWords(Self: string; params delim: array of char): array of string; extensionmethod;
/// ����������� ������ � ������ �����
function ToIntegers(Self: string): array of integer; extensionmethod;
/// ����������� ������ � ������ ������������
function ToReals(Self: string): array of real; extensionmethod;
/// ���������� �������� ������
function Inverse(Self: string): string; extensionmethod;
/// �������� � ��������� ������ ��� ��������� ����������� ��������� ��������� ������� ������ � ���������� ��������������� ������
function RegexReplace(Self: string; reg, repl: string; options: RegexOptions := RegexOptions.None): string; extensionmethod;
/// �������� � ��������� ������ ��� ��������� ����������� ��������� ��������� ��������������� ������ � ���������� ��������������� ������
function RegexReplace(Self: string; reg: string; repl: Match->string; options: RegexOptions := RegexOptions.None): string; extensionmethod;
/// ���� � ��������� ������ ��� ��������� ����������� ��������� � ���������� �� � ���� ������������������ ��������� ���� Match
function Matches(Self: string; reg: string; options: RegexOptions := RegexOptions.None): sequence of Match; extensionmethod;
/// ���� � ��������� ������ ������ ��������� ����������� ��������� � ���������� ��� � ���� ������
function MatchValue(Self: string; reg: string; options: RegexOptions := RegexOptions.None): string; extensionmethod;
/// ���� � ��������� ������ ��� ��������� ����������� ��������� � ���������� �� � ���� ������������������ �����
function MatchValues(Self: string; reg: string; options: RegexOptions := RegexOptions.None): sequence of string; extensionmethod;
/// ������������� �� ������ ����������� ���������
function IsMatch(Self: string; reg: string; options: RegexOptions := RegexOptions.None): boolean; extensionmethod := Regex.IsMatch(Self, reg, options);
/// ������� � ������ ��� ��������� ��������� �����
function Remove(Self: string; params targets: array of string): string; extensionmethod;
/// ���������� ���������, ���������� ���������� �� ������ length ����� ������ ��������
function Right(Self: string; length: integer): string; extensionmethod;
/// ���������� ���������, ���������� ���������� �� ������ length ����� ����� ��������
function Left(Self: string; length: integer): string; extensionmethod;
/// ���������� ���� ������ �� ������� from � ����� step
function Slice(Self: string; from, step: integer): string; extensionmethod;
/// ���������� ���� ������ �� ������� from � ����� step ����� �� ����� count
function Slice(Self: string; from, step, count: integer): string; extensionmethod;
//>>     ������ ���������� ���� Func # Extension methods for Func
/// ������������ �������
function Compose<T1, T2, TResult>(Self: T2->TResult; composer: T1->T2): T1->TResult; extensionmethod;
//>>     ������ ���������� ���� Complex # Extension methods for Complex
/// ���������� ���������� ����������� ��������
function Conjugate(Self: Complex): Complex; extensionmethod;
//>>     ������ ���������� IDictionary # Extension methods for IDictionary
/// ���������� � ������� ��������, ��������� � ��������� ������, � ���� ������ ����� ���, �� �������� �� ���������
function Get<Key, Value>(Self: IDictionary<Key, Value>; K: Key): Value; extensionmethod;
//>>     ������������ ��� ������ � ��������������� ������� # Subroutines for typed files
/// ��������� �������������� ���� � ���������� �������� ��� ������������� �������� ����������
function OpenBinary<T>(fname: string): file of T;
/// ������ ��� �������� �������������� ���� � ���������� �������� ��� ������������� �������� ����������
function CreateBinary<T>(fname: string): file of T;
/// ��������� �������������� ���� � ���������� �������� ��� ������������� �������� ����������
function OpenFile<T>(fname: string): file of T;
/// ������ ��� �������� �������������� ���� � ���������� �������� ��� ������������� �������� ����������
function CreateFile<T>(fname: string): file of T;
/// ��������� �������������� ���� ����� � ���������� �������� ��� ������������� �������� ����������
function OpenFileInteger(fname: string): file of integer;
/// ��������� �������������� ���� ������������ � ���������� �������� ��� ������������� �������� ����������
function OpenFileReal(fname: string): file of real;
/// ������ ��� �������� �������������� ���� ����� � ���������� �������� ��� ������������� �������� ����������
function CreateFileInteger(fname: string): file of integer;
/// ������ ��� �������� �������������� ���� ������������ � ���������� �������� ��� ������������� �������� ����������
function CreateFileReal(fname: string): file of real;
/// ��������� �������������� ����, ���������� ������������������ ��� ��������� � ��������� ���
procedure WriteElements<T>(fname: string; ss: sequence of T);
//>>     ������ ���������� �������������� ������ # Extension methods for typed files
/// ������������� ������� ������� ��������� ��������� � �������������� ����� �� ������� � ������� n
function Seek<T>(Self: file of T; n: int64): file of T; extensionmethod;
/// ��������� � ���������� ��������� ������� ��������������� �����
function Read<T>(Self: file of T): T; extensionmethod;
/// ��������� � ���������� ��� ��������� �������� ��������������� ����� � ���� �������
function Read2<T>(Self: file of T): (T,T); extensionmethod;
/// ��������� � ���������� ��� ��������� �������� ��������������� ����� � ���� �������
function Read3<T>(Self: file of T): (T,T,T); extensionmethod;
/// ���������� ������������������ ��������� ��������� ��������������� ����� �� �������� �������� �� ���������
function ReadElements<T>(Self: file of T): sequence of T; extensionmethod;
/// ��������� �������������� ����, ���������� ������������������ ��� ��������� � ��������� ���
function ReadElements<T>(fname: string): sequence of T;
/// ���������� ������ � �������������� ����
procedure Write<T>(Self: file of T; params vals: array of T); extensionmethod;
