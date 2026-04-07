set(WIN32_DIR ${PROJECT_SOURCE_DIR}/src/system/win32)
set(REF_GL_DIR ${PROJECT_SOURCE_DIR}/src/ref_gl)

if(HARDWARE_RENDERER)
set(SOURCES_QUAKE2_REF_SPECIFIC
    ${WIN32_DIR}/glw_imp.c
)
else()
set(SOURCES_QUAKE2_REF_SPECIFIC
    ${WIN32_DIR}/rw_dib.c
    ${WIN32_DIR}/rw_ddraw.c
    ${WIN32_DIR}/rw_imp.c    
)
endif()

set(SOURCES_QUAKE2_SYS
    ${WIN32_DIR}/cd_win.c
    ${WIN32_DIR}/net_wins.c
    ${WIN32_DIR}/qgl_win.c
    ${WIN32_DIR}/snd_win.c
    ${WIN32_DIR}/vid_dll.c
    ${WIN32_DIR}/conproc.c
    ${WIN32_DIR}/in_win.c
    ${WIN32_DIR}/q_shwin.c   
    ${WIN32_DIR}/sys_win.c
    ${WIN32_DIR}/vid_menu.c
    ${SOURCES_QUAKE2_REF_SPECIFIC}
)

set(SOURCES_REF_HW_SYS
    ${REF_GL_DIR}/gl_draw.c
    ${REF_GL_DIR}/gl_image.c
    ${REF_GL_DIR}/gl_light.c
    ${REF_GL_DIR}/gl_mesh.c
    ${REF_GL_DIR}/gl_model.c
    ${REF_GL_DIR}/gl_rmain.c
    ${REF_GL_DIR}/gl_rmisc.c
    ${REF_GL_DIR}/gl_rsurf.c
    ${REF_GL_DIR}/gl_warp.c
)

set(SOURCES_REF_SW_SYS
)

set(TARGET_COMPILE_OPTIONS_SYS
)

set(TARGET_LINK_LIBS_SYS
    Ws2_32.lib
    Winmm.lib
)