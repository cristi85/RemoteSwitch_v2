# ST Visual Debugger Generated MAKE File, based on DistanceSensor.stp

ifeq ($(CFG), )
CFG=Debug
$(warning ***No configuration specified. Defaulting to $(CFG)***)
endif

ToolsetRoot=d:\PROGRA~1\COSMIC\CXSTM8~1
ToolsetBin=d:\Program Files (x86)\COSMIC\CXSTM8_32K
ToolsetInc=d:\Program Files (x86)\COSMIC\CXSTM8_32K\Hstm8
ToolsetLib=d:\Program Files (x86)\COSMIC\CXSTM8_32K\Lib
ToolsetIncOpts=-i"d:\Program Files (x86)\COSMIC\CXSTM8_32K\Hstm8" 
ToolsetLibOpts=-l"d:\Program Files (x86)\COSMIC\CXSTM8_32K\Lib" 
ObjectExt=o
OutputExt=elf
InputName=$(basename $(notdir $<))


# 
# Debug
# 
ifeq "$(CFG)" "Debug"


OutputPath=Debug
ProjectSFile=DistanceSensor
TargetSName=$(ProjectSFile)
TargetFName=$(ProjectSFile).elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  +warn +mods0 +debug -pxp +compact +split -pp -l -dSTM8S003 -i..\..\src -i..\..\inc -i..\..\..\..\libraries\stm8s_stdperiph_driver\inc -i..\..\src -i..\..\src\osa -i..\..\src\osa\port -i..\..\src\osa\port\stm8 $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $<
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  -xx -l $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) $(ProjectSFile).elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

Debug\stm8s_flash.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_flash.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\calibdata.$(ObjectExt) : ..\..\src\calibdata.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\osa.$(ObjectExt) : ..\..\src\osa\osa.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\osa\osa.h ..\..\src\osacfg.h ..\..\src\osa\port\osa_include.h ..\..\src\osa\port\stm8\osa_stm8_cosmic.h ..\..\src\osa\kernel\osa_oldnames.h ..\..\src\osa\kernel\system\osa_system.h ..\..\src\osa\kernel\system\osa_tasks.h ..\..\src\osa\kernel\events\osa_bsem.h ..\..\src\osa\kernel\events\osa_csem.h ..\..\src\osa\kernel\events\osa_flag.h ..\..\src\osa\kernel\events\osa_msg.h ..\..\src\osa\kernel\events\osa_queue.h ..\..\src\osa\kernel\events\osa_smsg.h ..\..\src\osa\kernel\events\osa_squeue.h ..\..\src\osa\kernel\timers\osa_stimer.h ..\..\src\osa\kernel\timers\osa_stimer_old.h ..\..\src\osa\kernel\timers\osa_dtimer.h ..\..\src\osa\kernel\timers\osa_qtimer.h ..\..\src\osa\kernel\timers\osa_ttimer.h ..\..\src\osa\kernel\timers\osa_timer.h ..\..\src\osa\port\osa_include.c ..\..\src\osa\port\stm8\osa_stm8_cosmic.c ..\..\src\osa\kernel\timers\osa_dtimer.c ..\..\src\osa\kernel\timers\osa_qtimer.c ..\..\src\osa\kernel\timers\osa_stimer.c ..\..\src\osa\kernel\timers\osa_ttimer.c ..\..\src\osa\kernel\events\osa_squeue.c ..\..\src\osa\kernel\events\osa_queue.c ..\..\src\osa\kernel\events\osa_csem.c ..\..\src\osa\kernel\events\osa_bsem.c ..\..\src\osa\kernel\system\osa_system.c ..\..\src\osa\kernel\system\osa_tasks.c 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_wwdg.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_wwdg.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\display.$(ObjectExt) : ..\..\src\display.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\display_conf.h ..\..\src\7seg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\flashmngr.$(ObjectExt) : ..\..\src\flashmngr.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\sst25vf016b75.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\sst25vf016b75.$(ObjectExt) : ..\..\src\sst25vf016b75.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\delay.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\onewire.$(ObjectExt) : ..\..\src\onewire.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\delay.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\softi2c.$(ObjectExt) : ..\..\src\softi2c.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\delay.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_spi.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_spi.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\ds3231m_rtc.$(ObjectExt) : ..\..\src\ds3231m_rtc.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\softi2c.h ..\..\src\delay.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_uart1.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_uart1.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\7seg.$(ObjectExt) : ..\..\src\7seg.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\delay.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim1.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim1.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\config.$(ObjectExt) : ..\..\src\config.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim4.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim4.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim2.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim2.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\ds18b20.$(ObjectExt) : ..\..\src\ds18b20.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\onewire.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\delay.$(ObjectExt) : ..\..\src\delay.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\main.$(ObjectExt) : ..\..\src\main.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\stm8s_it.h ..\..\src\config.h ..\..\src\delay.h ..\..\src\ds18b20.h ..\..\src\display.h ..\..\src\7seg.h ..\..\src\ds3231m_rtc.h ..\..\src\flashmngr.h ..\..\src\osa\osa.h ..\..\src\osacfg.h ..\..\src\osa\port\osa_include.h ..\..\src\osa\port\stm8\osa_stm8_cosmic.h ..\..\src\osa\kernel\osa_oldnames.h ..\..\src\osa\kernel\system\osa_system.h ..\..\src\osa\kernel\system\osa_tasks.h ..\..\src\osa\kernel\events\osa_bsem.h ..\..\src\osa\kernel\events\osa_csem.h ..\..\src\osa\kernel\events\osa_flag.h ..\..\src\osa\kernel\events\osa_msg.h ..\..\src\osa\kernel\events\osa_queue.h ..\..\src\osa\kernel\events\osa_smsg.h ..\..\src\osa\kernel\events\osa_squeue.h ..\..\src\osa\kernel\timers\osa_stimer.h ..\..\src\osa\kernel\timers\osa_stimer_old.h ..\..\src\osa\kernel\timers\osa_dtimer.h ..\..\src\osa\kernel\timers\osa_qtimer.h ..\..\src\osa\kernel\timers\osa_ttimer.h ..\..\src\osa\kernel\timers\osa_timer.h ..\..\src\calibdata.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8_interrupt_vector.$(ObjectExt) : ..\..\src\stm8_interrupt_vector.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\stm8s_it.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_it.$(ObjectExt) : ..\..\src\stm8s_it.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\stm8s_it.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\board.h ..\..\src\ds18b20.h ..\..\src\osa\osa.h ..\..\src\osacfg.h ..\..\src\osa\port\osa_include.h ..\..\src\osa\port\stm8\osa_stm8_cosmic.h ..\..\src\osa\kernel\osa_oldnames.h ..\..\src\osa\kernel\system\osa_system.h ..\..\src\osa\kernel\system\osa_tasks.h ..\..\src\osa\kernel\events\osa_bsem.h ..\..\src\osa\kernel\events\osa_csem.h ..\..\src\osa\kernel\events\osa_flag.h ..\..\src\osa\kernel\events\osa_msg.h ..\..\src\osa\kernel\events\osa_queue.h ..\..\src\osa\kernel\events\osa_smsg.h ..\..\src\osa\kernel\events\osa_squeue.h ..\..\src\osa\kernel\timers\osa_stimer.h ..\..\src\osa\kernel\timers\osa_stimer_old.h ..\..\src\osa\kernel\timers\osa_dtimer.h ..\..\src\osa\kernel\timers\osa_qtimer.h ..\..\src\osa\kernel\timers\osa_ttimer.h ..\..\src\osa\kernel\timers\osa_timer.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_adc1.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_adc1.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_clk.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_clk.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_gpio.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_gpio.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

