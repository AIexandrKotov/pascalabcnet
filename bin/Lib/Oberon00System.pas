// (c) Mikst, Juliet 2010
/// ��������� ������ ��� ����� Oberon
unit Oberon00System;

interface

type
  /// ���������� ��� (TRUE | FALSE)
  BOOLEAN = System.boolean;
  /// ����� �����
  INTEGER = System.Int32;
  /// �������� ����� �����
  SHORTINT = System.byte;
  /// ������� ����� �����
  LONGINT = System.int64;
  /// ������������ �����
  REAL = System.double;
  /// ������� ������������ �����
  LONGREAL = System.double;
  /// ������
  CHAR = System.char;
  /// ������
  STRING = System.string;
  /// ��������� �����
  iset = array of integer;

procedure Print(o: object);
procedure Println(o: object);
procedure Println(o1,o2: integer);
procedure Println;

implementation

uses System; 

procedure Print(o: object);
begin
  Console.Write(o);
end;

/// ������� ��������
procedure Println(o: object);
begin
  Console.WriteLine(o);
end;

procedure Println(o1,o2: integer);
begin
  Print(o1);
  Println(o2);
end;

procedure Println;
begin
  Console.WriteLine;
end;
 
end.