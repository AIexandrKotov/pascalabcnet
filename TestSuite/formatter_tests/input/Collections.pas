/// ������ �������� ������� �������
///   Stack � ����
///   Queue � �������
///   DynArray � ������������ ������
///   SimpleSet � ������� ��������� �� ������ ������������� �������
///   AssocArray � ������� ������������� ������ �� ������ ������������� ������� ���
///   LinkedList � ���������� ������
unit Collections;

//------------------------------------------------------------------------------
// ������ ���������� ������� ��������� ��� ��������
// ������ 1.0
// Copyright (c) 2009 �������� �., ���������� �.�., ������ �.
//------------------------------------------------------------------------------

interface

// -------------------------------- SingleNode ---------------------------------
type
  /// ���� � ����� ����� �����
  SingleNode<T> = class
  private 
    /// ��������, ������������ � ����
    fData: T;
    /// ������ �� ��������� �������
    fNext: SingleNode<T>;
  /// <summary>
  /// �����������
  /// </summary>
  /// <param name="pData">�������� � ����</param>
  /// <param name="pNext">������ �� ��������� �������</param>
  public 
    constructor Create(pData: T; pNext: SingleNode<T>);
    begin
      fData := pData;
      fNext := pNext;
    end;
    
    property Data: T read fData write fData;
    property Next: SingleNode<T> read fNext write fNext;
  end; 

// ----------------------------------- Stack -----------------------------------
type
  /// ������ ������ Stack
  Stack<T> = class
  private 
    /// ������� �����
    fTop: SingleNode<T> := nil; 
  public 
    /// ������� ������ ����
    constructor Create;
    /// <summary>
    /// ������ ������� �� ������� �����
    /// </summary>
    /// <param name="x">����� �������</param>
    procedure Push(x: T);
    /// ���������� �������� �������� �� �������, ������ ��� �� �����
    function Pop: T;
    /// ���������� �������� �������� �� ������� �����, �� ������ ���
    function Top: T;
    /// ���������� ������, ���� ���� ����
    function IsEmpty: boolean;
    /// ����������� ���������� ����� � ������
    function ToString: string; override;
    /// ������� ���������� ����� �� �������
    procedure Print;
    /// ������� ���������� ����� �� ������� � ��������� �� ����� ������
    procedure Println;
  end;

// ----------------------------------- Queue -----------------------------------
type
  /// ������ ������ Queue
  Queue<T> = class
  private 
    /// ������ �������
    head: SingleNode<T>;
    /// ����� �������
    tail: SingleNode<T>;
  public 
    /// ������� ������ �������
    constructor Create;
    /// <summary>
    /// ��������� ������� � ����� �������
    /// </summary>
    /// <param name="x">����������� �������</param>
    procedure Enqueue(x: T);
    /// ���������� �������� �������� � ������, ������ ��� �� �������
    function Dequeue: T;
    /// ���������� �������� �������� � ������ �������, �� ������ ���
    function Top: T;
    /// ���������� ������, ���� ������� �����
    function IsEmpty: boolean;
    /// ����������� ���������� ������� � ������
    function ToString: string; override;
    /// ������� ���������� ������� �� �������
    procedure Print;
    /// ������� ���������� ������� �� ������� � ��������� �� ����� ������
    procedure Println;
  end;

// --------------------------------- DynArray ----------------------------------
const
  /// ����������� �������, ��������������� ��� �������� �������
  MIN_CAP = 4;
  /// ����������� ���������� ������� ������� ��� � ��������
  INC_CAP_FACTOR = 2;

