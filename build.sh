#!/bin/sh

DEPS="deps"
LIB="lib"

loader() {
    ldc2 -lib -of=${LIB}/libBindBC_Loader.a -betterC -oq ${DEPS}/bindbc/loader/*.d
}

opengl() {
    SRC="${DEPS}/bindbc/opengl"
    ldc2 -lib -of=${LIB}/libBindBC_OpenGL.a -betterC -oq -d-version=GL_45 -I=${DEPS}/ ${SRC}/*.d ${SRC}/bind/*.d ${SRC}/bind/arb/*.d ${SRC}/bind/dep/*.d
}

sdl() {
    ldc2 -lib -of=${LIB}/libBindBC_SDL.a -betterC -oq -d-version=BindSDL_Static -I=${DEPS}/ ${DEPS}/bindbc/sdl/package.d
}

imgui() {
    CXX="g++"
    CXXFLAGS="-c -I${DEPS}/imgui/"
    ${CXX} ${CXXFLAGS} ${DEPS}/imgui/imgui.cpp &
    ${CXX} ${CXXFLAGS} ${DEPS}/imgui/imgui_draw.cpp &
    ${CXX} ${CXXFLAGS} ${DEPS}/imgui/imgui_widgets.cpp &
    ${CXX} ${CXXFLAGS} -I/usr/include/SDL2/ -lSDL2 ${DEPS}/imgui/imgui_impl_sdl.cpp &
    ${CXX} ${CXXFLAGS} -DIMGUI_IMPL_OPENGL_LOADER_CUSTOM=\"../oldglad/glad.h\" ${DEPS}/imgui/imgui_impl_opengl3.cpp &

    wait $(jobs -p)

    ar rcs ${LIB}/libimgui.a imgui_draw.o imgui.o imgui_impl_opengl3.o imgui_impl_sdl.o imgui_widgets.o
}

stb() {
    gcc -c ${DEPS}/stb/image.c
    
    ar rcs ${LIB}/libstb_image.a image.o
}

exile() {
    SRC="src"
    
    DC="ldc2"
    DFLAGS="-c -gc -betterC -d-version=BindSDL_Static -d-version=GL_45 -I=${SRC} -I=${DEPS}"

    BLD="obj"

    ${DC} ${DFLAGS} ${SRC}/exile.d -of=exile.o &
    ${DC} ${DFLAGS} ${SRC}/io.d -of=io.o &
    #${DC} -c -gc ${DEPS}/glad/gl/*.d -of=glad.o &

    wait $(jobs -p)

    ldc2 -of=exile io.o exile.o ${LIB}/libBindBC_OpenGL.a ${LIB}/libBindBC_Loader.a ${LIB}/libBindBC_SDL.a ${LIB}/libimgui.a ${LIB}/libstb_image.a  -L=-lSDL2 -L=-ldl -L=-lstdc++
}

clean() {
    rm *.o
    rm exile
}

set -e
$1