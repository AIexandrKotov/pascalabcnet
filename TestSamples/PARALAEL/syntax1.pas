
//�������������
// ������� ��� ������ 3 ����� - GetResult SetX SetY
function GetResult:real set SetX(x: real), SetY(y: real);
begin
  //������ ���� ����� ����� ������� SetX � SetY
  result := x*y;
end;


//����������� ���������
procedure CalcX(z:real); async;
begin
  z := {������(z)};
  SetX(z);
end;
procedure CalcY(z:real); async;
begin
  z := {������(z)};
  SetY(z);
end;

begin
  CalcX(3.14);//����������� � ������ 1
  CalcY(2.71);//����������� � ������ 2
  writeln(GetResult);
end.