#ifdef __cplusplus
extern "C" {
#endif

int main(int argc, char **argv)
{
extern void save_restore_check(int, char**);

extern void scPreMain(int, char**);
extern int scsim_main(int, char**);

    save_restore_check(argc, argv);
    scPreMain(argc, argv);
    return scsim_main(argc, argv);
}

#ifdef __cplusplus
}
#endif
