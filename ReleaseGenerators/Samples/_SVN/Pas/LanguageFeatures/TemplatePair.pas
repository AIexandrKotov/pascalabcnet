// ����������� �������� ������� � ����� C++ (template)
type
  /// ���� ��������
  Pair<T, Q> = template class
  public
    First: T;
    Second: Q;
    constructor (First: T; Second: Q);
    begin
      Self.First := First;
      Self.Second := Second;
    end;
    function ToString: string; override;
    begin
      Result := Format('({0}; {1})', First, Second);
    end;
  end;
  
  /// ���� ��������, ������ �� ������� ����� ���������� � �������� ���� �� ����
  PairForPlus<T, Q> = template class(Pair<T,Q>)
  public
    class function operator+(Left,Right: PairForPlus<T,Q>): PairForPlus<T,Q>; 
  end;

class function PairForPlus<T, Q>.operator+(Left,Right: PairForPlus<T,Q>): PairForPlus<T,Q>;
begin
  Result := new PairForPlus<T,Q>(Left.First + Right.First, Left.Second + Right.Second);
end;

var
  r: Pair<real,real> := new Pair<real,real>(3.14,2.8);
  a,b: PairForPlus<integer,string>;
  
begin
  a := new PairForPlus<integer,string>(1, '����+');
  b := new PairForPlus<integer,string>(2, '���');
  Writeln(r);
  Writeln(a + b);
end.