project(solver)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib formatter_ex_lib_dir)

add_library(solver_lib ${CMAKE_CURRENT_SOURCE_DIR}/solver_lib/solver.cpp)
add_executable(solver ${CMAKE_CURRENT_SOURCE_DIR}/solver_application/equation.cpp)

target_include_directories(formatter_ex_lib PUBLIC
${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib
${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib
${CMAKE_CURRENT_SOURCE_DIR}/solver_lib
)

target_link_libraries(solver formatter_ex_lib formatter_lib solver_lib)

install(TARGETS solver
    RUNTIME DESTINATION bin
)

include(CPack.cmake)


# CPack настройки
include(InstallRequiredSystemLibraries)

set(CPACK_GENERATOR "ZIP;NSIS")
set(CPACK_PACKAGE_NAME "MyApp")
set(CPACK_PACKAGE_VERSION "1.0.0")
set(CPACK_PACKAGE_VENDOR "MyCompany")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "MyApp Description")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/LICENSE")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "MyApp")
set(CPACK_NSIS_DISPLAY_NAME "MyApp")
set(CPACK_NSIS_HELP_LINK "http://example.com")
set(CPACK_NSIS_URL_INFO_ABOUT "http://example.com")
set(CPACK_NSIS_CONTACT "support@example.com")

# Inno Setup settings
set(CPACK_IFW_PACKAGE_TITLE "MyApp")
set(CPACK_IFW_PACKAGE_DESCRIPTION "MyApp Description")
set(CPACK_IFW_PACKAGE_VERSION "1.0.0")
set(CPACK_IFW_PACKAGE_VENDOR "MyCompany")
set(CPACK_IFW_PACKAGE_URL "http://example.com")
set(CPACK_IFW_PACKAGE_LICENSE "${CMAKE_SOURCE_DIR}/LICENSE")
set(CPACK_IFW_PACKAGE_ICON "${CMAKE_SOURCE_DIR}/icon.ico")
set(CPACK_IFW_PACKAGE_WIZARD_STYLE "Modern")
set(CPACK_IFW_PACKAGE_DEFAULT "true")

# Inno Setup script
set(CPACK_IFW_PACKAGING_INSTALLER_FILE "${CMAKE_SOURCE_DIR}/installer.iss")
set(CPACK_IFW_PACKAGE_INSTALL_DIRECTORY "MyApp")
