{$reference System.Xml.Linq.dll}
uses PT4, PT4Linq, System, System.Xml.Linq;

(*
  ��� ������� ����� ������ LinqObj �������� ���������
  �������������� ������, ������������ � ������ PT4Linq:

  ReadAllLines(name) - �������, ������� ���������� ������������������ �����,
    ������������ � ��������� ����� � ������� name;
  Show() � Show(cmt) (������ ����������) - ���������� ������
    ������������������, cmt - ��������� �����������;
  Show(e -> str) � Show(cmt, e -> str) (������ ����������) -
    ���������� ������ ��������� �������� str, ����������
    �� ��������� e ������������������, cmt - ��������� �����������.
*)
// ������� �.�. ���������� LINQ �� ��������. �.: ���-�����, 2014.
// ����� 7. ������� ������� ����� �� ������ LinqXml
//     7.6. �������������� ������� �� ��������� XML-����������
// LinqXml82: ���������� ������� (�.276)
begin
// ������ ����������
    Task('LinqXml82');
    var name := ReadString;
    var d := XDocument.Load(name);
    var ns := d.Root.Name.Namespace;
    var a := d.Root.Elements()
      .Select(e ->
      begin
          var s := e.Name.LocalName.Substring(4).Split('-');
          result := new class
          (
              house := StrToInt(s[0]),
              floor := (StrToInt(s[1]) - 1) mod 36 div 4 + 1,
              debt := double(e)
          );
      end);
    var floors := Range(1, 9);
    d.Root.ReplaceNodes(a.OrderBy(e -> e.house)
      .GroupBy(e -> e.house,
        (k, ee) -> new XElement(ns + ('house' + k),
          floors.GroupJoin(ee, e1 -> e1, e2 -> e2.floor,
         (e1, ee2) -> new XElement(ns + ('floor' + e1),
         new XAttribute('count', ee2.Count()),
         new XAttribute('total-debt',
             Math.Round(ee2.Sum(e -> e.debt), 2)))))));
    d.Save(name);
end.


