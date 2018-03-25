#include "scscomm.h"
#ifdef __cplusplus
extern "C" {
#endif
extern char* strcpy(char*, const char*);
void scsim_comm_genfunc(scsim_communication_data_t *s) {
   s->worklibPath       = (char *) sc_mem_malloc(5);
   strcpy(s->worklibPath, "WORK");
   s->entityName        = (char *) sc_mem_malloc(23);
   strcpy(s->entityName,  "DUMMY_MHDL_CFG_FUNC_TB");
   s->architectureName  = (char *) 0;
   s->designUnitType = 19;
   s->topSimFileName    = (char *) sc_mem_malloc(51);
   strcpy(s->topSimFileName, "WORK_MHDL_SNPS_INTERNAL.DUMMY_MHDL_CFG_FUNC_TB.sim");
   s->timebase = 2;
   s->ignorelowres = 1;
   s->timebase_str      = (char *) sc_mem_malloc(3);
   strcpy(s->timebase_str, "NS");
   s->tres_str      = (char *) sc_mem_malloc(5);
   strcpy(s->tres_str, "1 PS");
   s->tres_time = 1;
   s->tres_timebase = 1;
   s->textio_timebase_unit = 0;
  s->upf_enabled = 0;
   s->isMixedHDL = 0;
   s->mhdlDatVerilog = 0;
   s->partitionFileName = (char *) 0;
   s->genericsFileName = (char *) 0;
   s->cmDirName  = (char *) sc_mem_malloc(10);
   strcpy(s->cmDirName, "delay.vdb");
   s->cmReportName = (char *) 0;
   s->isCovXmlDb  = 1;
   s->cmLogName = (char *) 0;
   s->monsigsFileCount  = 0;
   s->monsigsFileNames  = (char **) 0;
   s->vhpiLibStringCount = 0;
   s->vhpiLibStrings     = (char **) 0;
   s->UserName = (char *) sc_mem_malloc(7);
   strcpy(s->UserName, "vlsi02");
   s->CreationDate = (char *) sc_mem_malloc(25);
   strcpy(s->CreationDate, "Thu Feb  1 17:24:56 2018");
   s->Hostname = (char *) sc_mem_malloc(26);
   strcpy(s->Hostname, "ipc694.inf-ra.uni-jena.de");
   s->SciroccoVersion = (char *) 0;
   s->CompilerName = (char *) sc_mem_malloc(4);
   strcpy(s->CompilerName, "gcc");
   s->CompilerVersion = (char *) sc_mem_malloc(39);
   strcpy(s->CompilerVersion, "GNUC 4.1.2 20080704 (Red Hat 4.1.2-55)");
   s->CompilerOptions = (char *) sc_mem_malloc(6);
   strcpy(s->CompilerOptions, "-c -O");
   s->LoaderName = (char *) sc_mem_malloc(4);
   strcpy(s->LoaderName, "g++");
   s->LoaderVersion = (char *) 0;
   s->LoaderOptions = (char *) sc_mem_malloc(17);
   strcpy(s->LoaderOptions, "-Wl,-E -lpthread");
   s->ElaborationOptions = (char *) sc_mem_malloc(49);
   strcpy(s->ElaborationOptions, "-q -nc -debug_all -executable delay WORK.func_tb");
   s->VhdlOptions = (char *) sc_mem_malloc(176);
   strcpy(s->VhdlOptions, "-mxunielab -uni_make -nc -nc -q -nc -exe delay -uum -vhtop WORK.dummy_mhdl_cfg_FUNC_TB -elaboration_options /tmp/vcs_20180201162450_32198/elaboptfile_32198 -cm_xmldb -debug 4 ");
   s->VerilogOptions = (char *) 0;
   s->PartitionCount  = 0;
   s->Partitions  = (char **) 0;
   s->twoState = 0;
   s->perf = 1;
   s->event_perf_mode = 14;
   s->db = 1;
   s->hasOvaDummyTop = 0;
   s->isInterpreted = 0;
   s->platformVersion = (char *) sc_mem_malloc(21);
   strcpy(s->platformVersion, "Linux 2.6.18-363.el5");
   s->platform = (char *) sc_mem_malloc(6);
   strcpy(s->platform, "amd64");
   s->vcsHome = (char *) sc_mem_malloc(21);
   strcpy(s->vcsHome, "/data/cae/sn10/vcsmx");
   s->m_total_processes = 0;
   s->verWork = (char *) sc_mem_malloc(13);
   strcpy(s->verWork, "delay.daidir");
   s->scsimCompileDirName  = (char *) sc_mem_malloc(30);
   strcpy(s->scsimCompileDirName, "/home/vlsi02/vlsi/n_delay/sim");
   s->MhdlVerilogTopCount  = 0;
   s->MhdlVerilogTopNames  = (char **) 0;
   s->MhdlVhdlTopCount  = 1;
   s->MhdlVhdlTopNames = (char **) sc_mem_malloc(8*1);
   s->MhdlVhdlTopNames[0] = "WORK.dummy_mhdl_cfg_FUNC_TB";
   s->unifiedUseMod = 1;
   s->svaBindEnable = 0;
   s->isSlave = 0;
   s->lic_scsi = 0;
   s->isScsfpga = 0;
   s->mtvh = 0;
   s->pvmx = 0;
   s->vhdlthreads = 2;
   s->isUCLI = 0;
   s->isGUI = 0;
   s->smart_analysis = 0;
   s->debugLevel = 4;
   s->vdbgWatch = 0;
   s->isFsdbSet = 0;
   s->isFsdbOldSet = 0;
   s->ScsWorkDir = (char *) sc_mem_malloc(30);
   strcpy(s->ScsWorkDir, "/home/vlsi02/vlsi/n_delay/sim");
   s->sp_mem_size = 0;
   s->proc_split_num = 0;
   s->LcaLicenseEnabled = 0;
   s->fProfileNew = 0;
   s->accessCheck = 0;
   s->newProfArgs = (char *) 0;
   s->mhdl_root_net_opt = 0;
   s->mhdl_alias_highconn = 0;
   s->mxunielab = 1;
   s->withcheck = 0;
    s->dataBaseDirName = (char *) sc_mem_malloc(26);
    strcpy(s->dataBaseDirName, "delay.daidir/scsim.db.dir");
}

int scsim_comm_is_slave() {
   return 0;
}

#include "runtime.h"

extern int g_dynamic_phases;
extern int g_pvhdl;
extern int g_pvhdl2cdl;

int ctl_Simulate()
{
    extern int (*vhdl_Simulate_fptr_0[])();
    return vhdl_Simulate_fptr_0[g_dynamic_phases]();
}

int mhdl_Simulate()
{
    return 0;
}

int pvmx_Simulate()
{
     return 0;}

int pmhdl_Simulate()
{
     return 0;}

int vhmc_Simulate(simtime_t runtime)
{
    extern int in_simulate;
    int status = 0; 
    in_simulate = 0;
    return status;
}

unsigned int gNumOfSignals() { return 184;}
unsigned int gNumOfDerivedSignals() { return 0;}
#ifdef __cplusplus
}
#endif
