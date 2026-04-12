cmake_minimum_required(VERSION 3.25 FATAL_ERROR)

project(
    ProjectAnima
    VERSION 0.0.1
    LANGUAGES C
)

set(CMAKE_C_STANDARD 99)

message("Target system is " ${TARGET_SYSTEM})
if((NOT DEFINED TARGET_SYSTEM) OR ((NOT "${TARGET_SYSTEM}" MATCHES "WIN32") AND (NOT "${TARGET_SYSTEM}" MATCHES "PSP")))
	message( FATAL_ERROR "BUILD_SYSTEM variable must be defined." )
endif()

if ("${TARGET_SYSTEM}" MATCHES "PSP")
enable_language(ASM)
include(cmake/psp_build.cmake)
set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/install/PSP)
elseif("${TARGET_SYSTEM}" MATCHES "WIN32")
enable_language(ASM_MASM)
set(TARGET_OPTIONS WIN32)
include(cmake/win32_build.cmake)
set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/install/WIN32)
endif()

###############################
## Define common directories
###############################
set(CLIENT_DIR ${PROJECT_SOURCE_DIR}/src/client)
set(SERVER_DIR ${PROJECT_SOURCE_DIR}/src/server)
set(REF_SOFT_DIR ${PROJECT_SOURCE_DIR}/src/ref_soft)
set(COMMON_DIR ${PROJECT_SOURCE_DIR}/src/common)
set(SHARED_DIR ${PROJECT_SOURCE_DIR}/src/shared)
set(NULL_DIR ${PROJECT_SOURCE_DIR}/src/system/null)
set(GAME_DIR ${PROJECT_SOURCE_DIR}/src/game)

################################
## Define common source lists
###############################
set(SOURCES_QUAKE2_COMMON
    ${CLIENT_DIR}/cl_cin.c
	${CLIENT_DIR}/cl_ents.c
	${CLIENT_DIR}/cl_fx.c
	${CLIENT_DIR}/cl_input.c
	${CLIENT_DIR}/cl_inv.c
	${CLIENT_DIR}/cl_main.c
	${CLIENT_DIR}/cl_newfx.c
	${CLIENT_DIR}/cl_parse.c
	${CLIENT_DIR}/cl_pred.c
	${CLIENT_DIR}/cl_tent.c
	${CLIENT_DIR}/cl_scrn.c
	${CLIENT_DIR}/cl_view.c
	${CLIENT_DIR}/console.c
	${CLIENT_DIR}/keys.c
	${CLIENT_DIR}/menu.c
	${CLIENT_DIR}/osk.c
	${CLIENT_DIR}/snd_dma.c
	${CLIENT_DIR}/snd_mem.c
	${CLIENT_DIR}/snd_mix.c
	${CLIENT_DIR}/qmenu.c
	${COMMON_DIR}/cmd.c
	${COMMON_DIR}/cmodel.c
	${COMMON_DIR}/common.c
	${COMMON_DIR}/crc.c
	${COMMON_DIR}/cvar.c
	${COMMON_DIR}/files.c
	${COMMON_DIR}/md4.c
	${COMMON_DIR}/net_chan.c
	${COMMON_DIR}/zone.c
	${SERVER_DIR}/sv_ccmds.c
	${SERVER_DIR}/sv_ents.c
	${SERVER_DIR}/sv_game.c
	${SERVER_DIR}/sv_init.c
	${SERVER_DIR}/sv_main.c
	${SERVER_DIR}/sv_send.c
	${SERVER_DIR}/sv_user.c
	${SERVER_DIR}/sv_world.c
	${SHARED_DIR}/q_shared.c
	${SHARED_DIR}/BOPS.S
	${SHARED_DIR}/m_flash.c
	${COMMON_DIR}/pmove.c
)

