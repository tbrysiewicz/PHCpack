with Standard_Natural_Numbers;          use Standard_Natural_Numbers;
with Standard_Complex_Laurentials;      use Standard_Complex_Laurentials;
with Standard_Complex_Laur_Systems;     use Standard_Complex_Laur_Systems;

package Standard_Embed_Laurentials is

-- DESCRIPTION :
--   The operations in this package extend the Laurent polynomials
--   with extra variables.  This corresponds to the embedding
--   of the polynomials into a larger space.

  function Add_Variables ( p : Poly; k : natural32 ) return Poly;
  function Add_Variables ( p : Laur_Sys; k : natural32 ) return Laur_Sys;

  -- DESCRIPTION :
  --   Extends the representation of the degrees with k more variables,
  --   whose exponent equals 0.

end Standard_Embed_Laurentials;
