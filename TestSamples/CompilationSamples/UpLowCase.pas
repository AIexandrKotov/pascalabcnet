// ������� UpCase LowCase UpperCase LowerCase
var
  c: char;
  s: string;
begin
  cls;
  for c:='a' to 'z' do
    write(UpCase(c));
  writeln;
  for c:='A' to 'Z' do
    write(LowCase(c));
  writeln;
  for c:='�' to '�' do
    write(UpCase(c));
  writeln;
  for c:='�' to '�' do
    write(LowCase(c));
  writeln;
  s:='���� � ���� ���� � ����������';
  s:=UpperCase(s);
  writeln(s);
  s:=LowerCase(s);
  writeln(s);
end.
