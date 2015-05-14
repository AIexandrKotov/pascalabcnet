unit RBDMUtils;
// (������������������� ����������� PT4TaskMaker)
interface
//���������� � ���� ����������� ���������� � ����������� ������� ��� ������ ��� ����������
//taskname - ��� ������� ��� �������� RB � DM (������� ����������� �������������)
procedure ResRB(taskname: string); 
procedure ResDM(taskname: string); 

//���������� � ���� regtasks.dat � �������� Lib ���������� � ����� ������ �������
//��� ������ ��� ����������
//Group       - ��� ������ (�� 1 �� 7 ��������, ��� ���������),
//Description - �������� ������ (������ ������ ������������� ������������� � �������
//              ��������, ��� ��� �������� ����������� ����� ���������),
//TaskCount   - ����� ������� � ������ (�� 1 �� 999),
//Units       - ��� ������, ����������� ������ (������������ � �������). 
//              ���� Units �������� ������ �������, �� ���������, ��� ��� ������ 
//              ��������� � ������ ������ Group, ����������� ��������� RB ��� DM.
function RegisterRB(Group, Description: string; TaskCount: integer; 
  Units: string): integer;
function RegisterDM(Group, Description: string; TaskCount: integer; 
  Units: string): integer;

implementation

procedure ResRB(taskname: string); 
  external '%PABCSYSTEM%\PT4\PT4PABC.dll' name 'resrb';
procedure ResDM(taskname: string); 
  external '%PABCSYSTEM%\PT4\PT4PABC.dll' name 'resdm';
function registerrb(Group, Description: string; TaskCount: integer; 
  Units: string): integer;
  external '%PABCSYSTEM%\PT4\PT4PABC.dll' name 'registerrb';
function registerdm(Group, Description: string; TaskCount: integer; 
  Units: string): integer;
  external '%PABCSYSTEM%\PT4\PT4PABC.dll' name 'registerdm';
end.
