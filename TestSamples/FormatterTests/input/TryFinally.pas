// ����������� finally - ����������� ���������� �� ����, ��������� ���������� ��� ���

begin
  try
    if Random(2)=1 then
      raise Exception.Create('��-��!');
  finally
    write(1);
    readln;
    exit;
    write(2);
  end;
end.

