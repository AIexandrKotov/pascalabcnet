// �������� ����������� �������� �����
var 
  N: integer;
  IsSimple: boolean;

begin
  writeln('������� �����: ');
  readln(N);

  IsSimple := True;
  for var i:=2 to round(sqrt(N)) do // ���� ����� ���������, �� ���� �� ��� ������������ <= (sqrt(N)) 
    if N mod i = 0 then
    begin
      IsSimple := False;
      break;
    end;
  
  if IsSimple then
    writeln('����� ',N,' �������')
  else writeln('����� ',N,' ���������');  
end.