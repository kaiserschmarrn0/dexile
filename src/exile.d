import bindbc.sdl;
import bindbc.opengl;

import stb.image.binding;

//import imgui;

import io;

extern (C++) void cpf(int a);

struct mallocator(string name, bool log = true) {
    T* make(T)(size_t n = 1) {
        import core.stdc.stdlib : malloc;

        return malloc(n * T.sizeof);
    }

    T* alloc(size_t n) {

    }

    T* dealloc() {
        
    }
}

struct vec(T) {
    T* data = null;
    uint len;
    uint cap;


}

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

extern(C++, ImGui) ImGuiContext* CreateContext(ImFontAtlas* shared_font_atlas = null);

extern(C) void main() {

    { // create win
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
        print(cast(int)sup);
        if (sup != GLSupport.gl45) {
            die("failed to load opengl 4.5.");
        }
        
        info("loaded opengl 4.5.");
    }
	SDL_Init(0);

    const GLSupport support = loadOpenGL();

    ImGui.CreateContext();

    int w, h, channels;
    ubyte *data = stbi_load("nothing", &w, &h, &channels, 0);

    nested_struct nj;
    refl_test t = { ptr : &nj };
    
    print("hello! ", t, " this is convenient!\n");
    info("look at that filename!");
    warn("something bad is going on!");
    die("time to go!");

	return;
}