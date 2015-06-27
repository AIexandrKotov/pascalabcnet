// Copyright (c) Ivan Bondarev, Stanislav Mihalkovich (for details please see \doc\copyright.txt)
// This code is distributed under the GNU LGPL (for details please see \doc\license.txt)

unit Arrays;

interface

uses
  System;

/// ������� ������, ��������� delimiter � �������� �����������
procedure &Array.Write(delimiter: string := ' ');
/// ������� ������, ��������� delimiter � �������� �����������, � ������������ ������� �� ����� ������
procedure &Array.Writeln(delimiter: string := ' ');

/// ��������� ����� ������ ���������� ������� � ��������� �� 0 �� 99
procedure FillByRandom(a: array of integer);
/// ��������� ����� ������ ���������� ������� � ��������� �� minValue �� maxValue
procedure FillByRandom(a: array of integer; minValue, maxValue: integer);
/// ��������� ������������ ������ ���������� ������� � ��������� �� 0 �� 10
procedure FillByRandom(a: array of real);
/// ��������� ������������ ������ ���������� ������� � ��������� �� minValue �� maxValue
procedure FillByRandom(a: array of real; minValue, maxValue: real);
/// ��������� ������ ��������� x
procedure FillByValue<T>(a: array of T; x: T);
/// ������� � ���������� ����� ������ ������� n, ����������� ���������� ������� � ��������� �� 0 �� 99
function CreateRandomIntegerArray(n: integer): array of integer;
/// ������� � ���������� ����� ������ ������� n, ����������� ���������� ������� � ��������� �� minValue �� maxValue
function CreateRandomIntegerArray(n: integer; minValue, maxValue: integer): array of integer;
/// ������� � ���������� ������������ ������ ������� n, ����������� ���������� ������� � ��������� �� 0 �� 10
function CreateRandomRealArray(n: integer): array of real;
/// ������� � ���������� ������������ ������ ������� n, ����������� ���������� ������� � ��������� �� minValue �� maxValue
function CreateRandomRealArray(n: integer; minValue, maxValue: real): array of real;
/// ������ ����� ������
procedure ReadArray(a: array of integer);
/// ������ ������������ ������
procedure ReadArray(a: array of real);
/// ������ ������ �����
procedure ReadArray(a: array of string);
/// ������� ������, ��������� delimiter � �������� ����������� ��������
procedure WriteArray<T>(a: array of T; delimiter: string := ' ');
/// ������� ������, ��������� delimiter � �������� ����������� ��������, � ������������ ������� �� ����� ������
procedure WritelnArray<T>(a: array of T; delimiter: string := ' ');
/// ��������� ������ �� �����������
procedure Sort<T>(a: array of T);
/// ��������� ������ �� ��������
procedure SortDescending<T>(a: array of T);

/// ��������� ��������� ����� ������ ���������� ������� � ��������� �� 0 �� 99
procedure FillByRandom(a: array [,] of integer);
/// ��������� ��������� ����� ������ ���������� ������� � ��������� �� minValue �� maxValue
procedure FillByRandom(a: array [,] of integer; minValue, maxValue: integer);
/// ��������� ��������� ������������ ������ ���������� ������� � ��������� �� 0 �� 99
procedure FillByRandom(a: array [,] of real);
/// ��������� ��������� ������������ ������ ���������� ������� � ��������� �� minValue �� maxValue
procedure FillByRandom(a: array [,] of real; minValue, maxValue: real);
/// ��������� ������ ��������� x
procedure FillByValue<T>(a: array [,] of T; x: T);
/// ������� � ���������� ����� ������ ������� n, ����������� ���������� ������� � ��������� �� 0 �� 99
function CreateRandomIntegerMatrix(m, n: integer): array [,] of integer;
/// ������� � ���������� ����� ������ ������� n, ����������� ���������� ������� � ��������� �� minValue �� maxValue
function CreateRandomIntegerMatrix(m, n: integer; minValue, maxValue: integer): array [,] of integer;
/// ������� � ���������� ������������ ������ ������� n, ����������� ���������� ������� � ��������� �� 0 �� 10
function CreateRandomRealMatrix(m, n: integer): array [,] of real;
/// ������� � ���������� ������������ ������ ������� n, ����������� ���������� ������� � ��������� �� minValue �� maxValue
function CreateRandomRealMatrix(m, n: integer; minValue, maxValue: real): array [,] of real;
/// ������� ��������� ������
procedure WriteMatrix<T>(a: array [,] of T; width: integer := 0);
/// ������� ��������� ������
procedure WriteMatrix(a: array [,] of real; width: integer := 0; digitsAfterPoint: integer := 2);

implementation

// ================== ���������� ������� ==================

procedure FillByRandom(a: array of integer; minValue, maxValue: integer);
begin
  for var i := 0 to a.Length - 1 do
    a[i] := PABCSystem.Random(minValue, maxValue);
end;

procedure FillByRandom(a: array of integer);
begin
  FillByRandom(a, 0, 99);
end;

procedure FillByRandom(a: array of real; minValue, maxValue: real);
begin
  for var i := 0 to a.Length - 1 do
    a[i] := PABCSystem.Random * (maxValue - minValue);
