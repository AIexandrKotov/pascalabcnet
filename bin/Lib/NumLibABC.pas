unit NumLibABC;

const &NumLibABCVersion = 'NumLibABC 1.0.0 �� 06.09.2017';

type
  Point=auto class
  
  public
  
  x,y:real;
  
end;

{$region ApproxCheb}
type
  /// ������������� ��������� ������� ���������� ��������
  /// �� ������ ���������� ���������
  ApproxCheb=class
  
  private
  nt:integer;       // ���������� �����
  a:array[,] of real; // ����������� ������� ������� (��. MatrCreate) 
  
  procedure MatrCreate; 
  // ��������� ������� � ��� ������� ���� � ����� ���������
  // ������������� ����������������� �������� ������� n
  begin
    a:=new real[r+1,r+2]; // ������������� ������
    var p,s:real;
    for var i:=0 to r do begin
      (p,s):=(1.0,x[i]); a[i,r+1]:=f[i];
      for var j:=0 to r do begin a[i,j]:=p; p*=s end
      end
  end;
  
  procedure Gauss;
  // ���������� �� ��������� 3.1�
  // � ��.: ������ �.�. ��������� ������ ��� ����� �� ������
  // ������, ������� � �������. - �����: �� "�����", 1991.
  begin
    var n1:=r+1;
    c:=new real[n1];
    var p,s:real;   
    for var k:=0 to r do begin
      var k1:=k+1; s:=a[k,k]; var jj:=k; 
      for var i:=k1 to r do begin
        p:=a[i,k]; 
        if Abs(r)>Abs(s) then (s,jj):=(p,i)
        end; 
      if jj<>k then
        for var i:=k to n1 do Swap(a[k,i],a[jj,i]);
      for var j:=k1 to n1 do a[k,j]/=s; 
      for var i:=k1 to r do begin
        p:=a[i,k];
	      for var j:=k1 to n1 do a[i,j]-=a[k,j]*p
        end
      end; 
    for var i:=r downto 0 do begin
      s:=a[i,n1];
      for var j:=i+1 to r do s-=a[i,j]*c[j];
      c[i]:=s
      end
  end; 
  
  public
  
  x:array of real; // �������� ����������
  y:array of real; // �������� �������
  tol:real;        // ������������ �������������
  r:integer;       // ������� ����������������� �������� (r<nt)
  f:array of real; // ������������������ �������� �������
  c:array of real; // ������������ ����������������� ��������
  
  constructor (x,y:array of real; eps:real);
  begin
    nt:=x.Length;
    Assert(nt=y.Length,
        'Approx: ������������ ���������� ����� � ��������� � �������');
    Self.x:=x;
    Self.y:=y;
    f:=ArrFill(nt,0.0);
    Cheb(eps)
  end;
  
  /// ������������� ��������� ������� ���������� �������� (���)
  procedure Cheb(e:real);
  begin
    r:=0;
    var n:=nt-1;
	  var f1:=ArrFill(nt,0.0);
	  var f2:=ArrFill(nt,1.0);
	  var eps:=ArrFill(nt,0.0);
	  while true do begin
      var sum1:=y.Zip(f2,(p,q)->p*q).Sum;
      var sum2:=f2.Select(p->p*p).Sum;
      var al:=sum1/sum2;
      f:=f.Zip(f2,(p,q)->p+al*q).ToArray;
      for var i:=0 to n do eps[i]:=Abs(y[i]-f[i]);
      tol:=Sqrt((eps.Select(t->t*t).Sum)/n);
      if (tol<e) or (r>=n+1) then break;
      sum1:=x.Zip(f2,(p,q)->p*q*q).Sum;
      sum2:=f2.Select(p->p*p).Sum;
      var be:=-(sum1/sum2);
      var g:real;
      if r<>0 then begin
        (sum1,sum2):=(0.0,0.0);
        for var i:=0 to n do begin sum1+=x[i]*f1[i]*f2[i]; sum2+=Sqr(f1[i]) end;
        g:=-(sum1/sum2);
        end;
      r+=1;
      for var i:=0 to n do begin
        var a:=f1[i]; f1[i]:=f2[i]; f2[i]:=(x[i]+be)*f1[i]+g*a
        end
      end
  end;
  
  /// ��������� ������������� ���������� �������� � ��� ��������� �������������
  procedure MakeCoef;
  begin
    MatrCreate;
    Gauss
  end;
 
end;
{$endregion}

{$region Decomp}
type
  /// LU-���������� ������������ ������� ������� �������� ���������
  Decomp=class
    
  private
  
  n:integer; // ����� �����/�������� �������� ������� ����� 1
  
  procedure Decomp;
    //
    // *** ���������� LU-���������� ������������ ������� �����������
    // �������� ���������� � ������ ��������������� ������� ***
    // ������������ ��� ������� ������ �������� ���������
    // ��� ������ ������������� cond=MaxReal (�������� 10^308)
    // ����� ��������� ������������ �������, ����� ������������
    // ������������ ��������� ������� "�" � ������� ��� �� ���������
    // ������� ������� - ����������.
    // ��� ������� ������� �������� ��������� ���� ������� ���������
    // Solve, ������� �� ������ ������ ������ ���������.
    //
    // �������� ����������� ����������� ����������� �������-���������,
    // ����������� � ��. ��.�������, �.���������, �.������
    // "�������� ������ �������������� ����������",
    // �., "���", 1980.
    //
    begin
    Assert(a.RowCount=a.ColCount,'DECOMP: ������� �� ����������');
    ipvt[n]:=1;
    if n=0 then begin
      if a[0,0]<>0 then cond:=1
      else cond:=MaxReal;
      Exit
      end;
    var anorm:=a.Cols.Select(r->r.Select(x->Abs(x)).Sum).Max;
    for var k:=0 to n-1 do begin
	    var m:=k;
  	  for var i:=k+1 to n do
	      if Abs(a[i,k])>Abs(a[m,k]) then m:=i;
      ipvt[k]:=m;
  	  if m<>k then ipvt[n]:=-ipvt[n];
	    Swap(a[m,k],a[k,k]);
	    if a[k,k]<>0 then begin
  	    for var i:=k+1 to n do a[i,k]:=-a[i,k]/a[k,k];
	      for var j:=k+1 to n do begin
	        Swap(a[m,j],a[k,j]);
	        if a[k,j]<>0 then
		        for var i:=k+1 to n do a[i,j]+=a[i,k]*a[k,j]
  		    end
	  	  end
		  end;
	  var work:=new real[n+1];
	  for var k:=0 to n do begin
	    var t:=0.0;
  	  if k<>0 then
	      for var i:=0 to k-1 do t+=a[i,k]*work[i];
      var ek:=1.0;
 	    if t<0.0 then ek:=-1.0;
	    if a[k,k]=0.0 then begin cond:=MaxReal; Exit end;
  	  work[k]:=-(ek+t)/a[k,k];
	    end;
    for var kb:=0 to n-1 do begin
      var k:=n-kb-1;
      var t:=0.0;
      for var i:=k+1 to n do t+=a[i,k]*work[k];
	    work[k]:=t;
	    var m:=ipvt[k];
  	  if m<>k then Swap(work[m],work[k])
	    end;
	  var ynorm:=work.Select(x->Abs(x)).Sum;
  	Self.Solve(work);
    var znorm:=work.Select(x->Abs(x)).Sum;
    cond:=Max(anorm*znorm/ynorm,1.0);
    det:=real(ipvt.Last);
    for var i:=0 to a.RowCount-1 do det*=a[i,i];
  end;
  
  public
  
  a:array[,] of real; // �������� �������
  cond:real;
  ipvt:array of integer; // ��������������� ������
  det:real; // ����������� ������� a
  
  constructor(a:array[,] of real);
  begin
    n:=a.RowCount-1;
    Assert((n=a.ColCount-1) and (n>=0),'DECOMP: �������� ������� �� ����������');
    Self.a:=new real[n+1,n+1];
    for var i:=0 to n do
      for var j:=0 to n do
        Self.a[i,j]:=a[i,j];
    Self.ipvt:=new integer[n+1];
    Decomp
  end;
    
  /// ������� ������� �������� ��������� ��� ���������
  /// ������� ������ ������ ���������.
  procedure Solve(b:array of real);
    //
    // ������ b - ������ ������ ������ ������.
    // ������ ipvt �������� ����������� ������ Decomp.
    //
    // �������� ����������� ����������� ����������� �������-���������,
    // ����������� � ��. ��.�������, �.���������, �.������
    // "�������� ������ �������������� ����������",
    // �., "���", 1980.
    //
  begin
    Assert(b.Length-1=n,'DECOMP/SOLVE: �������� ����� ������� ������ ������');
    for var k:=0 to n-1 do begin
      var m:=ipvt[k];
      Swap(b[m],b[k]);
      for var i:=k+1 to n do b[i]+=a[i,k]*b[k]
      end;
    for var k:=n downto 1 do begin
      b[k]/=a[k,k];
      var t:=-b[k];
      for var i:=0 to k-1 do begin
        b[i]+=a[i,k]*t;
        end
      end;
    b[0]/=a[0,0]
  end;
  
end;
{$endregion}

{$region Factors}
type
  /// ���������� �������� � �������������� ��������������
  /// �� ������������ �������� ��������� ���� ux-v
  Factors=class
  
  private
  a:array of integer;
  n:integer;
  
  public
  
  constructor(params a:array of integer);
  begin
    Self.a:=a;
    Self.n:=a.Length-1;
  end;

  /// ���������� �������� � �������������� ��������������
  /// �� ������������ �������� ��������� ���� ux-v
  function Factorize:array[,] of integer;
  //
  // ������������ �������� ������ ���������� � ������� ����������� �������.
  // ������������ ������:
  // [0,0] - ���������� ��������� �������� ����������;
  // [0,1] - ������������ ��� ������������� ��������;
  // ������ ����������� i-� ������ �������� ������������ ���������
  // [i,0]=u, [i,1]=v
  //
  // ���������: � ������, ���� ��������� ���� �������, �������������� �������
  // ������� �������� �� ������ � ����������� ����� � ���������� ��������.
  //
  // �������� ������������ ��������� 75� (���� �����-60)
  // � ��. ����� �.�., ���� �.�., ������ �.�.
  // ���������� ���������� 51�-100�. (���������� �������).
  // ���.2. �., "���.�����", 1976
  //
  begin
    var f,g,q:integer;
    var (r,c):=(0,1);
    Result:=new integer[n+1,2];
    var b:=a.Reverse.ToArray;
    while b[n]=1 do begin // �������� ��������� (1*�-0)
      n-=1; r+=1;
      (Result[r,0],Result[r,1]):=(1,0);
      end;
    var Fin:=false;
    for var p:=1 to Abs(b[0]) do
      if b[0] mod p=0 then
        for var q1:=1 to Abs(b[n]) do begin
          q:=q1;
          if q<>1 then begin
            var flag:=true;
            for var j:=0 to n do
              if b[j] mod q<>0 then begin flag:=false; break end;
            if flag then
              for var j:=0 to n do b[j]:=b[j] div q
            end;
          repeat
            (f,g):=(b[0],1);
            for var i:=1 to n do begin g*=p; f:=f*q+g*b[i] end;
            if f=0 then begin
              r+=1;
              (Result[r,0],Result[r,1]):=(p,q);
              for var i:=0 to n do begin f:=(b[i]+f) div p; b[i]:=f; f*=q end;
              n-=1;
              if n<>0 then continue;
              Fin:=true
              end;
            if not Fin then q:=-q;
          until (q>0) or Fin;
          if Fin then break;
          end;
      if n=0 then c*=b[0];
      (Result[0,0],Result[0,1]):=(r,c);
      SetLength(Result,r+1,2)
  end;
  
end;
{$endregion}
 
{$region FMin}
type
  /// ���������� �������� ������� �� �������� ���������
  FMin=class
      
  private
  
  a,b,t:real;
  f:real->real;
  
  procedure FMin;

  // ���������� ���������� �������� ������� f(x) �� ��������� [a;b]
  // ����� ���������� ���������� ������ �������� ������� � ����������������
  // �������������� ������������. ���������� ������ �� ������ ����, ��� ���
  // ������������� ������. ���� ������� ����� ����������� ������������� ������
  // ����������� � ����� ��������, �� ����������� � �������� ��������� ���������
  // ������, ���������� ������������� � ������ ����� ������� 1.324...
  // ���������� �������� �������� �������� � ������ �������� ����������� �����
  // �� �������� ��������, ������������ �� ���������.
  // ���������: ������ ���� ���������� ���� real:
  // ��������� �������� ��������� � ����������� ��� ���� �������.
  // 
  // �� ������ ������ Fortran90 (John Burkardt).
  // ��������:
  // Richard Brent,
  // Algorithms for Minimization Without Derivatives,
  // Dover, 2002,
  // ISBN: 0-486-41998-3,
  // LC: QA402.5.B74.

