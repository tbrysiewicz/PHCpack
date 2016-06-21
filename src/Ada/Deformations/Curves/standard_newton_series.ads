with text_io;                           use text_io;
with Standard_Integer_Numbers;          use Standard_Integer_Numbers;
with Standard_Dense_Series_Vectors;
with Standard_Series_Poly_Systems;
with Standard_Series_Jaco_Matrices;

package Standard_Newton_Series is

-- DESCRIPTION :
--   This package contains the application of Newton's method to compute
--   truncated power series approximations for a space curve.

  procedure LU_Newton_Step
              ( p : in Standard_Series_Poly_Systems.Poly_Sys;
                jp : in Standard_Series_Jaco_Matrices.Jaco_Mat;
                order : in integer32;
                x : in out Standard_Dense_Series_Vectors.Vector;
                info : out integer32 );
  procedure LU_Newton_Step
              ( p : in Standard_Series_Poly_Systems.Poly_Sys;
                order : in integer32;
                x : in out Standard_Dense_Series_Vectors.Vector;
                info : out integer32 );
  procedure LU_Newton_Step
              ( file : in file_type;
                p : in Standard_Series_Poly_Systems.Poly_Sys;
                jp : in Standard_Series_Jaco_Matrices.Jaco_Mat;
                order : in integer32;
                x : in out Standard_Dense_Series_Vectors.Vector;
                info : out integer32 );
  procedure LU_Newton_Step
              ( file : in file_type;
                p : in Standard_Series_Poly_Systems.Poly_Sys;
                order : in integer32;
                x : in out Standard_Dense_Series_Vectors.Vector;
                info : out integer32 );

  -- DESCRIPTION :
  --   Performs one step with Newton's method on the square system p,
  --   starting at the series approximation x, 
  --   calculating with power series up to the given order,
  --   using LU factorization to solve the linear system.

  -- ON ENTRY :
  --   file     for intermediate output: p(x) and the update dx,
  --            if omitted, LU_Newton_Step is silent;
  --   p        a polynomial system with series coefficients;
  --   jp       Jacobi matrix of the system p;
  --   order    the order at which to solve the linear system;
  --   x        current approximation for the series solution.

  -- ON RETURN :
  --   x        updated approximation for the series solution;
  --   info     if zero, then the Jacobian matrix at x is regular,
  --            otherwise, info indicates the column at which the
  --            pivoting failed to find an invertible element.

  procedure LU_Newton_Steps
              ( p : in Standard_Series_Poly_Systems.Poly_Sys;
                jp : in Standard_Series_Jaco_Matrices.Jaco_Mat;
                order : in out integer32; nbrit : in integer32;
                x : in out Standard_Dense_Series_Vectors.Vector;
                info : out integer32 );
  procedure LU_Newton_Steps
              ( p : in Standard_Series_Poly_Systems.Poly_Sys;
                order : in out integer32; nbrit : in integer32;
                x : in out Standard_Dense_Series_Vectors.Vector;
                info : out integer32 );
  procedure LU_Newton_Steps
              ( file : in file_type;
                p : in Standard_Series_Poly_Systems.Poly_Sys;
                jp : in Standard_Series_Jaco_Matrices.Jaco_Mat;
                order : in out integer32; nbrit : in integer32;
                x : in out Standard_Dense_Series_Vectors.Vector;
                info : out integer32 );
  procedure LU_Newton_Steps
              ( file : in file_type;
                p : in Standard_Series_Poly_Systems.Poly_Sys;
                order : in out integer32; nbrit : in integer32;
                x : in out Standard_Dense_Series_Vectors.Vector;
                info : out integer32 );

  -- DESCRIPTION :
  --   Does a number of Newton steps on the square system p,
  --   starting at x, doubling the order after each step,
  --   with LU factorization on the Jacobian matrix,
  --   terminating if info /= 0 or if nbrit is reached.

  -- ON ENTRY :
  --   file     for intermediate output: p(x) and the update dx,
  --            if omitted, LU_Newton_Step is silent;
  --   p        a polynomial system with series coefficients;
  --   jp       Jacobi matrix of the system p;
  --   order    the order at start of the computations;
  --   nbrit    total number of Newton steps;
  --   x        current approximation for the series solution.

  -- ON RETURN :
  --   order    last order of the computation;
  --   x        updated approximation for the series solution;
  --   info     if zero, then the Jacobian matrix at x is regular,
  --            otherwise, info indicates the column at which the
  --            pivoting failed to find an invertible element.

end Standard_Newton_Series;
