begin
  try
    writeln(1);
    raise new Exception('xxx');
  except  
    writeln('����������!');
  end;
  readln;
end.
