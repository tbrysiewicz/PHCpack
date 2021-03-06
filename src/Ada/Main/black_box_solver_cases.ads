with text_io;                            use text_io;
with Ada.Calendar;
with Standard_Natural_Numbers;           use Standard_Natural_Numbers;
with Standard_Complex_Polynomials;
with Standard_Complex_Poly_Systems;
with Standard_Complex_Laur_Systems;
with DoblDobl_Complex_Polynomials;
with DoblDobl_Complex_Poly_Systems;
with DoblDobl_Complex_Laur_Systems;
with QuadDobl_Complex_Polynomials;
with QuadDobl_Complex_Poly_Systems;
with QuadDobl_Complex_Laur_Systems;
with Standard_Complex_Solutions;
with DoblDobl_Complex_Solutions;
with QuadDobl_Complex_Solutions;

package Black_Box_Solver_Cases is

-- DESCRIPTION :
--   Offers utilities and special cases for the blackbox solvers.

  function Is_Constant_In 
              ( p : Standard_Complex_Polynomials.Poly ) return boolean;
  function Is_Constant_In 
              ( p : DoblDobl_Complex_Polynomials.Poly ) return boolean;
  function Is_Constant_In 
              ( p : QuadDobl_Complex_Polynomials.Poly ) return boolean;

  -- DESCRIPTION :
  --   Returns true if the polynomial has a constant term.

  function Are_Constants_In
              ( p : Standard_Complex_Poly_Systems.Poly_Sys ) return boolean;
  function Are_Constants_In
              ( p : DoblDobl_Complex_Poly_Systems.Poly_Sys ) return boolean;
  function Are_Constants_In
              ( p : QuadDobl_Complex_Poly_Systems.Poly_Sys ) return boolean;

  -- DESCRIPTION :
  --   Returns true if all polynomials in p have a constant term.

  procedure Timing_Summary
              ( file : in file_type; roco,hoco,poco,total : in duration );

  -- DESCRIPTION :
  --   Writes a summary about execution times to the output file.

  procedure Append_Solutions_to_Input_File
              ( infilename : in string;
                sols : in Standard_Complex_Solutions.Solution_list;
                append_sols : in boolean );
  procedure Append_Solutions_to_Input_File
              ( infilename : in string;
                sols : in DoblDobl_Complex_Solutions.Solution_list;
                append_sols : in boolean );
  procedure Append_Solutions_to_Input_File
              ( infilename : in string;
                sols : in QuadDobl_Complex_Solutions.Solution_list;
                append_sols : in boolean );

  -- DESCRIPTION :
  --   If the solution list is not empty and append_sols is true,
  --   then the file with name in "infilename" is opened in append mode
  --   and the solutions are then appended to the input file.

  procedure Ask_Output_File
              ( outfile : out file_type; outfilename : in string;
                output_to_file : out boolean );

  -- DESCRIPTION :
  --   In case the output file is empty, the user is asked whether
  --   the output should be written to file.  In case the solutions
  --   should be written to file, the file with the given name is
  --   created, eventually after asking for a nonempty string.
  --   On return output_to_file is true if a file has been created.

  procedure Single_Main
               ( infilename,outfilename : in string;
                 p : in Standard_Complex_Polynomials.Poly;
                 append_sols : in boolean );
  procedure Single_Main
               ( infilename,outfilename : in string;
                 p : in DoblDobl_Complex_Polynomials.Poly;
                 append_sols : in boolean );
  procedure Single_Main
               ( infilename,outfilename : in string;
                 p : in QuadDobl_Complex_Polynomials.Poly;
                 append_sols : in boolean );

  -- DESCRIPTION :
  --   This procedure solves one single polynomial,
  --   branching ont the number of unknowns in p.

  procedure Linear_Main 
              ( infilename,outfilename : in string;
                p : in Standard_Complex_Poly_Systems.Link_to_Poly_Sys;
                n : in natural32; append_sols : in boolean;
                fail : out boolean );
  procedure Linear_Main 
              ( infilename,outfilename : in string;
                p : in DoblDobl_Complex_Poly_Systems.Link_to_Poly_Sys;
                n : in natural32; append_sols : in boolean;
                fail : out boolean );
  procedure Linear_Main 
              ( infilename,outfilename : in string;
                p : in QuadDobl_Complex_Poly_Systems.Link_to_Poly_Sys;
                n : in natural32; append_sols : in boolean;
                fail : out boolean );

  -- DESCRIPTION :
  --   Parses the system to see if it is square and linear.

  -- ON ENTRY :
  --   infilename     the name of the input file;
  --   outfilename    the name of the output file;
  --   p              a polynomial system;
  --   n              number of variables in the polynomials of p;
  --   append_sols    true if solutions need to be appended to input file.

  -- ON RETURN :
  --   fail           true if system p is nonlinear.

  procedure Square_Main
              ( nt : in natural32; infilename,outfilename : in string;
                start_moment : in Ada.Calendar.Time;
                p : in Standard_Complex_Poly_Systems.Link_to_Poly_Sys;
                append_sols : in boolean );
  procedure Square_Main
              ( nt : in natural32; infilename,outfilename : in string;
                start_moment : in Ada.Calendar.Time;
                p : in DoblDobl_Complex_Poly_Systems.Link_to_Poly_Sys;
                append_sols : in boolean );
  procedure Square_Main
              ( nt : in natural32; infilename,outfilename : in string;
                start_moment : in Ada.Calendar.Time;
                p : in QuadDobl_Complex_Poly_Systems.Link_to_Poly_Sys;
                append_sols : in boolean );

  -- DESCRIPTION :
  --   A polynomial system with as many equations as unknowns is square.
  --   This procedure solves a square polynomial system p,
  --   using standard double, double double, or quad double arithmetic.
  --
  -- REQUIRED :
  --   Must be called after the special cases (one single equation
  --   and a linear system) have been dealt with.

  -- ON ENTRY :
  --   nt             the number of tasks, if 0 then no multitasking,
  --                  otherwise nt tasks will be used to track the paths;
  --   infilename     the name of the input file;
  --   outfilename    the name of the output file;
  --   start_moment   clock time when phc was started;
  --   p              polynomial system to be solved.
  --   append_sols    true if solutions need to be appended to input file.

  -- ON RETURN :
  --   p              system may be scaled or reduced.

  procedure Square_Main
              ( nt : in natural32; infilename,outfilename : in string;
                start_moment : in Ada.Calendar.Time;
                p : in Standard_Complex_Laur_Systems.Link_to_Laur_Sys;
                append_sols : in boolean );
  procedure Square_Main
              ( nt : in natural32; infilename,outfilename : in string;
                start_moment : in Ada.Calendar.Time;
                p : in DoblDobl_Complex_Laur_Systems.Link_to_Laur_Sys;
                append_sols : in boolean );
  procedure Square_Main
              ( nt : in natural32; infilename,outfilename : in string;
                start_moment : in Ada.Calendar.Time;
                p : in QuadDobl_Complex_Laur_Systems.Link_to_Laur_Sys;
                append_sols : in boolean );

  -- DESCRIPTION :
  --   A polynomial system with as many equations as unknowns is square.
  --   This procedure solves a square Laurent polynomial system p,
  --   with standard double, double double, or quad double arithmetic.
  --
  -- REQUIRED :
  --   Must be called after the special cases (one single equation
  --   and a linear system) have been dealt with.

  -- ON ENTRY :
  --   nt             the number of tasks, if 0 then no multitasking,
  --                  otherwise nt tasks will be used to track the paths;
  --   infilename     the name of the input file;
  --   outfilename    the name of the output file;
  --   start_moment   clock time when phc was started;
  --   p              polynomial system to be solved.
  --   append_sols    true if solutions need to be appended to input file.

  -- ON RETURN :
  --   p              system may be scaled or reduced.

  procedure Solve_for_Special_Cases
              ( p : in Standard_Complex_Poly_Systems.Poly_Sys;
                rc : out natural32;
                sols : out Standard_Complex_Solutions.Solution_List;
                fail : out boolean );
  procedure Solve_for_Special_Cases
              ( p : in DoblDobl_Complex_Poly_Systems.Poly_Sys;
                rc : out natural32;
                sols : out DoblDobl_Complex_Solutions.Solution_List;
                fail : out boolean );
  procedure Solve_for_Special_Cases
              ( p : in QuadDobl_Complex_Poly_Systems.Poly_Sys;
                rc : out natural32;
                sols : out QuadDobl_Complex_Solutions.Solution_List;
                fail : out boolean );

  -- DESCRIPTION :
  --   Checks whether the system p is one of the three special cases:
  --   1. a polynomial in one variable;
  --   2. a linear system;
  --   3. a binomial system with a nonzero constant.
  --   In one of these three cases, the solver will return solutions
  --   and fail will be false.  Otherwise, fail is true.

  -- ON INPUT :
  --   p            a polynomial system.

  -- ON RETURN :
  --   rc           equals the number of solutions in sols or 0 if fail;
  --   fail         true if the system is not a special case,
  --                false otherwise;
  --   sols         solutions of p if not fail.

end Black_Box_Solver_Cases;