type
  /// ������ ������ DynArray [������������ ������ � ������������� ������]
  DynArray<T> = class
  private 
    /// ���������� ������������ ������, ���������� ������
    fData: array of T;
    /// ������ �������
    fSize: integer;
    /// ������� �������
    fCap: integer;
    /// ������������� ������� � �������� ind ������ x
    procedure SetElem(index: integer; x: T);
    /// ���������� ������� ������� � �������� ind
    function GetElem(index: integer): T;
  public 
    /// ������� ������ ������� 0
    constructor Create;
    /// ������� ������ ������� size
    constructor Create(psize: integer);
    /// <summary>
    /// �������� ����� ������. ������� �������������.
    /// (���� newCap ������ ������� �������, ������ �� ����������) 
    /// </summary>
    /// <param name="newCap">����� ������� �������</param>
    procedure Reserve(newCap: integer);
    /// <summary>
    /// ������������� ����� ������ ������� 
    /// </summary>
    /// <param name="newSize">����� ������ �������</param>
    procedure Resize(newSize: integer);
    /// <summary>
    /// ��������� ������� � ����� ������� 
    /// </summary>
    /// <param name="x">����������� �������</param>
    procedure Add(x: T);
    /// <summary>
    /// ��������� ������� � ��������� �������
    /// </summary>
    /// <param name="pos">�������, � ������� ����������� �������</param>
    /// <param name="x">����������� �������</param>
    procedure Insert(pos: integer; x: T);
    /// <summary>
    /// ������� ������� ������� �� ��������� �������
    /// </summary>
    /// <param name="pos">�������, �� ������� ��������� �������</param>
    procedure Remove(pos: integer);
    /// <summary>
    /// ���������� ������ ������� �������� ������� ������� ��������
    /// ��� -1, ���� ������ �������� ���
    /// </summary>
    /// <param name="x">������� �������</param>
    function Find(x: T): integer;
    /// ���������� ��������� (������) �������
    property Count: integer read fSize write Resize;
    /// ������� ������� 
    property Capacity: integer read fCap write Reserve;
    /// ��������� ���������� � ��������� ������� �� ������� 
    property Elem[index: integer]: T read GetElem write SetElem; default;
    /// ����������� ���������� ������� � ������
    function ToString: string; override;
    /// ������� ���������� ������� �� �������
    procedure Print;
    /// ������� ���������� ������� �� ������� � ��������� �� ����� ������
    procedure Println;
  end;

// -------------------------------- SimpleSet ----------------------------------
type
  /// ������ ������ SimpleSet
  SimpleSet<T> = class 
  private 
    /// �������� ���������
    data: DynArray<T>;
  public 
    /// ������� ���������
    constructor Create;
    /// <summary>
    /// ��������� ������� �� ���������, ���� ��� ��� ��� ���
    /// </summary>
    /// <param name="x">����������� �������</param>    
    procedure Add(x: T);
    /// <summary>
    /// ������� ������� �� ���������, ���� �� ��� ����
    /// </summary>
    /// <param name="x">��������� �������</param>
    procedure Remove(x: T);
    /// <summary>
    /// ���������� ������, ���� ��������� �������� �������
    /// </summary>
    /// <param name="x">������� �������</param>          
    function Contains(x: T): boolean;
    /// ����������� ���������� ������� � ������
    function ToString: string; override;
    /// ������� ���������� ������� �� �������
    procedure Print;
    /// ������� ���������� ��������� �� ������� � ��������� �� ����� ������
    procedure Println;
  end;

// -------------------------------- AssocArray ---------------------------------
type
  /// ������ ������ AssocArray 
  AssocArray<KeyType, ValueType> = class
  private 
    /// �����
    keys: DynArray<KeyType>;
    /// ��������, ��������������� ������
    values: DynArray<ValueType>;
    
    /// ������������� �������� �������� � ������ key ������ value
    procedure SetElem(key: KeyType; value: ValueType);
    /// ���������� �������� �������� � ������ key
    function GetElem(key: KeyType): ValueType;
  public 
    /// ������� ������������� ������
    constructor Create;
    /// ��������� ���������� � ��������� ������� �� �����
    property Elem[key: KeyType]: ValueType read GetElem write SetElem; default;
    /// ����������� ���������� �������������� ������� � ������
    function ToString: string; override;
    /// ������� ���������� �������������� ������� �� �������
    procedure Print;
    /// ������� ���������� �������������� ������� �� ������� � ��������� �� ����� ������
    procedure Println;
  end;

// ----------------------------- LinkedListNode --------------------------------
type
  /// ���� � ����� ������ �����
  LinkedListNode<T> = class
  private 
    /// ��������, ������������ � ����
    fData: T;
    /// ������ �� ���������� �������
    fPrev: LinkedListNode<T>;
    /// ������ �� ��������� �������
    fNext: LinkedListNode<T>;
  public 
    /// <summary>
    /// ������� ����� ����
    /// </summary>
    /// <param name="T">�������� ����</param>
    /// <param name="Prev">������ �� ���������� �������</param>
    /// <param name="Next">������ �� ��������� �������</param>
    constructor Create(data: T; prev, next: LinkedListNode<T>);
    begin
      fData := data;
      fNext := next;
      fPrev := prev;
    end;
    /// ��������, ������������ � ����
    property Value: T read fData write fData;
    /// ������ �� ���������� ������� � ������ �� ������
    property Prev: LinkedListNode<T> read fPrev;
    /// ������ �� ��������� ������� � ������ �� ������
    property Next: LinkedListNode<T> read fNext;
  end;


