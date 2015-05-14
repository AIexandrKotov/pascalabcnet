// ������� ���������� �. �����
uses ArrayLib;

/// ������� ���������� 
procedure QuickSort(a: array of integer);
  
/// ���������� a[l]..a[r] �� ����� a[l]..a[q] <= a[q+1]..a[r] 
  function Partition(l,r: integer): integer;
  begin
    var i := l - 1;
    var j := r + 1;
    var x := a[l];
    while True do
    begin
      repeat
        Inc(i);
      until a[i]>=x;
      repeat
        Dec(j);
      until a[j]<=x;
      if i<j then 
        Swap(a[i],a[j])
      else 
      begin
        Result := j;
        exit;
      end;
    end;
  end;
  
/// ���������� ������
  procedure sort(l,r: integer);
  begin
    if l>=r then exit;
    var j := Partition(l,r);
    sort(l,j);
    sort(j+1,r);
  end;

begin
  sort(0,a.Length-1)
end;

const n = 20;

var a: array of integer;

begin
  CreateRandom(a,n);
  writeln('�� ����������: ');
  WriteArray(a);
  QuickSort(a);
  writeln('����� ����������: ');
  WriteArray(a);
end.
