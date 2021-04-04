;; Menus Widget Triggers
;; Provide HSC variables to intercept buttons from Lua

;; Function name: set_<menu_name>_trigger
;; Value name: <menu_name>_trigger

;; Gametypes Menu
(script static void set_gametypes_menu_trigger_1
    (set gametypes_menu_trigger_1 true)
)
(script static void set_gametypes_menu_trigger_2
    (set gametypes_menu_trigger_2 true)
)
(script static void set_gametypes_menu_trigger_3
    (set gametypes_menu_trigger_3 true)
)
(script static void set_gametypes_menu_trigger_4
    (set gametypes_menu_trigger_4 true)
)
(script static void set_gametypes_menu_trigger_5
    (set gametypes_menu_trigger_5 true)
)
(script static void set_gametypes_menu_trigger_6
    (set gametypes_menu_trigger_6 true)
)
;; Functions for UI effects purposes

(script static void menu_blur_on
    (begin
        (cinematic_screen_effect_start true)
        ;; Cantidad de blur, Tipo de blur, Desenfoque a blur,
        ;; Blur a desenfoque, Tiempo de interpolación.
        (cinematic_screen_effect_set_convolution 3 1 1 2 0)
        (cinematic_screen_effect_start false)
    )
)

(script static void menu_blur_off
    (cinematic_stop)
)

;; UI Startup
;; Fade screen from black to transparent
(script startup fade_startup
    (fade_in 0 0 0 60)
)

;; PVS Cameras
;; Enable cameras to see animations and effects
(script startup pvs_cameras
    (begin
        (object_pvs_set_camera "uicam")
        (object_pvs_set_camera "load_campaign")
        (object_pvs_set_camera "settings")
        (object_pvs_set_camera "multiplayer")
        (object_pvs_set_camera "new_campaign")
    )
)

;; Block input controls
;; Prevent player from sending inputs
(script static void block_controls
    (begin
        (player_enable_input 0)
        (player_camera_control 0)
        (camera_control 1)
        (camera_set uicam 1)
   )
)

(script static void fade_in
    (fade_in 0 0 0 60)
)

(script static void fade_out
    (fade_out 0 0 0 60)
)
