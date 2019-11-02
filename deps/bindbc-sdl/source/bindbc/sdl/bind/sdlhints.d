
//          Copyright Michael D. Parker 2018.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.sdl.bind.sdlhints;

import bindbc.sdl.config;
import bindbc.sdl.bind.sdlstdinc : SDL_bool;

enum SDL_HINT_FRAMEBUFFER_ACCELERATION = "SDL_FRAMEBUFFER_ACCELERATION";
enum SDL_HINT_RENDER_DRIVER = "SDL_RENDER_DRIVER";
enum SDL_HINT_RENDER_OPENGL_SHADERS = "SDL_RENDER_OPENGL_SHADERS";
enum SDL_HINT_RENDER_SCALE_QUALITY = "SDL_RENDER_SCALE_QUALITY";
enum SDL_HINT_RENDER_VSYNC = "SDL_RENDER_VSYNC";
enum SDL_HINT_VIDEO_X11_XVIDMODE = "SDL_VIDEO_X11_XVIDMODE";
enum SDL_HINT_VIDEO_X11_XINERAMA = "SDL_VIDEO_X11_XINERAMA";
enum SDL_HINT_VIDEO_X11_XRANDR = "SDL_VIDEO_X11_XRANDR";
enum SDL_HINT_GRAB_KEYBOARD = "SDL_GRAB_KEYBOARD";
enum SDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS = "SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS";
enum SDL_HINT_IDLE_TIMER_DISABLED = "SDL_IOS_IDLE_TIMER_DISABLED";
enum SDL_HINT_ORIENTATIONS = "SDL_IOS_ORIENTATIONS";
enum SDL_HINT_XINPUT_ENABLED = "SDL_XINPUT_ENABLED";
enum SDL_HINT_GAMECONTROLLERCONFIG = "SDL_GAMECONTROLLERCONFIG";
enum SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS = "SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS";
enum SDL_HINT_ALLOW_TOPMOST = "SDL_ALLOW_TOPMOST";
enum SDL_HINT_TIMER_RESOLUTION = "SDL_TIMER_RESOLUTION";

static if(sdlSupport >= SDLSupport.sdl201) {
    enum SDL_HINT_RENDER_DIRECT3D_THREADSAFE = "SDL_RENDER_DIRECT3D_THREADSAFE";
    enum SDL_HINT_VIDEO_HIGHDPI_DISABLED = "SDL_VIDEO_HIGHDPI_DISABLED";
}

static if(sdlSupport >= SDLSupport.sdl202) {
    enum SDL_HINT_VIDEO_ALLOW_SCREENSAVER = "SDL_VIDEO_ALLOW_SCREENSAVER";
    enum SDL_HINT_MOUSE_RELATIVE_MODE_WARP = "SDL_MOUSE_RELATIVE_MODE_WARP";
    enum SDL_HINT_ACCELEROMETER_AS_JOYSTICK = "SDL_ACCELEROMETER_AS_JOYSTICK";
    enum SDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK = "SDL_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK";
    enum SDL_HINT_VIDEO_WIN_D3DCOMPILER = "SDL_VIDEO_WIN_D3DCOMPILER";
    enum SDL_HINT_VIDEO_WINDOW_SHARE_PIXEL_FORMAT = "SDL_VIDEO_WINDOW_SHARE_PIXEL_FORMAT";
    enum SDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES = "SDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES";
}

// This is *intended* to be == and not >=. The values for all of these changed in 2.0.4.
static if(sdlSupport == SDLSupport.sdl203) {
    enum SDL_HINT_RENDER_DIRECT3D11_DEBUG = "SDL_HINT_RENDER_DIRECT3D11_DEBUG";
    enum SDL_HINT_WINRT_PRIVACY_POLICY_URL = "SDL_HINT_WINRT_PRIVACY_POLICY_URL";
    enum SDL_HINT_WINRT_PRIVACY_POLICY_LABEL = "SDL_HINT_WINRT_PRIVACY_POLICY_LABEL";
    enum SDL_HINT_WINRT_HANDLE_BACK_BUTTON = "SDL_HINT_WINRT_HANDLE_BACK_BUTTON";
}

