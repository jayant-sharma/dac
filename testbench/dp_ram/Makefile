TOPLEVEL = dac

PWD=$(shell pwd)
COCOTB=/home/jayant/devel/cocotb
SRC=$(PWD)/../../hdl

VERILOG_SOURCES =  $(SRC)/tb_dac.v $(SRC)/dac.v 
MODULE=dac
EXTRA_ARGS=-I ../../include -I ../../hdl
SIM_ARGS=-lxt2

include $(COCOTB)/makefiles/Makefile.inc
include $(COCOTB)/makefiles/Makefile.sim
