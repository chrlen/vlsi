ARCHITECTURE timesim OF n_delay IS

SIGNAL intsig_delay : std_logic_vector(n DOWNTO 0);

begin
    gen_delays: 
    FOR i IN (n) DOWNTO 1 GENERATE
    delay_instance: delay 
      PORT MAP (
          del_in  => intsig_delay(i),
          del_out => intsig_delay(i-1) 
          );
    end generate gen_delays;
    intsig_delay(n) <= n_del_in;
    n_del_out <= intsig_delay(0);
end timesim;