set(SOURCES_GAME
    ${GAME_DIR}/g_ai.c
	${GAME_DIR}/g_chase.c
	${GAME_DIR}/p_client.c
	${GAME_DIR}/g_cmds.c
	${GAME_DIR}/g_svcmds.c
	${GAME_DIR}/g_combat.c
	${GAME_DIR}/g_func.c
	${GAME_DIR}/g_items.c
	${GAME_DIR}/g_main.c
	${GAME_DIR}/g_misc.c
	${GAME_DIR}/g_monster.c
	${GAME_DIR}/g_phys.c
	${GAME_DIR}/g_save.c
	${GAME_DIR}/g_spawn.c
	${GAME_DIR}/g_target.c
	${GAME_DIR}/g_trigger.c
	${GAME_DIR}/g_turret.c
	${GAME_DIR}/g_utils.c
	${GAME_DIR}/g_weapon.c
	${GAME_DIR}/m_actor.c
	${GAME_DIR}/m_berserk.c
	${GAME_DIR}/m_boss2.c
	${GAME_DIR}/m_boss3.c
	${GAME_DIR}/m_boss31.c
	${GAME_DIR}/m_boss32.c
	${GAME_DIR}/m_brain.c
	${GAME_DIR}/m_chick.c
	${GAME_DIR}/m_flipper.c
	${GAME_DIR}/m_float.c
	${GAME_DIR}/m_flyer.c
	${GAME_DIR}/m_gladiator.c
	${GAME_DIR}/m_gunner.c
	${GAME_DIR}/m_hover.c
	${GAME_DIR}/m_infantry.c
	${GAME_DIR}/m_insane.c
	${GAME_DIR}/m_medic.c
	${GAME_DIR}/m_move.c
	${GAME_DIR}/m_mutant.c
	${GAME_DIR}/m_parasite.c
	${GAME_DIR}/m_soldier.c
	${GAME_DIR}/m_supertank.c
	${GAME_DIR}/m_tank.c
	${GAME_DIR}/p_hud.c
	${GAME_DIR}/p_trail.c
	${GAME_DIR}/p_view.c
	${GAME_DIR}/p_weapon.c
)

set(SOURCES_REF_SW_COMMON
	${REF_SOFT_DIR}/r_aclip.c
	${REF_SOFT_DIR}/r_alias.c
	${REF_SOFT_DIR}/r_bsp.c
	${REF_SOFT_DIR}/r_draw.c
	${REF_SOFT_DIR}/r_edge.c
	${REF_SOFT_DIR}/r_image.c
	${REF_SOFT_DIR}/r_light.c
	${REF_SOFT_DIR}/r_main.c
	${REF_SOFT_DIR}/r_misc.c
	${REF_SOFT_DIR}/r_model.c
	${REF_SOFT_DIR}/r_part.c
	${REF_SOFT_DIR}/r_poly.c
	${REF_SOFT_DIR}/r_polyse.c
	${REF_SOFT_DIR}/r_rast.c
	${REF_SOFT_DIR}/r_scan.c
	${REF_SOFT_DIR}/r_sprite.c
	${REF_SOFT_DIR}/r_surf.c
)

################################################
## Create source lists
################################################
set(SOURCES_QUAKE2
	${SOURCES_QUAKE2_COMMON}
	${SOURCES_QUAKE2_SYS}
)

set(SOURCES_REF_SW
	${SOURCES_REF_SW_COMMON}
	${SOURCES_REF_SW_SYS}
)

set(SOURCES_REF_HW
	${SOURCES_REF_HW_SYS}
)

#######################################################
## Create REF source list based on selected renderer
#######################################################
if(${HARDWARE_RENDERER})
	set(SOURCES_REF ${SOURCES_REF_HW})
else()
	set(SOURCES_REF ${SOURCES_REF_SW})
endif()

###########################
## Create configure file
###########################
configure_file(${PROJECT_SOURCE_DIR}/cmake/config.h.in ${PROJECT_BINARY_DIR}/include/config.h)

################
## Add target
################
add_executable(${PROJECT_NAME} ${TARGET_OPTIONS} ${SOURCES_QUAKE2} ${SOURCES_GAME} ${SOURCES_REF})

target_compile_options(
    ${PROJECT_NAME}
    PRIVATE
    -Dstricmp=strcasecmp
	${TARGET_COMPILE_OPTS_SYS}
)

target_compile_definitions(
    ${PROJECT_NAME}
    PRIVATE
    REF_HARD_LINKED
    GAME_HARD_LINKED
    $<$<CONFIG:Debug>:DEBUG
                      USE_STDIN>
)

target_include_directories(
    ${PROJECT_NAME}
    PRIVATE
	${PROJECT_BINARY_DIR}/include
    ${PROJECT_SOURCE_DIR}/src
)

target_link_libraries(
    ${PROJECT_NAME}
    PRIVATE
    ${TARGET_LINK_LIBS_SYS}
)

######################
## Post build tasks
######################
if("${TARGET_SYSTEM}" MATCHES "PSP")
create_pbp_file(
    TARGET ${PROJECT_NAME}
    ICON_PATH NULL
    BACKGROUND_PATH NULL
    PREVIEW_PATH NULL
    TITLE ${PROJECT_NAME}
    VERSION ${PROJECT_VERSION}
)
elseif ("${TARGET_SYSTEM}" MATCHES "WIN32")
endif()

######################
## Install
######################
install(TARGETS ${PROJECT_NAME} DESTINATION .)
install(DIRECTORY ${PROJECT_SOURCE_DIR}/baseq2 DESTINATION .)