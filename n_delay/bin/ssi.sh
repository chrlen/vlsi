#!/bin/sh
# 
# Ein Arbeitsverzeichnis vereinbaren:
# z.B.:
WORKDIR=$HOME/vlsi/n_delay/; export WORKDIR;
cd $WORKDIR
#
# Die Umgebungsvariable HOME zeigt systemweit immer auf das
# Home-Verzeichnis des jeweiligen Nutzers.
#
# Mit der Anweisung export wird erreicht, dass die Werte der
# angegebenen Variablen allen aufgerufenen Prozeduren und ihren
# Kindprozessen zur Verfuegung stehen (wird z.B. beim Aufruf des
# Programms vhdlan in der Shellfunktion analyse_funcsim benoetigt).
#
# Pfadangaben:
# -----------
# a) relativer Pfad:
#    vom aktuellen Verzeichnis aus (das aktuelle Verzeichnis ist immer ./ )
#    z.B.: um mit der Anweisung ls den Inhalt des dem aktuellen
#    Verzeichnis uebergeordneten Verzeichnis rsff aufzulisten, wobei
#    der absolute Pfad des aktuellen Verzeichnisses /home/vlsi02/rsff/ sei:
# ls ../
#    Nachteil: unsicher, da abhaengig vom gerade aktuellen Verzeichnis
#
# b) absoluter Pfad, d.h. unabhaengig vom aktuellen Verzeichnis
#    z.B.:
# ls /home/vlsi02/rsff
#    Oft ist es einfacher und allgemeingueltiger, mit Pfadvariablen zu
#    arbeiten, z.B.:
# ls $WORKDIR
#
# um das Script von jedem Verzeichnis aus starten zu koennen, muss
# die Pfadvariable um den Pfad zu diesem Script erweitert
# werden. Unter der Annahme, dass sich das Schript im Verzeichnis
# /home/vlsi02/$WORKDIR befindet, kann man z.B. in der Shell, in der
# man arbeiten moechte, folgendes Kommando ausfuehren:
#
# PATH=$PATH:$HOME/vlsi/mixed_style; export PATH
#
# Achtung:
# -------
# Nicht das Kommentarzeichen entfernen, sondern auf der Kommandozeile
# ausfuehren!  Alternativ kann man dieses Kommando entweder in die
# Datei .bashrc oder .profile im Home-Verzeichnis eintragen. Der Pfad
# ist dann in jedem neu geoeffneten Terminal gueltig.
#
# Shellfunktionen:
# ---------------
#
# Die einzelnen Entwurfsabschnitte koennen in Shellfunktionen
# spezifiziert werden. Der Aufruf kann je nach dem aktuell
# auszufuehrenden Arbeitsschritt entweder direkt oder ueber Optionen
# erfolgen (siehe Ablaufsteuerung).
#
analyse_funcsim() {
    echo "Analyse der Quelldateien"
#
# Testen, ob Verzeichnisse fuer die Simulationsbibliotheken vorhanden
# sind, falls vorhanden, einschliesslich Inhalt loeschen:
# test -d  testet, ob das Verzeichnis lib vorhanden ist,
# rm -rf loescht rekursiv (-r) und ohne laestiges Nachfragen (-f)
#
if test -d $WORKDIR/sim;  then
rm -r $WORKDIR/sim;
fi
#
# Verzeichnisse neu erzeugen: mkdir erzeugt das letzte im Pfad
# angegebene Verzeichnis, mit der Option -p werden auch
# Elternverzeichnisse miterzeugt, falls nicht vorhanden
#
if test -d "$WORKDIR"/sim/lib;  then
rm -R "$WORKDIR"/sim/lib;
fi
mkdir -p $WORKDIR/sim/lib;
mkdir $WORKDIR/sim/lib/work;
cd $WORKDIR/sim;
#
# Die Analyse ist der erste Schritt bei der Simulation eines Entwurfs.
# In dieser Phase wird der Entwurf auf Syntaxfehler hin untersucht und
# als Vorstufe die in dem als Elaboration bezeichneten Schritt
# benoetigten Dateien erzeugt und in den zuvor angelegten
# Verzeichnissen gespeichert. Hierzu ist es erforderlich, den Bezug
# zwischen den physisch vorhandenen Verzeichnissen
# ($WORKDIR/sim/lib/worklib usw.) und den in den VHDL-Modellen
# verwendeten logischen Bezeichnern herzustellen.  Dazu dient die
# Datei synopsys_sim.setup, die sich in dem Verzeicnis befinden muss,
# in dem vhdlan gestartet wird (z.B. in $WORKDIR/sim/).  
#
cp $WORKDIR/ini/synopsys_sim.setup $WORKDIR/sim/synopsys_sim.setup 
#
# Hier ein Beispiel fuer den Inhalt der Datei synopsys_sim.setup:
#   --------------------------------------------------------------------------
#  |  WORK     : $WORKDIR/sim/lib/worklib                                     |
#  |  -- weitere Bibliotheken sind moeglich, z.B.:                            |
#  |  -- MY_LIB   : $WORKDIR/sim/lib/mylib                                    |
#  |  -- PACK_LIB : $WORKDIR/sim/lib/packlib                                  |
#  |                                                                          |
#  |  SYNOPSYS : $SYNOPSYS_SIM/Pfad_zur_Bibliothek_SYNOPSYS (systemabhaengig) |
#  |  IEEE     : $SYNOPSYS_SIM/Pfad_zur_Bibliothek_IEEE (systemabhaengig)     |
#  |  SIMPRIM  :  /Pfad_zur_Simulationsbibliothek_SIMPRIM (systemabhaengig)   | 
#  |  UNISIM   :  /Pfad_zur_Simulationsbibliothek_SIMPRIM (systemabhaengig)   |
#  |                                                                          |
#  | -- Steuerung des Simulators:                                             |
#  |  ASSERT_IGNORE_WARNING=TRUE (fuer dlatch nicht erforderlich)             |
#  |  -- Controls the generation of messages in response to VHDL              |
#  |  -- assertion violations or report statements. The possible values for   |
#  |  -- this variable are NOTE, WARNING, ERROR, FAILURE, NOIGNORE,           |
#  |  -- or NOTSET.                                                           |
#  |                                                                          |
#  |  TIME_RESOLUTION=PS                                                      |
#   --------------------------------------------------------------------------
# 
# Die VHDL-Dateien muessen in der Reihenfolge der Abhaengigkeit
# voneinander analysiert werden.
# Bedeutung der verwendeten Optionen:
# -w      logischer Bezeichner der Bibliothek, in der die erzeugten Dateien
#         abgelegt werden
# -event  Eventsimulation
# -no_opt umfangreiche Tests des VHDL-Codes in der Debugging-Phase
# -nc     unterdrueckt Synopsys Copyright-Information
#
# Textausgaben mit dem Kommando echo erzeugen:
echo ">> Analyzing all VHDL files ... ";
echo
#
# VHDL-Dateien mit dem Kommando vhdlan analysieren: 
#
#    Library WORK
#    ============
#
vhdlan -event -no_opt -nc $WORKDIR/vhdlsrc/int_to_ascii.vhd
vhdlan -event -no_opt -nc $WORKDIR/vhdlsrc/delayPack.vhd
vhdlan -event -no_opt -nc $WORKDIR/vhdlsrc/delay.vhd
vhdlan -event -no_opt -nc $WORKDIR/vhdlsrc/n_delay.vhd
vhdlan -event -no_opt -nc $WORKDIR/vhdlsrc/n_delay-timesim.vhd
#vhdlan -event -no_opt -nc $WORKDIR/vhdlsrc/n_delay-deterministic.vhd
vhdlan -event -no_opt -nc $WORKDIR/vhdlsrc/func_tb.vhd
vhdlan -event -no_opt -nc $WORKDIR/vhdlsrc/func_tb-arch.vhd

cd $WORKDIR;
}
# ----------------------------------------------------------------------------------
#
elaboration_funcsim() {
echo
echo "Elaboration der Quelldateien (ausfuehrbare Datei erzeugen)"
echo
#
cd $WORKDIR/sim;
#
# Elaboration ab der Entity der Testbench "func_tb"
# auf der isun02:
#scs -nc -debug_all -time NS -time_resolution 1ps -executable func_tb WORK.func_tb
# die Option -executable bestimmt die Bezeichnung der zu erzeugenden
# ausfuehrbaren Datei und kann beliebig gewaehlt werden.
#
# ab der Version 2009.06 (nicht auf isun02 installiert):
vcs -q -nc -debug_all -time NS -time_resolution 1ps -executable func_tb WORK.func_tb
# -q unterdrueckt Compilerinformationen
cd $WORKDIR;
}
# ----------------------------------------------------------------------------------
#
funcsim() {
echo
echo "Funktionale Simulation der Quelldateien"
echo
cd $WORKDIR/sim;

# Es erleichtert die Arbeit, wenn man fuer den Simulator eine
# Initialisierungsdatei schreibt (functional.ini).
# Die Simulationsdatei wird entsprechend der Anweisungen in der
# Initialisierungsdatei ausgefuehrt;
#
./func_tb -oldui -include ../ini/delay.ini 
#
# Nun kann entweder DVE oder gtkwave gestartet werden, um die erzeugte
# Wave-Datei anzuzeigen:
#
# mit DVE:
# DVE-Preferenzfile loeschen (stoert nur)
if test -d "$HOME"/\.synopsys_dve_prefs.tcl;  then
rm -R "$HOME"/\.synopsys_dve_prefs.tcl;
fi
# wenn der Verlauf der Session festgelegt werden soll, dann dve starten, 
# durchklicken und vor Verlassen von dve die Session abspeichern (File->Save Session ...):
#dve -full64 -vpd functional.vpd
# 
# In welcher Weise dve ausgefuehrt wird, wird mit der Datei session.tcl festgelegt.
# Dann kann dve mit dieser Datei (Option -session) gestartet werden
#dve -full64 -session $WORKDIR/dve_ini/session.functional.vpd.tcl
#
# mit gtkwave:
# zunaechst wird die .vpd-Datei in das vcd-Format umgewandelt
vpd2vcd ./functional.vpd ./functional.vcd
# dann wird gtkwave gestartet (nicht auf der isun02, lokal ausfuehren!)
gtkwave functional.vcd
#
cd $WORKDIR;
}
# ----------------------------------------------------------------------------------

