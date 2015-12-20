#ifndef _RTMS_H_
#define _RTMS_H_

#include "board.h"

typedef struct
{
  u16 tmin;
  u16 tmax;
  u16 tcur;
  u16 told;
  u16 runtime;
} Runtime_t;

#define RTMS_MEASURE_START(run) tmph = TIM2->CNTRH; tmpl = TIM2->CNTRL; tmp = (u16)(tmpl); tmp |= (u16)((u16)tmph << 8); run.told = tmp;

#define RTMS_DECLARE(run) Runtime_t run

#define RTMS_DECLARE_EXTERN(run) extern Runtime_t run; extern u16 tmph;  extern u16 tmpl; extern u16 tmp
                            
#define RTMS_INIT(run)  run.tmin = 65535; run.tmax = 0; run.tcur = 0; run.runtime = 0; run.told = 0;  

                                  
#define RTMS_MEASURE_STOP(run) { tmph = TIM2->CNTRH; tmpl = TIM2->CNTRL; tmp = (u16)(tmpl); tmp |= (u16)((u16)tmph << 8); \
                                 run.tcur = tmp;                                                                          \
                                 if(run.told > run.tcur) {run.runtime = (0xFFFF - run.told) + run.tcur;}                  \
                                 else run.runtime = run.tcur - run.told;                                                  \
                                 if(run.tmin > run.runtime) run.tmin = run.runtime;                                       \
                                 if(run.tmax < run.runtime) run.tmax = run.runtime;}

#endif