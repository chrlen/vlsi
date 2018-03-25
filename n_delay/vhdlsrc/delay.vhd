LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

LIBRARY work;
use work.delayPack.ALL;

ENTITY delay IS
	PORT (	del_in  : IN  std_logic;
        	del_out : OUT std_logic);
end delay;

ARCHITECTURE arch OF delay IS
begin
	del_out <= del_in AFTER delayTime;
END arch;