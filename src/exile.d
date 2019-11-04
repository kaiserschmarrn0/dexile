import bindbc.sdl;
import bindbc.opengl;

import stb.image;

import io;
import mem;

struct nested_struct {
    const int nest_int = 2;
    char nest_char = 'p';
}

enum nested_enum {
    nest_0,
    nest_1,
    nest_2,
    nest_3 = 4
}

struct refl_test {
    int[3] i = [ 0, 2, 4 ];
    nested_enum a = nested_enum.nest_0;
    bool bt = true;
    nested_struct* ptr;
}

struct ImGuiContext;
struct ImFontAtlas;
struct ImGuiStyle;

extern(C++, ImGui) {
    ImGuiContext* CreateContext(ImFontAtlas* shared_font_atlas = null);
    void SetAllocatorFunctions(void* function(size_t sz, void* user_data) alloc_func, void function(void* ptr, void* user_data) free_func, void* user_data = null);
    void StyleColorsDark(ImGuiStyle* dst = null);
}

extern(C++) { // sdl
    bool ImGui_ImplSDL2_InitForOpenGL(SDL_Window* window, void* sdl_gl_context);
}

extern(C++) { // ogl
    bool ImGui_ImplOpenGL3_Init(const char* glsl_version = null);
}

extern(C) void gl_debug(uint source, uint type, uint id, uint severity, int length, const(char)* message, void *user_param) nothrow {
    immutable(char)* source_str = null;
    switch(source) {
        case GL_DEBUG_SOURCE_API: source_str = "api"; break;
        case GL_DEBUG_SOURCE_WINDOW_SYSTEM: source_str = "window system"; break;
        case GL_DEBUG_SOURCE_SHADER_COMPILER: source_str = "shader compiler"; break;
        case GL_DEBUG_SOURCE_THIRD_PARTY: source_str = "third party"; break;
        case GL_DEBUG_SOURCE_APPLICATION: source_str = "application"; break;
        case GL_DEBUG_SOURCE_OTHER: source_str = "other"; break;
        default: assert(0);
    }

    immutable(char)* type_str = null;
    switch(type) {
        case GL_DEBUG_TYPE_ERROR: type_str = "error"; break;
        case GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR: type_str = "deprecated behaviour"; break;
        case GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR: type_str = "undefined behaviour"; break;
        case GL_DEBUG_TYPE_PORTABILITY: type_str = "portability"; break;
        case GL_DEBUG_TYPE_PERFORMANCE: type_str = "performance"; break;
        case GL_DEBUG_TYPE_MARKER: type_str = "marker"; break;
        case GL_DEBUG_TYPE_PUSH_GROUP: type_str = "push group"; break;
        case GL_DEBUG_TYPE_POP_GROUP: type_str = "pop group"; break;
        case GL_DEBUG_TYPE_OTHER: type_str = "other"; break;
        default: assert(0);
    }

    immutable(char)* severity_str = null;
    switch(severity) {
        case GL_DEBUG_SEVERITY_HIGH: severity_str = "high"; break;
        case GL_DEBUG_SEVERITY_MEDIUM: severity_str = "medium"; break;
        case GL_DEBUG_SEVERITY_LOW: severity_str = "low"; break;
        case GL_DEBUG_SEVERITY_NOTIFICATION: severity_str = "notification"; break;
        default: assert(0);
    }

    info("opengl debug (", source_str, ", ", type_str, ", ", severity_str, " severity): ", message);
}

extern(C++) void* imgui_alloc(size_t sz, void*) {
    return mallocator!("imgui").make!(ubyte)(sz);
}

extern(C++) void imgui_free(void *mem, void*) {
    mallocator!("imgui").dealloc!(ubyte)(mem);
}

extern(C) void main() {

    { // test win
        SDL_Init(SDL_INIT_EVERYTHING);

        SDL_GL_SetAttribute(SDL_GL_CONTEXT_FLAGS, SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG);
        SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_CORE);
        SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);

        SDL_Window* win = SDL_CreateWindow("Exile", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 1280, 720, SDL_WINDOW_OPENGL | SDL_WINDOW_RESIZABLE);
        if (!win) {
            die("failed to create sdl window.");
        }

        info("created sdl window.");

        SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 4);
        SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 5);

        SDL_GLContext gl_ctx = SDL_GL_CreateContext(win);
        if (!gl_ctx) {
            die("failed to create opengl 4.5 context. does your gpu support gl 4.5?");
        }

        info("created opengl 4.5 context.");

        SDL_GL_MakeCurrent(win, gl_ctx);
        SDL_GL_SetSwapInterval(1);

        GLSupport sup = loadOpenGL();
        if (sup != GLSupport.gl45) {
            warn("failed to load opengl 4.5.");
        }
        
        info("loaded opengl 4.5.");

        info("gl version: ", glGetString(GL_VERSION), '.');
        info("gl renderer: ", glGetString(GL_RENDERER), '.');
        info("gl vendor: ", glGetString(GL_VENDOR), '.');
        info("gl shading: ", glGetString(GL_SHADING_LANGUAGE_VERSION), '.');

        glEnable(GL_DEBUG_OUTPUT);
        glEnable(GL_DEBUG_OUTPUT_SYNCHRONOUS);
        glDebugMessageCallback(&gl_debug, null);
        glDebugMessageControl(GL_DONT_CARE, GL_DONT_CARE, GL_DONT_CARE, 0, null, GL_TRUE);

        ImGui.SetAllocatorFunctions(&imgui_alloc, &imgui_free, null);
        ImGui.CreateContext();

        ImGui_ImplSDL2_InitForOpenGL(win, gl_ctx);
        ImGui_ImplOpenGL3_Init();

        ImGui.StyleColorsDark();
    }
	
    /*ImGui.CreateContext();

    int w, h, channels;
    ubyte *data = stbi_load("nothing", &w, &h, &channels, 0);

    nested_struct nj;
    refl_test t = { ptr : &nj };

    vec!(int) v = vec!int.make(40);
    v.push(10);
    println(v);
    
    print("hello! ", t, " this is convenient!\n");
    info("look at that filename!");
    warn("something bad is going on!");
    die("time to go!");*/

	return;
}