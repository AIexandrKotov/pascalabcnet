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
// LinqObj41: ���������� ������� (�.196)


begin
// === ������ ���������� ===
  Task('LinqObj41');
  var m := ReadInteger;
  var r := ReadAllLines(ReadString)
    .Select(e ->
      begin
        var s := e.Split(' ');
        result := new class (
          brand := StrToInt(s[0]),
          street := s[1],
          price := StrToInt(s[3])
        );
      end)
    .Where(e -> e.brand = m)
    .GroupBy(e -> e.street,
      (k, ee) -> new class ( street := k, max := ee.Max(e -> e.price) ))
    .OrderBy(e -> e.max).ThenBy(e -> e.street)
    .Select(e -> IntToStr(e.max) + ' ' + e.street)
    .DefaultIfEmpty('���');
  WriteAllLines(ReadString, r);
end.