begin
  var d,fu,u,tol1:real;
  var c:=0.5*(3-Sqrt(5.0)); // ������� ��������, �������� �������� �������
  var(sa,sb):=(a,b);
  x:=sa+c*(b-a);
  var w:=x;
  var (v,e,fx):=(w,0.0,f(x));
  var fw:=fx;
  var fv:=fw;
  var eps:=1.0;
  repeat
    eps:=0.5*eps;
    tol1:=1.0+eps
  until tol1<=1.0;
  eps:=Sqrt(eps);
  repeat
    var m:=0.5*(sa+sb);
    var tol:=eps*Abs(x)+t;
    var t2:=2*tol;
    // �������� �������� ������
    if Abs(x-m) <= t2-0.5*(sb-sa) then break;
    // ��������� �� ��������?
    var r:=0.0;
    var q:=r;
    var p:=q;
    if tol<Abs(e) then begin
      r:=(x-w)*(fx-fv); q:=(x-v)*(fx-fw);
      p:=(x-v)*q-(x-w)*r; q:=2.0*(q-r);
      if q>0.0 then p:=-p;
      q:=Abs(q); r:=e; e:=d
      end;
    if (Abs(p)<Abs(0.5*q*r)) and (q*(sa-x)<p) and (p<q*(sb-x)) then begin
      // ��� �������������� ������������
      d:=p/q; u:=x+d;
      // f �� ������� ��������� ������� ������ � a ��� b.
      if ((u-sa)<t2) or ((sb-u)<t2) then d:=x<m?tol:-tol;
      end
    else begin
      // ��� �������� �������
      e:=x<m?sb-x:sa-x; d:=c*e
      end;
    // f �� ������� ��������� ������� ������ � ���������� �
    if tol<=Abs(d) then u:=x+d
    else if d>0.0 then u:=x+tol
    else u:=x-tol;
    fu:=f(u);
    // �������� ��������� ���������
    if fu<=fx then begin
      if u<x then sb:=x else sa:=x;
      (v,fv):=(w,fw);
      (w,fw):=(x,fx);
      (x,fx):=(u,fu)
      end
    else begin
      if u<x then sa:=u else sb:=u;
      if (fu<=fw) or (w=x) then begin
        (v,fv):=(w,fw);
        (w,fw):=(u,fu)
        end
      else
        if (fu<=fv) or (v=x) or (v=w) then (v,fv):=(u,fu)
      end
  until false;
  Value:=fx
end;
  
  public
  
  x:real;     // �������� ���������
  Value:real; // �������� �������
  
  constructor(f:real->real; a,b:real; t:real:=1.05e-8);
  begin
    Self.a:=a;
    Self.b:=b;
    Self.t:=t;
    Self.f:=f;
    FMin
  end;

end;
{$endregion}

{$region FMinN}
type
  /// ����������� ������� ������ ����������
  FMinN=class
  
  private
  
    delta:array of real; // ���������������� HJ
    fbefore:real;        // �������� ������� ��� �����
    newx:array of real;  // ���������������� HJ
    
    fun:function(x:array of real):real; // ������� �������
        
    function BestNearby:real;
    // ����� �����, ����� �������� (�� ������ ��������� �� ���)
    // �� ������ ���� ����� ��������� BEST_NEARBY.
    // ��������:
    //                TOMS178
    // Minimization by Hooke-Jeeves Direct Search
    // FORTRAN-90 version by John Burkardt.
    // ( Dept. of Scientific Computing, Florida State University ), 
    // �� �������� GNU LGPL
    begin
      Result:=fbefore;
      var z:=Copy(newx);
      for var i:=0 to n-1 do begin
      z[i]:=newx[i]+delta[i];
      var ftmp:=fun(z);
      if ftmp<Result then Result:=ftmp
      else begin
        delta[i]:=-delta[i];
        z[i]:=newx[i]+delta[i];
        ftmp:=fun(z);
        if ftmp<Result then Result:=ftmp
        else z[i]:=newx[i]
        end
      end;
      newx:=Copy(z);
    end;
    
    function IsEqual(x1,x2:array of real; eps:real):Boolean;
    begin
      Result:=true;
      for var i:=0 to x1.Length-1 do
        Result:=Result and (Abs(x1[i]-x2[i])<=eps);
    end;
        
  public
  
    n:integer;
    iter:integer;    // ����� ��������
    x:array of real; // ������ ����������
  
    constructor (px:array of real; f:function(x:array of real):real);
    begin
      n:=px.Length;
      x:=Copy(px);
      fun:=f;
      iter:=0;
      Randomize;
    end;
    
    /// ���������� ������������ �������� ������� ����������� ���������� ������ 
    procedure ARS(R:real; var t:real; MaxIter:integer:=100);
    //
    // t - ������ ������� ���������������� ��������� ���������;
    // R - ����������� �������� ���� �� ����������, R<t;
    // MaxIter - ������������ ���������� ��������
    //
    // �������� �������� � ����� ��������� �.�., ������ �.�.
    // ������ ����������� � �������� � �������. - �., ����.��., 2005.
    //
    begin
      var (a,b,n):=(1.618,0.618,x.Length);
      var (y,z,ksi):=(new real[n],new real[n],new real[n]);
      var (k,j,M):=(0,1,3*n);
      Randomize;
      t:=1.0;
      while true do begin
        var ka:=0.0;
        for var i:=0 to n-1 do begin
          ksi[i]:=2*Random-1.0;
          ka+=Sqr(ksi[i])
          end;
        ka:=Sqrt(ka);
        for var i:=0 to n-1 do y[i]:=x[i]+t*ksi[i]/ka;
        var fx:=fun(x);
        if fun(y)<fx then begin // ��� �������
          for var i:=0 to n-1 do z[i]:=x[i]+a*(y[i]-x[i]);
          if fun(z)<fun(x) then begin // ����������� ������ �������
            x:=Copy(z); t:=a*t; k+=1;
            if k<MaxIter then begin j:=1; continue end
            else break
            end
          end;
        if j<M then j+=1
        else
          if t>R then begin t:=b*t; j:=1 end
          else break
        end
    end;
    
    /// ����� �������� ������� ������� �����-�����
    procedure MKSearch(a,b:array of real; // ������� ������
                       var y:real;        // ������ �������� ������� fun
                       m:integer:=1000);  // ����� ��������� �����
    // ��������� ����������. �������� ���������.
    // ��������� ������ ���������� ����������� � �������� ������ x
    // �������� ������� ��� ����� ������� ������������ � ��������� y
    begin
      var n:=x.Length;
      var tx:=new real[n];
      var ty:real;
      loop m do begin
        for var i:=0 to n-1 do tx[i]:=Random*(b[i]-a[i])+a[i];
        ty:=fun(tx);
        if ty<y then begin x:=Copy(tx); y:=ty end
        end
    end;
    
    /// �������� ������� ������ ���� - ������
    function HJ(eps:real:=1e-6;
                rho:real:=0.5;
                itermax:integer:=5000):array of real;
    
    // �� ������ ���� ����� ��������� HOOKE.
    // ��������
    //                TOMS178
    // Minimization by Hooke-Jeeves Direct Search
    // FORTRAN-90 version by John Burkardt.
    // ( Dept. of Scientific Computing, Florida State University ), 
    // �� �������� GNU LGPL
    // ������������ ��� a������� ���� - ������ ������ ��������
    // ��� rho=0.5, �� ����� ��� rho=0.6 � ����� ��� rho=0.8
    
    begin
    newx:=Copy(x);
    var xbefore:=Copy(x);
    delta:=x.Select(t->t=0?rho:rho*Abs(t)).ToArray;
    var steplength:=rho;
    iter:=0;
    fbefore:=fun(newx);
    var newf:=fbefore;
    while (iter<itermax) and (eps<steplength) do begin
      iter+=1;
      // ����� ����� "������ �����" �� ����� ���������� �� ���
      newx:=Copy(xbefore);
      newf:=BestNearby;
      // ���� ��������� ��������, ���� � ���� �����������
      var keep:=1;
      while (newf<fbefore) and (keep=1) do begin
        for var i:=0 to n-1 do begin
          if newx[i]<=xbefore[i] then delta[i]:=-Abs(delta[i])
          else delta[i]:=Abs(delta[i]);
          var tmp:=xbefore[i];
          xbefore[i]:=newx[i];
          newx[i]+=newx[i]-tmp
          end;
        fbefore:=newf;
        newf:=BestNearby;
        if fbefore<=newf then break; // ���� �������� �� ����������...
        keep:=0;
        for var i:=0 to n-1 do
          if 0.5*Abs(delta[i])<Abs(newx[i]-xbefore[i]) then begin
            keep:=1; break
            end;
        end;
      if (eps<=steplength) and (fbefore<=newf) then begin
        steplength*=rho;
        delta.Transform(x->x*rho);
        end
      end;
    Result:=Copy(xbefore);
    end;
    
    /// �������� ��������� ����� � ������������ ��������������
    procedure BPHS(a,b:array of real;  // ������� ������
                  var y:real; // ������ ��������
                  k:integer:=100; // ����� ��������� �����
                  m:integer:=1000); // ����� ��������� ����� ��� MKSearch
    //              
    // ���������� MKSearch. ������� ����������� k*m ���.
    //
    // ������� �.�. ��������� ������ �����������: ������� �������
    // / �.�. �������; ������� ��������������� �����������.
    // -�����: ���-�� �������� ���������������� ������������, 2011.
              
    begin
      var alpha:=2.0;
      y:=real.MaxValue;
      var ty:=y;
      var ta:=Copy(a);
      var tb:=Copy(b);
      var brk:=false;
      loop k do begin
        MKSearch(ta,tb,ty,m);
        if ty<y then begin
          y:=ty;
          for var i:=0 to n-1 do begin 
            a[i]:=ta[i]; b[i]:=tb[i];
            var h:=(tb[i]-ta[i])/2/alpha;
            brk:=brk or (h+1=1);
            ta[i]:=x[i]-h; brk:=brk or (h+1=1); tb[i]:=x[i]+h;
            end;
          if brk then break
          end
        end
    end;
    
    /// ����� ����������� �� ������ �� p ����, ��������� BPHS
    function BestP(a,b:array of real;
                   eps:real;
                   p:integer:=10;
                   k:integer:=100;
                   m:integer:=1000):List<(real,array of real)>;
                   
    // ��������� ���������. ���������� BPHS, MKSearch (��������)
    
    begin
      var L1:=new List<(real,array of real)>;
      var L2:=new List<(real,array of real)>;
      Result:=new List<(real,array of real)>;
      var a1:=ArrFill(p,true);
      if p>0 then begin
        var i:=0;
        loop p do begin
          var y:=real.MaxValue;
          var ta:=Copy(a);
          var tb:=Copy(b);
          BPHS(ta,tb,y,k,m);
          L1.Add((y,x));
          i+=1;
          end;
        end;
      for var i:=0 to L1.Count-2 do begin
        if a1[i] then begin
          L2.Clear;
          L2.Add(L1[i]);
          for var j:=i+1 to L1.Count-1 do
            if a1[j] then
              if IsEqual(L1[i][1],L1[j][1],eps) then begin
                L2.Add(L1[j]);
                a1[j]:=false
                end;
          var q:=L2.Select(x->x[0]).ToArray.IndexMin;    
          if L2.Count>1 then Result.Add(L2[q]) // �� ������������
          end
        end
    end;

end;
{$endregion}

