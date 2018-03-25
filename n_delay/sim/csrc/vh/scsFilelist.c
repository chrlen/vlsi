#include "stdio.h"
#ifdef __cplusplus
extern "C" {
#endif
extern char at_least_one_object_file;
extern void *kernel_scs_file_ht_new(const void *, int);
extern int kernel_scs_file_ht_get(void *, const char *, int *);
extern int  strcmp(const char*, const char*);
  typedef struct {
    char* dFileName;
  } lPkgFileInfoStruct;

  typedef struct {
    char* dFileName;
    char* dRealFileName;
    long dFileOffset;
    int dFileSize;
    int dFileModTime;
    unsigned int simFlag;
  } lFileInfoStruct;

static int lNumOfScsFiles;
  static lFileInfoStruct lFInfoArr[] = {
  {"synopsys_sim.setup_0", "./synopsys_sim.setup", 6329, 256, 1517502289, 0},
  {"synopsys_sim.setup_1", "/data/cae/sn10/vcsmx/bin/synopsys_sim.setup", 6585, 3617, 1274759299, 0},
  {"/home/vlsi02/vlsi/n_delay//sim/lib/work/64/FUNC_TB.sim", "", 0, 6329, 0, 1},
  {"/home/vlsi02/vlsi/n_delay//sim/lib/work/64/DELAYPACK__.sim", "", 10202, 8172, 0, 1},
  {"/home/vlsi02/vlsi/n_delay//sim/lib/work/64/DELAYPACK.sim", "", 18374, 7921, 0, 1},
  {"delay.daidir/scsim.db.dir/DUMMY_MHDL_CFG_FUNC_TB.sim", "", 26295, 52745, 0, 0},
  {"/home/vlsi02/vlsi/n_delay//sim/lib/work/64/FUNC_TB__ARCH.sim", "", 79040, 9337, 0, 1},
  {"amd64/packages/VITAL2000/lib/64/VITAL_TIMING__.sim", "", 88377, 550049, 0, 0},
  {"amd64/packages/VITAL2000/lib/64/VITAL_TIMING.sim", "", 638426, 230684, 0, 0},
  {"/data/cae/ise13_1/ISE/vhdl/lib/sn10/RHEL5/simprim/64/VCOMPONENTS.sim", "", 869110, 32287141, 0, 1},
  {"amd64/packages/VITAL2000/lib/64/VITAL_PRIMITIVES__.sim", "", 33156251, 1685700, 0, 0},
  {"amd64/packages/IEEE/lib/64/STD_LOGIC_UNSIGNED__.sim", "", 34841951, 106714, 0, 0},
  {"amd64/packages/IEEE/lib/64/STD_LOGIC_UNSIGNED.sim", "", 34948665, 51546, 0, 0},
  {"amd64/packages/VITAL2000/lib/64/VITAL_PRIMITIVES.sim", "", 35000211, 322124, 0, 0},
  {"/data/cae/ise13_1/ISE/vhdl/lib/sn10/RHEL5/simprim/64/VPACKAGE__.sim", "", 35322335, 368668, 0, 1},
  {"/data/cae/ise13_1/ISE/vhdl/lib/sn10/RHEL5/simprim/64/VPACKAGE.sim", "", 35691003, 174350, 0, 1},
  {"/home/vlsi02/vlsi/n_delay//sim/lib/work/64/N_DELAY.sim", "", 35865353, 7782, 0, 1},
  {"/home/vlsi02/vlsi/n_delay//sim/lib/work/64/N_DELAY__STRUCTURE.sim", "", 35873135, 48782, 0, 1},
  {"/data/cae/ise13_1/ISE/vhdl/lib/sn10/RHEL5/simprim/64/X_BUF.sim", "", 35921917, 12405, 0, 1},
  {"/data/cae/ise13_1/ISE/vhdl/lib/sn10/RHEL5/simprim/64/X_BUF__X_BUF_V.sim", "", 35934322, 27919, 0, 1},
  {"/data/cae/ise13_1/ISE/vhdl/lib/sn10/RHEL5/simprim/64/X_LUT4.sim", "", 35962241, 18908, 0, 1},
  {"/data/cae/ise13_1/ISE/vhdl/lib/sn10/RHEL5/simprim/64/X_LUT4__X_LUT4_V.sim", "", 35981149, 49067, 0, 1},
  {"/data/cae/ise13_1/ISE/vhdl/lib/sn10/RHEL5/simprim/64/X_ONE.sim", "", 36030216, 8678, 0, 1},
  {"/data/cae/ise13_1/ISE/vhdl/lib/sn10/RHEL5/simprim/64/X_ONE__X_ONE_V.sim", "", 36038894, 10254, 0, 1},
  {"/data/cae/ise13_1/ISE/vhdl/lib/sn10/RHEL5/simprim/64/X_ROC.sim", "", 36049148, 10169, 0, 1},
  {"/data/cae/ise13_1/ISE/vhdl/lib/sn10/RHEL5/simprim/64/X_ROC__X_ROC_V.sim", "", 36059317, 13134, 0, 1},
  {"/data/cae/ise13_1/ISE/vhdl/lib/sn10/RHEL5/simprim/64/X_TOC.sim", "", 36072451, 10169, 0, 1},
  {"/data/cae/ise13_1/ISE/vhdl/lib/sn10/RHEL5/simprim/64/X_TOC__X_TOC_V.sim", "", 36082620, 12428, 0, 1},

  };
  static lPkgFileInfoStruct lPkgFileInfoArr[] = {
  {"/home/vlsi02/vlsi/n_delay//sim/lib/work/64/DELAYPACK__.sim"},
  {"amd64/packages/VITAL2000/lib/64/VITAL_TIMING__.sim"},
  {"amd64/packages/VITAL2000/lib/64/VITAL_PRIMITIVES__.sim"},
  {"amd64/packages/IEEE/lib/64/STD_LOGIC_UNSIGNED__.sim"},
  {"/data/cae/ise13_1/ISE/vhdl/lib/sn10/RHEL5/simprim/64/VPACKAGE__.sim"},

  };
int gGetFileInfo(char* xFileName, long xTimeStamp, long* xFileOffsetPtr, int* xFileSizePtr, int xCheckInPkgSimFiles,  char **xRealFileName)
{
  int j, lNumOfPkgSimFiles;
  static void *ht = 0;
  static int i = 0;
  static int k = 0;
at_least_one_object_file = 1;
  lNumOfScsFiles = 28;
  lNumOfPkgSimFiles = 5;
  if (xCheckInPkgSimFiles)
  {
     for (j = 0; j < lNumOfPkgSimFiles; j++)
     {
       char* lFName;
       lFName = lPkgFileInfoArr[k].dFileName;
       if (strcmp(lFName, xFileName) == 0)
           return 0;
       k = (k + 1) % lNumOfPkgSimFiles;
     }
     return 1;
  }
  if (!ht)
  {
    ht  = kernel_scs_file_ht_new(lFInfoArr, lNumOfScsFiles);
  }
  if (ht && (kernel_scs_file_ht_get(ht, xFileName, &i) == 0))
  { /* found it! The indicator 'i' was set properly. */
    if (xRealFileName)
        *xRealFileName = lFInfoArr[i].dRealFileName;
    *xFileSizePtr = lFInfoArr[i].dFileSize;
    *xFileOffsetPtr = lFInfoArr[i].dFileOffset;
    return 0;
  }
  return 1;
}
int getNextSimFile(char **fn, long *offset)
{
  static int cur;
  for ( ; cur < lNumOfScsFiles; ) {
    if (!lFInfoArr[cur].simFlag) {
      cur++;
      continue;
    }
    *fn = lFInfoArr[cur].dFileName;
    *offset = lFInfoArr[cur].dFileOffset;
    cur++;
    return 1;
  }
  return 0;
}

#ifdef __cplusplus
}
#endif