// -------------------------------- LinkedList ---------------------------------
type
  /// ���������� �������� ������
  LinkedList<T> = class
  private 
    /// ������ ������� (������)
    fFirst: LinkedListNode<T>;
    /// ��������� ������� (�����)
    fLast: LinkedListNode<T>;
  public 
    /// ������� ������ ������
    constructor Create;
    /// ������ ������� (������) � ������ �� ������
    property First: LinkedListNode<T> read fFirst;
    /// ��������� ������� (�����) � ������ �� ������
    property Last: LinkedListNode<T> read fLast;
    /// <summary>
    /// ��������� ������� x � ������ ������
    /// </summary>
    /// <param name="x">����������� �������</param>
    procedure AddFirst(x: T);
    /// <summary>
    /// ��������� ������� x � ����� ������
    /// </summary>
    /// <param name="x">����������� �������</param>
    procedure AddLast(x: T);
    /// ������� ������ ������� ������
    procedure RemoveFirst();
    /// ������� ��������� ������� ������
    procedure RemoveLast();
    /// <summary>
    /// ��������� ������� x ����� node
    /// </summary>
    /// <param name="node">������ �� �������, ����� ������� ����� �������� �����</param>
    /// <param name="x">����������� �������</param>
    procedure AddBefore(node: LinkedListNode<T>; x: T);
    /// <summary>
    /// ��������� ������� x ����� node
    /// </summary>
    /// <param name="node">������ �� �������, ����� �������� ����� �������� �����</param>
    /// <param name="x">����������� �������</param>
    procedure AddAfter(node: LinkedListNode<T>; x: T);
    /// <summary>
    /// ������� ������� node
    /// </summary>
    /// <param name="node">������ �� �������, ������� ����� �������</param>
    procedure Remove(node: LinkedListNode<T>);
    /// ����������� ���������� ������ � ������
    function ToString: string; override;
    /// ������� ���������� ������ �� �������
    procedure Print;
    /// ������� ���������� ������ �� ������� � ��������� �� ����� ������
    procedure Println;
  end;

//==============================================================================
implementation

//��������� ����������
const
  PopNilStackExceptionMessage =				'������� ������ �������� � ������� �����';
  TopNilStackExceptionMessage =				'������� ��������� �������� � ������� �����';
  
  DequeueNilQueueExceptionMessage =		'������� �������� �������� �� ������ �������';
  TopNilQueueExceptionMessage =				'������� ��������� �������� �� ������ �������';
  
  NegativeArraySizeExceptionMessage =	'������� ��������� ������� ������� ������������� �������� ';
  InsOutOfArrayBoundExceptionMessage = '������� ������� �� �������� ������� � ������� ';
  RemOutOfArrayBoundExceptionMessage = '������� �������� �� �������� ������� �� ������� ';
  SetElemOutOfBoundExceptionMessage =	'������� ��������� �������� �������� �� �������� ������� � �������� ';
  GetElemOutOfBoundExceptionMessage =	'������� �������� �������� �������� �� �������� ������� � �������� ';
  
  RemoveFromNilListExceptionMessage =	'������� �������� �� ������� ������';
  AddNilNodeExceptionMessage =				'�������� node �������� ������� �������';
  RemoveNilNodeExceptionMessage =			'�������� node �������� ������� �������';

// ----------------------------------- Stack -----------------------------------
constructor Stack<T>.Create;
begin
  fTop := nil;
end;

procedure Stack<T>.Push(x: T);
begin
  fTop := new SingleNode<T>(x, fTop);
end;

function Stack<T>.Pop: T;
begin
  if IsEmpty then 
    raise new Exception(PopNilStackExceptionMessage);
  
  Result := fTop.data;
  fTop := fTop.next;  
end;

function Stack<T>.Top: T;
begin
  if IsEmpty then 
    raise new Exception(TopNilStackExceptionMessage);
  
  Result := fTop.data;
end;

function Stack<T>.IsEmpty: boolean;
begin
  Result := (fTop = nil);
end;

function Stack<T>.ToString: string;
begin
  Result := '';
  var curElem := fTop;
  while curElem <> nil do
  begin
    Result += curElem.data.ToString + ' ';
    curElem := curElem.next;
  end;
end;

procedure Stack<T>.Print;
begin
  writeln(ToString);
end;

procedure Stack<T>.Println;
begin
  writeln(ToString);
end;

// ----------------------------------- Queue -----------------------------------
constructor Queue<T>.Create;
begin
  head := nil;
  tail := nil;
end;

