var s: string;
  
begin
  s := 'ABCDEFGH';
  writeln(s.Length);
  writeln(s.ToLower);
  writeln(s.Inverse);
  s := '������� ������� ����� �������';
  writeln(s.Replace('�������','������'));
  
  s := '12345';
  var i: integer := s.ToInteger;
  Print(i);
  s := i.ToString;
  Println(s);
end.