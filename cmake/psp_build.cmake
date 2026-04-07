set(PSP_DIR ${PROJECT_SOURCE_DIR}/src/system/psp)
set(REF_GU_DIR ${PROJECT_SOURCE_DIR}/src/ref_gu)

set(REF soft)
if(HARDWARE_RENDERER)
    set(REF gu)
endif()

set(SOURCES_QUAKE2_SYS
    ${PSP_DIR}/debug_psp.c
	${PSP_DIR}/sys_psp.c
	${PSP_DIR}/in_psp.c
	${PSP_DIR}/vid_psp.c
	${PSP_DIR}/vid_menu_${REF}.c
	${PSP_DIR}/net_psp.c
	${PSP_DIR}/q_shpsp.c
	${PSP_DIR}/glob.c
    ${PSP_DIR}/snd_psp.c
    ${PSP_DIR}/cd_mp3.c
)

set(SOURCES_REF_HW_SYS
    ${REF_GU_DIR}/gu_render.c
	${REF_GU_DIR}/gu_vram.c
	${REF_GU_DIR}/gu_extension.c
	${REF_GU_DIR}/gu_clipping.c
	${REF_GU_DIR}/gu_draw.c
	${REF_GU_DIR}/gu_image.c
	${REF_GU_DIR}/gu_light.c
	${REF_GU_DIR}/gu_mesh.c
	${REF_GU_DIR}/gu_model.c
	${REF_GU_DIR}/gu_rmain.c
	${REF_GU_DIR}/gu_rmisc.c
	${REF_GU_DIR}/gu_rsurf.c
	${REF_GU_DIR}/gu_warp.c
)

set(SOURCES_REF_SW_SYS
    ${PSP_DIR}/swimp_psp.c
)

set(TARGET_COMPILE_OPTIONS_SYS
    -mno-gpopt
)

set(TARGET_LINK_LIBS_SYS
    pspwlan
    pspnet_adhoc
    pspnet_adhocctl
    pspgum_vfpu
    pspvfpu
    pspgu
    pspge
    pspdmac
    pspaudio
    pspmp3
    pspdisplay
    pspvram
    pspaudiolib
    psprtc
    psppower
    psphprm
	pspctrl
	pspdebug
	pspnet
	pspnet_apctl
    m
)