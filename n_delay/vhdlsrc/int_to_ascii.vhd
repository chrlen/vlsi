-- Funktion itoa() (integer to ascii)
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

PACKAGE int_to_ascii IS
  TYPE TStr10 IS ARRAY (0 to 9) OF string(1 to 1);
  CONSTANT Str10: TStr10 :=
    ("0","1","2","3","4","5","6","7","8","9");
  FUNCTION itoa( x : integer ) RETURN string;
END int_to_ascii;

PACKAGE BODY int_to_ascii IS
  FUNCTION itoa( x : integer ) RETURN string IS
    VARIABLE n: integer := x;       
  BEGIN
    IF n < 0 THEN RETURN "-" & itoa(-n);
    ELSIF n < 10 THEN RETURN Str10(n);
    ELSE RETURN itoa(n/10) & Str10(n rem 10);
    END IF;
  END FUNCTION itoa;
END int_to_ascii;

