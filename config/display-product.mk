# Display product definitions
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.composer-service \
    gralloc.$(PRODUCT_BOARD_PLATFORM) \
    lights.$(PRODUCT_BOARD_PLATFORM) \
    hwcomposer.$(PRODUCT_BOARD_PLATFORM) \
    libsdmcore \
    libsdmutils \
    libqdMetaData \
    libqdMetaData.system \
    libdisplayconfig \
    libgralloc.qti \
    libdisplayconfig.qti \
    libdisplayconfig.vendor \
    libdisplayconfig.qti.vendor \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapper@4.0.vendor \
    init.qti.display_boot.sh \
    init.qti.display_boot.rc \
    modetest

ifneq ($(TARGET_DISABLE_MEMTRACK), true)
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    memtrack.$(PRODUCT_BOARD_PLATFORM)
endif

PRODUCT_VENDOR_PROPERTIES += \
    persist.demo.hdmirotationlock=false \
    persist.sys.sf.color_saturation=1.0 \
    persist.sys.sf.color_mode=9 \
    debug.sf.hw=0 \
    debug.egl.hw=0 \
    debug.sf.latch_unsignaled=1 \
    debug.sf.high_fps_late_app_phase_offset_ns=1000000 \
    debug.mdpcomp.logs=0 \
    vendor.gralloc.disable_ubwc=0 \
    vendor.display.disable_scaler=0 \
    vendor.display.disable_excl_rect=0 \
    vendor.display.disable_excl_rect_partial_fb=1 \
    vendor.display.comp_mask=0 \
    vendor.display.enable_posted_start_dyn=1 \
    vendor.display.enable_optimize_refresh=1 \
    vendor.display.use_smooth_motion=1 \
    vendor.display.enable_camera_smooth=1 \
    vendor.display.enable_allow_idle_fallback=1 \
    vendor.display.disable_idle_time_video=1 \
    vendor.display.disable_idle_time_hdr=1 \
    debug.sf.predict_hwc_composition_strategy=0

# Enable offline rotator for Bengal, Monaco, Khaje.
ifneq ($(filter bengal monaco khaje, $(PRODUCT_BOARD_PLATFORM)),$(PRODUCT_BOARD_PLATFORM))
PRODUCT_VENDOR_PROPERTIES += \
    vendor.display.disable_offline_rotator=1
else
PRODUCT_VENDOR_PROPERTIES += \
    vendor.display.disable_rotator_ubwc=1 \
    vendor.display.normal_noc_efficiency_factor=0.85 \
    vendor.display.camera_noc_efficiency_factor=0.70 \
    vendor.display.disable_layer_stitch=0 \
    vendor.display.secure_preview_buffer_format=420_sp \
    vendor.gralloc.secure_preview_buffer_format=420_sp \
    debug.sf.enable_advanced_sf_phase_offset=1 \
    debug.sf.high_fps_late_sf_phase_offset_ns=-2000000 \
    debug.sf.high_fps_early_phase_offset_ns=-5000000 \
    debug.sf.high_fps_early_gl_phase_offset_ns=-2000000
endif

ifeq ($(TARGET_1G_DDR_RAM), true)
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.disable_layer_stitch=1 \
    vendor.display.disable_cache_manager=1
endif

ifeq ($(TARGET_1G_DDR_RAM), true)
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.disable_layer_stitch=1 \
    vendor.display.disable_cache_manager=1
endif

ifeq ($(TARGET_1G_DDR_RAM), true)
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.disable_layer_stitch=1 \
    vendor.display.disable_cache_manager=1
endif

ifeq ($(PRODUCT_BOARD_PLATFORM),monaco)
PRODUCT_VENDOR_PROPERTIES += \
    vendor.display.disable_layer_stitch=1
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.max_frame_buffer_acquired_buffers=3
endif

ifeq ($(PRODUCT_BOARD_PLATFORM),kona)
PRODUCT_VENDOR_PROPERTIES += \
    debug.sf.enable_gl_backpressure=1 \
    debug.sf.enable_advanced_sf_phase_offset=1 \
    debug.sf.high_fps_late_sf_phase_offset_ns=-2000000 \
    debug.sf.high_fps_early_phase_offset_ns=-4000000 \
    debug.sf.high_fps_early_gl_phase_offset_ns=-2000000
endif

ifeq ($(PRODUCT_BOARD_PLATFORM),lito)
PRODUCT_VENDOR_PROPERTIES += \
    debug.sf.high_fps_late_sf_phase_offset_ns=-2000000 \
    debug.sf.high_fps_early_phase_offset_ns=-4000000 \
    debug.sf.high_fps_early_gl_phase_offset_ns=-2000000 \
    debug.sf.perf_fps_late_sf_phase_offset_ns=-5000000 \
    debug.sf.perf_fps_early_phase_offset_ns=-5000000 \
    debug.sf.perf_fps_early_gl_phase_offset_ns=-5000000 \
    debug.sf.enable_advanced_sf_phase_offset=1
endif

ifeq ($(TARGET_FWK_SUPPORTS_FULL_VALUEADDS), true)
  ifeq ($(PRODUCT_BOARD_PLATFORM),lito)
  PRODUCT_VENDOR_PROPERTIES += \
      vendor.display.enable_perf_hint_large_comp_cycle=1
  endif
endif

#Set WCG properties
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.has_wide_color_display=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.has_HDR_display=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.use_color_management=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.wcg_composition_dataspace=143261696
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.protected_contents=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.force_hwc_copy_for_virtual_displays=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.max_frame_buffer_acquired_buffers=3
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.max_virtual_display_dimension=4096

ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
# Recovery is enabled, logging is enabled
PRODUCT_VENDOR_PROPERTIES += \
    vendor.display.disable_hw_recovery_dump=0
else
# Recovery is enabled, logging is disabled
PRODUCT_VENDOR_PROPERTIES += \
    vendor.display.disable_hw_recovery_dump=1
endif

# Enable power async mode
PRODUCT_VENDOR_PROPERTIES +=  vendor.display.enable_async_powermode=1

QMAA_ENABLED_HAL_MODULES += display
ifeq ($(TARGET_USES_QMAA),true)
ifeq ($(TARGET_USES_QMAA_OVERRIDE_DISPLAY),true)
PRODUCT_VENDOR_PROPERTIES += \
    vendor.display.enable_null_display=0
else
TARGET_IS_HEADLESS := true
PRODUCT_VENDOR_PROPERTIES += \
    vendor.display.enable_null_display=1
endif
endif

# Properties using default value:
#    vendor.display.disable_hw_recovery=0
