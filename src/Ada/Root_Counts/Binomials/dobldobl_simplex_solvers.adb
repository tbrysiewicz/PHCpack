with Double_Double_Numbers_io;         use Double_Double_Numbers_io;
with DoblDobl_Complex_Numbers;         use DoblDobl_Complex_Numbers;
with DoblDobl_Complex_Vectors_io;      use DoblDobl_Complex_Vectors_io;
with Standard_Integer64_Matrices_io;   use Standard_Integer64_Matrices_io;
with Multprec_Integer_Matrices_io;     use Multprec_Integer_Matrices_io;
with DoblDobl_Complex_Vector_Norms;    use DoblDobl_Complex_Vector_Norms;
with DoblDobl_Complex_Matrices_io;     use DoblDobl_Complex_Matrices_io;
with DoblDobl_Complex_Linear_Solvers;  use DoblDobl_Complex_Linear_Solvers;
with DoblDobl_Binomial_Solvers;        use DoblDobl_Binomial_Solvers;
with DoblDobl_Simplex_Systems;         use DoblDobl_Simplex_Systems;

package body DoblDobl_Simplex_Solvers is

-- AUXILIARY CHECK ON ZERO COMPONENT :

  function Zero_Component ( y : in DoblDobl_Complex_Vectors.Vector;
                            tol : in double_double ) return boolean is
  begin
    for i in y'range loop
      if AbsVal(y(i)) < tol
       then return true;
      end if;
    end loop;
    return false;
  end Zero_Component;