static if(sdlSupport >= SDLSupport.sdl204) {
    enum SDL_HINT_VIDEO_X11_NET_WM_PING = "SDL_VIDEO_X11_NET_WM_PING";
    enum SDL_HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN = "SDL_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN";
    enum SDL_HINT_WINDOWS_ENABLE_MESSAGELOOP = "SDL_WINDOWS_ENABLE_MESSAGELOOP";
    enum SDL_HINT_XINPUT_USE_OLD_JOYSTICK_MAPPING = "SDL_XINPUT_USE_OLD_JOYSTICK_MAPPING";
    enum SDL_HINT_THREAD_STACK_SIZE = "SDL_THREAD_STACK_SIZE";
    enum SDL_HINT_MAC_BACKGROUND_APP = "SDL_MAC_BACKGROUND_APP";
    enum SDL_HINT_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION = "SDL_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION";
    enum SDL_HINT_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION = "SDL_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION";
    enum SDL_HINT_IME_INTERNAL_EDITING = "SDL_IME_INTERNAL_EDITING";
    enum SDL_HINT_EMSCRIPTEN_KEYBOARD_ELEMENT = "SDL_EMSCRIPTEN_KEYBOARD_ELEMENT";
    enum SDL_HINT_NO_SIGNAL_HANDLERS = "SDL_NO_SIGNAL_HANDLERS";
    enum SDL_HINT_WINDOWS_NO_CLOSE_ON_ALT_F4 = "SDL_WINDOWS_NO_CLOSE_ON_ALT_F4";

    // Changed values from those introduced in 2.0.3
    enum SDL_HINT_RENDER_DIRECT3D11_DEBUG = "SDL_RENDER_DIRECT3D11_DEBUG";
    enum SDL_HINT_WINRT_PRIVACY_POLICY_URL = "SDL_WINRT_PRIVACY_POLICY_URL";
    enum SDL_HINT_WINRT_PRIVACY_POLICY_LABEL = "SDL_WINRT_PRIVACY_POLICY_LABEL";
    enum SDL_HINT_WINRT_HANDLE_BACK_BUTTON = "SDL_WINRT_HANDLE_BACK_BUTTON";
}

static if(sdlSupport >= SDLSupport.sdl205) {
    enum SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH = "SDL_MOUSE_FOCUS_CLICKTHROUGH";
    enum SDL_HINT_APPLE_TV_CONTROLLER_UI_EVENTS = "SDL_APPLE_TV_CONTROLLER_UI_EVENTS";
    enum SDL_HINT_APPLE_TV_REMOTE_ALLOW_ROTATION = "SDL_APPLE_TV_REMOTE_ALLOW_ROTATION";
    enum SDL_HINT_BMP_SAVE_LEGACY_FORMAT = "SDL_BMP_SAVE_LEGACY_FORMAT";
    enum SDL_HINT_WINDOWS_DISABLE_THREAD_NAMING = "SDL_WINDOWS_DISABLE_THREAD_NAMING";
    enum SDL_HINT_RPI_VIDEO_LAYER = "SDL_RPI_VIDEO_LAYER";
}

static if(sdlSupport >= SDLSupport.sdl206) {
    enum SDL_HINT_RENDER_LOGICAL_SIZE_MODE = "SDL_RENDER_LOGICAL_SIZE_MODE";
    enum SDL_HINT_WINDOWS_INTRESOURCE_ICON = "SDL_WINDOWS_INTRESOURCE_ICON";
    enum SDL_HINT_WINDOWS_INTRESOURCE_ICON_SMALL = "SDL_WINDOWS_INTRESOURCE_ICON_SMALL";
    enum SDL_HINT_MOUSE_NORMAL_SPEED_SCALE = "SDL_MOUSE_NORMAL_SPEED_SCALE";
    enum SDL_HINT_MOUSE_RELATIVE_SPEED_SCALE = "SDL_MOUSE_RELATIVE_SPEED_SCALE";
    enum SDL_HINT_TOUCH_MOUSE_EVENTS = "SDL_TOUCH_MOUSE_EVENTS";
    enum SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES = "SDL_GAMECONTROLLER_IGNORE_DEVICES";
    enum SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT = "SDL_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT";
    enum SDL_HINT_QTWAYLAND_CONTENT_ORIENTATION = "SDL_QTWAYLAND_CONTENT_ORIENTATION";
    enum SDL_HINT_QTWAYLAND_WINDOW_FLAGS = "SDL_QTWAYLAND_WINDOW_FLAGS";
    enum SDL_HINT_OPENGL_ES_DRIVER = "SDL_OPENGL_ES_DRIVER";
    enum SDL_HINT_AUDIO_RESAMPLING_MODE = "SDL_AUDIO_RESAMPLING_MODE";
    enum SDL_HINT_AUDIO_CATEGORY = "SDL_AUDIO_CATEGORY";
}

static if(sdlSupport >= SDLSupport.sdl208) {
    enum SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR = "SDL_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR";
    enum SDL_HINT_IOS_HIDE_HOME_INDICATOR = "SDL_IOS_HIDE_HOME_INDICATOR";
    enum SDL_HINT_TV_REMOTE_AS_JOYSTICK = "SDL_TV_REMOTE_AS_JOYSTICK";
    enum SDL_HINT_RETURN_KEY_HIDES_IME = "SDL_RETURN_KEY_HIDES_IME";
    enum SDL_HINT_VIDEO_DOUBLE_BUFFER = "SDL_VIDEO_DOUBLE_BUFFER";
}

