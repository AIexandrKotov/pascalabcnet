// ����� ����� ������������� �����
type Str20 = string[20];

var 
  s: Str20;
  f: file of Str20; // file of string ���������� ������, ��������� string ����� ���������� �����!
  
begin
  assign(f,'str.dat');
  rewrite(f);
  write(f,'������ ���� ��������');
  write(f,'������ ���� ��������');
  write(f,'������� ��������� ���');
  close(f);
  reset(f);
  writeln('���������� ����� �����: ');
  for var i := 1 to FileSize(f) do
  begin
    read(f,s);
    writeln(s);
  end;
  close(f);
end.