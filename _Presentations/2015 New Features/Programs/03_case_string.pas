begin
  var Country := ReadString('������� ������:');
  write('�������: ');
  case Country of
    '������': writeln('������');
    '�������': writeln('�����');
    '������': writeln('���');
    '��������': writeln('������');
    else writeln('������ ��� � ���� ������'); 
  end;
end.