procedure test(params x:array of integer);
begin
  foreach i:integer in x do
    writeln(i);
end;

var x:array of integer;
    

begin
  //test;  //������?
  test(1);
  test(1,2);
  SetLength(x,2);
  x[0]:=1;x[1]:=2;
  test(x);
end.