synthese() {
echo
echo "Synthese"
echo
#
#################################################
#
if test -d $WORKDIR/syn;  then
rm -r $WORKDIR/syn;
fi
mkdir -p $WORKDIR/syn/expdir
# der FPGA-Typ:
# wird im Synplify-Initialisierungsscript (Tcl-Script) verwendet
TECHNOLOGY=Spartan3A; export TECHNOLOGY;
PART=delay; export PART;
PACKAGE=FGG484; export PACKAGE;
SPEED_GRADE=-4; export SPEED_GRADE;
# die oberste Hierarchieebene (ebenfalls fuer das Tcl-Script):
#TOP=xc3s700an; export TOP;
TOP=n_delay; export TOP;
#
cd $WORKDIR/syn
synplify_premier -tcl $WORKDIR/ini/synplify.tcl -batch -verbose_log -log synplify_latch.log
#synplify_premier -tcl $WORKDIR/ini/synplify.tcl -verbose_log -log synplify_latch.log

#
}
# ----------------------------------------------------------------------------------

implement() {
echo
echo "Implementierung"
echo 
# ------------------------
UCFFILE='../ucf/delay'
IMPDIR=$WORKDIR/imp
TARGET_PART='xc3s700anfgg484-4'
#TOP=xc3s700an;
TOP=n_delay;
# ------------------------
if  test -d $IMPDIR;  then
rm -R $IMPDIR;
fi
mkdir $IMPDIR
cp $WORKDIR/syn/expdir/$TOP.edf $IMPDIR
cd $IMPDIR
#
edif2ngd -l synopsys ./$TOP.edf
# ------------------------
# mit ucf
ngdbuild -verbose -aul -a -p $TARGET_PART -uc $UCFFILE.ucf $TOP.ngo
#ngdbuild -quiet -uc $UCFFILE.ucf $TOP.ngo
# ohne ucf
#ngdbuild -verbose -aul -a -p $TARGET_PART $TOP.ngo
# ------------------------
map -cm speed -detail -u -o map.ncd $TOP.ngd $TOP.pcf
#map -cm speed -detail -o map.ncd $TOP.ngd $TOP.pcf
# ------------------------
#par -w  map.ncd $TOP.ncd $TOP.pcf # min. Rechenzeit
par -w -ol high map.ncd $TOP.ncd $TOP.pcf # max. Frequenz
# ------------------------
##trce -v 10 -u $TOP.ncd $TOP.pcf -o $TOP.twr
# ------------------------
bitgen -w $TOP.ncd
# ------------------------
netgen -mhf -ofmt vhdl -sim -tm $TOP -w $TOP $TOP.vhd
#
cd $WORKDIR
#
}
analyse_timesim() {
echo 
echo "Analyse der Dateien fuer die Timingsimulation"
echo
#
#
if test -d $WORKDIR/sim;  then
rm -R $WORKDIR/sim;
fi
mkdir -p $WORKDIR/sim/lib/work;
cd $WORKDIR/sim;
cp $WORKDIR/ini/synopsys_sim.setup $WORKDIR/sim/synopsys_sim.setup

vhdlan  -event -no_opt -nc $WORKDIR/vhdlsrc/delayPack.vhd
vhdlan  -event -no_opt -nc $WORKDIR/vhdlsrc/func_tb.vhd
vhdlan  -event -no_opt -nc $WORKDIR/vhdlsrc/func_tb-arch.vhd
vhdlan  -event -no_opt -nc $WORKDIR/imp/n_delay_sim.vhd

}