{$region Fraction}
type
  /// ����� ������������ ������ ������������ ��������
  Fraction=class
  
  private
  
  class function ToReal(m:BigInteger):(real,integer);
  begin
    var s:=m.ToString;
    var r:real;
    if Real.TryParse(s,r) then Result:=(r,0)
    else Result:=(s.Left(16).ToReal,s.Length-16)
  end;
  
  /// ��� ���� �����
  class function GCD(a,b:BigInteger):BigInteger;
  begin
    while b<>0 do (a,b):=(b,a mod b);
    Result:=a
  end;

  public
  numerator:BigInteger;
  denominator:BigInteger;
  
  constructor (num:BigInteger:=0; denom:BigInteger:=1);
  begin
    Assert(denom>0,'Fraction: ����������� ����� ������ ���� �������������');
    var n:=GCD(num,denom);
    numerator:=num div n;
    denominator:=denom div n
  end;
  
  class function operator +(a,b:fraction):fraction;
  begin
    var n:=GCD(a.denominator,b.denominator);
    Result:=new fraction(a.numerator*(b.denominator div n)+
        b.numerator*(a.denominator div n),a.denominator div n*b.denominator);
  end;
    
  class procedure operator +=(var r:fraction; a:fraction);
  begin
    r:=r+a;
  end;
        
  class function operator +(a:BigInteger; b:fraction):fraction;
  begin
    Result:=new fraction(a*b.denominator+b.numerator,b.denominator);
    var n:=GCD(Result.numerator,Result.denominator);
    if n<>1 then begin
      Result.numerator:=Result.numerator div n;
      Result.denominator:=Result.denominator div n
      end
  end;
    
  class function operator +(a:fraction; b:BigInteger):fraction;
  begin
    Result:=new fraction(b*a.denominator+a.numerator,a.denominator);
    var n:=GCD(Result.numerator,Result.denominator);
    if n<>1 then begin
      Result.numerator:=Result.numerator div n;
      Result.denominator:=Result.denominator div n
      end
  end;
    
  class procedure operator +=(var r:fraction; a:BigInteger);
  begin
    r:=r+a;
  end;
    
  class function operator -(a,b:fraction):fraction;
    begin
    var n:=GCD(a.denominator,b.denominator);
    Result:=new fraction(a.numerator*(b.denominator div n)-
        b.numerator*(a.denominator div n),a.denominator div n*b.denominator);
    end;
    
  class procedure operator -=(var R:fraction; a:fraction);
  begin
    r:=r-a;
  end;
        
  class function operator -(a:BigInteger; b:fraction):fraction;
  begin
    Result:=new fraction(a*b.denominator-b.numerator,b.denominator);
    var n:=GCD(Result.numerator,Result.denominator);
    if n<>1 then begin
      Result.numerator:=Result.numerator div n;
      Result.denominator:=Result.denominator div n
      end
  end;
    
  class function operator -(a:fraction; b:BigInteger):fraction;
  begin
    Result:=new fraction(a.numerator-b*a.denominator,a.denominator);
    var n:=GCD(Result.numerator,Result.denominator);
    if n<>1 then begin
      Result.numerator:=Result.numerator div n;
      Result.denominator:=Result.denominator div n
      end
  end;
  
  class procedure operator -=(var r:fraction; a:BigInteger);
  begin
    r:=r-a;
  end;
    
  class function operator *(a,b:fraction):fraction;
  begin
    Result:=new fraction(a.numerator*b.numerator,a.denominator*b.denominator);
    var n:=GCD(Result.numerator,Result.denominator);
    if n<>1 then begin
      Result.numerator:=Result.numerator div n;
      Result.denominator:=Result.denominator div n
      end
  end;
    
  class procedure operator *=(var r:fraction; a:fraction);
  begin
    r:=r*a;
  end;
        
  class function operator *(a:BigInteger; b:fraction):fraction;
  begin
    Result:=new fraction(a*b.numerator,b.denominator);
    var n:=GCD(Result.numerator,Result.denominator);
    if n<>1 then begin
      Result.numerator:=Result.numerator div n;
      Result.denominator:=Result.denominator div n
      end
  end;
    
  class function operator *(a:fraction; b:BigInteger):fraction;
  begin
    Result:=new fraction(a.numerator*b,a.denominator);
    var n:=GCD(Result.numerator,Result.denominator);
    if n<>1 then begin
      Result.numerator:=Result.numerator div n;
      Result.denominator:=Result.denominator div n
      end
  end;
    
  class procedure operator *=(var r:fraction; a:BigInteger);
  begin
    r:=r*a;
  end;
    
  class function operator /(a,b:fraction):fraction;
  begin
    Result:=new fraction(a.numerator*b.denominator,a.denominator*b.numerator);
    var n:=GCD(Result.numerator,Result.denominator);
    if n<>1 then begin
      Result.numerator:=Result.numerator div n;
      Result.denominator:=Result.denominator div n
      end
  end;
    
  class procedure operator /=(var r:fraction; a:fraction);
  begin
    r:=r/a;
  end;
        
  class function operator /(a:BigInteger; b:fraction):fraction;
  begin
    Result:=new fraction(a*b.denominator,b.numerator);
    var n:=GCD(Result.numerator,Result.denominator);
    if n<>1 then begin
      Result.numerator:=Result.numerator div n;
      Result.denominator:=Result.denominator div n
      end
  end;
    
  class function operator /(a:fraction; b:BigInteger):fraction;
  begin
    Result:=new fraction(a.numerator,a.denominator*b);
    var n:=GCD(Result.numerator,Result.denominator);
    if n<>1 then begin
      Result.numerator:=Result.numerator div n;
      Result.denominator:=Result.denominator div n
      end
  end;
    
  class procedure operator /=(var r:fraction; a:BigInteger);
  begin
    r:=r/a;
  end;
    
  class function operator -(a:fraction):=
      new fraction(-a.numerator,a.denominator);
    
  class function operator =(a:fraction; b:fraction):=(a-b).numerator=0;
  
  class function operator =(a:BigInteger; b:fraction):=(a-b).numerator=0;
  
  class function operator =(a:fraction; b:BigInteger):=(a-b).numerator=0;
  
  class function operator >(a:fraction; b:fraction):=(a-b).numerator>0;
  
  class function operator >(a:BigInteger; b:fraction):=(a-b).numerator>0;
  
  class function operator >(a:fraction; b:BigInteger):=(a-b).numerator>0;
  
  class function operator >=(a:fraction; b:fraction):=(a-b).numerator>=0;
  
  class function operator >=(a:BigInteger; b:fraction):=(a-b).numerator>=0;
  
  class function operator >=(a:fraction; b:BigInteger):=(a-b).numerator>=0;
  
  class function operator <(a:fraction; b:fraction):=(a-b).numerator<0;
  
  class function operator <(a:BigInteger; b:fraction):=(a-b).numerator<0;
  
  class function operator <(a:fraction; b:BigInteger):=(a-b).numerator<0;
  
  class function operator <=(a:fraction; b:fraction):=(a-b).numerator<=0;
  
  class function operator <=(a:BigInteger; b:fraction):=(a-b).numerator<=0;
  
  class function operator <=(a:fraction; b:BigInteger):=(a-b).numerator<=0;
  
  class function operator <>(a:fraction; b:fraction):=(a-b).numerator<>0;
  
  class function operator <>(a:BigInteger; b:fraction):=(a-b).numerator<>0;
  
  class function operator <>(a:fraction; b:BigInteger):=(a-b).numerator<>0;
  
  /// �������� �������� �����
  function Inv:fraction;
  begin
    Result:=new fraction;
    Result.numerator:=denominator;
    Result.denominator:=numerator
  end;
  
  /// ���������� �������� �����
  function Abs:fraction;
  begin
    Result:=new fraction;
    Result.numerator:=PABCSystem.Abs(numerator);
    Result.denominator:=denominator
  end;
  
  function ToReal:real;
  begin
    var a:=Fraction.ToReal(numerator);
    var b:=Fraction.ToReal(denominator);
    Result:=a[0]/b[0]*Power(10,a[1]-b[1])
  end;
  
  function Print(s:string:=' '):fraction;
  begin
    Result:=Self;
    if denominator=1 then Write(numerator,s)
    else Write(numerator,'/',denominator,s)
  end;
  
  function ToString:string; override;
  begin
    Result:=numerator.ToString;
    if denominator<>1 then Result+='/'+denominator.ToString
  end;
  
end;

  /// ������� ��� ������������ ������
  function Frc(a:BigInteger):fraction;
  begin
    Result:=new fraction(a,1);
  end;
  
  /// ������� ��� ������������ ������
  function Frc(a,b:BigInteger):fraction;
  begin
    Result:=new fraction(a,b);
  end;
  
  /// ������� ��� ������������ ������
  function Frc(a,b,c:BigInteger):fraction;
  begin
    Result:=new fraction(b,c);
    Result:=a+Result
  end;
{$endregion}

{$region Vector}
type
  /// � � � � � � �
  Vector=class
  
  public
  
    Value:array of real;
    Length:integer;
  
  constructor (params px:array of real);
  begin
    Value:=PABCSystem.Copy(px);
    Length:=Value.Length;
    Assert(Value.Length<>0,'Vector: ������� ����� ���������')
  end;
  
  constructor (pa,pb:array of real);
  begin
    Value:=PABCSystem.Copy(pb);
    Length:=Value.Length;
    for var i:=0 to Length-1 do Value[i]-=pa[i];
    Assert(Value.Length<>0,'Vector: ������� ����� ���������');
  end;
  
  constructor (pn:integer);
  begin
    Value:=new real[pn];
    Length:=pn
  end;
  
  class function operator + (va,vb:Vector):Vector;
  begin
    Assert(va.Length=vb.Length,'Vector:����� ������������');
    Result:=new Vector(va.Value.Zip(vb.Value,(p,q)->p+q).ToArray);
  end;
  
  class function operator - (va,vb:Vector):Vector;
  begin
    Assert(va.Length=vb.Length,'Vector:����� ������������');
    Result:=new Vector(va.Value.Zip(vb.Value,(p,q)->p-q).ToArray);
  end;
  
  class function operator - (va:Vector):Vector; // ������� �����
  begin
    Result:=new Vector(va.Value);
    for var i:=0 to Result.Length-1 do Result.Value[i]:=-Result.Value[i]; 
  end;
  
  class function operator * (va,vb:Vector):real; // ��������� ������������
  begin
    Assert(va.Length=vb.Length,'Vector:����� ������������');
    Result:=va.Value.Zip(vb.Value,(p,q)->p*q).Sum;
  end;
  
  class function operator * (ra:real; vb:Vector):Vector;
  begin
    Result:=new Vector(vb.Value);
    for var i:=0 to Result.Length-1 do Result.Value[i]*=ra 
  end;
  
  class function operator * (va:Vector; rb:real):=rb*va;
  
  class function operator = (va,vb:Vector):boolean;
  begin
    Assert(va.Length=vb.Length,'Vector:����� ������������');
    Result:=(va.Value[0]/vb.Value[0]=1.0);
    var i:=1;
    while Result and (i<=va.Length-1) do begin
      Result:=Result and (va.Value[i]/vb.Value[i]=1.0);
      i+=1
      end
  end;
  
  /// ��������� ������������
  function VP(vb:Vector):Vector;
  begin
    Result:=new Vector(3);
    Assert(Length=vb.Length,'Vector.VP: ����� �������� ������������');
    if (Length=2) or (Length=3) then begin
      var r:=new real[3,3] ((1,1,1),(0,0,0),(0,0,0));
      for var j:=0 to Length-1 do begin
        r[1,j]:=Value[j];
        r[2,j]:=vb.Value[j]
        end;
      Result.Value[0]:=r[1,1]*r[2,2]-r[1,2]*r[2,1];
      Result.Value[1]:=-r[1,0]*r[2,2]+r[1,2]*r[2,0];
      Result.Value[2]:=r[1,0]*r[2,1]-r[1,1]*r[2,0]
      end       
    else begin
      Assert(false,'Vector.VP: ������� ������ ���� ���� ��� �����������');
      Result.Value:=ArrFill(3,MaxReal)
      end
  end;
  
  /// ��������� ������������
  function MP(vb,vc:Vector):real;
  begin
    Assert((Length=vb.Length) or (Length=vc.Length),
        'Vector.MP: ����� �������� ������������');
    if (Length=2) or (Length=3) then begin
      var r:=new real[3,3];
      for var j:=0 to Length-1 do begin
        r[0,j]:=Value[j];
        r[1,j]:=vb.Value[j];
        r[2,j]:=vc.Value[j]
        end;
      Result:=r[0,0]*(r[1,1]*r[2,2]-r[1,2]*r[2,1])-
          r[0,1]*(r[1,0]*r[2,2]-r[1,2]*r[2,0])+
          r[0,2]*(r[1,0]*r[2,1]-r[1,1]*r[2,0])
      end       
    else begin
      Assert(false,'Vector.VP: ������� ������ ���� ���� ��� �����������');
      Result:=MaxReal
      end
  end;
  
  /// ������ �������
  function ModV:real; 
  begin
    Result:=Sqrt(Value.Select(t->t*t).Sum);
  end;
  
  /// ��� �������
  function Ort:Vector; 
  begin
    Result:=new Vector(Length);
    var invd:=1.0/Sqrt(Value.Select(t->t*t).Sum);
    for var i:=0 to Length-1 do Result.Value[i]:=Value[i]*invd
  end;
  
  /// �������������� ��������
  function IsCollinear(vb:Vector):boolean;
  begin
    Assert(Length=vb.Length,'Vector.IsCollinear: ����� �������� ������������');
    var k:=Value[0]/vb.Value[0];
    Result:=true;
    var i:=1;
    while Result and (i<=Length-1) do begin
      Result:=Result and (Value[i]/vb.Value[i]=k);
      i+=1
      end
  end;
  
  /// �������������� ��������
  function IsCoplanar(vb,vc:Vector):boolean;
  begin
    Assert((Length=vb.Length) or (Length=vc.Length),
        'Vector.IsCoplanar: ����� �������� ������������');
    Result:=Self.MP(vb,vc)=0.0
  end;
  
  /// ���������� ����� �������
  function Copy:Vector;
  begin
    Result:=new Vector(Value)
  end;
  
  function Print(delim:string:=' '):Vector;
  begin
    Value.Print(delim);
    Result:=new Vector(Value)
  end;
  
  function Println(delim:string:=' '):Vector;
  begin
    Value.Println(delim);
    Result:=new Vector(Value)
  end;
  
