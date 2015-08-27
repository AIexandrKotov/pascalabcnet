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
//     6.3. ��������� ��������������� �������������������
// LinqObj98: ���������� ������� (�.215, ������)
begin
//������ ����������
    Task('LinqObj98');
    var B := ReadAllLines(ReadString)
      .Select(e ->
      begin
          var s := e.Split(' ');
          result := new class
          (
              art := s[1],
              cat := s[2]
          );
      end);
    var C := ReadAllLines(ReadString)
      .Select(e ->
      begin
          var s := e.Split(' ');
          result := new class
          (
              discount := StrToInt(s[0]),
              code := s[1],
              shop := s[2]
          );
      end);
    var D := ReadAllLines(ReadString)
      .Select(e ->
      begin
          var s := e.Split(' ');
          result := new class
          (
              art := s[0],
              price := StrToInt(s[1]),
              shop := s[2]  
          );
      end);
    var E := ReadAllLines(ReadString)  
      .Select(e ->
      begin
          var s := e.Split(' ');
          result := new class
          (
              code := s[0],
              art := s[1],
              shop := s[2]
          );
      end);     
    var discounts := E.Join(B, e1 -> e1.art, e2 -> e2.art,
        (e1, e2) -> new class ( e1.code, e1.art, e1.shop, e2.cat ))
      .Join(D, e1 -> e1.art + e1.shop, e2 -> e2.art + e2.shop,
        (e1, e2) -> new class ( e1.code, e1.shop, e1.cat, e2.price ))
      .GroupJoin(C, e1 -> e1.code + e1.shop, e2 -> e2.code + e2.shop,
        (e1, ee2) -> new class                 
        (
            cat_shop := e1.cat + ' ' + e1.shop,
            discount := ee2.Select(e -> e.discount)
              .FirstOrDefault() * e1.price div 100
        ));
    var cats := B.GroupBy(e -> e.cat, (k, ee) -> k);
    var shops := E.GroupBy(e -> e.shop, (k, ee) -> k);
    var r := cats
      .SelectMany(e1 -> shops.Select(e2 -> e1 + ' ' + e2))
      .OrderBy(e -> e)
      .GroupJoin(discounts, e1 -> e1, e2 -> e2.cat_shop,
        (e1, ee2) -> e1 + ' ' +
        IntToStr(ee2.Select(e -> e.discount).DefaultIfEmpty(-1).Sum()));
    WriteAllLines(ReadString, r);
end.