procedure Queue<T>.Enqueue(x: T);
begin
  if IsEmpty then
  begin
    head := new SingleNode<T>(x, nil);
    tail := head;
  end
  else
  begin
    tail.next := new SingleNode<T>(x, nil);
    tail := tail.next;  // ������� ��������� �� ������ ������� (�.�. ������� ���������� ��������� �������)
  end;
end;

function Queue<T>.Dequeue: T;
begin
  if IsEmpty then 
    raise new Exception(DequeueNilQueueExceptionMessage);
  
  Result := head.data;
  head := head.next;  // ������� ��������� �� ������ ������� (�.�. ������� ���������� ��������� �������)
  if head = nil then
    tail := nil;
end;

function Queue<T>.Top: T;
begin
  if IsEmpty then 
    raise new Exception(TopNilQueueExceptionMessage);
  Result := head.data;
end;

function Queue<T>.IsEmpty: boolean;
begin
  Result := (head = nil);
  if Result then
    Assert(tail = nil);
end;

function Queue<T>.ToString: string;
begin
  Result := '';
  var curElem := head;
  while curElem <> nil do
  begin
    Result += curElem.data + ' ';
    curElem := curElem.next;
  end;
end;

procedure Queue<T>.Print;
begin
  write(ToString);
end;

procedure Queue<T>.Println;
begin
  writeln(ToString);
end;

// ---------------------------------- DynArray ---------------------------------
constructor DynArray<T>.Create;
begin
  Create(0);
end;

constructor DynArray<T>.Create(pSize: integer);
begin
  if pSize < 0 then
    raise new Exception(NegativeArraySizeExceptionMessage + pSize.ToString);
  
  fSize := pSize;
  fCap := INC_CAP_FACTOR * pSize + MIN_CAP; // ������������� ������� "� �������"
  SetLength(fData, fCap);
end;

procedure DynArray<T>.Reserve(newCap: integer);
begin
  if newCap > fCap then 
  begin
    SetLength(fData, newCap);
    fCap := newCap;
  end;
end;

procedure DynArray<T>.Resize(newSize: integer);
begin
  if newSize < 0 then
    raise new Exception(NegativeArraySizeExceptionMessage + newSize.ToString);
  
  if newSize > fCap then
  begin
    Reserve(INC_CAP_FACTOR * newSize);
    for var i := fSize to newSize - 1 do // ����� ������� ��������� ����� ��������
      fData[i] := default(T);
  end;
  fSize := newSize;
end;

procedure DynArray<T>.Add(x: T);
begin
  Resize(fSize + 1);
  fData[fSize - 1] := x;
end;

procedure DynArray<T>.Insert(pos: integer; x: T);
begin
  if (pos < 0) or (pos > fSize - 1) then 
    raise new Exception(InsOutOfArrayBoundExceptionMessage + pos.ToString);
  
  Resize(fSize + 1);
  for var i := fSize - 2 downto pos do
    fData[i + 1] := fData[i];
  fData[pos] := x;
end;

procedure DynArray<T>.Remove(pos: integer);
begin
  if (pos < 0) or (pos > fSize - 1) then 
    raise new Exception(RemOutOfArrayBoundExceptionMessage + pos.ToString);
  
  for var i := pos to fSize - 2 do // ����� ��������� ����� �� 1, ������� � ������� pos
    fData[i] := fData[i + 1];
  Resize(fSize - 1);
end;

function DynArray<T>.Find(x: T): integer;
begin
  Result := -1;
  for var i := 0 to fSize - 1 do
    if fData[i] = x then
    begin
      Result := i;
      exit;
    end;
end;

procedure DynArray<T>.SetElem(index: integer; x: T);
begin
  if (index < 0) or (index > fSize - 1) then 
    raise new Exception(SetElemOutOfBoundExceptionMessage + index.ToString);
  
  fData[index] := x;
end;

{���������� ������� ������� � �������� ind}
function DynArray<T>.GetElem(index: integer): T;
begin
  if (index < 0) or (index > fSize - 1) then 
    raise new Exception(GetElemOutOfBoundExceptionMessage + index.ToString);
  
  Result := fData[index];
end;

function DynArray<T>.ToString: string;
begin
  Result := '';
  for var i := 0 to fSize - 1 do
    Result += fData[i].ToString + ' '; 
end;

procedure DynArray<T>.Print;
begin
  write(ToString);
end;

procedure DynArray<T>.Println;
begin
  writeln(ToString);
end;

// -------------------------------- SimpleSet ----------------------------------
constructor SimpleSet<T>.Create;
begin
  data := new DynArray<T>;
end;

procedure SimpleSet<T>.Add(x: T);
begin
  if data.Find(x) = -1 then 
    data.Add(x);
