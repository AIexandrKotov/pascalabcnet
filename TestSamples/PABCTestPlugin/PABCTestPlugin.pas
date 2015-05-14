{$apptype dll}

//��� ������� � IVisualPascalABCPlugin, IVisualEnvironmentCompiler
{$reference PluginsSupport.dll}
//��� ������� � IVisualEnvironmentCompiler.Compiler
{$reference Compiler.dll}

{$reference System.Windows.Forms.dll}
{$reference System.Drawing.dll}

//������ - ������ ������
{$resource PABCTestPlugin_newfile.png}

unit PABCTestPlugin;

uses System.Collections.Generic,
     System.Drawing, 
     VisualPascalABCPlugins;

const NL = #13#10;

type
  //�������� ������ - ������ ����� ��� *_VisualPascalABCPlugin � ������������� 
  //��������� VisualPascalABCPlugins.IVisualPascalABCPlugin
  //���� ������ ��������� ������ �� ������ � � ����, �� ������� �� �������:
  // 1. ��������� ����� pas ����
  // 2. �� ����������� � ��������
  // 3. �� ������������� � �����������
  PABCTestPlugin_VisualPascalABCPlugin = class(IVisualPascalABCPlugin)
  private
    //��������� �� �������� �����������
    compiler: IVisualEnvironmentCompiler;
    
    //��� ��������� ������ ����� �����
    function GetNewFileName():string;
    begin
      var fileTemplate := 'C:\PABCWork.NET\NewProgram{0}.pas';
      var pasFile := '';
      var i := 1;
      repeat
        pasFile := string.Format(fileTemplate, i);
        i += 1;
      until(not System.IO.File.Exists(pasFile));
      result := pasFile;
    end;
    //���������� ������� �� ������
    procedure Click1;
    begin
      //������� ����
      var fileName := GetNewFileName;
      System.IO.File.WriteAllText(fileName, string.Format('begin'+NL+'Write(''Im new program "{0}" :)'');'+NL+'end.', fileName));
      //��������� ��� � ��������
      compiler.ExecuteAction(VisualEnvironmentCompilerAction.OpenFile, fileName);
      //��������� ���������� � ����������
      compiler.ExecuteAction(VisualEnvironmentCompilerAction.Run, nil);
    end;
  
  public
    //���������� ����������� � ����� ���������� ���� IVisualEnvironmentCompiler
    constructor(compiler: IVisualEnvironmentCompiler);
    begin
      self.compiler := compiler;
    end;
    //�����������
    function get_Name:string;
    begin
      result := 'PABC Test Plugin';
    end;
    //�����������
    function get_Version:string;
    begin
      result := '1.0';
    end;
    //�����������    
    function get_Copyright:string;
    begin
      result := 'PascalABCNet Team';
    end;
    //�����������
    //���������� �������� � ������� ���� ������� �������� ����� ������ �� ������ � ������ � ����:
    //������ ������ �������� � ������������� ������ ����������� ������.
    procedure GetGUI(MenuItems:List<IPluginGUIItem>; ToolBarItems:List<IPluginGUIItem>);
    begin
      //������ ����������� �� �������
      var img:Image := Image.FromStream(GetResourceStream('PABCTestPlugin_newfile.png'));
      //������� ������
      var item1 := new PluginGUIItem('����� ����', '������� ����� ����', img, Color.Transparent, Click1);
      //��������� � ����
      MenuItems.Add(item1);
      //��������� �� ������
      ToolBarItems.Add(item1);
    end;
    
  end;
  
end.
  