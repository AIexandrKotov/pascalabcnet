begin
  try
    writeln(1);
    raise new Exception('xxx');
  except  
  //on e:exception do
    //writeln('����������: ',e);
    writeln('����������!');
  end;
  readln;
end.
