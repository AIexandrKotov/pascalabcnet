type MyException=class(Exception)
     constructor create;
     begin
       inherited Create('MyException');
     end;
     end;

begin
  try
    writeln(2);
    raise new MyException;
  except  
  on e:myexception do
    writeln('����������: ',e);
  end;
  readln;
end.
