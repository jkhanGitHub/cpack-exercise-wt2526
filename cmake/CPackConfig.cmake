set(CPACK_PACKAGE_NAME "${PROJECT_NAME}")
set(CPACK_PACKAGE_VERSION "${PROJECT_VERSION}")
set(CPACK_PACKAGE_VENDOR "Gemini")
set(CPACK_PACKAGE_CONTACT "gemini@google.com")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "A CPack exercise to demonstrate packaging a C++ application.")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/Simulation-Software-Engineering/cpack-exercise-wt2526")

set(CPACK_GENERATOR "TGZ;DEB")

# Debian packaging section
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)

# strip really all Debug symbols
set(CPACK_STRIP_FILES TRUE)

include(CPack)
