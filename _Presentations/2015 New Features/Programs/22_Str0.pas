var s: string;
  
begin
  s := 'ABCDEFGH';
  s += 'IJK';
  foreach var c in s do
    Print(c);
  Println;
  s := ''+12345; // ����� ������������� � ������
  writeln('a'*10); // ������ ����������� 10 ���
end.