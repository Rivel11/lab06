## Homework
Представьте, что вы стажер в компании "Formatter Inc.".

# Задание 1
Вам поручили перейти на систему автоматизированной сборки CMake. Исходные файлы находятся в директории formatter_lib. В этой директории находятся файлы для статической библиотеки formatter. Создайте CMakeList.txt в директории formatter_lib, с помощью которого можно будет собирать статическую библиотеку formatter.
```
$ cmake --version
```
```
cmake version 3.29.2

CMake suite maintained and supported by Kitware (kitware.com/cmake).
```
```
$ cmake -H. -B_build
$ cmake --build ./_build
```
# Содержимое CMakeLists.txt:
```
cmake_minimum_required(VERSION 3.29.2)

project(formatter_lib)
set(SOURCE_LIB formatter.cpp formatter.h)
add_library(formatter_lib STATIC ${SOURCE_LIB})
```

## Задание 2
У компании "Formatter Inc." есть перспективная библиотека, которая является расширением предыдущей библиотеки. Т.к. вы уже овладели навыком созданием CMakeList.txt для статической библиотеки formatter, ваш руководитель поручает заняться созданием CMakeList.txt для библиотеки formatter_ex, которая в свою очередь использует библиотеку formatter.
```
$ cmake -H. -B_build
$ cmake --build _build
```
# Содержимое CMakeLists.txt:
```
cmake_minimum_required(VERSION 3.29.2)

project(formatter_ex)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Установим путь к директории formatter_ex_lib
set(CMAKE_CURRENT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib)

# Явно перечислим исходные файлы
set(SOURCES
    formatter_ex.cpp
)

# Создадим библиотеку formatter_ex
add_library(formatter_ex STATIC ${SOURCES})

# Установим директорию для поиска заголовочных файлов
include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib)

# Добавим зависимость от библиотеки formatter
target_link_libraries(formatter_ex formatter)
```

# Задание 3
Конечно же ваша компания предоставляет примеры использования своих библиотек. Чтобы продемонстрировать как работать с библиотекой formatter_ex, вам необходимо создать два CMakeList.txt для двух простых приложений:

hello_world, которое использует библиотеку formatter_ex;
solver, приложение которое испольует статические библиотеки formatter_ex и solver_lib.
# 1. Hello_world_application
```
$ cmake -H. -B_build
$ cmake --build _build
```
# Содержимое CMakeLists.txt:
```
cmake_minimum_required(VERSION 3.29.2)
									 # Если версия установленой программы
									 # старее указаной, произайдёт аварийный выход.

project(hello_world)				 # Название проекта

set(SOURCE_EXE hello_world.cpp)			 # Установка переменной со списком исходников

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib/)

add_executable(main ${SOURCE_EXE})	 # Создает исполняемый файл с именем main

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib/ formatter_ex_lib)

target_link_libraries(main formatter_ex_lib)		 # Линковка программы с библиотекой
```
# 2. Solver_application
CMakeLists.txt
```
cmake_minimum_required(VERSION 3.29.2)

project(solver)				# Название проекта

set(SOURCE_EXE equation.cpp)			# Установка переменной со списком исходников

include_directories("${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib/"
					"${CMAKE_CURRENT_SOURCE_DIR}/../solver_lib/")

add_executable(main ${SOURCE_EXE})	# Создает исполняемый файл с именем main

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib/ formatter_ex_lib)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../solver_lib/ solver_lib)

target_link_libraries(main formatter_ex_lib solver_lib)		# Линковка программы с библиотекой
```
# 2. Solver_lib
CMakeLists.txt
```
cmake_minimum_required(VERSION 3.22) # Проверка версии CMake.
									# Если версия установленой программы
									# старее указаной, произайдёт аварийный выход.

project(solver_lib)				# Название проекта

set(SOURCE_LIB solver.cpp solver.h)		# Установка переменной со списком исходников

add_library(solver_lib STATIC ${SOURCE_LIB})# Создание статической библиотеки
```

