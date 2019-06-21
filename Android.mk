LOCAL_PATH:= $(call my-dir)

####################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE := libattr
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
LOCAL_SRC_FILES := libattr/attr_copy_action.c \
	libattr/attr_copy_check.c \
	libattr/attr_copy_fd.c \
	libattr/attr_copy_file.c \
	libattr/libattr.c \
	libattr/syscalls.c \
	libmisc/high_water_alloc.c \
	libmisc/next_line.c \
	libmisc/quote.c \
	libmisc/unquote.c \
	libmisc/walk_tree.c
LOCAL_CFLAGS := -Werror -Wno-unused-parameter -Wno-sign-compare
LOCAL_C_INCLUDES := \
        $(LOCAL_PATH)/include/ \
        $(LOCAL_PATH)/libattr/ \
		$(LOCAL_PATH)/libmisc/

include $(BUILD_STATIC_LIBRARY)
#########################################################################################

include $(CLEAR_VARS)
LOCAL_MODULE:= getfattr
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
LOCAL_SRC_FILES := tools/getfattr.c
LOCAL_STATIC_LIBRARIES := libattr
LOCAL_CFLAGS := -Werror -Wno-unused-parameter -Wno-sign-compare
LOCAL_C_INCLUDES := \
        $(LOCAL_PATH)/include/ \
        $(LOCAL_PATH)/libattr/ \
		$(LOCAL_PATH)/libmisc/
include $(BUILD_EXECUTABLE)

include $(call all-makefiles-under,$(LOCAL_PATH))