-- TARGET ROUTINES :

  procedure Solve ( A : in Standard_Integer64_Matrices.Matrix;
                    C : in DoblDobl_Complex_Matrices.Matrix;
                    b : in DoblDobl_Complex_Vectors.Vector;
                    tol : in double_double; zero_y : out boolean;
                    r : out integer32; info : out integer32;
                    sols : out Solution_List ) is

    LUf : DoblDobl_Complex_Matrices.Matrix(C'range(1),C'range(2));
    pivots : Standard_Integer_Vectors.Vector(C'range(2));
    U : Standard_Integer64_Matrices.Matrix(A'range(1),A'range(2));
    M : Standard_Integer64_Matrices.Matrix(A'range(1),A'range(1));
    Usols : Solution_List;

  begin
    Solve(A,C,b,tol,zero_y,r,LUf,pivots,info,M,U,Usols,sols);
  exception
    when others => put_line("Exception raised in Solve...");
                   put_line("For the matrix A : "); put(A);
                   raise;
  end Solve;

  procedure Solve ( A : in Multprec_Integer_Matrices.Matrix;
                    C : in DoblDobl_Complex_Matrices.Matrix;
                    b : in DoblDobl_Complex_Vectors.Vector;
                    tol : in double_double; zero_y : out boolean;
                    r : out integer32; info : out integer32;
                    sols : out Solution_List ) is

    LUf : DoblDobl_Complex_Matrices.Matrix(C'range(1),C'range(2));
    pivots : Standard_Integer_Vectors.Vector(C'range(2));
    U : Multprec_Integer_Matrices.Matrix(A'range(1),A'range(2));
    M : Multprec_Integer_Matrices.Matrix(A'range(1),A'range(1));
    Usols : Solution_List;

  begin
    Solve(A,C,b,tol,zero_y,r,LUf,pivots,info,M,U,Usols,sols);
  exception
    when others => put_line("Exception raised in Solve...");
                   put_line("For the matrix A : "); put(A);
                   raise;
  end Solve;

  procedure Solve ( file : in file_type;
                    A : in Standard_Integer64_Matrices.Matrix;
                    C : in DoblDobl_Complex_Matrices.Matrix;
                    b : in DoblDobl_Complex_Vectors.Vector;
                    tol : in double_double; zero_y : out boolean;
                    r : out integer32; info : out integer32;
                    sols : out Solution_List ) is

    LUf : DoblDobl_Complex_Matrices.Matrix(C'range(1),C'range(2));
    pivots : Standard_Integer_Vectors.Vector(C'range(2));
    U : Standard_Integer64_Matrices.Matrix(A'range(1),A'range(2));
    M : Standard_Integer64_Matrices.Matrix(A'range(1),A'range(1));
    Usols : Solution_List;

  begin
    Solve(file,A,C,b,tol,zero_y,r,LUf,pivots,info,M,U,Usols,sols);
  end Solve;

  procedure Solve ( file : in file_type;
                    A : in Multprec_Integer_Matrices.Matrix;
                    C : in DoblDobl_Complex_Matrices.Matrix;
                    b : in DoblDobl_Complex_Vectors.Vector;
                    tol : in double_double; zero_y : out boolean;
                    r : out integer32; info : out integer32;
                    sols : out Solution_List ) is

    LUf : DoblDobl_Complex_Matrices.Matrix(C'range(1),C'range(2));
    pivots : Standard_Integer_Vectors.Vector(C'range(2));
    U : Multprec_Integer_Matrices.Matrix(A'range(1),A'range(2));
    M : Multprec_Integer_Matrices.Matrix(A'range(1),A'range(1));
    Usols : Solution_List;

  begin
    Solve(file,A,C,b,tol,zero_y,r,LUf,pivots,info,M,U,Usols,sols);
  end Solve;

  procedure Solve ( A : in Standard_Integer64_Matrices.Matrix;
                    C : in DoblDobl_Complex_Matrices.Matrix;
                    b : in DoblDobl_Complex_Vectors.Vector;
                    tol : in double_double; zero_y : out boolean;
                    r : out integer32; rcond : out double_double;
                    sols : out Solution_List ) is

    LUf : DoblDobl_Complex_Matrices.Matrix(C'range(1),C'range(2));
    pivots : Standard_Integer_Vectors.Vector(C'range(2));
    U : Standard_Integer64_Matrices.Matrix(A'range(1),A'range(2));
    M : Standard_Integer64_Matrices.Matrix(A'range(1),A'range(1));
    Usols : Solution_List;

  begin
    Solve(A,C,b,tol,zero_y,r,LUf,pivots,rcond,M,U,Usols,sols);
  end Solve;

  procedure Solve ( A : in Multprec_Integer_Matrices.Matrix;
                    C : in DoblDobl_Complex_Matrices.Matrix;
                    b : in DoblDobl_Complex_Vectors.Vector;
                    tol : in double_double; zero_y : out boolean;
                    r : out integer32; rcond : out double_double;
                    sols : out Solution_List ) is

    LUf : DoblDobl_Complex_Matrices.Matrix(C'range(1),C'range(2));
    pivots : Standard_Integer_Vectors.Vector(C'range(2));
    U : Multprec_Integer_Matrices.Matrix(A'range(1),A'range(2));
    M : Multprec_Integer_Matrices.Matrix(A'range(1),A'range(1));
    Usols : Solution_List;

  begin
    Solve(A,C,b,tol,zero_y,r,LUf,pivots,rcond,M,U,Usols,sols);
  end Solve;

  procedure Solve ( file : in file_type;
                    A : in Standard_Integer64_Matrices.Matrix;
                    C : in DoblDobl_Complex_Matrices.Matrix;
                    b : in DoblDobl_Complex_Vectors.Vector;
                    tol : in double_double; zero_y : out boolean;
                    r : out integer32; rcond : out double_double;
                    sols : out Solution_List ) is

    LUf : DoblDobl_Complex_Matrices.Matrix(C'range(1),C'range(2));
    pivots : Standard_Integer_Vectors.Vector(C'range(2));
    U : Standard_Integer64_Matrices.Matrix(A'range(1),A'range(2));
    M : Standard_Integer64_Matrices.Matrix(A'range(1),A'range(1));
    Usols : Solution_List;

  begin
    Solve(file,A,C,b,tol,zero_y,r,LUf,pivots,rcond,M,U,Usols,sols);
  end Solve;

  procedure Solve ( file : in file_type;
                    A : in Multprec_Integer_Matrices.Matrix;
                    C : in DoblDobl_Complex_Matrices.Matrix;
                    b : in DoblDobl_Complex_Vectors.Vector;
                    tol : in double_double; zero_y : out boolean;
                    r : out integer32; rcond : out double_double;
                    sols : out Solution_List ) is

    LUf : DoblDobl_Complex_Matrices.Matrix(C'range(1),C'range(2));
    pivots : Standard_Integer_Vectors.Vector(C'range(2));
    U : Multprec_Integer_Matrices.Matrix(A'range(1),A'range(2));
    M : Multprec_Integer_Matrices.Matrix(A'range(1),A'range(1));
    Usols : Solution_List;

  begin
    Solve(file,A,C,b,tol,zero_y,r,LUf,pivots,rcond,M,U,Usols,sols);
  end Solve;

  procedure Solve ( A : in Standard_Integer64_Matrices.Matrix;
                    C : in DoblDobl_Complex_Matrices.Matrix;
                    b : in DoblDobl_Complex_Vectors.Vector;
                    tol : in double_double; zero_y : out boolean;
                    r : out integer32; 
                    LUf : out DoblDobl_Complex_Matrices.Matrix;
                    pivots : out Standard_Integer_Vectors.Vector;
                    info : out integer32;
                    M,U : out Standard_Integer64_Matrices.Matrix;
                    Usols,Asols : out Solution_List ) is

    n : constant integer32 := C'last(1);
    y : DoblDobl_Complex_Vectors.Vector(b'range);

  begin
    LUf := C;
    lufac(LUf,n,pivots,info);
    if info = 0 then
      y := b;
      lusolve(LUf,n,pivots,y);
      zero_y := Zero_Component(y,tol);
      if not zero_y
       then Solve(A,y,r,M,U,Usols,Asols);
      end if;
    end if;
  end Solve;

  procedure Solve ( A : in Multprec_Integer_Matrices.Matrix;
                    C : in DoblDobl_Complex_Matrices.Matrix;
                    b : in DoblDobl_Complex_Vectors.Vector;
                    tol : in double_double; zero_y : out boolean;
                    r : out integer32; 
                    LUf : out DoblDobl_Complex_Matrices.Matrix;
                    pivots : out Standard_Integer_Vectors.Vector;
                    info : out integer32;
                    M,U : out Multprec_Integer_Matrices.Matrix;
                    Usols,Asols : out Solution_List ) is

    n : constant integer32 := C'last(1);
    y : DoblDobl_Complex_Vectors.Vector(b'range);

  begin
    LUf := C;
    lufac(LUf,n,pivots,info);
    if info = 0 then
      y := b;
      lusolve(LUf,n,pivots,y);
      zero_y := Zero_Component(y,tol);
      if not zero_y
       then Solve(A,y,r,M,U,Usols,Asols);
      end if;
    end if;
  end Solve;

  procedure Solve ( file : in file_type;
                    A : in Standard_Integer64_Matrices.Matrix;
                    C : in DoblDobl_Complex_Matrices.Matrix;
                    b : in DoblDobl_Complex_Vectors.Vector;
                    tol : in double_double; zero_y : out boolean;
                    r : out integer32; 
                    LUf : out DoblDobl_Complex_Matrices.Matrix;
                    pivots : out Standard_Integer_Vectors.Vector;
                    info : out integer32;
                    M,U : out Standard_Integer64_Matrices.Matrix;
                    Usols,Asols : out Solution_List ) is

    n : constant integer32 := C'last(1);
    y : DoblDobl_Complex_Vectors.Vector(b'range);

  begin
    LUf := C;
    lufac(LUf,n,pivots,info);
    if info = 0 then
      y := b;
      lusolve(LUf,n,pivots,y);
      zero_y := Zero_Component(y,tol);
      if not zero_y
       then Solve(file,A,y,r,M,U,Usols,Asols);
      end if;
    end if;
  exception 
    when others => put_line("Exception raised in Solve");
                   put_line("For the matrix : "); put(C);
                   put_line("and righthand side vector :"); put_line(b);
                   raise;
  end Solve;

  procedure Solve ( file : in file_type;
                    A : in Multprec_Integer_Matrices.Matrix;
                    C : in DoblDobl_Complex_Matrices.Matrix;
                    b : in DoblDobl_Complex_Vectors.Vector;
                    tol : in double_double; zero_y : out boolean;
                    r : out integer32; 
                    LUf : out DoblDobl_Complex_Matrices.Matrix;
                    pivots : out Standard_Integer_Vectors.Vector;
                    info : out integer32;
                    M,U : out Multprec_Integer_Matrices.Matrix;
                    Usols,Asols : out Solution_List ) is

    n : constant integer32 := C'last(1);
    y : DoblDobl_Complex_Vectors.Vector(b'range);

  begin
    LUf := C;
    lufac(LUf,n,pivots,info);
    if info = 0 then
      y := b;
      lusolve(LUf,n,pivots,y);
      zero_y := Zero_Component(y,tol);
      if not zero_y
       then Solve(file,A,y,r,M,U,Usols,Asols);
      end if;
    end if;
  exception 
    when others => put_line("Exception raised in Solve");
                   put_line("For the matrix : "); put(C);
                   put_line("and righthand side vector :"); put_line(b);
                   raise;
  end Solve;

  procedure Solve ( A : in Standard_Integer64_Matrices.Matrix;
                    C : in DoblDobl_Complex_Matrices.Matrix;
                    b : in DoblDobl_Complex_Vectors.Vector;
                    tol : in double_double; zero_y : out boolean;
                    r : out integer32; 
                    LUf : out DoblDobl_Complex_Matrices.Matrix;
                    pivots : out Standard_Integer_Vectors.Vector;
                    rcond : out double_double;
                    M,U : out Standard_Integer64_Matrices.Matrix;
                    Usols,Asols : out Solution_List ) is

    n : constant integer32 := C'last(1);
    y : DoblDobl_Complex_Vectors.Vector(b'range);
    one : constant double_double := create(1.0);

  begin
    LUf := C;
    lufco(LUf,n,pivots,rcond);
    if rcond + one /= one then
      y := b;
      lusolve(LUf,n,pivots,y);
      zero_y := Zero_Component(y,tol);
      if not zero_y
       then Solve(A,y,r,M,U,Usols,Asols);
      end if;
    end if;
  exception
    when others => put_line("exception raised in solve...");
  end Solve;

  procedure Solve ( A : in Multprec_Integer_Matrices.Matrix;
                    C : in DoblDobl_Complex_Matrices.Matrix;
                    b : in DoblDobl_Complex_Vectors.Vector;
                    tol : in double_double; zero_y : out boolean;
                    r : out integer32; 
                    LUf : out DoblDobl_Complex_Matrices.Matrix;
                    pivots : out Standard_Integer_Vectors.Vector;
                    rcond : out double_double;
                    M,U : out Multprec_Integer_Matrices.Matrix;
                    Usols,Asols : out Solution_List ) is

    n : constant integer32 := C'last(1);
    y : DoblDobl_Complex_Vectors.Vector(b'range);
    one : constant double_double := create(1.0);

  begin
    LUf := C;
    lufco(LUf,n,pivots,rcond);
    if rcond + one /= one then
      y := b;
      lusolve(LUf,n,pivots,y);
      zero_y := Zero_Component(y,tol);
      if not zero_y
       then Solve(A,y,r,M,U,Usols,Asols);
      end if;
    end if;
  exception
    when others => put_line("exception raised in solve...");
  end Solve;

  procedure Solve ( file : in file_type;
                    A : in Standard_Integer64_Matrices.Matrix;
                    C : in DoblDobl_Complex_Matrices.Matrix;
                    b : in DoblDobl_Complex_Vectors.Vector;
                    tol : in double_double; zero_y : out boolean;
                    r : out integer32; 
                    LUf : out DoblDobl_Complex_Matrices.Matrix;
                    pivots : out Standard_Integer_Vectors.Vector;
                    rcond : out double_double;
                    M,U : out Standard_Integer64_Matrices.Matrix;
                    Usols,Asols : out Solution_List ) is

    n : constant integer32 := C'last(1);
    y : DoblDobl_Complex_Vectors.Vector(b'range);
    one : constant double_double := create(1.0);

  begin
    LUf := C;
    lufco(LUf,n,pivots,rcond);
    if rcond + one /= one then
      y := b;
      lusolve(LUf,n,pivots,y);
      zero_y := Zero_Component(y,tol);
      if not zero_y
       then Solve(file,A,y,r,M,U,Usols,Asols);
      end if;
    end if;
  exception 
    when others => put_line("Exception raised in Solve");
                   put_line("For the matrix : "); put(C);
                   put_line("and righthand side vector :"); put_line(b);
                   raise;
  end Solve;

  procedure Solve ( file : in file_type;
                    A : in Multprec_Integer_Matrices.Matrix;
                    C : in DoblDobl_Complex_Matrices.Matrix;
                    b : in DoblDobl_Complex_Vectors.Vector;
                    tol : in double_double; zero_y : out boolean;
                    r : out integer32; 
                    LUf : out DoblDobl_Complex_Matrices.Matrix;
                    pivots : out Standard_Integer_Vectors.Vector;
                    rcond : out double_double;
                    M,U : out Multprec_Integer_Matrices.Matrix;
                    Usols,Asols : out Solution_List ) is

    n : constant integer32 := C'last(1);
    y : DoblDobl_Complex_Vectors.Vector(b'range);
    one : constant double_double := create(1.0);

  begin
    LUf := C;
    lufco(LUf,n,pivots,rcond);
    if rcond + one /= one then
      y := b;
      lusolve(LUf,n,pivots,y);
      zero_y := Zero_Component(y,tol);
      if not zero_y
       then Solve(file,A,y,r,M,U,Usols,Asols);
      end if;
    end if;
  exception 
    when others => put_line("Exception raised in Solve");
                   put_line("For the matrix : "); put(C);
                   put_line("and righthand side vector :"); put_line(b);
                   raise;
  end Solve;

-- RESIDUAL CALCULATION :

  function Sum_Residuals
                  ( A : Standard_Integer64_Matrices.Matrix;
                    C : DoblDobl_Complex_Matrices.Matrix;
                    b : DoblDobl_Complex_Vectors.Vector;
                    sols : Solution_List ) return double_double is

    res : double_double := create(0.0);
    tmp : Solution_List := sols;
    y : DoblDobl_Complex_Vectors.Vector(C'range(1));

  begin
    while not Is_Null(tmp) loop
      y := Eval(A,C,b,Head_Of(tmp).v);
      res := res + Max_Norm(y);
      tmp := Tail_Of(tmp);
    end loop;
    return res;
  end Sum_Residuals;

  procedure Write_Residuals
                  ( file : in file_type;
                    A : in Standard_Integer64_Matrices.Matrix;
                    C : in DoblDobl_Complex_Matrices.Matrix;
                    b : in DoblDobl_Complex_Vectors.Vector;
                    sols : in Solution_List ) is

    tmp : Solution_List := sols;
    y : DoblDobl_Complex_Vectors.Vector(C'range(1));

  begin
    while not Is_Null(tmp) loop
      y := Eval(A,C,b,Head_Of(tmp).v);
      put(file,Max_Norm(y)); new_line(file);
      tmp := Tail_Of(tmp);
    end loop;
  end Write_Residuals;

end DoblDobl_Simplex_Solvers;
