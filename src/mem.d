module mem;

import io;

struct mallocator(string n = "default", bool log = true) {
    static string name = n;
    static T* make(T)(size_t n = 1) {
        import core.stdc.stdlib : calloc;

        T* ret = cast(T*) calloc(n * T.sizeof, 1);
        assert(ret);

        return ret;
    }

    static T* alloc(T)(size_t n) {
        warn("we don't alloc!!");
    }

    static void dealloc(T)(void* data) {
        import core.stdc.stdlib : free;

        free(data);
    }
}

struct vec(T, A = mallocator!()) {
    T* data = null;
    size_t len = 0;
    size_t cap = 8;

    static vec make(size_t cap = 8) {
        vec ret = {
            data : A.make!(T)(cap),
            len : 0,
            cap : cap
        };
        return ret;
    }

    static vec make(vec o) { // minimum size
        import core.stdc.string : memcpy;
        
        vec ret = {
            data : A.make!(T)(o.len),
            len : o.len,
            cap : o.len
        };
        memcpy(ret.data, o.data, T.sizeof * o.len);
        return ret;
    }

    static vec take(vec* o) {
        vec ret = *o;
        vec tmp = { data : null, len : 0, cap : 0 };
        *o = tmp;
        return ret;
    }

    void destroy() {
        A.dealloc!T(data);
        data = null;
        len = 0;
        cap = 0;
    }

    void grow() {
        import core.stdc.string : memcpy;
        
        size_t new_cap = 2 * cap;

        T* new_data = A.make!(T)(new_cap);
        memcpy(new_data, data, T.sizeof * len);
        A.dealloc!T(data);

        cap = new_cap;
        data = new_data;
    }

    void clear() {
        //destroy objects

        len = 0;
    }

    pragma(inline) bool empty() {
        return len == 0;
    }

    pragma(inline) bool full() {
        return len == cap;
    }

    void push(T n) {
        if (full()) grow();
        data[len++] = n;
    }

    T pop() {
        assert (len > 0);
        return data[len--];
    }

    ref T opIndex(size_t idx) {
        assert(0 <= idx && idx < len);
        return data[idx];
    }
}