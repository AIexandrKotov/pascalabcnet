var s:string;
    i,j:integer;
begin
  write('������� ������: ');  
  readln(s); 
  writeln('�� �����: ',s);  
  write('������� �����: ');
  readln(i);
  writeln('�� �����: ',i);  
  i:=i div i;
{
ss
1
2 1
}  
  write('������� ��� �����: ');
  readln(i,j); 
  writeln('�� �����: ',i,' ',j);  
  
  writeln('Sleep(1000)');  
  sleep(1000);
  writeln('�����');  
end.