var s: set of string;

begin
  s := ['�������','�����','��������'];
  s := s + ['�����','��������','������'];
  if '������' in s then 
    write('������');
  write(s);
end.
