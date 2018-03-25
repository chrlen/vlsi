#!/bin/sh
#
echo ">> Synthese ... ";
if test -d ./syn;  then
rm -r ./syn;
fi
mkdir -p ./syn;
#
cd ./syn
synplify_premier -tcl ../synplify.tcl -batch -verbose_log  -log synplify_delay.log
#synplify_premier -tcl ../synplify.tcl -verbose_log  -log synplify_delay.log
#
cd ..
# ==========================================
echo ">> FPGA-Implementierung ... ";
TOP='n_delay_mit_arch'
imp_dir=./imp
UCF_FILE='../ucf/delay.ucf'
TARGET_PART='xc3s700anfgg484-4'; export TARGET_PART
# ------------------------
if  test -d $imp_dir;  then
rm -r $imp_dir;
fi
mkdir $imp_dir
cp ./syn/expdir/$TOP.edf $imp_dir
cd $imp_dir
#
# ------------------------
# mit ucf
ngdbuild -verbose -aul -a -p $TARGET_PART -uc $UCF_FILE $TOP.ngo
# ohne ucf
#ngdbuild -verbose -aul -a -p $TARGET_PART $TOP.ngo
# ------------------------
map -detail -u -o map.ncd $TOP.ngd $TOP.pcf
# ------------------------
#par -w  map.ncd $TOP.ncd $TOP.pcf # min. Rechenzeit
par -w -ol high map.ncd $TOP.ncd $TOP.pcf # max. Frequenz
# ------------------------
trce  -v 10 -a -u $TOP.ncd $TOP.pcf -o $TOP.twr 
# ------------------------
#bitgen -w $TOP.ncd
netgen -mhf -ofmt vhdl -sim -w $TOP $TOP.vhd
cd ..
unset $TOP
unset imp_dir









