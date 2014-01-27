#============================================================================
#
# Program: SOFA
#
# Copyright (c) Kitware Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0.txt
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#============================================================================

# -------------------------------------------------------------------------
# Find and install SOFA external libs
# -------------------------------------------------------------------------
if (WIN32)

  # For windows, just grab everything in the dependency dir and install
  file(GLOB files ${SOFA_LIB_OS_DIR}/*.dll)
  foreach(f ${files})
    install(FILES ${f} DESTINATION bin COMPONENT Runtime)
  endforeach()

else()

  # Assume that all the external libs are in the form lib_LIBRARIES and lib_INCLUDE_DIR
  set(libraries "OPENGL;GLUT;GLEW;PNG;ZLIB;")
  foreach(lib ${libraries})
    foreach(target ${${lib}_LIBRARIES})
      if (EXISTS ${target} AND NOT IS_DIRECTORY ${target})
        install(FILES ${target} DESTINATION ${SOFA-INSTALL_BIN_DIR} COMPONENT Runtime)
      endif()
    endforeach()
  endforeach()

endif()
