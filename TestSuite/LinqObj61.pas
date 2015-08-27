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
// ������� �.�. ���������� LINQ �� ��������. �.: ���-�����, 2014.
// ����� 6. ������� ������� ����� �� ������ LinqObj
//     6.2. ����� ������� ������� �� ��������� ��������� �������������������
// LinqObj61: ���������� ������� (�.199-200)
begin
// === ������ ���������� ===
    Task('LinqObj61');
    var subjects : array of string := ( '�������', '���������', '�����������' );
    var culture := new System.Globalization.CultureInfo('en-US');
    var r := ReadAllLines(ReadString)
      .Select(e ->
      begin
          var s := e.Split(' ');
          result := new class
          (
              name := s[0] + ' ' + s[1],
              subj := s[3],
              mark := StrToInt(s[4])
          );
      end)
      .GroupBy(e -> e.name, (k, ee) -> new class
      (
          name := k,
          avrs := subjects
            .GroupJoin(ee, s -> s, e -> e.subj,
              (s1, ee1) -> ee1.Select(e1 -> e1.mark)
            .DefaultIfEmpty().Average())
      ))
      .OrderBy(e -> e.name)
      .Select(e -> e.name + e.avrs.Aggregate('',
         (a, d) -> a + ' ' + d.ToString('f2', culture)));
    WriteAllLines(ReadString, r);
end.


