uses PointerTools;

var
  v: integer;
  
begin
  write('������� ����� �����: ');
  readln(v);
  WriteMemoryToScreen(@v, sizeof(integer));
  readln;
end.

