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

#
# This module is provided as SOFA_USE_FILE by SOFAConfig.cmake. It can
# be INCLUDED in a project to load the needed compiler and linker
# settings to use SOFA.
#

if(NOT SOFA_USE_FILE_INCLUDED)
  set(SOFA_USE_FILE_INCLUDED 1)

  set(CMAKE_MODULE_PATH
    ${CMAKE_MODULE_PATH}
    ${SOFA_CMAKE_DIR})
    
  set(defines)
  foreach(it ${SOFA_DEFINES})
    if(NOT ${it} MATCHES "SOFA_TARGET=*")
      list(APPEND defines "-D${it}")
    endif()
  endforeach()
  
  # Add compiler definitions
  add_definitions(${defines})
  
  # Add include directories needed to use SOFA.
  include_directories(${SOFA_INCLUDE_DIRS})

  # Add link directories needed to use SOFA.
  link_directories(${SOFA_LIBRARY_DIRS} ${SOFA_EXTERNAL_LIBRARY_DIRS})

  if (NOT DEFINED QT_QMAKE_EXECUTABLE AND DEFINED SOFA_QT_QMAKE_EXECUTABLE)
    set(QT_QMAKE_EXECUTABLE ${SOFA_QT_QMAKE_EXECUTABLE})
  endif()

endif()