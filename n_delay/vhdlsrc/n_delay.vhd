LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

LIBRARY work;
use work.int_to_ascii.ALL;
use work.delayPack.ALL;


ENTITY n_delay IS
    GENERIC (n : positive := 10);
  PORT (n_del_in  :       IN     std_logic;
        n_del_out :       OUT    std_logic);
END n_delay;

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;


-- Achtung, das ist KEINE Testbench!
ENTITY delay_test IS
  PORT (delay_test_in  : IN  std_logic;
        delay_test_out : OUT std_logic);
END delay_test;


ARCHITECTURE delay_test_arch OF delay_test IS 
  
  COMPONENT n_delay 
    PORT (
    n_del_in  :       IN     std_logic;
    n_del_out :       OUT    std_logic);
  END COMPONENT;

BEGIN
  n_delay_inst: n_delay
    PORT MAP (n_del_in  => delay_test_in,
              n_del_out => delay_test_out);
END delay_test_arch;
