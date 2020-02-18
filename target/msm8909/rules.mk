LOCAL_DIR := $(GET_LOCAL_DIR)

INCLUDES += -I$(LOCAL_DIR)/include -I$(LK_TOP_DIR)/platform/msm_shared
INCLUDES += -I$(LK_TOP_DIR)/dev/gcdb/display -I$(LK_TOP_DIR)/dev/gcdb/display/include

PLATFORM := msm8909

MEMBASE := 0x8F600000 # SDRAM
MEMSIZE := 0x00100000 # 1MB

BASE_ADDR        := 0x80000000
SCRATCH_ADDR     := 0x90000000

DEFINES += ENABLE_SMD_SUPPORT=1

#UEFI_FB_BASE := 0x80400000
#UEFI_FB_SIZE := 0x00800000
#UEFI_FB_HORZ := 720
#UEFI_FB_VERT := 1280

#DEFINES += DISPLAY_SPLASH_SCREEN=1
#DEFINES += DISPLAY_TYPE_MIPI=1
#DEFINES += DISPLAY_TYPE_DSI6G=1
#DEFINES += NO_ALARM_DISPLAY=0
#DEFINES += WITH_DEBUG_UART=1
#DEFINES += CHAINLOADED_UEFI=1
#DEFINES += WITH_DEBUG_FBCON=1

MODULES += \
	dev/keys \
	dev/vib \
	lib/ptable \
	dev/pmic/pm8x41 \
	dev/pmic/pmi8994 \
	lib/libfdt
#        dev/gcdb/display 

DEFINES += \
	MEMSIZE=$(MEMSIZE) \
	MEMBASE=$(MEMBASE) \
	BASE_ADDR=$(BASE_ADDR) \
	SCRATCH_ADDR=$(SCRATCH_ADDR) 
#	UEFI_FB_BASE=$(UEFI_FB_BASE) \
#	UEFI_FB_SIZE=$(UEFI_FB_SIZE) \
#	UEFI_FB_VERT=$(UEFI_FB_VERT) \
#	UEFI_FB_HORZ=$(UEFI_FB_HORZ)

OBJS += \
	$(LOCAL_DIR)/init.o \
	$(LOCAL_DIR)/meminfo.o
#	$(LOCAL_DIR)/target_display.o \
#	$(LOCAL_DIR)/oem_panel.o

ifeq ($(ENABLE_SMD_SUPPORT),1)
OBJS += \
    $(LOCAL_DIR)/regulator.o
endif
