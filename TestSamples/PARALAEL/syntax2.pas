//��������� 2

procedure CalcX(z:real); async;
begin
  GetResult.x := {������(z)};
end;
procedure CalcY(z:real); async;
begin
  GetResult.y := {������(z)};
end;

function GetResult:real;
asyncparam x,y:real;
var z:real;
begin
  //������ ���� ����� ����� ������� GetResult.X:= � GetResult.Y:=
  //���������� � �������� ������ 
  z := x*y;
  result := z;
end;

begin
  CalcX(3.14);//����������� � ������ 1
  CalcY(2.71);//����������� � ������ 2
  writeln(GetResult);
end.