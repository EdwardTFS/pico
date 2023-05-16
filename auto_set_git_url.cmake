include(CMakePrintHelpers)
# get_cmake_property(_variableNames VARIABLES)
# list (SORT _variableNames)
# foreach (_variableName ${_variableNames})
#     cmake_print_variables(${_variableName})
#     message(STATUS "${_variableName}=${${_variableName}}")
# endforeach()

execute_process(
    COMMAND git remote get-url origin
    OUTPUT_VARIABLE GIT_URL
    OUTPUT_STRIP_TRAILING_WHITESPACE)

    execute_process(
    COMMAND git rev-parse --short HEAD
    OUTPUT_VARIABLE GIT_HASH
    OUTPUT_STRIP_TRAILING_WHITESPACE)
    
    
    
set(TARGET_URL ${GIT_URL})
set(TARGET_HASH ${GIT_HASH})
cmake_print_variables(TARGET_URL)
cmake_print_variables(TARGET_HASH)

macro(auto_set_git_url TARGET)
    file(RELATIVE_PATH URL_REL_PATH "${ROOT_PROJECT_SOURCE_DIR}" "${CMAKE_CURRENT_LIST_DIR}")
    pico_set_program_url(${TARGET} "${TARGET_URL}/${URL_REL_PATH}")
    pico_set_program_version (${TARGET} "${TARGET_HASH}")
endmacro()