begin
  with System.Console do begin
    if CursorLeft >= 0 then 
      WriteLine;
    Write('��������� ���������, ������� ����� ������� . . .');
    Readkey(true);
  end;
end.