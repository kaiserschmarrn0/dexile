#!/bin/sh

exile() {
    SRC="src"
    DEPS="deps"

    DC="ldc2"
    DFLAGS="-c -gc -betterC -d-version=BindSDL_Static -I=${SRC} -I=${DEPS}/bindbc-sdl/source/ -I=${DEPS}/bindbc-opengl/source/ -I=${DEPS}/bindbc-loader/source/ -I=${DEPS}/stb/source/ -I=${DEPS}/dimgui/src/"

    BLD="obj"

    ${DC} ${DFLAGS} ${SRC}/exile.d -of=exile.o
    ${DC} ${DFLAGS} ${SRC}/io.d -of=io.o

    ldc2 -of=exile *.o ${DEPS}/bindbc-sdl/lib/libBindBC_SDL.a ${DEPS}/bindbc-opengl/lib/libBindBC_OpenGL.a ${DEPS}/bindbc-loader/lib/libBindBC_Loader.a ${DEPS}/stb/libstb.a ${DEPS}/imgui/*.o -L=-lSDL2 -L=-ldl -L=-lstdc++
}

clean() {
    rm *.o
    rm exile
}

set -e
$1