#FOR i IN (n) DOWNTO 1 GENERATE
#  CONSTANT param : natural  := 
#      ((n-i)) mod 2;
#  CONSTANT row : natural    := 
#      ((n-i)/4) mod 2;
#  CONSTANT column : natural := 
#      (n-i)/4 + (param - row);
#  CONSTANT rloc_str : string := 
#      "X" & itoa(row) & "Y" & itoa(column);
#    
#  ATTRIBUTE RLOC of lut_instance : 
#      LABEL IS rloc_str;

n=5
for i in list(reversed(range(0,n+1))):
  param = ((n-i)) % 2
  row = ((n-i)/4) % 2
  column = (n-i)/4 + (param - row)
  print("X" + str(int(row)) + "Y" + str(int(column)) )