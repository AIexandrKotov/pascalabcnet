{function Reverse<T>(Self: array of T): array of T; extensionmethod;
begin
  System.Array.Reverse(Self);
  Result := Self;
end;}

{function BinarySearch<T>(self: array of T; item: T): integer; extensionmethod;
begin
  Result := System.Array.BinarySearch(self,item);
end;}


begin
  var a := Arr(1,2,3);
  //System.Linq.Enumerable.Select(a,x->x); - ���� - ���� �� ��������. ����������� ����� ����� �� ������
  //a.Reverse.Print;
end.