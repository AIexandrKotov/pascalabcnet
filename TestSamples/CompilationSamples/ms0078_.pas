procedure p;
var arr,work: array ['�'..'�'] of integer;
begin
  arr['�']:=666;
  work:=arr;
  work['�']:=777;
  writeln(arr['�']);
end;

var arr,work: array ['�'..'�'] of integer;

begin
  p;
  arr['�']:=888;
  work:=arr;
  work['�']:=999;
  writeln(arr['�']);
  readln;
end.