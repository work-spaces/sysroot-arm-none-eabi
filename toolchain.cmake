set(SYSROOT $ENV{SPACES_WORKSPACE}/sysroot)

set(CMAKE_SYSTEM_NAME Generic CACHE INTERNAL "")
set(CMAKE_SYSTEM_PROCESSOR arm CACHE INTERNAL "")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER CACHE INTERNAL "")
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY CACHE INTERNAL "")
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY CACHE INTERNAL "")
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY CACHE INTERNAL "")
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY CACHE INTERNAL "")

set(CMAKE_NO_SYSTEM_FROM_IMPORTED ON CACHE INTERNAL "GCC don't use isystem")
set(CMAKE_C_COMPILER ${SYSROOT}/bin/arm-none-eabi-gcc CACHE INTERNAL "GCC TOOLCHAIN C COMPILER")
set(CMAKE_CXX_COMPILER ${SYSROOT}/bin/arm-none-eabi-g++ CACHE INTERNAL "GCC TOOLCHAIN C++ COMPILER")
set(CMAKE_ASM_COMPILER ${SYSROOT}/bin/arm-none-eabi-g++ CACHE INTERNAL "GCC TOOLCHAIN ASM COMPILER")
set(CMAKE_AR ${SYSROOT}/bin/arm-none-eabi-gcc-ar CACHE INTERNAL "GCC TOOLCHAIN AR")
set(CMAKE_RANLIB ${SYSROOT}/bin/arm-none-eabi-gcc-ranlib CACHE INTERNAL "GCC TOOLCHAIN RANLIB")
set(CMAKE_NM ${SYSROOT}/bin/arm-none-eabi-gcc-nm CACHE INTERNAL "GCC TOOLCHAIN NM")
set(CMAKE_OBJCOPY ${SYSROOT}/bin/arm-none-eabi-objcopy CACHE INTERNAL "GCC TOOLCHAIN OBJCOPY")
set(CMAKE_OBJDUMP ${SYSROOT}/bin/arm-none-eabi-objdump CACHE INTERNAL "GCC TOOLCHAIN OBJDUMP")
set(CMAKE_SIZE ${SYSROOT}/bin/arm-none-eabi-size CACHE INTERNAL "GCC TOOLCHAIN SIZE")

set(CMAKE_C_FLAGS "-mthumb" CACHE INTERNAL "CMAKE C FLAGS")
set(CMAKE_ASM_FLAGS "-mthumb" CACHE INTERNAL "CMAKE ASM FLAGS")

set(SYSROOT_THUMB_LIB ${SYSROOT}/arm-none-eabi/lib/thumb)


option(thumbv6m-none-eabi OFF)
option(thumbv7m-none-eabi OFF)
option(thumbv7em-none-eabi OFF)
option(thumbv7em-none-eabihf OFF)
option(thumbv8m.base-none-eabi OFF)
option(thumbv8m.main-none-eabi OFF)
option(thumbv8m.main-none-eabihf OFF)

if(thumbv6m-none-eabi)
    set(THUMBV6M_NONE_EABI_LINK_PATH "${SYSROOT_THUMB_LIB}/v6-m/nofp" CACHE INTERNAL "THUMBV6M_NONE_EABI_LINK_PATH")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mcpu=cortex-m0")
endif()

if(thumbv7m-none-eabi)
    set(THUMBV7M_NONE_EABI_LINK_PATH "${SYSROOT_THUMB_LIB}/v7-m/nofp" CACHE INTERNAL "THUMBV6M_NONE_EABI_LINK_PATH")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mcpu=cortex-m3")
endif()

if(thumbv7em-none-eabi)
    set(THUMBV7EM_NONE_EABI_LINK_PATH "${SYSROOT_THUMB_LIB}/v7e-m/nofp" CACHE INTERNAL "THUMBV7EM_NONE_EABI_LINK_PATH")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mcpu=cortex-m4")
endif()

if(thumbv7em-none-eabihf)
    set(THUMBV7EM_NONE_EABIHF_LINK_PATH "${SYSROOT_THUMB_LIB}/v7e-m+fp/hard" CACHE INTERNAL "THUMBV7EM_NONE_EABI_LINK_PATH")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16")
endif()

if(thumbv8m.base-none-eabi)
    set(THUMBV8M_BASE_NONE_EABI_LINK_PATH "${SYSROOT_THUMB_LIB}/v8-m.base/nofp" CACHE INTERNAL "THUMBV7EM_NONE_EABI_LINK_PATH")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mcpu=cortex-m33")
endif()

if(thumbv8m.main-none-eabi)
    set(THUMBV8M_MAIN_NONE_EABI_LINK_PATH "${SYSROOT_THUMB_LIB}/v8-m.main/nofp" CACHE INTERNAL "THUMBV7EM_NONE_EABI_LINK_PATH")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mcpu=cortex-m33")
endif()

if(thumbv8m.main-none-eabihf)
    set(THUMBV8M_MAIN_NONE_EABIHF_LINK_PATH "${SYSROOT_THUMB_LIB}/v8-m.main/nofp" CACHE INTERNAL "THUMBV7EM_NONE_EABI_LINK_PATH")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mcpu=cortex-m33 -mfloat-abi=hard -mfpu=fpv5-sp-d16")
endif()
    
set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -fno-exceptions -fno-unwind-tables -fno-rtti" CACHE INTERNAL "CMAKE CXX FLAGS")