#
elaboration_timesim() {
echo
echo "Elaboration der Quelldateien fuer die Timingsimulation"
echo "(ausfuehrbare Datei erzeugen)"
echo
#
cd $WORKDIR/sim;
# 
echo ">> Compiling design ..."
# 
# Elaboration ab der Entity der Testbench "time_tb"
# auf isun02:
#scs -nc -debug_all -executable xc3s700an WORK.time_tb
# oder mit vielen Ausgaben:
#scs -nc -verb -debug_all -executable  xc3s700an WORK.time_tb
#
# ab der Version 2009.06 (nicht auf isun02 installiert):
vcs -q -nc -debug_all -executable delay WORK.func_tb
# -q unterdrueckt Compilerinformationen
cd $WORKDIR;
}
#
#
timesim() {
    echo "Timingsimulation"
#
cd $WORKDIR/sim;
echo
#
# GUI fuer interaktive Simulation:
# -------------------------------
#dve -full64 -toolexe $WORKDIR/sim/xc3s700an -toolargs "-sdf /TIME_TB/LATCH_INSTANCE/:$WORKDIR/imp/xc3s700an.sdf"
#
# Post-processing-Simulation:
# --------------------------
echo ">> Starting Simulator and GUI ..."
#
# Simulationsprogramm mit sdf-Datei und entsprechend der Anweisungen im 
# Initialisierungsfile  ausfuehren:
#
# mit VCS MX Simulator Version D-2010.06:
$WORKDIR/sim/delay -oldui -sdf /func_tb/delay_instance/:$WORKDIR/imp/n_delay_sim.sdf -include $WORKDIR/ini/delay.ini
#
# DVE-Preferenzfile loeschen (stoert nur)
rm $HOME/\.synopsys_dve_prefs.tcl
#
# GUI mit dem VPD-File starten
# In welcher Weise dve ausgefuehrt wird, wird mit der Datei session_xc3s700an.tcl festgelegt.
# Die Session muss zuvor durchgeklickt werden, dann wird kopiert: 
# sim/DVEfiles/session.tcl -> /sim/dve_ini/session_xc3s700an.tcl
#dve -full64 -session $WORKDIR/dve_ini/session_muller_C.tcl
#
# oder mit gtkwave:
# zunaechst wird die .vpd-Datei in das vcd-Format umgewandelt
echo ""
echo "Achtung! Auf ipc694 ausfuehren!"
echo ""
vpd2vcd +morevhdlf ./functional.vpd ./functional.vcd
#
# dann wird gtkwave gestartet - lokal ausfuehren!):
#gtkwave xc3s700an_waves.vcd
gtkwave functional.vcd
#
}