$(ProjectSFile).elf :  $(OutputPath)\stm8s_flash.o $(OutputPath)\calibdata.o $(OutputPath)\osa.o $(OutputPath)\stm8s_wwdg.o $(OutputPath)\display.o $(OutputPath)\flashmngr.o $(OutputPath)\sst25vf016b75.o $(OutputPath)\onewire.o $(OutputPath)\softi2c.o $(OutputPath)\stm8s_spi.o $(OutputPath)\ds3231m_rtc.o $(OutputPath)\stm8s_uart1.o $(OutputPath)\7seg.o $(OutputPath)\stm8s_tim1.o $(OutputPath)\config.o $(OutputPath)\stm8s_tim4.o $(OutputPath)\stm8s_tim2.o $(OutputPath)\ds18b20.o $(OutputPath)\delay.o $(OutputPath)\main.o $(OutputPath)\stm8_interrupt_vector.o $(OutputPath)\stm8s_it.o $(OutputPath)\stm8s_adc1.o $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\DistanceSensor.lkf
	$(ToolsetBin)\clnk  $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 -m$(OutputPath)\$(TargetSName).map $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\stm8s_flash.o
	-@erase $(OutputPath)\calibdata.o
	-@erase $(OutputPath)\osa.o
	-@erase $(OutputPath)\stm8s_wwdg.o
	-@erase $(OutputPath)\display.o
	-@erase $(OutputPath)\flashmngr.o
	-@erase $(OutputPath)\sst25vf016b75.o
	-@erase $(OutputPath)\onewire.o
	-@erase $(OutputPath)\softi2c.o
	-@erase $(OutputPath)\stm8s_spi.o
	-@erase $(OutputPath)\ds3231m_rtc.o
	-@erase $(OutputPath)\stm8s_uart1.o
	-@erase $(OutputPath)\7seg.o
	-@erase $(OutputPath)\stm8s_tim1.o
	-@erase $(OutputPath)\config.o
	-@erase $(OutputPath)\stm8s_tim4.o
	-@erase $(OutputPath)\stm8s_tim2.o
	-@erase $(OutputPath)\ds18b20.o
	-@erase $(OutputPath)\delay.o
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\stm8_interrupt_vector.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\stm8s_adc1.o
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\DistanceSensor.elf
	-@erase $(OutputPath)\DistanceSensor.elf
	-@erase $(OutputPath)\DistanceSensor.map
	-@erase $(OutputPath)\stm8s_flash.ls
	-@erase $(OutputPath)\calibdata.ls
	-@erase $(OutputPath)\osa.ls
	-@erase $(OutputPath)\stm8s_wwdg.ls
	-@erase $(OutputPath)\display.ls
	-@erase $(OutputPath)\flashmngr.ls
	-@erase $(OutputPath)\sst25vf016b75.ls
	-@erase $(OutputPath)\onewire.ls
	-@erase $(OutputPath)\softi2c.ls
	-@erase $(OutputPath)\stm8s_spi.ls
	-@erase $(OutputPath)\ds3231m_rtc.ls
	-@erase $(OutputPath)\stm8s_uart1.ls
	-@erase $(OutputPath)\7seg.ls
	-@erase $(OutputPath)\stm8s_tim1.ls
	-@erase $(OutputPath)\config.ls
	-@erase $(OutputPath)\stm8s_tim4.ls
	-@erase $(OutputPath)\stm8s_tim2.ls
	-@erase $(OutputPath)\ds18b20.ls
	-@erase $(OutputPath)\delay.ls
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\stm8_interrupt_vector.ls
	-@erase $(OutputPath)\stm8s_it.ls
	-@erase $(OutputPath)\stm8s_adc1.ls
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
endif

