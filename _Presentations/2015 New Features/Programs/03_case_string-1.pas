var Country: string;

begin
  read(Country);
  write('�������: ');
  
  if Country = '������' then
    writeln('������')
  else if Country = '�������' then
    writeln('�����')
  else if Country = '������' then
    writeln('���')
  else if Country = '��������' then
    writeln('������')
  else writeln('��� � ���� ������'); 
end.