end;
{$endregion}

{$region Matrix}
type
  /// � � � � � � �
  Matrix=class
  
  public
  
    Value: array[,] of real;
    RowCount:  integer;
    ColCount:  integer;
  
  constructor (pa:array[,] of real);
  begin
    (RowCount,ColCount):=(pa.RowCount,pa.ColCount);
    Value:=new real[RowCount,ColCount];
    for var i:=0 to RowCount-1 do
      for var j:=0 to ColCount-1 do
        Value[i,j]:=pa[i,j]
  end;
  
  constructor (nRows,nCols:integer);
  begin
    Value:=new real[nRows,nCols];
    RowCount:=nRows;
    ColCount:=nCols
  end;
  
  constructor (nRows,nCols:integer; params pa:array of real);
  begin
    Assert(pa.Length=nRows*nCols,
        '�������� MarixR: �������� ���������� ����������');
    (RowCount,ColCount):=(nRows,nCols);
    Value:=new real[RowCount,ColCount];
    for var i:=0 to RowCount-1 do
      for var j:=0 to ColCount-1 do
        Value[i,j]:=pa[ColCount*i+j]
  end;
  
  class function operator + (pa,pb:Matrix):Matrix;
  // �������� ������
  begin
    Assert((pa.RowCount=pb.RowCount) and (pa.ColCount=pb.ColCount),
        '�������� MarixR: ������������ ��������');
    Result:=new Matrix(pa.RowCount,pa.RowCount);
    for var i:=0 to pa.RowCount-1 do
      for var j:=0 to pa.ColCount-1 do
        Result.Value[i,j]:=pa.Value[i,j]+pb.Value[i,j]
  end;
  
  class function operator - (pa:Matrix):Matrix;
  // ����� ����� ������� (������� �����)
  begin
    Result:=new Matrix(pa.RowCount,pa.ColCount);
    for var i:=0 to pa.RowCount-1 do
      for var j:=0 to pa.ColCount-1 do
        Result.Value[i,j]:=-pa.Value[i,j]
  end;
  
  class function operator - (pa,pb:Matrix):Matrix;
  // ��������� ������
  begin
    Assert((pa.RowCount=pb.RowCount) and (pa.ColCount=pb.ColCount),
        '��������� MarixR: ������������ ��������');
    Result:=new Matrix(pa.RowCount,pa.ColCount);
    for var i:=0 to pa.RowCount-1 do
      for var j:=0 to pa.ColCount-1 do
        Result.Value[i,j]:=pa.Value[i,j]-pb.Value[i,j]
  end;
  
  class function operator * (r:real; pb:Matrix):Matrix;
  // ��������� ������� �� �������
  begin
    Result:=new Matrix(pb.RowCount,pb.ColCount);
    for var i:=0 to pb.RowCount-1 do
      for var j:=0 to pb.ColCount-1 do
        Result.Value[i,j]:=r*pb.Value[i,j]
  end;
  
  class function operator * (pa:Matrix; r:real):=r*pa;
  // ��������� ������� �� ������
  
  class function operator * (pa,pb:Matrix):Matrix;
  // ��������� ������
  begin
    Assert(pa.ColCount=pb.RowCount,
        'Matrix: ��������� ������. ������������ ��������');
    Result:=new Matrix(pa.RowCount,pb.ColCount);
    for var i:=0 to pa.RowCount-1 do
      for var j:=0 to pb.ColCount-1 do begin
        var s:=0.0;
        for var k:=0 to pa.ColCount-1 do
          s+=pa.Value[i,k]*pb.Value[k,j];
        Result.Value[i,j]:=s
        end
  end;
  
  class function operator * (pa:Matrix; pb:Vector):Vector;
  // ��������� ������� �� ������
  begin
    Assert(pa.ColCount=pb.Length,
        'Matrix: ��������� ������� �� ������. ������������ ��������');
    Result:=new Vector(pa.RowCount);
    for var i:=0 to pa.RowCount-1 do begin
      var s:=0.0;
      for var j:=0 to pa.ColCount-1 do
          s+=pa.Value[i,j]*pb.Value[j];
      Result.Value[i]:=s
      end
  end;
  
  class function operator * (pa:Vector; pb:Matrix):Vector;
  // ��������� ������� �� �������
  begin
    Assert(pa.Length=pb.RowCount,
        'Matrix: ��������� ������� �� �������. ������������ ��������');
    Result:=new Vector(pb.ColCount);
    for var j:=0 to pb.ColCount-1 do begin
      var s:=0.0;
      for var i:=0 to pb.RowCount-1 do
          s+=pa.Value[i]*pb.Value[i,j];
      Result.Value[j]:=s
      end
  end;
  
  /// ���������� ������������ ������� n*n �� ���� �������� r
  class function Diag(n:integer; r:real):Matrix;
  begin
    Result:=new Matrix(n,n);
    for var i:=0 to n-1 do
      for var j:=0 to n-1 do
        Result.Value[i,j]:=i=j?r:0.0
  end;
  
  /// ��������� ������
  function Row(k:integer; base:integer:=1):Vector;
  begin
    if base<>0 then base:=1;
    Result:=new Vector(ColCount);
    Result.Value:=Value.Row(k-base)
  end;

  /// ������ ������
  procedure SetRow(v:Vector; k:integer; base:integer:=1);
  begin
    if base<>0 then base:=1;
    Value.SetRow(k-base,v.Value)
  end;
  
  /// ������� ������ ����� ���������
  procedure InsertRowAfter(v:Vector; k:integer; base:integer:=1);
  begin
    if base<>0 then base:=1;
    var k1:=k-base;
    Assert((k1 >= 0) and (k1 < RowCount),
        'Matrix.InsertRowAfter: ������������ ����� ������');
    Assert(ColCount=v.Length,
        'Matrix.InsertRowAfter: ������������� ����� �������');
    var tm:=new Matrix(RowCount+1,ColCount);
    for var i:=0 to k1 do
      for var j:=0 to ColCount-1 do tm.Value[i,j]:=Value[i,j];
    for var j:=0 to ColCount-1 do tm.Value[k1+1,j]:=v.Value[j];
    for var i:=k1+2 to RowCount do
      for var j:=0 to ColCount-1 do tm.Value[i,j]:=Value[i-1,j];
    RowCount+=1;
    Value:=new real[RowCount,ColCount];
    for var i:=0 to RowCount-1 do
      for var j:=0 to ColCount-1 do Value[i,j]:=tm.Value[i,j];
  end;
  
  /// ������� ������ ����� ���������
  procedure InsertRowBefore(v:Vector; k:integer; base:integer:=1);
  begin
    if base<>0 then base:=1;
    var k1:=k-base;
    Assert((k1 >= 0) and (k1 < RowCount),
        'Matrix.InsertRowBefore: ������������ ����� ������');
    Assert(ColCount=v.Length,
        'Matrix.InsertRowBefore: ������������� ����� �������');
    var tm:=new Matrix(RowCount+1,ColCount);
    for var i:=0 to k1-1 do
      for var j:=0 to ColCount-1 do tm.Value[i,j]:=Value[i,j];
    for var j:=0 to ColCount-1 do tm.Value[k1,j]:=v.Value[j];
    for var i:=k1+1 to RowCount do
      for var j:=0 to ColCount-1 do tm.Value[i,j]:=Value[i-1,j];
    RowCount+=1;
    Value:=new real[RowCount,ColCount];
    for var i:=0 to RowCount-1 do
      for var j:=0 to ColCount-1 do Value[i,j]:=tm.Value[i,j];
  end;

  /// �������� ������
  procedure DeleteRow(k:integer; base:integer:=1);
  begin
    if base<>0 then base:=1;
    var k1:=k-base;
    Assert((k1 >= 0) and (k1 < RowCount),
        'Matrix.DeleteRowAfter: ������������ ����� ������');
    var tm:=new Matrix(RowCount-1,ColCount);
    for var i:=0 to k1-1 do
      for var j:=0 to ColCount-1 do tm.Value[i,j]:=Value[i,j];
    for var i:=k1+1 to RowCount-1 do
      for var j:=0 to ColCount-1 do tm.Value[i-1,j]:=Value[i,j];
    RowCount-=1;
    Value:=new real[RowCount,ColCount];
    for var i:=0 to RowCount-1 do
      for var j:=0 to ColCount-1 do Value[i,j]:=tm.Value[i,j];
  end;

  /// ������������ j-� ������ � i-�, ��������� � i-� ������
  procedure AddRow(i,j:integer; base:integer:=1);
  begin
    if base<>0 then base:=1;
    for var k:=0 to ColCount-1 do
      Value[i-base,k]+=Value[j-base,k]
  end;
  
  /// ��������� j-� ������ �� i-�, ��������� � i-� ������
  procedure SubRow(i,j:integer; base:integer:=1);
  begin
    if base<>0 then base:=1;
    for var k:=0 to ColCount-1 do
      Value[i-base,k]-=Value[j-base,k]
  end;
  
  /// ��������� ������ �� ������
  procedure MultRow(k:integer; r:real; base:integer:=1);
  begin
    if base<>0 then base:=1;
    for var j:=0 to ColCount-1 do
      Value[k-base,j]*=r
  end;
  
  /// ����� ������� ����� i � j
  procedure SwapRows(i,j:integer; base:integer:=1);
  begin
    if base<>0 then base:=1;
    Value.SwapRows(i-base,j-base)
  end;

  /// ��������� �������
  function Col(k:integer; base:integer:=1):Vector;
  begin
    if base<>0 then base:=1;
    Result:=new Vector(RowCount);
    Result.Value:=Value.Col(k-base)
  end;

  /// ������ �������
  procedure SetCol(v:Vector; k:integer; base:integer:=1);
  begin
    if base<>0 then base:=1;
    Value.SetCol(k-base,v.Value)
  end;
  
  /// ������� ������� ����� ����������
  procedure InsertColAfter(v:Vector; k:integer; base:integer:=1);
  begin
    if base<>0 then base:=1;
    var k1:=k-base;
    Assert((k1 >= 0) and (k1 < ColCount),
        'Matrix.InsertColAfter: ������������ ����� �������');
    Assert(RowCount=v.Length,
        'Matrix.InsertColAfter: ������������� ����� �������');
    var tm:=new Matrix(RowCount,ColCount+1);
    for var j:=0 to k1 do
      for var i:=0 to RowCount-1 do tm.Value[i,j]:=Value[i,j];
    for var i:=0 to RowCount-1 do tm.Value[i,k1+1]:=v.Value[i];
    for var j:=k1+2 to ColCount do
      for var i:=0 to RowCount-1 do tm.Value[i,j]:=Value[i,j-1];
    ColCount+=1;
    Value:=new real[RowCount,ColCount];
    for var i:=0 to RowCount-1 do
      for var j:=0 to ColCount-1 do Value[i,j]:=tm.Value[i,j];
  end;
  
  /// ������� ������� ����� ���������
  procedure InsertColBefore(v:Vector; k:integer; base:integer:=1);
  begin
    if base<>0 then base:=1;
    var k1:=k-base;
    Assert((k1 >= 0) and (k1 < ColCount),
        'Matrix.InsertColBefore: ������������ ����� �������');
    Assert(RowCount=v.Length,
        'Matrix.InsertColBefore: ������������� ����� �������');
    var tm:=new Matrix(RowCount,ColCount+1);
    for var j:=0 to k1-1 do
      for var i:=0 to RowCount-1 do tm.Value[i,j]:=Value[i,j];
    for var i:=0 to RowCount-1 do tm.Value[i,k1]:=v.Value[i];
    for var j:=k1+1 to ColCount do
      for var i:=0 to RowCount-1 do tm.Value[i,j]:=Value[i,j-1];
    ColCount+=1;
    Value:=new real[RowCount,ColCount];
    for var i:=0 to RowCount-1 do
      for var j:=0 to ColCount-1 do Value[i,j]:=tm.Value[i,j];
  end;
  
  /// �������� �������
  procedure DeleteCol(k:integer; base:integer:=1);
  begin
    if base<>0 then base:=1;
    var k1:=k-base;
    Assert((k1 >= 0) and (k1 < ColCount),
        'Matrix.DeleteCol: ������������ ����� �������');
    var tm:=new Matrix(RowCount,ColCount-1);
    for var j:=0 to k1-1 do
      for var i:=0 to RowCount-1 do tm.Value[i,j]:=Value[i,j];
    for var j:=k1+1 to ColCount-1 do
      for var i:=0 to RowCount-1 do tm.Value[i,j-1]:=Value[i,j];
    ColCount-=1;
    Value:=new real[RowCount,ColCount];
    for var i:=0 to RowCount-1 do
      for var j:=0 to ColCount-1 do Value[i,j]:=tm.Value[i,j];
  end;

  /// ������������ j-�� ������� � i-�, ��������� � i-� �������
  procedure AddCol(i,j:integer; base:integer:=1);
  begin
    if base<>0 then base:=1;
    for var k:=0 to RowCount-1 do
      Value[k,i-base]+=Value[k,j-base]
  end;
  
  /// ��������� j-�� ������� �� i-��, ��������� � i-� �������
  procedure SubCol(i,j:integer; base:integer:=1);
  begin
    if base<>0 then base:=1;
    for var k:=0 to RowCount-1 do
      Value[k,i-base]-=Value[k,j-base]
  end;
  
  /// ��������� ������� �� ������
  procedure MultCol(k:integer; r:real; base:integer:=1);
  begin
    if base<>0 then base:=1;
    for var i:=0 to RowCount-1 do
      Value[i,k-base]*=r
  end;
  
  /// ����� ������� �������� i � j
  procedure SwapCols(i,j:integer; base:integer:=1);
  begin
    if base<>0 then base:=1;
    Value.SwapCols(i-base,j-base)
  end;
  
  /// ���������������� �������
  function Transpose:Matrix;
  begin
    Result:=new Matrix(ColCount,RowCount);
    Result.Value:=PABCSystem.Transpose(Value);
  end;
  
  /// ����� ������� �� ����� 
  function Println(w:integer:=6; d:integer:=2):Matrix;
  begin
    Result:=new Matrix(RowCount,ColCount);
    for var i:=0 to RowCount-1 do begin
      for var j:=0 to ColCount-1 do begin
        Result.Value[i,j]:=Value[i,j];
        Write(Result.Value[i,j]:w:d)
        end;
      Writeln
      end
  end;

  /// ����������� �������
  function Det:real;
  begin
    var r:=new Decomp(Value);
    Result:=r.det
  end;
  
  /// ��������� ���������� �������
  function Inv:Matrix;
  begin
    Assert(RowCount=ColCount,'Matrix.Inv: ������� �� ����������');
    Result:=new Matrix(RowCount,ColCount);
    var r:=new Decomp(Value);
    if r.cond<MaxReal then begin
      for var j:=0 to ColCount-1 do begin
        var v:=ArrGen(RowCount,i->i=j?1.0:0.0);
        r.Solve(v);
        for var i:=0 to RowCount-1 do Result.Value[i,j]:=v[i]
        end
      end
    else Result.Value:=MatrFill(RowCount,ColCount,MaxReal);  
  end;
  
  /// ������� ������� �������� �������������� ��������� (����)
  function SLAU(vb:Vector; var cond:real):Vector;
  // ���������� ������, ���������� ������� ����.
  // ������� � cond ����� ��������������� �������� �������.
  // ���� cond ������, �������� ������� ��������� ��� ������ � ����� �
  // �������� ���������� ������������ ������.
  // �������� ��������� � ���������������� ������ Decomp.
  begin
    Assert(vb.Length=ColCount,
        'Matrix.SLAU: ����� ������� vb ������������ � �������� �������');
    var r:=new Decomp(Value);
    cond:=r.cond;
    Result:=new Vector(vb.Length);
    Result.Value:=PABCSystem.Copy(vb.Value);
    r.Solve(Result.Value);
  end;

  /// ���������� ����� �������
  function Copy:Matrix;
  begin
    Result:=new Matrix(RowCount,ColCount);
    for var i:=0 to RowCount-1 do
      for var j:=0 to ColCount-1 do
        Result.Value[i,j]:=Value[i,j]
  end;
  
