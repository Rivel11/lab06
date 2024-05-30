## HOMEWORK

#CMakeLists.txt
```
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
```

# Action.yml
```

name: CPack

on:
  push:
    branches: [branch1]
  pull_request:
    branches: [branch1]

jobs:
  build_packages_Linux:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v2
        with:
          node-version: '20'
      - name: Config solver
        run: cmake ${{github.workspace}} -B ${{github.workspace}}/build -D PRINT_VERSION=1.0.0

      - name: Build solver
        run: cmake --build ${{github.workspace}}/build

      - name: Build package
        run: cmake --build ${{github.workspace}}/build --target package

      - name: Build source package
        run: cmake --build ${{github.workspace}}/build --target package_source

      - name: Make a release
        uses: ncipollo/release-action@v1.10.0
        with:
          tag: v1.3.0
          artifacts: "build/*.deb,build/*.tar.gz,build/*.zip"
          token: ${{ secrets.GITHUB_TOKEN }}
      - name: Artifacts
        uses: actions/upload-artifact@v4
        with:
          name: solver
          path: build/solver
```
# CPack.cmake
```
include(InstallRequiredSystemLibraries)

set(CPACK_PACKAGE_VERSION ${PRINT_VERSION})
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "C++ app for solving equations")
set(CPACK_RESOURCE_FILE_README ${CMAKE_CURRENT_SOURCE_DIR}/README.md)

set(CPACK_SOURCE_IGNORE_FILES 
"\\\\.cmake;/.build/;/.git/;/.github/"
)

set(CPACK_SOURCE_INSTALLED_DIRECTORIES "${CMAKE_SOURCE_DIR}; /")

set(CPACK_SOURCE_GENERATOR "TGZ;ZIP")

set(CPACK_DEBIAN_PACKAGE_NAME "solver-dev")
set(CPACK_DEBIAN_FILE_NAME "solver-${PRINT_VERSION}.deb")
set(CPACK_DEBIAN_PACKAGE_VERSION ${PRINT_VERSION})
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "all")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Rivel11")
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION "Solve equation")
set(CPACK_DEBIAN_PACKAGE_RELEASE 1)

set(CPACK_GENERATOR "DEB")

include(CPack)
```
