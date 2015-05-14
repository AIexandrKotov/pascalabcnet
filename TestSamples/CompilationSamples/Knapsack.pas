// ������ � �����. � ������� B ������ ���� ���������.
// ������ ��� �������� ������ ������������ ����� ������ ���� ���������
const Sz=100;

type IArr=array [1..Sz] of integer;

procedure PrintArr(const A: IArr; n: integer);
var i: integer;
begin
  for i:=1 to n do
    write(A[i],' ');
  writeln;
end;

procedure TrySolve(n: integer; const B: IArr; nb: integer);
var
  Subset: IArr;
  ns: integer;
  space: integer;

  procedure TrySolve0(i: integer);
  begin
    if space=0 then PrintArr(Subset,ns)
    else if (space<0) or (i>nb) then exit // ���������
    else // ����������� �������� ���� ����������� ��������� B
    begin
      TrySolve0(i+1); // ����������� �� ����� i-��� �������

      Inc(ns); Subset[ns]:=B[i]; space:=space-B[i];
      TrySolve0(i+1); // ����������� ����� i-��� �������
      space:=space+B[i]; Dec(ns);
    end;
  end;
  
begin
  space:=n;
  TrySolve0(1);
end;

procedure FillArr(var B: IArr; var n: integer);
begin
  n:=5;
  B[1]:=8; B[2]:=5; B[3]:=13; B[4]:=3; B[5]:=15;
end;

var
  B: IArr;
  nb: integer;

begin
  cls;
  FillArr(B,nb);
  TrySolve(23,B,5);
end.