end;  
  {$endregion}

{$region Polynom}
type
  /// �������������� ����������
  Polynom=class
  
  public
    a:array of real; // ������������ �� ����������� �������
    n:integer; // ���-�� ��������� � ��������
    eps:real; // ������ �������� ��� ������������ ��������
  
  constructor(params p:array of real);
  begin
    a:=PABCSystem.Copy(p);
    n:=a.Length
  end;
  
  constructor Create(n:integer);
  begin
    a:=ArrFill(n,0.0);
    Self.n:=n
  end;

  /// �������� �������� P(x)
  function Value(x:real):real;
  begin
    Result:=a[0];
    var k:=1.0;
    for var i:=1 to n-1 do begin
      k*=x;
      Result+=a[i]*k
      end;
  end;
  
  /// ������������ ����������� ��������
  function PDif:Polynom;
  begin
    Result:=new Polynom(n-1);
    for var i:=0 to n-2 do Result.a[i]:=a[i+1]*(i+1)
  end;
  
  /// ������������ ��������������� ��������� �� ��������
  function PInt:Polynom;
  begin
    Result:=new Polynom(Arr(0.0)+a);
    for var i:=1 to Result.n-1 do Result.a[i]/=i
  end;
  
  class function operator + (p,q:Polynom):Polynom;
  begin
    var m:=Max(p.n,q.n);
    Result:=new Polynom(m);
    if p.n>q.n then begin
      for var i:=0 to q.n-1 do Result.a[i]:=p.a[i]+q.a[i];
      for var i:=q.n to m-1 do Result.a[i]:=p.a[i]
      end
    else begin
      for var i:=0 to p.n-1 do Result.a[i]:=p.a[i]+q.a[i];
      for var i:=p.n to m-1 do Result.a[i]:=q.a[i]
      end
  end;
  
  class function operator + (r:real; p:Polynom):Polynom;
  begin
    Result:=new Polynom(p.a);
    Result.a[0]+=r
  end;
  
  class function operator + (p:Polynom; r:real):=r+p;
  
  class function operator - (p:Polynom):=
      new Polynom(p.a.Select(x->-x).ToArray);
  
  class function operator - (p,q:Polynom):Polynom;
  begin
    var m:=Max(p.n,q.n);
    Result:=new Polynom(m);
    if p.n>q.n then begin
      for var i:=0 to q.n-1 do Result.a[i]:=p.a[i]-q.a[i];
      for var i:=q.n to m-1 do Result.a[i]:=p.a[i]
      end
    else begin
      for var i:=0 to p.n-1 do Result.a[i]:=p.a[i]-q.a[i];
      for var i:=p.n to m-1 do Result.a[i]:=-q.a[i]
      end
  end;
  
  class function operator - (r:real; p:Polynom):Polynom;
  begin
    Result:=-p;
    Result.a[0]+=r
  end;
  
  class function operator - (p:Polynom; r:real):Polynom;
  begin
    Result:=new Polynom(p.a);
    Result.a[0]-=r
  end;
  
  class function operator * (p,q:Polynom):Polynom;
  begin
    var m:=p.n+q.n-1;
    Result:=new Polynom(m);
    for var i:=0 to p.n-1 do
      for var j:=0 to q.n-1 do
        Result.a[i+j]+=p.a[i]*q.a[j]
  end;
  
  class function operator * (r:real; p:Polynom):Polynom;
  begin
    Result:=new Polynom(p.a);
    for var i:=0 to p.n-1 do Result.a[i]*=r 
  end;
  
  class function operator * (p:Polynom; r:real):=r*p;
  
  class function operator = (p,q:Polynom):boolean;
  begin
    if p.n<>q.n then Result:=false
    else begin
      Result:=true;
      for var i:=0 to p.n-1 do
        if Abs(p.a[i]-q.a[i])>0 then begin
          Result:=false; Exit
          end
      end    
  end;
  
  /// ����� ��������
  function Copy:=new Polynom(a);
  
  class function operator / (p,q:Polynom):(Polynom,Polynom);
  begin
    var np:=p.n-q.n+1;
    if np<=0 then begin
      Result:=(new Polynom(1),p.Copy);
      Exit
      end;
    var pp:=new Polynom(np);
    var s:=p.Copy;
    var ns:=q.n-1;
    var i:=np;
    repeat
      pp.a[i-1]:=s.a[i+ns-1]/q.a.Last;
      for var k:=0 to ns-1 do begin
        var j:=k-1+i;
        s.a[j]-=pp.a[i-1]*q.a[k]
        end;
      i-=1
    until i<=0;
    SetLength(s.a,ns);
    s.n:=ns;
    Result:=(pp,s)
  end;
  
  class function operator / (p:Polynom; q:real):Polynom;
  begin
    Result:=p.Copy;
    for var i:=0 to Result.n-1 do Result.a[i]/=q
  end;
  
  class function operator / (p:real; q:Polynom):=(p,q.Copy);
  
  /// ����� ������������� �������� � ������������
  function Print(delim:char:=' '):Polynom;
  begin
    a.Print(delim);
    Result:=Self.Copy
  end;
  
  /// ������ ��������� � �� at+b
  function Polyx(a,b:real):Polynom;
  begin
    Result:=new Polynom(n);
    var z:=new real[n];
    var w:=ArrFill(n,1.0);
    Result.a[0]:=Self.a[0];
    z[0]:=1;
    for var i:=1 to n-1 do begin
      z[i]:=b*z[i-1];
      Result.a[0]+=Self.a[i]*z[i]
      end;
    for var j:=1 to n-1 do begin
      w[0]*=a; Result.a[j]:=Self.a[j]*w[0];
      for var i:=j+1 to n-1 do begin
        var k:=i-j;
        w[k]:=a*w[k]+w[k-1];
        Result.a[j]+=Self.a[i]*w[k]*z[k]
        end
      end
  end;
  
  /// ������������ �������� �� [-1;1]
  function EconomSym(h,limit:real):Polynom;
  // ����������� ��������� 38�
  // � ��.: ����� �.�., ���� �.�., ������ �.�.
  // ���������� ���������� 1�-50�. (���������� �������).
  // �., "���.�����", 1975
  begin
    var n1:=n-1;
    var t:=new real[n];
    Result:=Self.Copy;
    var s:real;
    eps:=0;
    while n1>=2 do begin  
      t[n1]:=-Result.a[n1];
      var k:=n1;
      while k>=2 do begin
        t[k-2]:=-t[k]*Sqr(h)*k*(k-1)/((n1+k-2)*(n1-k+2));
        k-=2
        end;
      s:=n1.IsEven?a[0]:t[1]/n1;
      if eps+Abs(s)<limit then begin
        eps+=Abs(s);
        k:=n1;
        while k>=0 do begin Result.a[k]+=t[k]; k-=2 end;
        n1-=1;
        end
      else break
      end;
    SetLength(Result.a,n1+1);
    Result.n:=n1+1;
    Result.eps:=eps
  end;

  /// ������������ �������� �� [0,1]
  function EconomUnsym(h,limit:real):Polynom;
  // ����������� ��������� 37�
  // � ��.: ����� �.�., ���� �.�., ������ �.�.
  // ���������� ���������� 1�-50�. (���������� �������).
  // �., "���.�����", 1975
  begin
    var n1:=n-1;
    var t:=new real[n];
    Result:=Self.Copy;
    eps:=0.0;
    while n1>=1 do begin  
      t[n1]:=-Result.a[n1];
      for var k:=n1 downto 1 do
        t[k-1]:=-t[k]*h*k*(k-0.5)/((n1+k-1)*(n1-k+1));
      if eps+Abs(t[0])<limit then begin
        eps+=Abs(t[0]);
        for var k:=n1 downto 0 do Result.a[k]+=t[k];
        n1-=1;
        end
      else break
      end;
    SetLength(Result.a,n1+1);
    Result.n:=n1+1;
    Result.eps:=eps  
  end;
  
  /// ����� ������������� �������� � ������������ � ������ ������
  function Println(delim:char:=' '):Polynom;
  begin
    a.Println(delim);
    Result:=Self.Copy
  end;
  
  /// ����� �������� � "��������������" ���� �� ������ ������
  procedure PrintlnBeauty(p:char:='x');
  begin
    var s:string:='';
    for var i:=Self.n-1 downto 0 do begin
      var t:=Self.a[i];
      case i of
      0: if t<0 then s+=t.ToString
         else if t>0 then s+='+'+t.ToString
         else if s.Length=0 then s:='0';
      1: if t<0 then 
            if t<>-1 then s+=t.ToString+p
            else s+='-'+p
         else if t>0 then
            if t<>1 then s+='+'+t.ToString+p
            else s+='+'+p;
      else
          if t<0 then 
            if t<>-1 then s+=t.ToString+p+'^'+i.ToString
            else s+='-'+p+'^'+i.ToString
         else if t>0 then
              if t<>1 then s+='+'+t.ToString+p+'^'+i.ToString
              else s+='+'+p+'^'+i.ToString
        end
      end;
    if s[1]='+' then s:=s[2:];  
    Writeln(s)  
  end;
  
