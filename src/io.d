module io;

import std.traits;

int esnprintf(A...)(char[] str, immutable(char)* fmt, A a) {
    import core.stdc.stdio : snprintf;
    return snprintf(str.ptr, str.length, fmt, a);
}

int format_type(T : bool)(char[] str, T val) {
    return esnprintf(str, "%s", val ? "true".ptr : "false".ptr);
}

int format_type(T : byte)(char[] str, T val) {
    return esnprintf(str, "%hhd", val);
}

int format_type(T : ubyte)(char[] str, T val) {
    return esnprintf(str, "%hhu", val);
}

int format_type(T : short)(char[] str, T val) {
    return esnprintf(str, "%hd", val);
}

int format_type(T : ushort)(char[] str, T val) {
    return esnprintf(str, "%hu", val);
}

int format_type(T : int)(char[] str, T val) if (!is(T == enum)) {
    return esnprintf(str, "%d", val);
}

int format_type(T : uint)(char[] str, T val) if (!is(T == enum)) {
    return esnprintf(str, "%u", val);
}

int format_type(T : long)(char[] str, T val) if (!is(T == enum)) {
    return esnprintf(str, "%ld", val);
}

int format_type(T : ulong)(char[] str, T val) if (!is(T == enum)) {
    return esnprintf(str, "%lu", val);
}

int format_type(T : float)(char[] str, T val) {
    return esnprintf(str, "%f", val);
}

int format_type(T : double)(char[] str, T val) {
    return esnprintf(str, "%lf", val);
}

int format_type(T : double)(char[] str, T val) {
    return esnprintf(str, "%lf", val);
}

int format_type(T : char)(char[] str, T val) {
    return esnprintf(str, "%c", val);
}

int format_type(T)(char[] str, T val) if (isPointer!(T)) {
    if (val == null) {
        return esnprintf(str, "null");
    }

    return format_type!(typeof(*val))(str, *val);
}

int format_type(T : string)(char[] str, T val) { // for inline literals
    return esnprintf(str, "%s", val.ptr);
}

int format_type(T)(char[] str, T val) if (isArray!(T)) {
    int idx = 0;
    int err = 0;
    err = esnprintf(str, "[ ");
    idx += err;
    if (err < 0 || idx >= str.length) return -1;
    foreach(i; 0..val.length) {
        err = format_type!(typeof(*val.ptr))(str[idx..str.length], val[i]);
        idx += err;
        if (err < 0 || idx >= str.length) return -1;
        err = esnprintf(str[idx..str.length], ", ");
        idx += err;
        if (err < 0 || idx >= str.length) return -1;
    }
    err = esnprintf(str[idx..str.length], "]");
    idx += err;
    if (err < 0 || idx >= str.length) return -1;
    return idx;
}

int format_type(T : int)(char[] str, T val) if (is(T == enum)) {
    immutable(immutable(char)*[__traits(allMembers, T).length]) names = [ __traits(allMembers, T) ];
    if (val < names.length) { // your enum is fucked up :^)
        return esnprintf(str, "%s (%d)", names[val], val);
    }
    
    return esnprintf(str, "%d", val);
}

int format_type(T)(char[] str, T val) if (!isArray!(T) && !isPointer!(T)) {
    int idx = 0;
    int err = 0;
    err = esnprintf(str, "{ ");
    idx += err;
    if (err < 0 || idx >= str.length) return -1;
    static foreach(mem; __traits(allMembers, T)) {
        static if (__traits(compiles, __traits(getMember, T, mem).offsetof)) {
            err = esnprintf(str[idx..str.length], "%s %s : ", typeof(__traits(getMember, T, mem)).stringof.ptr, mem.ptr);
            idx += err;
            if (err < 0 || idx >= str.length) return -1;
            err = format_type!(typeof(__traits(getMember, T, mem)))(str[idx..str.length], *cast(typeof(__traits(getMember, T, mem))*)(cast(ubyte*)&val + __traits(getMember, T, mem).offsetof));
            idx += err;
            if (err < 0 || idx >= str.length) return -1;
            err = esnprintf(str[idx..str.length], ", ");
            idx += err;
            if (err < 0 || idx >= str.length) return -1;
        }
    }
    err = esnprintf(str[idx..str.length], "}");
    idx += err;
    if (err < 0 || idx >= str.length) return -1;
    return idx;
}

int sprint(A...)(char[] str, A a) {
    import core.stdc.stdio : sprintf;

    int idx = 0;
    int err = 0;
    static foreach(i, var; a) {
        err = format_type!(A[i])(str[idx..str.length], var);
        idx += err;
        if (err < 0 || idx >= str.length) return -1;
    }
    return idx;
}

import core.sys.posix.pthread;

__gshared pthread_mutex_t scratch_lock;
__gshared char[1000] scratch;

int print(A...)(A a) {
    import core.stdc.stdio : fputs, stdout;

    pthread_mutex_lock(&scratch_lock);
    const int got = sprint(scratch, a);
    fputs(scratch.ptr, stdout);
    pthread_mutex_unlock(&scratch_lock);

    if (got < 0) fputs(" !!! scratch buffer full !!!\n", stdout);

    return got;
}

pragma(inline) int info(A...)(A a, string file = __FILE__, int line = __LINE__) {
    return print(file, "(", line, ") \033[38;2;100;149;237;1m[info]\033[0m: ", a, '\n');
}

pragma(inline) int warn(A...)(A a, string file = __FILE__, int line = __LINE__) {
    return print(file, "(", line, ") \033[38;2;240;230;140;1m[warn]\033[0m: ", a, '\n');
}

pragma(inline) void die(A...)(A a, string file = __FILE__, int line = __LINE__) {
    import core.stdc.stdlib : exit;

    print(file, "(", line, ") \033[38;2;255;160;122;1m[fatal]\033[0m: ", a, '\n');
    exit(0);
}