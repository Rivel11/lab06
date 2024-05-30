cmake_minimum_required(VERSION 3.22) # Проверка версии CMake.
									 # Если версия установленой программы
									 # старее указаной, произайдёт аварийный выход.

project(formatter_lib)				# Название проекта

set(SOURCE_LIB formatter.cpp formatter.h)		# Установка переменной со списком исходников

add_library(formatter_lib STATIC ${SOURCE_LIB}) # Создание статической библиотеки
