
set vhdl_dir "../vhdlsrc"
set edf_dir "../expdir"
set TOP n_delay

add_file -vhdl $vhdl_dir/$TOP.vhd

set_option -technology Spartan3A
set_option -part XC3S700AN
set_option -package FGG484
set_option -speed_grade -4

set_option -write_vhdl 1
set_option -disable_io_insertion 0
project -result_file "./expdir/$TOP.edf"

project -run