end;

procedure SimpleSet<T>.Remove(x: T);
begin
  var xPos := data.Find(x);
  if xPos <> -1 then
    data.Remove(xPos);
end;

function SimpleSet<T>.Contains(x: T): boolean;
begin
  Result := (data.Find(x) <> -1);
end;

function SimpleSet<T>.ToString: string;
begin
  Result := data.ToString;
end;

procedure SimpleSet<T>.Print;
begin
  write(ToString);
end;

procedure SimpleSet<T>.Println;
begin
  writeln(ToString);
end;

// -------------------------------- AssocArray ---------------------------------
constructor AssocArray<KeyType, ValueType>.Create;
begin
  keys := new DynArray<KeyType>;
  values := new DynArray<ValueType>;
end;

procedure AssocArray<KeyType, ValueType>.SetElem(key: KeyType; value: ValueType);
begin
  var ind := Keys.Find(key);
  if ind <> -1 then
    Values[ind] := value
  else
  begin
    Keys.Add(key);
    Values.Add(value);
  end;
end;

function AssocArray<KeyType, ValueType>.GetElem(key: KeyType): ValueType;
begin
  var ind := Keys.Find(key);
  if ind <> -1 then
    Result := Values[ind]
  else Result := default(ValueType);
end;

function AssocArray<KeyType, ValueType>.ToString: string;
const
  NewLine = #13#10;
begin
  Result := '';
  for var i := 0 to keys.Count - 1 do
    Result += keys[i].ToString + ' ' + values[i].ToString + NewLine;
end;

procedure AssocArray<KeyType, ValueType>.Print;
begin
  write(ToString);
end;

procedure AssocArray<KeyType, ValueType>.Println;
begin
  write(ToString);
end;

// -------------------------------- LinkedList ---------------------------------
constructor LinkedList<T>.Create;
begin
end;

procedure LinkedList<T>.AddFirst(x: T);
begin
  var val := new LinkedListNode<T>(x, nil, fFirst);
  if fFirst <> nil then
    fFirst.fPrev := val;
  
  fFirst := val;
  if fLast = nil then
    fLast := fFirst;
end;

procedure LinkedList<T>.AddLast(x: T);
begin
  var val := new LinkedListNode<T>(x, fLast, nil);
  if fLast <> nil then
    fLast.fNext := val;
  
  fLast := val;
  if fFirst = nil then
    fFirst := fLast;
end;

procedure LinkedList<T>.RemoveFirst();
begin
  if fFirst = nil then
    raise new Exception(RemoveFromNilListExceptionMessage);
  
  fFirst := fFirst.fNext;
  if fFirst = nil then
    fLast := nil
  else
    fFirst.fPrev := nil;
end;

procedure LinkedList<T>.RemoveLast();
begin
  if fLast = nil then
    raise new Exception(RemoveFromNilListExceptionMessage);
  
  fLast := fLast.fPrev;
  if fLast = nil then
    fFirst := nil
  else
    fLast.fNext := nil;
end;

procedure LinkedList<T>.AddBefore(node: LinkedListNode<T>; x: T);
begin
  if node = nil then
    raise new Exception(AddNilNodeExceptionMessage);
  
  if node = fFirst then
    AddFirst(x)
  else
  begin
    var val := new LinkedListNode<T>(x, node.fPrev, node);
    node.fPrev.fNext := val;
    node.fPrev := val;
  end;
end;

procedure LinkedList<T>.AddAfter(node: LinkedListNode<T>; x: T);
begin
  if node = nil then
    raise new Exception(AddNilNodeExceptionMessage);
  
  if node = fLast then
    AddLast(x)
  else
  begin
    var val := new LinkedListNode<T>(x, node, node.fNext);
    node.fNext.fPrev := val;
    node.fNext := val;
  end;
end;

procedure LinkedList<T>.Remove(node: LinkedListNode<T>);
begin
  if node = nil then
    raise new Exception(RemoveNilNodeExceptionMessage);
  
  if node = fFirst then
    RemoveFirst
  else if node = fLast then
    RemoveLast
  else
  begin
    node.fPrev.fNext := node.fNext;
    node.fNext.fPrev := node.fPrev;
  end;
end;

function LinkedList<T>.ToString: string;
begin
  Result := '';
  var cur := fFirst;
  while cur <> nil do
  begin
    Result := cur.Value.ToString + ' ';
    cur := cur.Next;
  end;
end;

procedure LinkedList<T>.Print;
begin
  write(ToString);
end;

procedure LinkedList<T>.Println;
begin
  writeln(ToString);
end;

end.