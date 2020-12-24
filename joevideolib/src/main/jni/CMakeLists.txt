cmake_minimum_required(VERSION 3.4.1)
include_directories(D:/AndroidStudioProjects/lovewmfan/FFMpegBuild/ffmpeg-4.2.4)
# 支持gnu++11
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu++11")

# 1. 定义so库和头文件所在目录，方面后面使用
set(ffmpeg_lib_dir ${CMAKE_SOURCE_DIR}/../jniLibs/${ANDROID_ABI})
# 2. 添加ffmpeg相关的so库
add_library(avutil
        SHARED
        IMPORTED)
set_target_properties(avutil
        PROPERTIES IMPORTED_LOCATION
        ${ffmpeg_lib_dir}/libavutil.so)

add_library(swresample
        SHARED
        IMPORTED)
set_target_properties(swresample
        PROPERTIES IMPORTED_LOCATION
        ${ffmpeg_lib_dir}/libswresample.so)

add_library(avcodec
        SHARED
        IMPORTED)
set_target_properties(avcodec
        PROPERTIES IMPORTED_LOCATION
        ${ffmpeg_lib_dir}/libavcodec.so)

add_library(avfilter
        SHARED
        IMPORTED)
set_target_properties(avfilter
        PROPERTIES IMPORTED_LOCATION
        ${ffmpeg_lib_dir}/libavfilter.so)

add_library(swscale
        SHARED
        IMPORTED)
set_target_properties(swscale
        PROPERTIES IMPORTED_LOCATION
        ${ffmpeg_lib_dir}/libswscale.so)

add_library(avformat
        SHARED
        IMPORTED)
set_target_properties(avformat
        PROPERTIES IMPORTED_LOCATION
        ${ffmpeg_lib_dir}/libavformat.so)

add_library(avdevice
        SHARED
        IMPORTED)
set_target_properties(avdevice
        PROPERTIES IMPORTED_LOCATION
        ${ffmpeg_lib_dir}/libavdevice.so)





# 查找代码中使用到的系统库
find_library( # Sets the name of the path variable.
        log-lib

        # Specifies the name of the NDK library that
        # you want CMake to locate.
        log)


add_library(ffmpeg-exec
        SHARED

        ${CMAKE_SOURCE_DIR}/cmdutils.c
        ${CMAKE_SOURCE_DIR}/ffmpeg.c
        ${CMAKE_SOURCE_DIR}/ffmpeg_filter.c
        ${CMAKE_SOURCE_DIR}/ffmpeg_hw.c
        ${CMAKE_SOURCE_DIR}/ffmpeg_opt.c
        ${CMAKE_SOURCE_DIR}/ffmpeg_thread.c
        ${CMAKE_SOURCE_DIR}/Jni_FFmpegCmd.c
        )

# 指定编译目标库时，cmake要链接的库
target_link_libraries(

        # 指定目标库，ffmpeg-exec 是在上面 add_library 中配置的目标库
        ffmpeg-exec


        # 4. 连接 FFmpeg 相关的库
        avutil
        swresample
        avcodec
        avfilter
        swscale
        avformat
        avdevice
        -llog
        -ljnigraphics
        -lz
        -landroid
        -lm
        -pthread
        OpenSLES
        -lEGL
        -lGLESv2
        # Links the target library to the log library
        # included in the NDK.
        ${log-lib})