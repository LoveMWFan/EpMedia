LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE :=  libavutil
LOCAL_SRC_FILES := ../jniLibs/$(TARGET_ARCH_ABI)/libavutil.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE :=  libswresample
LOCAL_SRC_FILES := ../jniLibs/$(TARGET_ARCH_ABI)/libswresample.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE :=  libswscale
LOCAL_SRC_FILES := ../jniLibs/$(TARGET_ARCH_ABI)/libswscale.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libavcodec
LOCAL_SRC_FILES := ../jniLibs/$(TARGET_ARCH_ABI)/libavcodec.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libavformat
LOCAL_SRC_FILES := ../jniLibs/$(TARGET_ARCH_ABI)/libavformat.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libavfilter
LOCAL_SRC_FILES := ../jniLibs/$(TARGET_ARCH_ABI)/libavfilter.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE :=  libavdevice
LOCAL_SRC_FILES := ../jniLibs/$(TARGET_ARCH_ABI)/libavdevice.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE :=  libpostproc
LOCAL_SRC_FILES := ../jniLibs/$(TARGET_ARCH_ABI)/libpostproc.so
include $(PREBUILT_SHARED_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE := ffmpeg-exec

LOCAL_SRC_FILES :=Jni_FFmpegCmd.c \
                 cmdutils.c \
                 ffmpeg_filter.c \
                 ffmpeg_opt.c \
                 ffmpeg_hw.c \
                 ffmpeg.c \
                 ffmpeg_thread.c


LOCAL_C_INCLUDES := D:\AndroidStudioProjects\lovewmfan\FFMpegBuild\ffmpeg-4.2.4

LOCAL_LDLIBS := -llog -ljnigraphics -lz -landroid -lm -pthread -L$(SYSROOT)/usr/lib
LOCAL_SHARED_LIBRARIES := libavcodec libavfilter libavformat libavutil libswresample libswscale

include $(BUILD_SHARED_LIBRARY)