end;
{$endregion}

{$region PolRt}
type
  /// ���������� ���� ������ �������� � ��������������� ��������������   
  /// ������� �������-������� (�� ���� 36-� �������)
  PolRt=class
  
  private
    p:Polynom;
    
  public
    ier:integer;
  
  constructor(p:Polynom);
  begin
    Self.p:=p;
  end;

  /// ����� ������ �������� � ������
  function Value:array of complex;
    //
    // ����������� �������������� ��� ����� PascalABC.NET 3.2
    // ������������ DPOLRT �� ���������� SSP
    // (��� �� - "����� ������� �������� �� ����� �������-4").
    //
    // ������������ �������� �������� � ������� ����������� �������.
    // ier=0 - ������ �� ����������
    // ier=1 - ���� ��������� ��� ���������� ��������
    // ier=2 - ������� �������� ��������� 36
    // ier=3 - �� ������� ���������� ���������� �������� ������� �� 500 �����
    // ier=4 - ����������� ��� ������� ������� �������� �������
    //
  begin
    var m:=p.n-2;
    if m>35 then begin ier:=2; Exit end;
    if p.a[m+1]=0 then begin ier:=4; Exit end;
    if m<=0 then begin ier:=1; Exit end;
    var SSq:complex->real:=x->Sqr(x.Real)+Sqr(x.Imaginary);
    ier:=0;
    Result:=new complex[m+1];
    var sumsq,temp,alpha:real;
    var x:complex;
    var L50, L60, L100, L135: boolean;
    var (ifit,n2,n,nx,nxx):=(0,0,m,m,m+1);
    var kj1:=nxx;
    var cof:=p.a.Reverse.ToArray;
    while n>=0 do begin
      var xo:=cplx(0.00500101,0.01000101);
      var ini:=0;
      (L50,L60,L135):=(false,false,false);
      while true do begin
        if not l60 then begin
          xo:=cplx(-10*xo.Imaginary,-10*xo.Real); x:=xo; ini+=1
          end;
        L100:=false;
        var xpr:=cplx(0.0,0.0);
        for var ict:=1 to 500 do begin
          var u:=cplx(cof[n+1],0.0);
          var xt:=cplx(1.0,0.0);
          var ux:=cplx(0.0,0.0);
          if u.Real=0 then begin
            (x,L50,L135):=(0.0,true,true); nx-=1; nxx-=1;
            break
            end;
          for var i:=1 to n+1 do begin
            temp:=cof[n-i+1];
            var xt2:=x*xt;
            u+=temp*xt2; ux+=Conjugate(i*temp*xt);
            xt:=xt2
            end;
          sumsq:=SSq(ux);
          if sumsq=0.0 then
            if ifit=0 then begin L60:=false; continue end
            else begin x:=xpr; L50:=true; break end;
          var dx:=-u*ux/sumsq; x+=dx;
          if Abs(dx.Imaginary)+Abs(dx.Real)<1e-12 then begin
            L100:=true; break
            end
          end;
        if not L50 then begin  
          L100:=L100 or (ifit<>0);
          if not L100 then
            if ini>=5 then begin ier:=3; Exit end
            else begin L60:=false; continue end;
          for var l:=0 to nxx do Swap(p.a[kj1-l],cof[l]);
          Swap(n,nx);
          if ifit=0 then begin
            (ifit,xpr,L60):=(1,x,true);
            continue
            end
          else break
          end
        end;
      L50:=false;
      if L135 then begin
        x:=cplx(x.Real,0.0); (sumsq,alpha,L135):=(0.0,x.Real,false); n-=1;
        end
      else begin
        ifit:=0;
        if Abs(x.Imaginary)-1e-10*Abs(x.Real)>=0 then begin
          alpha:=2*x.Real; sumsq:=SSq(x); n-=2
          end
        else begin
          x:=cplx(x.Real,0.0); (sumsq,alpha):=(0.0,x.Real); n-=1
          end
        end;
      cof[1]:=cof[1]+alpha*cof[0];
      for var l:=1 to n do cof[l+1]+=alpha*cof[l]-sumsq*cof[l-1];
      Result[n2]:=x; n2+=1;
      if sumsq<>0.0 then begin
        Result[n2]:=Conjugate(x); n2+=1
        end
      end
  end;

end;
{$endregion}

{$region Quanc8}
type
  /// ���������� ������������ ��������� ���������� ��������������
  Quanc8=class
  
  private
  
  fun:real->real;
  a,b,abserr,relerr:real;
  
  public
  
  constructor(f:real->real; a,b,abserr,relerr:real);
  begin
    fun:=f;
    Self.a:=a;
    Self.b:=b;
    Self.abserr:=abserr;
    Self.relerr:=relerr;
  end;

  /// ���������� � ������� �������� ��������� � ���� �������
  /// ��������������� ��������� ������ � ������� 
  function Value:(real,real,real,integer);
    //
    // a, b - ������� ��������� ��������������
    // abserr - �������� ���������� ���������� ������
    // relerr - �������� ���������� ������������� ������
    // * ������������ ������ *
    // [0] - ��������� �������������� (res)
    // [1] - ������ ���������� ������ ���������� (errest)
    // [2] - ��������� ���������� (flag)
    // [3] - ����� �����, � ������� ����������� ������� (nofun)
    //
    // ���� flag ���������, �� ���, ��������� ��� ����� �������,
    // ���� ����� - ��������� ���������� ��� ����� �������.
    // flag=XXX.YYY, ��� ��� - ���������� ������������� 
    // ����� (b-a)/2^30 � ����������� ������� ������� ����������,
    // YYY - ����� ��������������� ��������� ���������.
    //
    // �������� ����������� ����������� ����������� �������-���������,
    // ����������� � ��. ��.�������, �.���������, �.������
    // "�������� ������ �������������� ����������",
    // �., "���", 1980.
    //
  begin
    // ���� 1
    var (res,errest,flag):=(0.0,0.0,0.0);
    var nofun:=0;
    var (levmin,levmax,levout,nomax):=(1,30,6,5000);
    var nofin:=nomax-8*(levmax-levout+128);
    var k:=14175.0;
    var (w0,w1,w2,w3,w4):=(3956.0/k,23552.0/k,-3712.0/k,41984.0/k,-18160.0/k);
    var (area,cor11):=(0.0,0.0);
    if(a=b) then begin Result:=(0.0,0.0,0.0,0); Exit end;
    // ���� 2
    var (lev,nim):=(0,1);
    var x:=new real[17];
    (x[0],x[16]):=(a,b);
    var qprev:=0.0;
    var f:=new real[17];
  	f[0]:=fun(x[0]);
	  var stone:=(b-a)/16;
	  x[8]:=(x[0]+x[16])/2;
    x[4]:=(x[0]+x[8])/2;
    x[12]:=(x[8]+x[16])/2;
    x[2]:=(x[0]+x[4])/2;
    x[6]:=(x[4]+x[8])/2;
    x[10]:=(x[8]+x[12])/2;
    x[14]:=(x[12]+x[16])/2;
    var j:=2;
    while j<=16 do begin f[j]:=fun(x[j]); j+=2 end;
	  nofun:=9;
    // ���� 3
    var qright:=new real[32];
    var fsave:=new real[9,31];
    var xsave:=new real[9,31];
    while True do begin
	    x[1]:=(x[0]+x[2])/2; f[1]:=fun(x[1]);
      j:=3;
      while j<=15 do begin
        x[j]:=(x[j-1]+x[j+1])/2; f[j]:=fun(x[j]); j:=j+2
        end;
		  nofun+=8;
		  var step:=(x[16]-x[0])/16;
      var qleft:=(w0*(f[0]+f[8])+w1*(f[1]+f[7])+w2*(f[2]+f[6])+w3*(f[3]+f[5])+
		      w4*f[4])*step;
		  qright[lev+1]:=(w0*(f[8]+f[16])+w1*(f[9]+f[15])+w2*(f[10]+f[14])+
			  	w3*(f[11]+f[13])+w4*f[12])*step;
		  var qnow:=qleft+qright[lev+1];
		  var qdiff:=qnow-qprev; area+=qdiff;
		  // ���� 4
		  var esterr:=Abs(qdiff)/1023;
		  var tolerr:=Max(abserr,relerr*Abs(area))*(step/stone);
		  var L70:=false;
		  if lev>=levmin then begin;
		    if lev>=levmax then begin
		      flag+=1; L70:=true
		      end
		    else if nofun>nofin then begin
		      nofin*=2; levmax:=levout; flag+=(b-x[0])/(b-a); L70:=true
		      end
		    else if esterr<=tolerr then L70:=true;
		    end;
  		// ���� 5
      if not L70 then begin
        nim*=2; lev+=1;
        for var i:=1 to 8 do begin
          fsave[i,lev]:=f[i+8];
          xsave[i,lev]:=x[i+8]
          end;
        qprev:=qleft;
    		for var i:=8 downto 1 do begin
	    	  f[2*i]:=f[i];
		      x[2*i]:=x[i]
		      end;
  		  continue
	  	  end;
      // ���� 7
  		res+=qnow; errest+=esterr; cor11+=qdiff/1023;
	  	while nim.IsOdd do begin
		    nim:=nim div 2;
		    lev-=1
  		end;
      nim+=1;
      if lev<=0 then break;
      qprev:=qright[lev]; x[0]:=x[16]; f[0]:=f[16];
	  	for var i:=1 to 8 do begin
		    f[2*i]:=fsave[i,lev];
		    x[2*i]:=xsave[i,lev]
  		  end;
	  	end;
    // ���� 8
    res+=cor11;
    if errest=0 then begin
      Result:=(res,errest,flag,nofun); Exit
      end;
    repeat
      var temp:=Abs(res)+errest;
      if temp<>Abs(res) then begin
        Result:=(res,errest,flag,nofun); Exit
        end;
      errest*=2;
    until false;
  end;
  
end;
{$endregion}

