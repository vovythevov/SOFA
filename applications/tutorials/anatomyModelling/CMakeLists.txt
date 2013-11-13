include(${SOFA_CMAKE_DIR}/preProject.cmake)

set(SOURCE_FILES

    anatomyModelling.cpp

    )
# if(SOFA-PLUGIN_IMAGE)
    include_directories("${SOFA_EXTLIBS_DIR}")
    include_directories("${SOFA_APPLICATIONS_PLUGINS_DIR}/Flexible")
    include_directories("${SOFA_APPLICATIONS_PLUGINS_DIR}/image")
    include_directories("${SOFA_APPLICATIONS_PLUGINS_DIR}")
# endif()

add_executable(${PROJECT_NAME} ${SOURCE_FILES})

AddLinkerDependencies(SofaSimulationTree SofaComponentMain SofaGuiMain ObjectCreator)

include(${SOFA_CMAKE_DIR}/postProject.cmake)

