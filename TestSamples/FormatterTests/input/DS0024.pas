#apptype windows
#reference 'System.Windows.Forms.dll' 

uses 
  System,
  System.Windows.Forms; 

type proc=procedure;

procedure P;
begin
end;

var 
  p1: procedure;
  f: Form;

begin
  // ��� �� ����������
  f.Invoke(proc(p));
  p1 := P;
  // � ��� ����������
  f.Invoke(p1);
end.