# 
# Release
# 
ifeq "$(CFG)" "Release"


OutputPath=Release
ProjectSFile=DistanceSensor
TargetSName=adc
TargetFName=adc.elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  +mods0 -pp -i..\..\src -i..\..\inc -i..\..\..\..\libraries\stm8s_stdperiph_driver\inc $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $<
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) adc.elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

Release\stm8s_flash.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_flash.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\calibdata.$(ObjectExt) : ..\..\src\calibdata.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\osa.$(ObjectExt) : ..\..\src\osa\osa.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\osa\osa.h ..\..\src\osacfg.h ..\..\src\osa\port\osa_include.h ..\..\src\osa\port\stm8\osa_stm8_cosmic.h ..\..\src\osa\kernel\osa_oldnames.h ..\..\src\osa\kernel\system\osa_system.h ..\..\src\osa\kernel\system\osa_tasks.h ..\..\src\osa\kernel\events\osa_bsem.h ..\..\src\osa\kernel\events\osa_csem.h ..\..\src\osa\kernel\events\osa_flag.h ..\..\src\osa\kernel\events\osa_msg.h ..\..\src\osa\kernel\events\osa_queue.h ..\..\src\osa\kernel\events\osa_smsg.h ..\..\src\osa\kernel\events\osa_squeue.h ..\..\src\osa\kernel\timers\osa_stimer.h ..\..\src\osa\kernel\timers\osa_stimer_old.h ..\..\src\osa\kernel\timers\osa_dtimer.h ..\..\src\osa\kernel\timers\osa_qtimer.h ..\..\src\osa\kernel\timers\osa_ttimer.h ..\..\src\osa\kernel\timers\osa_timer.h ..\..\src\osa\port\osa_include.c ..\..\src\osa\port\stm8\osa_stm8_cosmic.c ..\..\src\osa\kernel\timers\osa_dtimer.c ..\..\src\osa\kernel\timers\osa_qtimer.c ..\..\src\osa\kernel\timers\osa_stimer.c ..\..\src\osa\kernel\timers\osa_ttimer.c ..\..\src\osa\kernel\events\osa_squeue.c ..\..\src\osa\kernel\events\osa_queue.c ..\..\src\osa\kernel\events\osa_csem.c ..\..\src\osa\kernel\events\osa_bsem.c ..\..\src\osa\kernel\system\osa_system.c ..\..\src\osa\kernel\system\osa_tasks.c 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_wwdg.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_wwdg.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\display.$(ObjectExt) : ..\..\src\display.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\display_conf.h ..\..\src\7seg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\flashmngr.$(ObjectExt) : ..\..\src\flashmngr.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\sst25vf016b75.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\sst25vf016b75.$(ObjectExt) : ..\..\src\sst25vf016b75.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\delay.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\onewire.$(ObjectExt) : ..\..\src\onewire.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\delay.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\softi2c.$(ObjectExt) : ..\..\src\softi2c.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\delay.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_spi.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_spi.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\ds3231m_rtc.$(ObjectExt) : ..\..\src\ds3231m_rtc.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\softi2c.h ..\..\src\delay.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_uart1.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_uart1.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\7seg.$(ObjectExt) : ..\..\src\7seg.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\delay.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim1.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim1.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\config.$(ObjectExt) : ..\..\src\config.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim4.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim4.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim2.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim2.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\ds18b20.$(ObjectExt) : ..\..\src\ds18b20.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\onewire.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\delay.$(ObjectExt) : ..\..\src\delay.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\main.$(ObjectExt) : ..\..\src\main.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\board.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\stm8s_it.h ..\..\src\config.h ..\..\src\delay.h ..\..\src\ds18b20.h ..\..\src\display.h ..\..\src\7seg.h ..\..\src\ds3231m_rtc.h ..\..\src\flashmngr.h ..\..\src\osa\osa.h ..\..\src\osacfg.h ..\..\src\calibdata.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8_interrupt_vector.$(ObjectExt) : ..\..\src\stm8_interrupt_vector.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\stm8s_it.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_it.$(ObjectExt) : ..\..\src\stm8s_it.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\src\stm8s_it.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\src\board.h ..\..\src\ds18b20.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_adc1.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_adc1.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_clk.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_clk.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_gpio.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_gpio.c ..\..\..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\src\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

