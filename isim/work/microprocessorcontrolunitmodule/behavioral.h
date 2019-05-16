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

#ifndef H_Work_microprocessorcontrolunitmodule_behavioral_H
#define H_Work_microprocessorcontrolunitmodule_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_microprocessorcontrolunitmodule_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[9];

  char *t0;
  char *t1;
  char *t2;
  char *t3;
  char *t4;
  char *t5;
  char *t6;
    HSim__s1 SA[11];
    Work_microprocessorcontrolunitmodule_behavioral(const char * name);
    ~Work_microprocessorcontrolunitmodule_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_microprocessorcontrolunitmodule_behavioral(const char *name);

#endif