{$region RKF45}
type
  /// ����� �����-�����-��������� 4-5 �������
  RKF45=class
  
  // �� ������ ���� ����� ��������� RKF45 �� ����� Fortran-90,
  // ����������� �� ����� https://www.sc.fsu.edu
  // ( Dept. of Scientific Computing, Florida State University ), 
  // ���������������� �� �������� GNU LGPL

  private
  
  neqn:integer; // ���������� ��������� �������
  abserr_save:real;
  relerr_save:real;
  h:real;
  epsilon:=1.2e-15;
  flag_save:integer;
  init:integer;
  kflag:integer;
  kop:integer;
  nfe:integer;
  f1:array of real;
  f2:array of real;
  f3:array of real;
  f4:array of real;
  f5:array of real;
  p:procedure(x:real; y,yp:array of real);
    
  function Sign(a,b:real):=b<0?-a:a;
  
  procedure Fehl(s:array of real; t,h:real);
  //
  // ����� �����-�����-��������� 4-5 �������.
  // ������������� ������� ������������ ���������������� ��������� 1-�� �������
  // ���� dy(i)/dt = f(t, y(1), y(2) ... ,
  // ��� �������� ������� y(i) � �������� � ����������� yp(i) ������
  // � ��������� ����� t.
  // ����� ���������� ������� �� ������������� ��� h � �������� � ������ s
  // ����������� � ������� � ����� t+h, ������� ����� ������� ��������.
  // � �������� ����������� ����������� � ����� ��������� ������
  // ������ ������.
  // ����� ����� ���� ��������� �������� ����������� ����������, ��� ������
  // Fehl �� ������� �������� ��� h ��������, ������� ������ ���������� t,
  // ���������� �� 13.
  //
  begin
    var ch:=h/4.0;
    for var i:=0 to neqn-1 do f5[i]:=y[i]+ch*yp[i];
    p(t+ch,f5,f1); ch:=3.0*h/32.0;
    for var i:=0 to neqn-1 do f5[i]:=y[i]+ch*(yp[i]+3.0*f1[i]);
    p(t+3.0*h/8.0,f5,f2); ch:=h/2197.0;
    for var i:=0 to neqn-1 do 
      f5[i]:=y[i]+ch*(1932.0*yp[i]+7296.0*f2[i]-7200.0*f1[i]);
    p(t+12.0*h/13.0,f5,f3); ch:=h/4104.0;
    for var i:=0 to neqn-1 do
      f5[i]:=y[i]+ch*(8341.0*yp[i]-845.0*f3[i]+29440.0*f2[i]-32832.0*f1[i]);
    p(t+h,f5,f4); ch:=h/20520.0;
    for var i:=0 to neqn-1 do
      f1[i]:=y[i]+ch*(-6080.0*yp[i]+9295.0*f3[i]-5643.0*f4[i]+41040.0*f1[i]-
          28352.0*f2[i]);
    p(t+h/2.0,f1,f5); ch:=h/7618050.0;
    for var i:=0 to neqn-1 do
      s[i]:=y[i]+ch*(902880.0*yp[i]+3855735.0*f3[i]-1371249.0*f4[i]+
          3953664.0*f2[i]+277020.0*f5[i])
  end;
  
  procedure FlagDev;
  // ���������� ��������� ����� ����������� ���� flag
  // ������� ��������� ��� MsgOn=true
  begin
    if MsgOn then
      case flag of
      -5:Writeln('RKF45: ����������� ������',NewLine,'kFlag=5 � AbsErr=0');
      -4:Writeln('RKF45: ����������� ������',NewLine,
           'kFlag=6 � RelErr<=RelErr_save � AbsErr<=AbsErr_save');
      -3:Writeln('RKF45: ����������� ������',NewLine,
           '���������� ���������� ��������������',NewLine,
           '������������ �� ������������ �� flag=5..8');
      1: Writeln('������������ �����');
      3: Writeln('�����������: relerr,abserr = ',relerr,',',abserr);
      4: Writeln('��������� ������� ����� �����');
      5: begin
           abserr:=0.2e-5;
           Writeln('�����������: relerr,abserr = ',relerr,',',abserr);
           flag:=0
           end;
      6: begin
           relerr*=10.0;
           Writeln('�����������: relerr,abserr = ',relerr,',',abserr);
           flag:=0
           end;
      7: begin
           Writeln('������ �������� ��������� ��������');
           flag:=0
           end;
      8: Writeln('������������ �����')
        end;
  end;
  
  public
  
  flag:integer;
  relerr:real;
  abserr:real;
  y:array of real; // �������
  yp:array of real; // ������ �����������
  MsgOn:boolean;
  
  constructor (f:procedure(x:real; y,yp:array of real);
      y:array of real; abserr,relerr:real; MsgOn:boolean:=true);
  begin
    neqn:=y.Length;
    Self.y:=Copy(y);
    yp:=new real[neqn];
    f1:=new real[neqn];
    f2:=new real[neqn];
    f3:=new real[neqn];
    f4:=new real[neqn];
    f5:=new real[neqn];
    Self.epsilon:=epsilon;
    flag:=1;
    Self.abserr:=abserr;
    Self.relerr:=relerr;
    Self.MsgOn:=MsgOn;
    (abserr_save,relerr_save,h):=(-1.0,-1.0,-1.0);
    (flag_save,init,kflag,kop,nfe):=(-1000,-1000,-1000,-1,-1);
    p:=f;
  end;
  
  procedure Solve(var t:real; tout:real);
  //   ��������� ����� Runge-Kutta-Fehlberg
  //   ������ ������ ����� ��������� �������������� �� �������
  // ��  t �� t_out, �� ���� ��������� ����������� ����������, 
  // ����� � ��� ������� ������� ��������� ����� � ����������� t_out.
  //   ����� ������� ���� �������� t � t_out ��������������� ���,
  // ����� ��� ���������� ���� ���������� ������ ��� ���
  // ���������� � ������ Solve.
  //
  //   ����� ������ ���������� ������������ ������
  // - ���������� ������� ��������� � ����������� ���� F(t,y,yp),
  //   ����������� ��� �������� ��������� t �������� ������� y � � ������
  //   ����������� yp �� ������ ����� ���������;
  // - ������ ��������� �������� ����������� y, t, tout, relerr, abserr � flag.
  //   ������ t ������ ��������� ����� ��� �������,
  //   y ���������� ��������� �������, � flag �������� ������ +1.
  //
  //   C��������� �������� flag ����� ������ ������� ���������������� � 1,
  // � ���������� ���������� ����� �� ���� ���������. Flag=-1 ��������,
  // ���� ����� ����������� �����.
  //   ����� ���������� ����� Solve ���������� �������� Flag=2 � ������� ������
  // ��� -2 � �����������, ��� ��������� ��������� ���������� ������.
  //   (�������� +1 � -1 ��������� �� ������������� ��������� ����������
  // �������������, � 2 � -2 �������� � �����)
  //
  //   ���� ������������ ��������� ����� ��������� tout, ������������
  // ������ ���������� ����� �������� ��� ���������� ���� � ���������� ������.
  // � ����������� ������ ������������, ������� Flag=-2, ������ ��������,
  // ��� ������� - ��� ���� ��������� �������� � ����������� tout � �������
  // ��������� ����� ������ Solve.
  //   �������� Flag=2 ���������� �� ������ ���������, ��� tout ����������.
  // ���� ����� ���������� ������ � ����������� ������, ������� ������ Flag=-2.
  //
  //   � ��������� ������� ����� ��������� ������. ������ �� ������� �
  // ������� ��������������� ������� �������� �������� Flag.
  //
  //   3: �������������� �� ���������, ��������� �������� �������� �������
  // ������������� ������ relerr ������� ����. ��� ����������� ����������
  // ��������� �������� relerr. ���� ��������� ���������� ����������
  // Flag=2 � ����������� ������.
  //
  //   4: �������������� �� ���������, ��������� ������������� ����� 3000
  // ���������� �������� �����������, ��� ������������� �������� 500 �����.
  // ������������ ����� ��������� ���������, ��� ���� �������
  // ���������� ���������� ������� ����� ������� � ���� �, ��������, ���
  // ���� ���������.
  //   5: �������������� �� ���������, ��������� ������� ���������� � ����,
  // ���������� ���� ���� ����� ������ ������������� ������ �� ��������.
  // ������������ ������ ������ ��������� �������� abserr � ���������� ������.
  // ��������, ������������� ������������ ����������� ����� ������� �������.
  //   6: �������������� �� ���������, ��������� ��������� �������� �� �����
  // ���� ���������� ���� ��� ���������� ���������� ����. ������������ ������
  // ��������� ������� ���������� ����������� abserr �/��� reller ������ ���
  // �������� ���������� �������. �����, ����������� ���������� flag=2 (��� -2
  // ��� ������ ������������ �����������). flag=6 ��������� � ������
  // ����������� ���������� �����, � ������� ��� ������� �������� ����� �����,
  // ��� ������������ �������������.
  //   7: �� ���� ��������� RKF45 ������������ ��� ��� ������ �������. �������
  // ������� �������� ��������� ��� ���������� ����� ������������ ������ ����.
  // ����� ���������� ������������ ����� ������������ �����������.
  // ���� ������������ ���������� ���������� �������, ����� flag=2, ������
  // ����� ���������.
  //   8: �������� ������� ���������. ���������, ����:
  //     - ������� ��� ������������ ���������� ���������;
  //     - t=tout � ��� ���� flag �� ����� 1;
  //     - relerr ��� abserr ������������;
  //     - flag ����� �������� 0 ��� �� ����� � ��������� [-4;8]
  begin
    var maxnfe:=3000;
    var remin:=1.0E-12;
    // remin - ��� ����������� ���\�������� �������� relerr.
    // ������� �������� � ������� RKF45 ����� ������� �������� ������
    // ���������� � ��������� ����� ������.
    var ae,dt,ee,eeoet,eps,esttol,et,hmin,relerr_min,s,scale,tol,toln,ypk:real;
    var hfaild,output:boolean;
    eps:=Self.epsilon; // �������� ��������
    // �������� ������� ��������
    if (neqn<1) then begin
      flag:=8; FlagDev; Exit
      end;
    if (relerr<0.0) or (abserr<0.0) then begin
      flag:=8; FlagDev; Exit
      end;
    if (flag=0) or (flag<-2) or (flag>8) then begin
      flag:=8; FlagDev; Exit
        end;
    var mflag:=Abs(flag);
    if mflag<>1 then begin // ����� ����� ���� ��� ������ ���������
      if (t=tout) and (kflag<>3) then begin
        flag:=8; FlagDev; Exit
        end;
      if mflag=2 then begin
        if kflag=3 then begin
          flag:=flag_save; mflag:=Abs(flag)
          end
        else if init=0 then flag:=flag_save
        else if kflag=4 then nfe:=0
        else if (kflag=5) and (abserr=0.0) then begin
          flag:=-5; FlagDev; Exit
          end
        else if (kflag=6) and (relerr<=relerr_save) and
            (abserr<=abserr_save) then begin
              flag:=-4; FlagDev; Exit
              end
        end
      else
        if flag=3 then begin
          flag:=flag_save;
          if kflag=3 then mflag:=Abs(flag);
          end
        else if flag=4 then begin
          nfe:=0; flag:=flag_save;
          if kflag=3 then mflag:=Abs(flag)
          end
        else if (flag=5) and (abserr>0.0) then begin
          flag:=flag_save;
          if kflag=3 then mflag:=Abs(flag)
          end
        else begin
          flag:=-3; FlagDev; Exit
          end
        end;
    flag_save:=flag; kflag:=0;
    relerr_save:=relerr; abserr_save:=abserr; // ��� ������� ��������
    relerr_min:=2.0*epsilon+remin; // ������������ �� ��������
    if relerr<relerr_min then begin
      relerr:=relerr_min; flag:=3; kflag:=3;
      FlagDev; Exit
      end;
    dt:=tout-t;
    if mflag=1 then begin
      init:=0; kop:=0;
      p(t,y,yp);
      nfe:=1;
      if t=tout then begin
        flag:=2; FlagDev; Exit
        end
      end;
    if init=0 then begin
      init:=1; h:=Abs(dt); toln:=0.0;
      for var k:=0 to neqn-1 do begin
        tol:=relerr*Abs(y[k])+abserr;
        if tol>0.0 then begin
          toln:=tol; ypk:=Abs(yp[k]);
          if tol<ypk*Power(h,5) then h:=Power(tol/ypk,0.2)
          end
        end;
      if toln<=0.0 then h:=0.0;
      h:=Max(h,26.0*eps*Max(Abs(t),Abs(dt)));
      flag_save:=flag<0?-2:2
      end;
    if dt<0 then h:=-h;
    if 2.0*Abs(dt)<=Abs(h) then kop+=1;
    if kop=10000 then begin kop:=0; flag:=7; FlagDev; Exit end;
    if Abs(dt)<=26.0*eps*Abs(t) then begin
      t:=tout;
      for var i:=0 to neqn-1 do y[i]+=dt*yp[i];
      p(t,y,yp);
      nfe+=1; flag:=2;
      FlagDev; Exit
    end;
    // �������������� ��� �� �����
    output:=false; scale:=2.0/relerr; ae:=scale*abserr;
    repeat
      hfaild:=false; hmin:=26.0*eps*Abs(t); dt:=tout-t;
      if 2.0*Abs(h)>Abs(dt) then begin
        if Abs(dt)<=Abs(h) then begin output:=true; h:=dt end
        else h:=0.5*dt
        end;
      // ���������� ����������� ����������
      while true do begin
        if maxnfe<nfe then begin (flag,kflag):=(4,4); FlagDev; Exit end;
        Fehl(f1,t,h);
        nfe+=5; eeoet:=0.0;
        for var k:=0 to neqn-1 do begin
          et:=Abs(y[k])+Abs(f1[k])+ae;
          if et<=0.0 then begin flag:=5; FlagDev; Exit end;
          ee:=Abs((-2090.0*yp[k]+(21970.0*f3[k]-15048.0*f4[k]))+
              (22528.0*f2[k]-27360.0*f5[k]));
          eeoet:=Max(eeoet,ee/et)
          end;
        esttol:=Abs(h)*eeoet*scale/752400.0;
        if esttol<=1.0 then Break;
        hfaild:=true; output:=false;
        if esttol<59049.0 then s:=0.9/Power(esttol,0.2)
        else s:=0.1;
        h*=s;
        if Abs(h)<hmin then begin (flag,kflag):=(6,6); FlagDev; Exit end;
        end;
      t+=h; y:=Copy(f1);
      p(t,y,yp);
      nfe+=1;
      if esttol>0.0001889568 then s:=0.9/Power(esttol,0.2)
      else s:=5.0;
      if hfaild then s:=Min(s,1.0);
      h:=Sign(Max(s*Abs(h),hmin),h);
      // ��������� ���� ����������� ������������ �����������
      if output then begin t:=tout; flag:=2; FlagDev; Exit end;
    until flag<=0;    
    flag:=-2;
    FlagDev
  end;
  