static if(sdlSupport >= SDLSupport.sdl209) {
    enum SDL_HINT_MOUSE_DOUBLE_CLICK_TIME = "SDL_MOUSE_DOUBLE_CLICK_TIME";
    enum SDL_HINT_MOUSE_DOUBLE_CLICK_RADIUS = "SDL_MOUSE_DOUBLE_CLICK_RADIUS";
    enum SDL_HINT_JOYSTICK_HIDAPI = "SDL_JOYSTICK_HIDAPI";
    enum SDL_HINT_JOYSTICK_HIDAPI_PS4 = "SDL_JOYSTICK_HIDAPI_PS4";
    enum SDL_HINT_JOYSTICK_HIDAPI_PS4_RUMBLE = "SDL_JOYSTICK_HIDAPI_PS4_RUMBLE";
    enum SDL_HINT_JOYSTICK_HIDAPI_STEAM = "SDL_JOYSTICK_HIDAPI_STEAM";
    enum SDL_HINT_JOYSTICK_HIDAPI_SWITCH = "SDL_JOYSTICK_HIDAPI_SWITCH";
    enum SDL_HINT_JOYSTICK_HIDAPI_XBOX = "SDL_JOYSTICK_HIDAPI_XBOX";
    enum SDL_HINT_ENABLE_STEAM_CONTROLLERS = "SDL_ENABLE_STEAM_CONTROLLERS";
    enum SDL_HINT_ANDROID_TRAP_BACK_BUTTON = "SDL_ANDROID_TRAP_BACK_BUTTON";
}

static if(sdlSupport >= SDLSupport.sdl2010) {
    enum SDL_HINT_MOUSE_TOUCH_EVENTS = "SDL_MOUSE_TOUCH_EVENTS";
    enum SDL_HINT_GAMECONTROLLERCONFIG_FILE = "SDL_GAMECONTROLLERCONFIG_FILE";
    enum SDL_HINT_ANDROID_BLOCK_ON_PAUSE = "SDL_ANDROID_BLOCK_ON_PAUSE";
    enum SDL_HINT_RENDER_BATCHING = "SDL_RENDER_BATCHING";
    enum SDL_HINT_EVENT_LOGGING = "SDL_EVENT_LOGGING";
    enum SDL_HINT_WAVE_RIFF_CHUNK_SIZE = "SDL_WAVE_RIFF_CHUNK_SIZE";
    enum SDL_HINT_WAVE_TRUNCATION = "SDL_WAVE_TRUNCATION";
    enum SDL_HINT_WAVE_FACT_CHUNK = "SDL_WAVE_FACT_CHUNK";
}
else static if(sdlSupport >= SDLSupport.sdl204) {
    // Added in 2.0.4, removed in 2.0.10.
    enum SDL_HINT_ANDROID_SEPARATE_MOUSE_AND_TOUCH = "SDL_ANDROID_SEPARATE_MOUSE_AND_TOUCH";
}

enum SDL_HintPriority {
    SDL_HINT_DEFAULT,
    SDL_HINT_NORMAL,
    SDL_HINT_OVERRIDE,
}
mixin(expandEnum!SDL_HintPriority);

extern(C) nothrow alias SDL_HintCallback = void function(void*, const(char)*, const(char)*);

version(BindSDL_Static) {
    extern(C) @nogc nothrow {
        SDL_bool SDL_SetHintWithPriority(const(char)*,const(char)*,SDL_HintPriority);
        SDL_bool SDL_SetHint(const(char)*,const(char)*);
        const(char)* SDL_GetHint(const(char)*);
        void SDL_AddHintCallback(const(char)*,SDL_HintCallback,void*);
        void SDL_DelHintCallback(const(char)*,SDL_HintCallback,void*);
        void SDL_ClearHints();

        static if(sdlSupport >= SDLSupport.sdl205) {
            SDL_bool SDL_GetHintBoolean(const(char)*,SDL_bool);
        }
    }
}
else {
    extern(C) @nogc nothrow {
        alias pSDL_SetHintWithPriority = SDL_bool function(const(char)*,const(char)*,SDL_HintPriority);
        alias pSDL_SetHint = SDL_bool function(const(char)*,const(char)*);
        alias pSDL_GetHint = const(char)* function(const(char)*);
        alias pSDL_AddHintCallback = void function(const(char)*,SDL_HintCallback,void*);
        alias pSDL_DelHintCallback = void function(const(char)*,SDL_HintCallback,void*);
        alias pSDL_ClearHints = void function();
    }

    __gshared {
        pSDL_SetHintWithPriority SDL_SetHintWithPriority;
        pSDL_SetHint SDL_SetHint;
        pSDL_GetHint SDL_GetHint;
        pSDL_AddHintCallback SDL_AddHintCallback;
        pSDL_DelHintCallback SDL_DelHintCallback;
        pSDL_ClearHints SDL_ClearHints;
    }

    static if(sdlSupport >= SDLSupport.sdl205) {
        extern(C) @nogc nothrow {
            alias pSDL_GetHintBoolean = SDL_bool function(const(char)*,SDL_bool);
        }

        __gshared {
            pSDL_GetHintBoolean SDL_GetHintBoolean;
        }
    }
}