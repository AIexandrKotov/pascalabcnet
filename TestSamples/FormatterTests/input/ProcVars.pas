// ��� ��������� ������� ������������� ���������� ����������
// ����������� ��� ���������� ����� �������� .NET, ��� ���� �������� �������� +=, -=
var p: procedure;

procedure pp;
begin
  writeln('����� ������� ���������');
end;

type 
  A = class
    x: integer;
    constructor Create(xx: integer);
    begin
      x := xx;
    end;
    procedure pp;
    begin
      writeln('����� ������ ������, �������� ���� ����� ',x);
    end;
    class procedure ppstatic;
    begin
      writeln('����� ������������ ������ ������');
    end;
  end;

begin
  p := pp;
  var a1: A := new A(5);
  p += a1.pp;
  p += A.ppstatic;
  p;
end.