end;
{$endregion}

{$region RootsIsolation}
type
  /// �������� ������ ��������� y(x)=0 �� �������� ���������
  RootsIsolation=class
    
  private
    f:real->real;
    a,b,h:real;
  
  public
  
  constructor(f:real->real; a,b,h:real);
  begin
    Self.f:=f;
    Self.a:=a;
    Self.b:=b;
    Self.h:=h
  end;

  /// ���������� ����������
  function Value:array of (real,real);
    //
    // f - �������, ��� ������� ������ ��������� ��������;
    // a,b - ������� ��������� ��������� [a;b]
    // h - ��� ���������
    // ������� ���������� ������ �������� (x1,x2), ����� ��� f(x1) � f(x2) �����
    // ������ �����.
    //
  begin
    var r:=new List<(real,real)>;
    var h2:=h/2;
    var eps:=1e-7;
    var (xa,ya,bk):=(a,f(a),b+h2);
    if Abs(ya)<eps then begin
      r.Add((xa-h2,xa+h2));
      xa+=h2; ya:=f(xa)
      end;
    var xb:=xa+h;
    while xb<=bk do begin
      var yb:=f(xb);
      if Abs(yb)<eps then begin
        r.Add((xb-h2,xb+h2));
        xa:=xb+h2; ya:=f(xa);
        xb:=xa+h
        end
      else if ya*yb<0 then begin
        r.Add((xa,xb));
        (xa,ya):=(xb,yb);
        xb:=xa+h
        end
      else begin
        (xa,ya):=(xb,yb);
        xb:=xa+h
        end
      end;
    Result:=r.ToArray
  end;
  
end;
{$endregion}

{$region Spline}
type
  /// ������������ ��������� ������� ���������� ��������
  Spline=class
  
  private
  
  n:integer; // ���������� ����� ������������
  aK:array[,] of real; // ������������ �������
  P:array of Point; // ���� ������������
  
  ///- ���������� ������� (���������� �������������)
  procedure Spline;
  //
  // ������� Spline ���������� ������������ ������� � �������.
  // �������� ����������� ����������� �������-���������,
  // ����������� � ��. ��.�������, �.���������, �.������
  // "�������� ������ �������������� ����������",
  // �., "���", 1980.
  //
  begin
    if n<2 then Exit;
	  if n=2 then begin
      aK[0,0]:=(P[1].y-P[0].y)/(P[1].x-P[0].x); aK[0,1]:=aK[0,0];
      (aK[1,0],aK[1,1],aK[2,0],aK[2,1]):=(0,0,0,0);
      Exit
      end;
	  aK[2,0]:=P[1].x-P[0].x; aK[1,1]:=(P[1].y-P[0].y)/aK[2,0];
	  for var i:=1 to n-2 do begin
	    aK[2,i]:=P[i+1].x-P[i].x;
		  aK[0,i]:=2*(aK[2,i-1]+aK[2,i]);
		  aK[1,i+1]:=(P[i+1].y-P[i].y)/aK[2,i];
		  aK[1,i]:=aK[1,i+1]-aK[1,i]
      end;
	  aK[0,0]:=-aK[2,0]; aK[0,n-1]:=-aK[2,n-2];
	  aK[1,0]:=0; aK[1,n-1]:=0;
	  if n<>3 then begin
  	  aK[1,0]:=aK[1,2]/(P[3].x-P[1].x)-aK[1,1]/(P[2].x-P[0].x);
	    aK[1,n-1]:=aK[1,n-2]/(P[n-1].x-P[n-3].x)-aK[1,n-3]/(P[n-2].x-P[n-4].x);
	    aK[1,0]:=aK[1,0]*Sqr(aK[2,0])/(P[3].x-P[0].x);
	    aK[1,n-1]:=-aK[1,n-1]*Sqr(aK[2,n-2])/(P[n-1].x-P[n-4].x)
      end;
    for var i:=1 to n-1 do begin
      var t:=aK[2,i-1]/aK[0,i-1];
      aK[0,i]:=aK[0,i]-t*aK[2,i-1];
      aK[1,i]:=aK[1,i]-t*aK[1,i-1]
      end;
	  aK[1,n-1]:=aK[1,n-1]/aK[0,n-1];
    for var i:=n-2 downto 0 do
      aK[1,i]:=(aK[1,i]-aK[2,i]*aK[1,i+1])/aK[0,i];
  	aK[0,n-1]:=(P[n-1].y-P[n-2].y)/aK[2,n-2]+
	      aK[2,n-2]*(aK[1,n-2]+2*aK[1,n-1]);
	  for var i:=0 to n-2 do begin
	    aK[0,i]:=(P[i+1].y-P[i].y)/aK[2,i]-
	        aK[2,i]*(aK[1,i+1]+2*aK[1,i]);
		  aK[2,i]:=(aK[1,i+1]-aK[1,i])/aK[2,i];
		  aK[1,i]:=3*aK[1,i]
      end;
	  aK[1,n-1]:=3*aK[1,n-1]; aK[2,n-1]:=aK[2,n-2]
  end;
  
  public
  
  constructor (pts:array of Point);
  begin
    n:=pts.Length;
    P:=pts;
    SetLength(aK,3,n);
    Spline;
  end;
  
  /// ���������� �������� ������������ 
  /// ������������� ������� � �������� �����
  function Value(u:real):real;
  //
  // ������������� � �������� ������� Seval)
  begin
    var i,j:integer;
    if u<P[0].x then i:=0
    else if u>P[n-1].x then i:=n-2
    else begin
      j:=n-1;
      repeat
        var k:=(i+j) div 2;
        if u<P[k].x then j:=k else i:=k
      until j-i<=1
      end;  
    var dx:=u-P[i].x;
	  Result:=P[i].y+dx*(aK[0,i]+dx*(aK[1,i]+dx*aK[2,i]))
  end;
  
  /// ��������� �������� ������ � ������ ����������� � �������� �����
  function Diff(u:real):(real,real);
  //
  // (���������������� ����� Value)
  begin
    var i,j:integer;
    if u<P[0].x then i:=0
    else if u>P[n-1].x then i:=n-2
    else begin
      j:=n-1;
      repeat
        var k:=(i+j) div 2;
        if u<P[k].x then j:=k else i:=k
      until j-i<=1
      end;  
    var dx:=u-P[i].x;
	  Result:=(aK[0,i]+dx*(2*aK[1,i]+3*dx*aK[2,i]),2*ak[1,i]+6*dx*aK[2,i])
  end;
  
end;
{$endregion}

{$region Svenn}
type
  /// ����� ���������� ��������� ���������������� ��� ����������� 
  /// �������� ������������ ������� ������� ������.
  Svenn=class
  
  private
  f:real->real;
  xn,t:real;
  
  public
  
  constructor(f:real->real; xn,t:real);
  begin
    Self.f:=f;
    Self.xn:=xn;
    Self.t:=t
  end;
  
  /// C���������, ���� ������� � ���������
  function Value:(real,real,integer);
    //
    // xn - ��������� �����������
    // t - ���
    // ���������: ������ �� ���� ���������, ��� ������ ��� ������������
    // ��������� ��������, ���� ������ ������� ������� � �� ������������
    // ������ ���� ��������� �����/��� ������� ��������, ���� ���� �������
    // �� ����������� � ����������� �������� �����.
    // ����������: ���� �������� ������� �� ������, ����� �������� ��������
    // �������� ����� ��������� f(x)=0
    //
  begin
    var k:=0;
    var (x1,x2,x3):=(xn-t,xn,xn+t);
    var (y1,y2,y3):=(f(x1),f(x2),f(x3));
    var d,a,b:real;
    if (y1>=y2) and (y2<=y3) then begin
      Result:=(x1,x3,0);
      Exit
      end
    else if (y1<=y2) and (y2>=y3) then begin
      Result:=(x1,x3,1);
      Exit
      end
    else if (y1>=y2) and (y2>=y3) then (d,a,x2,k):=(t,x2,x2+t,1)
    else (d,b,x2,k):=(-t,x2,x2-t,1);
    repeat
      x1:=x2+Power(2,k)*d;
      (y1,y2):=(f(x1),f(x2));
      if (y1<y2) then begin
        if d=t then a:=x2 else b:=x2;
        k+=1; x2:=x1
        end
    until y1>=y2;
    if d=t then Result:=(a,x1,0)
    else Result:=(x1,b,0)
  end;
  
end;
{$endregion}

{$region Zeroin}
type
  /// ���������� ��������������� ���� ������� �� ��������� ��������
  Zeroin=class
  
  private
  tol:real;
  f:real->real;
  
  public
  
  constructor(f:real->real; tol:real);
  begin
    Self.tol:=tol;
    Self.f:=f;
  end;  
    
  /// ����������, ���� ������� � ���������
  function Value(ax,bx:real):real;
  //
  // *** ���������� ��������������� ���� ������� �� ��������� �������� ***
  // ��������� ��� ��������, ��� �� ��������� [ax;bx] ���� ����,
  // ������ ������������.
  // �������� ����������� ����������� ����������� �������-���������,
  // ����������� � ��. ��.�������, �.���������, �.������
  // "�������� ������ �������������� ����������",
  // �., "���", 1980.
  //
  begin
    var Sign:real->real:=x->(x=0?0.0:x<0?-1.0:1.0);
    var eps:=1.0;
    var tol1:real;
    repeat
      eps:=eps/2; tol1:=1.0+eps
    until tol1<=1.0;
    var (fa,fb,a,b):=(f(ax),f(bx),ax,bx);
    repeat
      var (c,d,fc):=(a,b-a,fa);
      var e:=d;
      repeat
	      if Abs(fc)<Abs(fb) then
          begin (a,b):=(b,c); c:=a; (fa,fb):=(fb,fc); fc:=fa end;
	      tol1:=2*eps*Abs(b)+0.5*tol;
	      var xm:=0.5*(c-b);
	      if (Abs(xm)<tol1) or (fb=0) then begin Result:=b; Exit end;
	      if (Abs(e)<tol1) or (Abs(fa)<=Abs(fb)) then (d,e):=(xm,d)
	      else begin
	        var p,q,s:real;
	        if a=c then begin s:=fb/fa; p:=2*xm*s; q:=1-s end
  	      else begin
            var r:=fb/fc; q:=fa/fc; s:=fb/fa; p:=s*(2*xm*q*(q-r)-(b-a)*(r-1));
		        q:=(q-1)*(r-1)*(s-1)
            end;
  	      if p>0 then q:=-q;
	        p:=Abs(p);
	        if (2*p >= 3*xm*q-Abs(tol1*q)) or (p>=Abs(0.5*e*q)) then (d,e):=(xm,d)
	        else (e,d):=(d,p/q)
	        end;
  	    (a,fa):=(b,fb);
	      if abs(d)>tol1 then  b:=b+d
	      else b+=Abs(tol1)*Sign(xm);
	      fb:=f(b);
	    until fb*Sign(fc)>0;
	  until false
  end;

end;
{$endregion}

//----------------------------------------

end.