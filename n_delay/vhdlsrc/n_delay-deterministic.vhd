-- Attribute fuer die Synthese
LIBRARY synplify;
USE synplify.attributes.ALL;

-- FPGA-Komponentendeklaration
Library UNISIM;
use UNISIM.vcomponents.all;

ARCHITECTURE deterministic OF n_delay IS

  SIGNAL intsig_delay : std_logic_vector(n DOWNTO 0);
  ATTRIBUTE RLOC : string;

  ATTRIBUTE syn_hier : string;
  ATTRIBUTE syn_hier OF deterministic : ARCHITECTURE IS "hard";

  ATTRIBUTE xc_use_xmodule: boolean;
  ATTRIBUTE xc_use_keep_hierarchy OF deterministic : ARCHITECTURE IS true;

  BEGIN n_delay:
  FOR i IN (n) DOWNTO 1 GENERATE
    CONSTANT param : natural  := ((n-i)) mod 2;
    CONSTANT row : natural    := ((n-i)/4) mod 2;
    CONSTANT column : natural := (n-i)/4 + (param - row);
    CONSTANT rloc_str : string := "X" & itoa(row) & "Y" & itoa(column);
    
    ATTRIBUTE RLOC of lut_instance : LABEL IS rloc_str;

    BEGIN

      lut_instance: LUT1
        GENERIC MAP (
          INIT => "0000000000000010"
          )   -- Inverter: 01, Buffer 10
        
        PORT MAP (
          O  => intsig_delay(i),  -- LUT general output
          I0 => intsig_delay(i-1)   -- LUT input
          );

  END GENERATE;
  intsig_delay(0) <= n_del_in;
  n_del_out <= intsig_delay(n);
END deterministic;