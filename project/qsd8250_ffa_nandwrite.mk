# top level project rules for the qsd8250_ffa_nandwrite project
#
LOCAL_DIR := $(GET_LOCAL_DIR)

TARGET := qsd8250_ffa

MODULES += app/nandwrite

DEFINES += WITH_DEBUG_JTAG=1
#DEFINES += WITH_DEBUG_DCC=1
#DEFINES += WITH_DEBUG_UART=1
#DEFINES += WITH_DEBUG_FBCON=1

