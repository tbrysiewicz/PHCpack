with Standard_Natural_Numbers;           use Standard_Natural_Numbers;
with Standard_Natural_Numbers_io;        use Standard_Natural_Numbers_io;
with Standard_Complex_Poly_Systems_io;   use Standard_Complex_Poly_Systems_io;
with Standard_Complex_Laur_Systems_io;   use Standard_Complex_Laur_Systems_io;
with DoblDobl_Complex_Poly_Systems_io;   use DoblDobl_Complex_Poly_Systems_io;
with DoblDobl_Complex_Laur_Systems_io;   use DoblDobl_Complex_Laur_Systems_io;
with QuadDobl_Complex_Poly_Systems_io;   use QuadDobl_Complex_Poly_Systems_io;
with QuadDobl_Complex_Laur_Systems_io;   use QuadDobl_Complex_Laur_Systems_io;
with Standard_Complex_Solutions_io;      use Standard_Complex_Solutions_io;
with DoblDobl_Complex_Solutions_io;      use DoblDobl_Complex_Solutions_io;
with QuadDobl_Complex_Solutions_io;      use QuadDobl_Complex_Solutions_io;

package body Monodromy_Homotopies_io is

  function Is_In ( v : Standard_Natural_Vectors.Link_to_Vector;
                   x : natural32 ) return boolean is

  -- DESCRIPTION :
  --   Returns true if there is an index i in v such that v(i) = x.

  -- REQUIRED : v /= null;

  begin
    for i in v'range loop
      if v(i) = x
       then return true;
      end if;
    end loop;
    return false;
  end Is_In;

  procedure Write_Factor
              ( file : in file_type;
                eqs : in Standard_Complex_Poly_Systems.Poly_Sys;
                pts : in Standard_Complex_Solutions.Solution_List;
                fac : in Standard_Natural_Vectors.Link_to_Vector ) is

    use Standard_Natural_Vectors;
    use Standard_Complex_Solutions;

    deg,nvr,cnt : natural32;
    tmp : Solution_List;
    ls : Link_to_Solution;

  begin
    if fac /= null then
      deg := natural32(fac'last);
      put_line(file,eqs);
      if not Is_Null(pts) then
        nvr := natural32(Head_Of(pts).n);
        new_line(file);
        put_line(file,"THE SOLUTIONS :");
        put(file,deg,1); put(file," "); put(file,nvr,1); new_line(file);
        cnt := 0;
        tmp := pts;
        for k in 1..deg loop
          ls := Head_Of(tmp);
          if Is_In(fac,k) then
            Write_Next(file,cnt,ls.all);
          end if;
          tmp := Tail_Of(tmp);
        end loop;
      end if;
    end if;
  end Write_Factor;

  procedure Write_Factor
              ( file : in file_type;
                eqs : in Standard_Complex_Laur_Systems.Laur_Sys;
                pts : in Standard_Complex_Solutions.Solution_List;
                fac : in Standard_Natural_Vectors.Link_to_Vector ) is

    use Standard_Natural_Vectors;
    use Standard_Complex_Solutions;

    deg,nvr,cnt : natural32;
    tmp : Solution_List;
    ls : Link_to_Solution;

  begin
    if fac /= null then
      deg := natural32(fac'last);
      put_line(file,eqs);
      if not Is_Null(pts) then
        nvr := natural32(Head_Of(pts).n);
        new_line(file);
        put_line(file,"THE SOLUTIONS :");
        put(file,deg,1); put(file," "); put(file,nvr,1); new_line(file);
        cnt := 0;
        tmp := pts;
        for k in 1..deg loop
          ls := Head_Of(tmp);
          if Is_In(fac,k) then
            Write_Next(file,cnt,ls.all);
          end if;
          tmp := Tail_Of(tmp);
        end loop;
      end if;
    end if;
  end Write_Factor;

  procedure Write_Factor
              ( file : in file_type;
                eqs : in DoblDobl_Complex_Poly_Systems.Poly_Sys;
                pts : in DoblDobl_Complex_Solutions.Solution_List;
                fac : in Standard_Natural_Vectors.Link_to_Vector ) is

    use Standard_Natural_Vectors;
    use DoblDobl_Complex_Solutions;

    deg,nvr,cnt : natural32;
    tmp : Solution_List;
    ls : Link_to_Solution;

  begin
    if fac /= null then
      deg := natural32(fac'last);
      put_line(file,eqs);
      if not Is_Null(pts) then
        nvr := natural32(Head_Of(pts).n);
        new_line(file);
        put_line(file,"THE SOLUTIONS :");
        put(file,deg,1); put(file," "); put(file,nvr,1); new_line(file);
        cnt := 0;
        tmp := pts;
        for k in 1..deg loop
          ls := Head_Of(tmp);
          if Is_In(fac,k) then
            Write_Next(file,cnt,ls.all);
          end if;
          tmp := Tail_Of(tmp);
        end loop;
      end if;
    end if;
  end Write_Factor;

  procedure Write_Factor
              ( file : in file_type;
                eqs : in DoblDobl_Complex_Laur_Systems.Laur_Sys;
                pts : in DoblDobl_Complex_Solutions.Solution_List;
                fac : in Standard_Natural_Vectors.Link_to_Vector ) is

    use Standard_Natural_Vectors;
    use DoblDobl_Complex_Solutions;

    deg,nvr,cnt : natural32;
    tmp : Solution_List;
    ls : Link_to_Solution;

  begin
    if fac /= null then
      deg := natural32(fac'last);
      put_line(file,eqs);
      if not Is_Null(pts) then
        nvr := natural32(Head_Of(pts).n);
        new_line(file);
        put_line(file,"THE SOLUTIONS :");
        put(file,deg,1); put(file," "); put(file,nvr,1); new_line(file);
        cnt := 0;
        tmp := pts;
        for k in 1..deg loop
          ls := Head_Of(tmp);
          if Is_In(fac,k) then
            Write_Next(file,cnt,ls.all);
          end if;
          tmp := Tail_Of(tmp);
        end loop;
      end if;
    end if;
  end Write_Factor;

  procedure Write_Factor
              ( file : in file_type;
                eqs : in QuadDobl_Complex_Poly_Systems.Poly_Sys;
                pts : in QuadDobl_Complex_Solutions.Solution_List;
                fac : in Standard_Natural_Vectors.Link_to_Vector ) is

    use Standard_Natural_Vectors;
    use QuadDobl_Complex_Solutions;

    deg,nvr,cnt : natural32;
    tmp : Solution_List;
    ls : Link_to_Solution;

  begin
    if fac /= null then
      deg := natural32(fac'last);
      put_line(file,eqs);
      if not Is_Null(pts) then
        nvr := natural32(Head_Of(pts).n);
        new_line(file);
        put_line(file,"THE SOLUTIONS :");
        put(file,deg,1); put(file," "); put(file,nvr,1); new_line(file);
        cnt := 0;
        tmp := pts;
        for k in 1..deg loop
          ls := Head_Of(tmp);
          if Is_In(fac,k) then
            Write_Next(file,cnt,ls.all);
          end if;
          tmp := Tail_Of(tmp);
        end loop;
      end if;
    end if;
  end Write_Factor;

  procedure Write_Factor
              ( file : in file_type;
                eqs : in QuadDobl_Complex_Laur_Systems.Laur_Sys;
                pts : in QuadDobl_Complex_Solutions.Solution_List;
                fac : in Standard_Natural_Vectors.Link_to_Vector ) is

    use Standard_Natural_Vectors;
    use QuadDobl_Complex_Solutions;

    deg,nvr,cnt : natural32;
    tmp : Solution_List;
    ls : Link_to_Solution;

  begin
    if fac /= null then
      deg := natural32(fac'last);
      put_line(file,eqs);
      if not Is_Null(pts) then
        nvr := natural32(Head_Of(pts).n);
        new_line(file);
        put_line(file,"THE SOLUTIONS :");
        put(file,deg,1); put(file," "); put(file,nvr,1); new_line(file);
        cnt := 0;
        tmp := pts;
        for k in 1..deg loop
          ls := Head_Of(tmp);
          if Is_In(fac,k) then
            Write_Next(file,cnt,ls.all);
          end if;
          tmp := Tail_Of(tmp);
        end loop;
      end if;
    end if;
  end Write_Factor;

  procedure Write_Factors
              ( file : in file_type;
                eqs : in Standard_Complex_Poly_Systems.Poly_Sys;
                pts : in Standard_Complex_Solutions.Solution_List;
                fac : in Standard_Natural_VecVecs.Link_to_VecVec ) is

    use Standard_Natural_VecVecs;

  begin
    if fac /= null then
      for k in fac'range loop
        Write_Factor(file,eqs,pts,fac(k));
      end loop;
    end if;
  end Write_Factors;

  procedure Write_Factors
              ( file : in file_type;
                eqs : in Standard_Complex_Laur_Systems.Laur_Sys;
                pts : in Standard_Complex_Solutions.Solution_List;
                fac : in Standard_Natural_VecVecs.Link_to_VecVec ) is

    use Standard_Natural_VecVecs;

  begin
    if fac /= null then
      for k in fac'range loop
        Write_Factor(file,eqs,pts,fac(k));
      end loop;
    end if;
  end Write_Factors;

  procedure Write_Factors
              ( file : in file_type;
                eqs : in DoblDobl_Complex_Poly_Systems.Poly_Sys;
                pts : in DoblDobl_Complex_Solutions.Solution_List;
                fac : in Standard_Natural_VecVecs.Link_to_VecVec ) is

    use Standard_Natural_VecVecs;

  begin
    if fac /= null then
      for k in fac'range loop
        Write_Factor(file,eqs,pts,fac(k));
      end loop;
    end if;
  end Write_Factors;

  procedure Write_Factors
              ( file : in file_type;
                eqs : in DoblDobl_Complex_Laur_Systems.Laur_Sys;
                pts : in DoblDobl_Complex_Solutions.Solution_List;
                fac : in Standard_Natural_VecVecs.Link_to_VecVec ) is

    use Standard_Natural_VecVecs;

  begin
    if fac /= null then
      for k in fac'range loop
        Write_Factor(file,eqs,pts,fac(k));
      end loop;
    end if;
  end Write_Factors;

  procedure Write_Factors
              ( file : in file_type;
                eqs : in QuadDobl_Complex_Poly_Systems.Poly_Sys;
                pts : in QuadDobl_Complex_Solutions.Solution_List;
                fac : in Standard_Natural_VecVecs.Link_to_VecVec ) is

    use Standard_Natural_VecVecs;

  begin
    if fac /= null then
      for k in fac'range loop
        Write_Factor(file,eqs,pts,fac(k));
      end loop;
    end if;
  end Write_Factors;

  procedure Write_Factors
              ( file : in file_type;
                eqs : in QuadDobl_Complex_Laur_Systems.Laur_Sys;
                pts : in QuadDobl_Complex_Solutions.Solution_List;
                fac : in Standard_Natural_VecVecs.Link_to_VecVec ) is

    use Standard_Natural_VecVecs;

  begin
    if fac /= null then
      for k in fac'range loop
        Write_Factor(file,eqs,pts,fac(k));
      end loop;
    end if;
  end Write_Factors;

  procedure Write_Components
              ( file : in file_type;
                eqs : in Standard_Complex_Poly_Systems.Array_of_Poly_Sys;
                pts : in Standard_Complex_Solutions.Array_of_Solution_Lists;
                comp : in Standard_Natural_VecVecs.VecVec ) is

    use Standard_Natural_Vectors;

  begin
    for k in comp'range loop
      if comp(k) /= null then
        Write_Factor(file,eqs(k).all,pts(k),comp(k));
      end if;
    end loop;
  end Write_Components;

  procedure Write_Components
              ( file : in file_type;
                eqs : in Standard_Complex_Laur_Systems.Array_of_Laur_Sys;
                pts : in Standard_Complex_Solutions.Array_of_Solution_Lists;
                comp : in Standard_Natural_VecVecs.VecVec ) is

    use Standard_Natural_Vectors;

  begin
    for k in comp'range loop
      if comp(k) /= null then
        Write_Factor(file,eqs(k).all,pts(k),comp(k));
      end if;
    end loop;
  end Write_Components;

  procedure Write_Components
              ( file : in file_type;
                eqs : in DoblDobl_Complex_Poly_Systems.Array_of_Poly_Sys;
                pts : in DoblDobl_Complex_Solutions.Array_of_Solution_Lists;
                comp : in Standard_Natural_VecVecs.VecVec ) is

    use Standard_Natural_Vectors;

  begin
    for k in comp'range loop
      if comp(k) /= null then
        Write_Factor(file,eqs(k).all,pts(k),comp(k));
      end if;
    end loop;
  end Write_Components;

  procedure Write_Components
              ( file : in file_type;
                eqs : in DoblDobl_Complex_Laur_Systems.Array_of_Laur_Sys;
                pts : in DoblDobl_Complex_Solutions.Array_of_Solution_Lists;
                comp : in Standard_Natural_VecVecs.VecVec ) is

    use Standard_Natural_Vectors;

  begin
    for k in comp'range loop
      if comp(k) /= null then
        Write_Factor(file,eqs(k).all,pts(k),comp(k));
      end if;
    end loop;
  end Write_Components;

  procedure Write_Components
              ( file : in file_type;
                eqs : in QuadDobl_Complex_Poly_Systems.Array_of_Poly_Sys;
                pts : in QuadDobl_Complex_Solutions.Array_of_Solution_Lists;
                comp : in Standard_Natural_VecVecs.VecVec ) is

    use Standard_Natural_Vectors;

  begin
    for k in comp'range loop
      if comp(k) /= null then
        Write_Factor(file,eqs(k).all,pts(k),comp(k));
      end if;
    end loop;
  end Write_Components;

  procedure Write_Components
              ( file : in file_type;
                eqs : in QuadDobl_Complex_Laur_Systems.Array_of_Laur_Sys;
                pts : in QuadDobl_Complex_Solutions.Array_of_Solution_Lists;
                comp : in Standard_Natural_VecVecs.VecVec ) is

    use Standard_Natural_Vectors;

  begin
    for k in comp'range loop
      if comp(k) /= null then
        Write_Factor(file,eqs(k).all,pts(k),comp(k));
      end if;
    end loop;
  end Write_Components;

  procedure Write_Decomposition
              ( file : in file_type;
                eqs : in Standard_Complex_Poly_Systems.Array_of_Poly_Sys;
                pts : in Standard_Complex_Solutions.Array_of_Solution_Lists;
                fac : in Standard_Natural_VecVecs.Array_of_VecVecs ) is

    use Standard_Natural_VecVecs;

  begin
    for k in fac'range loop
      if fac(k) /= null then
        Write_Factors(file,eqs(k).all,pts(k),fac(k));
      end if;
    end loop;
  end Write_Decomposition;

  procedure Write_Decomposition
              ( file : in file_type;
                eqs : in Standard_Complex_Laur_Systems.Array_of_Laur_Sys;
                pts : in Standard_Complex_Solutions.Array_of_Solution_Lists;
                fac : in Standard_Natural_VecVecs.Array_of_VecVecs ) is

    use Standard_Natural_VecVecs;

  begin
    for k in fac'range loop
      if fac(k) /= null then
        Write_Factors(file,eqs(k).all,pts(k),fac(k));
      end if;
    end loop;
  end Write_Decomposition;

  procedure Write_Decomposition
              ( file : in file_type;
                eqs : in DoblDobl_Complex_Poly_Systems.Array_of_Poly_Sys;
                pts : in DoblDobl_Complex_Solutions.Array_of_Solution_Lists;
                fac : in Standard_Natural_VecVecs.Array_of_VecVecs ) is

    use Standard_Natural_VecVecs;

  begin
    for k in fac'range loop
      if fac(k) /= null then
        Write_Factors(file,eqs(k).all,pts(k),fac(k));
      end if;
    end loop;
  end Write_Decomposition;

  procedure Write_Decomposition
              ( file : in file_type;
                eqs : in DoblDobl_Complex_Laur_Systems.Array_of_Laur_Sys;
                pts : in DoblDobl_Complex_Solutions.Array_of_Solution_Lists;
                fac : in Standard_Natural_VecVecs.Array_of_VecVecs ) is

    use Standard_Natural_VecVecs;

  begin
    for k in fac'range loop
      if fac(k) /= null then
        Write_Factors(file,eqs(k).all,pts(k),fac(k));
      end if;
    end loop;
  end Write_Decomposition;

  procedure Write_Decomposition
              ( file : in file_type;
                eqs : in QuadDobl_Complex_Poly_Systems.Array_of_Poly_Sys;
                pts : in QuadDobl_Complex_Solutions.Array_of_Solution_Lists;
                fac : in Standard_Natural_VecVecs.Array_of_VecVecs ) is

    use Standard_Natural_VecVecs;

  begin
    for k in fac'range loop
      if fac(k) /= null then
        Write_Factors(file,eqs(k).all,pts(k),fac(k));
      end if;
    end loop;
  end Write_Decomposition;

  procedure Write_Decomposition
              ( file : in file_type;
                eqs : in QuadDobl_Complex_Laur_Systems.Array_of_Laur_Sys;
                pts : in QuadDobl_Complex_Solutions.Array_of_Solution_Lists;
                fac : in Standard_Natural_VecVecs.Array_of_VecVecs ) is

    use Standard_Natural_VecVecs;

  begin
    for k in fac'range loop
      if fac(k) /= null then
        Write_Factors(file,eqs(k).all,pts(k),fac(k));
      end if;
    end loop;
  end Write_Decomposition;

end Monodromy_Homotopies_io;