end;

procedure FillByRandom(a: array of real);
begin
  FillByRandom(a, 0, 10);
end;

procedure FillByValue<T>(a: array of T; x: T);
begin
  for var i := 0 to a.Length - 1 do
    a[i] := x;
end;

function CreateRandomIntegerArray(n: integer; minValue, maxValue: integer): array of integer;
begin
  SetLength(Result, n);
  FillByRandom(Result, minValue, maxValue);
end;

function CreateRandomRealArray(n: integer; minValue, maxValue: real): array of real;
begin
  SetLength(Result, n);
  FillByRandom(Result, minValue, maxValue);
end;

function CreateRandomIntegerArray(n: integer): array of integer;
begin
  SetLength(Result, n);
  FillByRandom(Result);
end;

function CreateRandomRealArray(n: integer): array of real;
begin
  SetLength(Result, n);
  FillByRandom(Result);
end;

procedure ReadArray(a: array of integer);
begin
  for var i := 0 to a.Length - 1 do
    read(a[i]);
  readln;  
end;

procedure ReadArray(a: array of real);
begin
  for var i := 0 to a.Length - 1 do
    read(a[i]);
  readln;  
end;

procedure ReadArray(a: array of string);
begin
  for var i := 0 to a.Length - 1 do
    read(a[i]);
  readln;  
end;

procedure WriteArray<T>(a: array of T; delimiter: string);
begin
  if (a=nil) or (a.Length=0) then
    exit;
  for var i := 0 to a.Length - 2 do
    write(a[i], delimiter);
  write(a[a.Length - 1]);  
end;

procedure WritelnArray<T>(a: array of T; delimiter: string);
begin
  WriteArray(a, delimiter);
  writeln;
end;

procedure Sort<T>(a: array of T);
begin
  System.Array.Sort(a);
end;

procedure SortDescending<T>(a: array of T);
begin
  System.Array.Sort(a);
  System.Array.Reverse(a);
end;

// ================== ��������� ������� ==================

procedure FillByRandom(a: array [,] of integer; minValue, maxValue: integer);
begin
  for var i := 0 to a.GetLength(0) - 1 do
    for var j := 0 to a.GetLength(1) - 1 do
      a[i, j] := PABCSystem.Random(minValue, maxValue);
end;

procedure FillByRandom(a: array [,] of integer);
begin
  FillByRandom(a, 0, 100);
end;

procedure FillByRandom(a: array [,] of real; minValue, maxValue: real);
begin
  for var i := 0 to a.GetLength(0) - 1 do
    for var j := 0 to a.GetLength(1) - 1 do
      a[i, j] := PABCSystem.Random * (maxValue - minValue);
end;

procedure FillByValue<T>(a: array [,] of T; x: T);
begin
  for var i := 0 to a.GetLength(0) - 1 do
    for var j := 0 to a.GetLength(1) - 1 do
      a[i, j] := x
end;

procedure FillByRandom(a: array [,] of real);
begin
  FillByRandom(a, 0, 10);
end;

function CreateRandomIntegerMatrix(m, n: integer): array [,] of integer;
begin
  SetLength(Result, m, n);
  FillByRandom(Result, 0, 100);
end;

function CreateRandomIntegerMatrix(m, n: integer; minValue, maxValue: integer): array [,] of integer;
begin
  SetLength(Result, m, n);  
  FillByRandom(Result, minValue, maxValue);
end;

function CreateRandomRealMatrix(m, n: integer): array [,] of real;
begin
  SetLength(Result, m, n);  
  FillByRandom(Result, 0, 10);
end;

function CreateRandomRealMatrix(m, n: integer; minValue, maxValue: real): array [,] of real;
begin
  SetLength(Result, m, n);  
  FillByRandom(Result, minValue, maxValue);
end;

procedure WriteMatrix<T>(a: array [,] of T; width: integer);
begin
  for var i := 0 to a.GetLength(0) - 1 do
  begin
    for var j := 0 to a.GetLength(1) - 1 do
      write(a[i, j]:width, ' ');
    writeln;  
  end;
end;

procedure WriteMatrix(a: array [,] of real; width: integer; digitsafterpoint: integer);
begin
  for var i := 0 to a.GetLength(0) - 1 do
  begin
    for var j := 0 to a.GetLength(1) - 1 do
      write(a[i, j]:width:digitsafterpoint, ' ');
    writeln;  
  end;
end;

// ================== ������ ���������� ��� �������� ==================

procedure &Array.Write(delimiter: string);
begin
  if Self.Rank = 1 then
    for var i := 0 to Self.Length - 1 do
    begin
      write(Self.GetValue(i));
      if i < Self.Length - 1 then
        write(delimiter);
    end
  else if Self.Rank = 2 then 
    for var i := 0 to Self.GetLength(0) - 1 do
    begin
      for var j := 0 to Self.GetLength(1) - 1 do
        write(Self.GetValue(i, j), delimiter);
      writeln;
    end;
end;

procedure &Array.Writeln(delimiter: string);
begin
  Self.Write(delimiter);
  writeln;
end;

end.