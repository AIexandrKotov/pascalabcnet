type Pupil = record
  name: string;
  age: integer;
  procedure Init(n: string; a: integer);
  begin
    name := n;
    age := a;
  end;
end;

var p: Pupil;

begin
  p.Init('�������',18);
  writeln(p);
  var r := Rec('������',13);
  Println(r, r.Item1, r.Item2);
end.