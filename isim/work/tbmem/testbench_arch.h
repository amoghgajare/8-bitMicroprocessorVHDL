////////////////////////////////////////////////////////////////////////////////
//   ____  ____   
//  /   /\/   /  
// /___/  \  /   
// \   \   \/  
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /---/   /\     
// \   \  /  \  
//  \___\/\___\
////////////////////////////////////////////////////////////////////////////////

#ifndef H_Work_tbmem_testbench_arch_H
#define H_Work_tbmem_testbench_arch_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_tbmem_testbench_arch: public HSim__s6 {
public:


HSimFileVar Results;
HSim__s4 CV;
HSim__s4 CZ;
HSim__s4 C12;
    HSim__s1 SA[5];
    Work_tbmem_testbench_arch(const char * name);
    ~Work_tbmem_testbench_arch();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_tbmem_testbench_arch(const char *name);

#endif
