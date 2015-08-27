uses PT4, PT4Linq;

(*
  ��� ������� ����� ������ LinqObj �������� ���������
  �������������� ������, ������������ � ������ PT4Linq:

  ReadAllLines(name) - �������, ������� ���������� ������������������ �����,
    ������������ � ��������� ����� � ������� name;
  WriteAllLines(name, seq) - ���������, ������� ���������� � ��������� ����
    � ������ name ������������������ ����� seq;
  Show() � Show(cmt) (������ ����������) - ���������� ������
    ������������������, cmt - ��������� �����������;
  Show(e -> str) � Show(cmt, e -> str) (������ ����������) -
    ���������� ������ ��������� �������� str, ����������
    �� ��������� e ������������������, cmt - ��������� �����������.
*)

begin
  Task('LinqObj40');
  var res := ReadAllLines(ReadString)
    .Select(s ->
      begin
        var ss := s.Split();
        result := new class
          (
            C := ss[0],
            M := integer.Parse(ss[2]),
            P := integer.Parse(ss[3]),
            S := ss[1]
          );
      end)
    .GroupBy(s -> s.S, (k, ss) -> new class
      (
         S := k,
         C := Range(0,2).Select(i -> ss.Count(s -> s.M = 92+i*3))
      ))
    .OrderBy(e -> e.S)
    .Select(e -> e.S + e.C.Aggregate('', (seed, s) -> seed + ' ' + s));
  WriteAllLines(ReadString, res);
end.


