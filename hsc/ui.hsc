(global boolean gametypes_menu_trigger_1 false)
(global boolean gametypes_menu_trigger_2 false)
(global boolean gametypes_menu_trigger_3 false)
(global boolean gametypes_menu_trigger_4 false)
(global boolean gametypes_menu_trigger_5 false)
(global boolean gametypes_menu_trigger_6 false)

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
    (begin
        (object_pvs_set_camera "ui_camera")
        (object_pvs_set_camera "old_ui_camera")
        (object_pvs_set_camera "new_campaign")
        (object_pvs_set_camera "load_campaign")
        (object_pvs_set_camera "multiplayer")
        (object_pvs_set_camera "settings")
    )
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

(script static void fade_screen_in
    (fade_in 0 0 0 60)
)

(script static void fade_screen_out
    (fade_out 0 0 0 60)
)

(script static void set_ui_background
    (camera_control 1)
    (camera_set ui_camera 0)
)

(script static void set_multiplayer_background
    (camera_control 1)
    (camera_set multiplayer 0)
)

;; UI Main
(script startup ui_main
    ;; Fade screen from black to transparent
    (fade_screen_in)
)