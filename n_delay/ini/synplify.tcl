set VHDL_DIR "[get_env WORKDIR]/vhdlsrc"
set TOP "[get_env TOP]"

#add_file -vhdl $VHDL_DIR/dlatch.vhd
#add_file -vhdl $VHDL_DIR/dlatch-mixed.vhd

add_file -vhdl $VHDL_DIR/int_to_ascii.vhd
add_file -vhdl $VHDL_DIR/delayPack.vhd
add_file -vhdl $VHDL_DIR/n_delay.vhd
add_file -vhdl $VHDL_DIR/n_delay-deterministic.vhd


add_file -vhdl $VHDL_DIR/$TOP.vhd

#device options
set_option -technology "[get_env TECHNOLOGY]"
set_option -part "[get_env PART]"
set_option -package "[get_env PACKAGE]"
set_option -speed_grade "[get_env SPEED_GRADE]"


set_option -write_vhdl 1
set_option -disable_io_insertion 0
project -result_file "./expdir/$TOP.edf"

project -run

