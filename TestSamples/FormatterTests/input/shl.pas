var i: integer;
begin
  writeln('������� ������');
  writeln(' n         2^n');
  for i:=0 to 30 do
    writeln(i.tostring+'  '+(1 shl i).tostring);
  readln;
end.

