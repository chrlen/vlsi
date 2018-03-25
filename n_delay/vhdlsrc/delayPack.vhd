LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;


-- Zeitkonstanten in Package definieren

package delayPack is 
	component n_delay 
		    --GENERIC (n : positive := 8);
  			PORT (	n_del_in  : IN   std_logic;
        			n_del_out : OUT  std_logic);
	end component;

	component delay
  			PORT (	del_in  : IN   std_logic;
        			del_out : OUT  std_logic); 
	end component;
	
	constant delayTime: time;
end delayPack;

package body delayPack is
	constant delayTime : time := 1 ns;
end delayPack;



