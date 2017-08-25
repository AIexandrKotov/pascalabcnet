uses GraphWPF;

begin
  Window.Title := '������� �������';
  var ww := Window.Width / 2;
  var hh := Window.Height / 2;
  Draw(x -> sin(4 * x) + cos(3 * x), -5, 5, 0, 0, ww, hh);
  Draw(x -> x * x, -5, 5, ww - 1, 0, ww, hh);
  Draw(x -> exp(x), -5, 5, 0, hh-1, ww, hh);
  Draw(x -> x*cos(2*x-1), -5, 5, ww - 1, hh-1, ww, hh);
end.