uses GraphWPF;

begin
  Window.Title := '�������� ����';
  Font.Size := 180;
  Font.Color := Colors.Red;
  Window.Title := '����';
  while True do
  begin
    DrawTextCentered(Window.ClientRect,System.DateTime.Now.ToLongTimeString);
    Sleep(1000);
    Window.Clear;
  end;
end.