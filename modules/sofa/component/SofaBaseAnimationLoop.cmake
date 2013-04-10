cmake_minimum_required(VERSION 2.8)

project("SofaBaseAnimationLoop")

include(${SOFA_CMAKE_DIR}/preProject.cmake)

set(HEADER_FILES

	initBaseAnimationLoop.h
    animationloop/MultiStepAnimationLoop.h
    animationloop/MultiTagAnimationLoop.h
	)

set(SOURCE_FILES

	initBaseAnimationLoop.cpp
    animationloop/MultiStepAnimationLoop.cpp
    animationloop/MultiTagAnimationLoop.cpp
	)

add_library(${PROJECT_NAME} SHARED ${HEADER_FILES} ${SOURCE_FILES})

set(COMPILER_DEFINES "SOFA_BUILD_BASE_ANIMATION_LOOP")
set(LINKER_DEPENDENCIES SofaSimulationTree)

include(${SOFA_CMAKE_DIR}/postProject.cmake)

