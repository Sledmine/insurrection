;; UI FX
(script static void menu_blur_on
    (begin
        (cinematic_screen_effect_start true)
        ;; Blur quantity, blur type, focus to blur, blur to focus, interpolation time???
        (cinematic_screen_effect_set_convolution 2 2 1 2 0)
        (cinematic_screen_effect_start false)
    )
)

(script static void menu_blur_off
    (cinematic_stop)
)

;; Allow cameras to see animations and effects
(script startup pvs_cameras
    (object_pvs_set_camera "ui_camera")
    (object_pvs_set_camera "old_ui_camera")
    (object_pvs_set_camera "new_campaign")
    (object_pvs_set_camera "load_campaign")
    (object_pvs_set_camera "multiplayer")
    (object_pvs_set_camera "settings")
    (object_pvs_set_camera "customization_color")
    (object_pvs_set_camera "customization_lobby")
)

(script static void restore_halo_background
    (switch_bsp 0)
    (object_create halo)
    (object_destroy_containing "customization")
    (object_destroy_containing "prop")
)

;; Block controls, prevent player from sending inputs
(script static void block_controls
    (begin
        (player_enable_input 0)
        (player_camera_control 0)
        (camera_control 1)
        (camera_set ui_camera 1)
    )
)

;; Fade screen from black to transparent
(script static void fade_screen_in
    (fade_in 0 0 0 60)
)

;; Fade screen from transparent to black
(script static void fade_screen_out
    (fade_out 0 0 0 60)
)

(script static void set_ui_background
    (menu_blur_on)
    (restore_halo_background)
    (camera_control 1)
    (camera_set ui_camera 0)
)

(script static void set_multiplayer_background
    (menu_blur_on)
    (restore_halo_background)
    (camera_control 1)
    (camera_set multiplayer 0)
)

(script static void set_customization_background
    (menu_blur_off)
    (switch_bsp 1)
    (object_destroy halo)
    (object_create_containing "customization")
    (object_create_containing "prop")
    (objects_attach customization_biped "right hand" customization_prop_ar "attach_point")
    (camera_control 1)
    (camera_set customization_lobby 0)
)

;; UI Main
(script startup ui_main
    (fade_screen_in)
)