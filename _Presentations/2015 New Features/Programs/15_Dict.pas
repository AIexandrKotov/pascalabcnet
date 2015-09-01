begin
  var dct := Dict(KV('����','color'));
  foreach var s in ReadLines('translations.txt') do
  begin
    var ss := s.ToWords;
    dct.Add(ss[0],ss[1]);
  end;
  writeln(dct);
  
  var word := ReadString('������� �����:');
  if dct.ContainsKey(word) then
    Println('�������:',dct[word])
  else Println('��� ������ �����!')  
end.