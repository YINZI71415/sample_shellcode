LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)



LOCAL_C_INCLUDES := $(UTILS_H)

# build source file

BUILD_NAME=shell_test


LOCAL_SRC_FILES := ../shell_test.c

LOCAL_MODULE    := $(BUILD_NAME)


LOCAL_CFLAGS += -Werror -fno-stack-protector -z execstack
LOCAL_LDFLAGS += -static

include $(BUILD_EXECUTABLE)
