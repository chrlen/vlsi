#!/bin/sh
#
# create simulation libraries:
#
#if test -d ./sim/lib;  then
#rm -R ./sim/lib;
#fi
#mkdir ./sim/lib;
#mkdir .sim/lib/work;
#cd ./sim;
#echo
#echo -n "Aktuelles Verzeichnis: "; 
#pwd;
#echo;
# analyzing all necessary files:
#
#echo ">> Analyse aller VHDL files ... ";
#
#vhdlan  -event -no_opt -nc ../vhdlsrc/mux.vhd
#
echo ">> Synthese mit Synplify ... ";
#cd ..
#if test -d ./syn/expdir;  then
#rm -r ./syn/expdir;
#mkdir ./syn/expdir;
#fi
#
cd ./syn
synplify_premier -tcl ../synplify.tcl -batch -verbose_log  -log synplify_delay.log
#synplify_premier -tcl ../synplify.tcl -verbose_log  -log synplify_delay.log
#
cd ..

#unset imp_dir









