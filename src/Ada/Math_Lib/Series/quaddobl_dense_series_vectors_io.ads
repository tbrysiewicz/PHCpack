with QuadDobl_Dense_Series_Ring_io;
with QuadDobl_Dense_Series_Vectors;
with Generic_Vectors_io;

package QuadDobl_Dense_Series_Vectors_io is 
  new Generic_Vectors_io(QuadDobl_Dense_Series_Ring_io,
                         QuadDobl_Dense_Series_Vectors);

-- DESCRIPTION :
--   Defines input/output of vectors of truncated power series
--   with as coefficients complex numbers in quad double precision.