adc.elf :  $(OutputPath)\stm8s_flash.o $(OutputPath)\calibdata.o $(OutputPath)\osa.o $(OutputPath)\stm8s_wwdg.o $(OutputPath)\display.o $(OutputPath)\flashmngr.o $(OutputPath)\sst25vf016b75.o $(OutputPath)\onewire.o $(OutputPath)\softi2c.o $(OutputPath)\stm8s_spi.o $(OutputPath)\ds3231m_rtc.o $(OutputPath)\stm8s_uart1.o $(OutputPath)\7seg.o $(OutputPath)\stm8s_tim1.o $(OutputPath)\config.o $(OutputPath)\stm8s_tim4.o $(OutputPath)\stm8s_tim2.o $(OutputPath)\ds18b20.o $(OutputPath)\delay.o $(OutputPath)\main.o $(OutputPath)\stm8_interrupt_vector.o $(OutputPath)\stm8s_it.o $(OutputPath)\stm8s_adc1.o $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\adc.lkf
	$(ToolsetBin)\clnk  $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8 

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\stm8s_flash.o
	-@erase $(OutputPath)\calibdata.o
	-@erase $(OutputPath)\osa.o
	-@erase $(OutputPath)\stm8s_wwdg.o
	-@erase $(OutputPath)\display.o
	-@erase $(OutputPath)\flashmngr.o
	-@erase $(OutputPath)\sst25vf016b75.o
	-@erase $(OutputPath)\onewire.o
	-@erase $(OutputPath)\softi2c.o
	-@erase $(OutputPath)\stm8s_spi.o
	-@erase $(OutputPath)\ds3231m_rtc.o
	-@erase $(OutputPath)\stm8s_uart1.o
	-@erase $(OutputPath)\7seg.o
	-@erase $(OutputPath)\stm8s_tim1.o
	-@erase $(OutputPath)\config.o
	-@erase $(OutputPath)\stm8s_tim4.o
	-@erase $(OutputPath)\stm8s_tim2.o
	-@erase $(OutputPath)\ds18b20.o
	-@erase $(OutputPath)\delay.o
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\stm8_interrupt_vector.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\stm8s_adc1.o
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\adc.elf
	-@erase $(OutputPath)\stm8s_flash.ls
	-@erase $(OutputPath)\calibdata.ls
	-@erase $(OutputPath)\osa.ls
	-@erase $(OutputPath)\stm8s_wwdg.ls
	-@erase $(OutputPath)\display.ls
	-@erase $(OutputPath)\flashmngr.ls
	-@erase $(OutputPath)\sst25vf016b75.ls
	-@erase $(OutputPath)\onewire.ls
	-@erase $(OutputPath)\softi2c.ls
	-@erase $(OutputPath)\stm8s_spi.ls
	-@erase $(OutputPath)\ds3231m_rtc.ls
	-@erase $(OutputPath)\stm8s_uart1.ls
	-@erase $(OutputPath)\7seg.ls
	-@erase $(OutputPath)\stm8s_tim1.ls
	-@erase $(OutputPath)\config.ls
	-@erase $(OutputPath)\stm8s_tim4.ls
	-@erase $(OutputPath)\stm8s_tim2.ls
	-@erase $(OutputPath)\ds18b20.ls
	-@erase $(OutputPath)\delay.ls
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\stm8_interrupt_vector.ls
	-@erase $(OutputPath)\stm8s_it.ls
	-@erase $(OutputPath)\stm8s_adc1.ls
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
endif