download() {
echo ""
echo "Konfiguration des FPGA (download)"
echo "Achtung! Lokal ausfuehren!"
echo ""
#
BITFILE=n_delay.bit
IMPDIR=$WORKDIR/imp
# ------------------------
#
echo "setMode -bs" > /tmp/usbdownload
echo "setCable -port auto" >> /tmp/usbdownload
echo "Identify" >> /tmp/usbdownload
echo "identifyMPM" >> /tmp/usbdownload
echo "assignFile -p 1 -file $IMPDIR/$BITFILE" >> /tmp/usbdownload
echo "Program -p 1 -onlyFpga" >> /tmp/usbdownload
echo "quit" >> /tmp/usbdownload
impact -batch < /tmp/usbdownload 
rm /tmp/usbdownloadnalyse_funcsim
rm _impactbatch.log
#
#
}
testen() {
echo
echo "Test des Designs mit dem Experimentalsystem"
echo "Achtung! Lokal ausfuehren!"
echo ""
echo
#
echo
echo "Aufruf der Hilfe mit h, Verlassen des Programms mit q"
echo
$WORKDIR/csrc/eb_example
}
#unset $WORKDIR

hilfe() {
echo 
echo "Die als Option spezifizierten Funktionen werden in der"
echo "Reihenfolge ausgefuehrt, in der sie angegeben werden."
echo "Optionen:"

echo "-fa  Analyse der Quelldateien"
echo "-fe  Elaboration der Quelldateien (ausfuehrbare Datei erzeugen)"
echo "-fs  Funktionale Simulation der Quelldateien"
echo "-s   Synthese"
echo "-i   Implementierung "
echo "-ta  Analyse der Dateien fuer die Timingsimulation"
echo "-te  Elaboration der Dateien fuer die Timingsimulation"
echo "-ts  Timingsimulation"
echo "-d   Konfiguration des FPGA (download)"
echo "-t   Test des Designs mit dem Experimentalsystem"
echo "-faes Analyse, Elaboration und funktionale Simulation der Quelldateien"
echo "-h   Hilfe"
}
fehler() {
echo ""
echo " Achtung!"
echo " Die Option $i ist ungueltig! "
echo " gueltige Optionen werden mit "
echo " der Option -h angezeigt      "
echo ""
}
#
#
# Ablaufsteuerung
# ---------------
for i in "$@"; do 
case $i in
  -fa) analyse_funcsim;;
  -fe) elaboration_funcsim;;
  -fs) funcsim;;
  -s)  synthese;;
  -i)  implement;;
  -ta) analyse_timesim;;
  -te) elaboration_timesim;;
  -ts) timesim;;
  -d)  download;;
  -t)  testen;;
  -h)  hilfe;;
  -faes) analyse_funcsim; elaboration_funcsim, funcsim;;
  *)   fehler;;
esac
done
echo
