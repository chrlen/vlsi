ARCHITECTURE arch of func_tb is 
SIGNAL in_sig, out_sig : std_logic;

BEGIN
  delay_instance : n_delay
    PORT MAP (in_sig, out_sig);

    in_sig <= '0',
    		  '1' after 60 ns,
    		  '0' after 120 ns;
END arch;



