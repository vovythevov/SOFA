cmake_minimum_required(VERSION 2.8)

project("SofaBaseAnimationLoop")

include(${SOFA_CMAKE_DIR}/pre.cmake)

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
target_link_libraries(${PROJECT_NAME} SofaSimulationTree)

set_target_properties(${PROJECT_NAME} PROPERTIES COMPILE_DEFINITIONS "${GLOBAL_DEFINES};SOFA_BUILD_BASE_ANIMATION_LOOP")
	
include(${SOFA_CMAKE_DIR}/post.cmake)
