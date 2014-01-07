# Remove target file if it exists already to avoid duplication of the libs
# when exporting them
if (EXISTS "${SOFA_BUILD_DIR}/SOFATargets.cmake")
  file(REMOVE "${SOFA_BUILD_DIR}/SOFATargets.cmake")
endif()
