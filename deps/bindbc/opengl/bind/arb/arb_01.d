//          Copyright Michael D. Parker 2018.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.opengl.bind.arb.arb_01;

import bindbc.loader;
import bindbc.opengl.config,
       bindbc.opengl.context;
import bindbc.opengl.bind.types;

// ARB_bindless_texture
version(GL_ARB) enum useARBBindlessTexture = true;
else version(GL_ARB_bindless_texture) enum useARBBindlessTexture = true;
else enum useARBBindlessTexture = false;

static if(useARBBindlessTexture) {
    private bool _hasARBBindlessTexture;
    bool hasARBBindlessTexture() { return _hasARBBindlessTexture; }

    enum uint GL_UNSIGNED_INT64_ARB = 0x140F;

    extern(System) @nogc nothrow  {
        alias pglGetTextureHandleARB = GLuint64 function(GLuint);
        alias pglGetTextureSamplerHandleARB = GLuint64 function(GLuint,GLuint);
        alias pglMakeTextureHandleResidentARB = void function(GLuint64);
        alias pglMakeTextureHandleNonResidentARB = void function(GLuint64);
        alias pglGetImageHandleARB = GLuint64 function(GLuint,GLint,GLboolean,GLint,GLenum);
        alias pglMakeImageHandleResidentARB = void function(GLuint64,GLenum);
        alias pglMakeImageHandleNonResidentARB = void function(GLuint64);
        alias pglUniformHandleui64ARB = void function(GLint,GLuint64);
        alias pglUniformHandleui64vARB = void function(GLint,GLsizei,const(GLuint64)*);
        alias pglProgramUniformHandleui64ARB = void function(GLuint,GLint,GLuint64);
        alias pglProgramUniformHandleui64vARB = void function(GLuint,GLint,GLsizei,const(GLuint64)*);
        alias pglIsTextureHandleResidentARB = GLboolean function(GLuint64);
        alias pglIsImageHandleResidentARB = GLboolean function(GLuint64);
        alias pglVertexAttribL1ui64ARB = void function(GLuint,GLuint64);
        alias pglVertexAttribL1ui64vARB = void function(GLuint,const(GLuint64)*);
        alias pglGetVertexAttribLui64vARB = void function(GLuint,GLenum,GLuint64*);
    }

    extern(C++) __gshared {
        pglGetTextureHandleARB glGetTextureHandleARB;
        pglGetTextureSamplerHandleARB glGetTextureSamplerHandleARB;
        pglMakeTextureHandleResidentARB glMakeTextureHandleResidentARB;
        pglMakeTextureHandleNonResidentARB glMakeTextureHandleNonResidentARB;
        pglGetImageHandleARB glGetImageHandleARB;
        pglMakeImageHandleResidentARB glMakeImageHandleResidentARB;
        pglMakeImageHandleNonResidentARB glMakeImageHandleNonResidentARB;
        pglUniformHandleui64ARB glUniformHandleui64ARB;
        pglUniformHandleui64vARB glUniformHandleui64vARB;
        pglProgramUniformHandleui64ARB glProgramUniformHandleui64ARB;
        pglProgramUniformHandleui64vARB glProgramUniformHandleui64vARB;
        pglIsTextureHandleResidentARB glIsTextureHandleResidentARB;
        pglIsImageHandleResidentARB glIsImageHandleResidentARB;
        pglVertexAttribL1ui64ARB glVertexAttribL1ui64ARB;
        pglVertexAttribL1ui64vARB glVertexAttribL1ui64vARB;
        pglGetVertexAttribLui64vARB glGetVertexAttribLui64vARB;
    }

    private @nogc nothrow
    bool loadARBBindlessTexture(SharedLib lib, GLSupport contextVersion)
    {
        lib.bindGLSymbol(cast(void**)&glGetTextureHandleARB, "glGetTextureHandleARB");
        lib.bindGLSymbol(cast(void**)&glGetTextureSamplerHandleARB, "glGetTextureSamplerHandleARB");
        lib.bindGLSymbol(cast(void**)&glMakeTextureHandleResidentARB, "glMakeTextureHandleResidentARB");
        lib.bindGLSymbol(cast(void**)&glMakeTextureHandleNonResidentARB, "glMakeTextureHandleNonResidentARB");
        lib.bindGLSymbol(cast(void**)&glGetImageHandleARB, "glGetImageHandleARB");
        lib.bindGLSymbol(cast(void**)&glMakeImageHandleResidentARB, "glMakeImageHandleResidentARB");
        lib.bindGLSymbol(cast(void**)&glMakeImageHandleNonResidentARB, "glMakeImageHandleNonResidentARB");
        lib.bindGLSymbol(cast(void**)&glUniformHandleui64ARB, "glUniformHandleui64ARB");
        lib.bindGLSymbol(cast(void**)&glUniformHandleui64vARB, "glUniformHandleui64vARB");
        lib.bindGLSymbol(cast(void**)&glProgramUniformHandleui64ARB, "glProgramUniformHandleui64ARB");
        lib.bindGLSymbol(cast(void**)&glProgramUniformHandleui64vARB, "glProgramUniformHandleui64vARB");
        lib.bindGLSymbol(cast(void**)&glIsTextureHandleResidentARB, "glIsTextureHandleResidentARB");
        lib.bindGLSymbol(cast(void**)&glIsImageHandleResidentARB, "glIsImageHandleResidentARB");
        lib.bindGLSymbol(cast(void**)&glVertexAttribL1ui64ARB, "glVertexAttribL1ui64ARB");
        lib.bindGLSymbol(cast(void**)&glVertexAttribL1ui64vARB, "glVertexAttribL1ui64vARB");
        lib.bindGLSymbol(cast(void**)&glGetVertexAttribLui64vARB, "glGetVertexAttribLui64vARB");
        return resetErrorCountGL();
    }
}
else enum hasARBBindlessTexture = false;

// ARB_cl_event
version(GL_ARB) enum useARBCLEvent = true;
else version(GL_ARB_cl_event) enum useARBCLEvent = true;
else enum useARBCLEvent = false;

static if(useARBCLEvent) {
    import bindbc.opengl.bind.arb.core_32 : GLsync;
    private bool _hasARBCLEvent;
    bool hasARBCLEvent() { return _hasARBCLEvent; }

    struct _cl_context;
    struct _cl_event;

    enum : uint {
        GL_SYNC_CL_EVENT_ARB              = 0x8240,
        GL_SYNC_CL_EVENT_COMPLETE_ARB     = 0x8241,
    }

    extern(System) @nogc nothrow alias  pglCreateSyncFromCLeventARB = GLsync function(_cl_context*, _cl_event*, GLbitfield);
    __gshared pglCreateSyncFromCLeventARB glCreateSyncFromCLeventARB;

    private @nogc nothrow
    bool loadARBCLEvent(SharedLib lib, GLSupport contextVersion)
    {
        lib.bindGLSymbol(cast(void**)&glCreateSyncFromCLeventARB, "glCreateSyncFromCLeventARB");
        return resetErrorCountGL();
    }
}
else enum hasARBCLEvent = false;

// ARB_compute_variable_group_size
version(GL_ARB) enum useARBComputeVariableGroupSize = true;
else version(GL_ARB_compute_variable_group_size) enum useARBComputeVariableGroupSize = true;
else enum useARBComputeVariableGroupSize = false;

static if(useARBComputeVariableGroupSize) {
    private bool _hasARBComputeVariableGroupSize;
    bool hasARBComputeVariableGroupSize() { return _hasARBComputeVariableGroupSize; }

    enum : uint {
        GL_MAX_COMPUTE_VARIABLE_GROUP_INVOCATIONS_ARB   = 0x9344,
        GL_MAX_COMPUTE_FIXED_GROUP_INVOCATIONS_ARB      = 0x90EB,
        GL_MAX_COMPUTE_VARIABLE_GROUP_SIZE_ARB          = 0x9345,
        GL_MAX_COMPUTE_FIXED_GROUP_SIZE_ARB             = 0x91BF,
    }

    extern(System) @nogc nothrow alias  pglDispatchComputeGroupSizeARB = GLsync function(GLuint,GLuint,GLuint,GLuint,GLuint,GLuint);
    __gshared pglDispatchComputeGroupSizeARB glDispatchComputeGroupSizeARB;

    private @nogc nothrow
    bool loadARBComputeVariableGroupSize(SharedLib lib, GLSupport contextVersion)
    {
        lib.bindGLSymbol(cast(void**)&glDispatchComputeGroupSizeARB, "glDispatchComputeGroupSizeARB");
        return resetErrorCountGL();
    }
}
else enum hasARBComputeVariableGroupSize = false;

// ARB_debug_output
version(GL_ARB) enum useARBDebugOutput = true;
else version(GL_ARB_debug_output) enum useARBDebugOutput = true;
else enum useARBDebugOutput = false;

static if(useARBDebugOutput) {
    private bool _hasARBDebugOutput;
    bool hasARBDebugOutput() { return _hasARBDebugOutput; }

    enum : uint {
        GL_DEBUG_OUTPUT_SYNCHRONOUS_ARB   = 0x8242,
        GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH_ARB = 0x8243,
        GL_DEBUG_CALLBACK_FUNCTION_ARB    = 0x8244,
        GL_DEBUG_CALLBACK_USER_PARAM_ARB  = 0x8245,
        GL_DEBUG_SOURCE_API_ARB           = 0x8246,
        GL_DEBUG_SOURCE_WINDOW_SYSTEM_ARB = 0x8247,
        GL_DEBUG_SOURCE_SHADER_COMPILER_ARB = 0x8248,
        GL_DEBUG_SOURCE_THIRD_PARTY_ARB   = 0x8249,
        GL_DEBUG_SOURCE_APPLICATION_ARB   = 0x824A,
        GL_DEBUG_SOURCE_OTHER_ARB         = 0x824B,
        GL_DEBUG_TYPE_ERROR_ARB           = 0x824C,
        GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR_ARB = 0x824D,
        GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR_ARB = 0x824E,
        GL_DEBUG_TYPE_PORTABILITY_ARB     = 0x824F,
        GL_DEBUG_TYPE_PERFORMANCE_ARB     = 0x8250,
        GL_DEBUG_TYPE_OTHER_ARB           = 0x8251,
        GL_MAX_DEBUG_MESSAGE_LENGTH_ARB   = 0x9143,
        GL_MAX_DEBUG_LOGGED_MESSAGES_ARB  = 0x9144,
        GL_DEBUG_LOGGED_MESSAGES_ARB      = 0x9145,
        GL_DEBUG_SEVERITY_HIGH_ARB        = 0x9146,
        GL_DEBUG_SEVERITY_MEDIUM_ARB      = 0x9147,
        GL_DEBUG_SEVERITY_LOW_ARB         = 0x9148,
    }

    extern(System) nothrow {
        alias GLDEBUGPROCARB = void function(GLenum,GLenum,GLuint,GLenum,GLsizei,in GLchar*,GLvoid*);
        alias GLDEBUGPROCAMD = void function(GLuint,GLenum,GLenum,GLsizei,in GLchar*,GLvoid*);
    }

    extern(System) @nogc nothrow  {
        alias pglDebugMessageControlARB = void function(GLenum,GLenum,GLenum,GLsizei,const(GLuint)*,GLboolean);
        alias pglDebugMessageInsertARB = void function(GLenum,GLenum,GLuint,GLenum,GLsizei,const(GLchar)*);
        alias pglGetDebugMessageLogARB = void function(GLuint,GLsizei,GLenum*,GLenum*,GLuint*,GLenum*,GLsizei*,GLchar*);
        alias pglDebugMessageCallbackARB = void function(GLDEBUGPROCARB,const(GLvoid)*);
    }

    __gshared {
        pglDebugMessageControlARB glDebugMessageControlARB;
        pglDebugMessageInsertARB glDebugMessageInsertARB;
        pglDebugMessageCallbackARB glDebugMessageCallbackARB;
        pglGetDebugMessageLogARB glGetDebugMessageLogARB;
    }

    private @nogc nothrow
    bool loadARBDebugOutput(SharedLib lib, GLSupport contextVersion)
    {
        lib.bindGLSymbol(cast(void**)&glDebugMessageControlARB, "glDebugMessageControlARB");
        lib.bindGLSymbol(cast(void**)&glDebugMessageInsertARB, "glDebugMessageInsertARB");
        lib.bindGLSymbol(cast(void**)&glDebugMessageCallbackARB, "glDebugMessageCallbackARB");
        lib.bindGLSymbol(cast(void**)&glGetDebugMessageLogARB, "glGetDebugMessageLogARB");
        return resetErrorCountGL();
    }
}
else enum hasARBDebugOutput = false;

// ARB_framebuffer_sRGB
version(GL_ARB) enum useARBFramebufferSRGB = true;
else version(GL_ARB_framebuffer_sRGB) enum useARBFramebufferSRGB = true;
else enum useARBFramebufferSRGB = false;

static if(useARBFramebufferSRGB) {
    private bool _hasARBFramebufferSRGB;
    bool hasARBFramebufferSRGB() { return _hasARBFramebufferSRGB; }

    enum uint GL_FRAMEBUFFER_SRGB = 0x8DB9;
}
else enum hasARBFramebufferSRGB = false;

// ARB_geometry_shader4
version(GL_ARB) enum useARBGeometryShader4 = true;
else version(GL_ARB_geometry_shader4) enum useARBGeometryShader4 = true;
else enum useARBGeometryShader4 = false;

static if(useARBGeometryShader4) {
    private bool _hasARBGeometryShader4;
    bool hasARBGeometryShader4() { return _hasARBGeometryShader4; }

    enum : uint {
        GL_LINES_ADJACENCY_ARB            = 0x000A,
        GL_LINE_STRIP_ADJACENCY_ARB       = 0x000B,
        GL_TRIANGLES_ADJACENCY_ARB        = 0x000C,
        GL_TRIANGLE_STRIP_ADJACENCY_ARB   = 0x000D,
        GL_PROGRAM_POINT_SIZE_ARB         = 0x8642,
        GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_ARB = 0x8C29,
        GL_FRAMEBUFFER_ATTACHMENT_LAYERED_ARB = 0x8DA7,
        GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_ARB = 0x8DA8,
        GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_ARB = 0x8DA9,
        GL_GEOMETRY_SHADER_ARB            = 0x8DD9,
        GL_GEOMETRY_VERTICES_OUT_ARB      = 0x8DDA,
        GL_GEOMETRY_INPUT_TYPE_ARB        = 0x8DDB,
        GL_GEOMETRY_OUTPUT_TYPE_ARB       = 0x8DDC,
        GL_MAX_GEOMETRY_VARYING_COMPONENTS_ARB = 0x8DDD,
        GL_MAX_VERTEX_VARYING_COMPONENTS_ARB = 0x8DDE,
        GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_ARB = 0x8DDF,
        GL_MAX_GEOMETRY_OUTPUT_VERTICES_ARB = 0x8DE0,
        GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_ARB = 0x8DE1,
    }

    extern(System) @nogc nothrow  {
        alias pglProgramParameteriARB = void function(GLuint,GLenum,GLint);
        alias pglFramebufferTextureARB = void function(GLuint,GLenum,GLuint,GLint);
        alias pglFramebufferTextureLayerARB = void function(GLuint,GLenum,GLuint,GLint,GLint);
        alias pglFramebufferTextureFaceARB = void function(GLuint,GLenum,GLuint,GLint,GLenum);
    }

    __gshared {
        pglProgramParameteriARB glProgramParameteriARB;
        pglFramebufferTextureARB glFramebufferTextureARB;
        pglFramebufferTextureLayerARB glFramebufferTextureLayerARB;
        pglFramebufferTextureFaceARB glFramebufferTextureFaceARB;
    }

    private @nogc nothrow
    bool loadARBGeometryShader4(SharedLib lib, GLSupport contextVersion)
    {
        lib.bindGLSymbol(cast(void**)&glProgramParameteriARB,"glProgramParameteriARB");
        lib.bindGLSymbol(cast(void**)&glFramebufferTextureARB,"glFramebufferTextureARB");
        lib.bindGLSymbol(cast(void**)&glFramebufferTextureLayerARB,"glFramebufferTextureLayerARB");
        lib.bindGLSymbol(cast(void**)&glFramebufferTextureFaceARB,"glFramebufferTextureFaceARB");
        return resetErrorCountGL();
    }
}
else enum hasARBGeometryShader4 = false;

// ARB_pipeline_statistics_query
version(GL_ARB) enum useARBPipelineStatisticsQuery = true;
else version(GL_ARB_pipeline_statistics_query) enum useARBPipelineStatisticsQuery = true;
else enum useARBPipelineStatisticsQuery = false;

static if(useARBPipelineStatisticsQuery) {
    private bool _hasARBPipelineStatisticsQuery;
    bool hasARBPipelineStatisticsQuery() { return _hasARBPipelineStatisticsQuery; }

    enum : uint {
        GL_VERTICES_SUBMITTED_ARB         = 0x82EE,
        GL_PRIMITIVES_SUBMITTED_ARB       = 0x82EF,
        GL_VERTEX_SHADER_INVOCATIONS_ARB  = 0x82F0,
        GL_TESS_CONTROL_SHADER_PATCHES_ARB = 0x82F1,
        GL_TESS_EVALUATION_SHADER_INVOCATIONS_ARB = 0x82F2,
        GL_GEOMETRY_SHADER_PRIMITIVES_EMITTED_ARB = 0x82F3,
        GL_FRAGMENT_SHADER_INVOCATIONS_ARB = 0x82F4,
        GL_COMPUTE_SHADER_INVOCATIONS_ARB = 0x82F5,
        GL_CLIPPING_INPUT_PRIMITIVES_ARB  = 0x82F6,
        GL_CLIPPING_OUTPUT_PRIMITIVES_ARB = 0x82F7,
    }
}
else enum hasARBPipelineStatisticsQuery = false;

// ARB_robustness_isolation
version(GL_ARB) enum useARBRobustnessIsolation = true;
else version(GL_ARB_robustness_isolation) enum useARBRobustnessIsolation = true;
else enum useARBRobustnessIsolation = false;

static if(useARBRobustnessIsolation) {
    private bool _hasARBRobustnessIsolation;
    bool hasARBRobustnessIsolation() { return _hasARBRobustnessIsolation; }
}
else enum hasARBRobustnessIsolation = false;

// ARB_sample_shading
version(GL_ARB) enum useARBSampleShading = true;
else version(GL_ARB_sample_shading) enum useARBSampleShading = true;
else enum useARBSampleShading = false;

static if(useARBSampleShading) {
    private bool _hasARBSampleShading;
    bool hasARBSampleShading() { return _hasARBSampleShading; }

    enum : uint {
        GL_SAMPLE_SHADING_ARB             = 0x8C36,
        GL_MIN_SAMPLE_SHADING_VALUE_ARB   = 0x8C37,
    }

    extern(System) @nogc nothrow alias pglMinSampleShadingARB = void function(GLclampf);
    __gshared pglMinSampleShadingARB glMinSampleShadingARB;

    private @nogc nothrow
    bool loadARBSampleShading(SharedLib lib, GLSupport contextVersion)
    {
        lib.bindGLSymbol(cast(void**)&glMinSampleShadingARB,"glMinSampleShadingARB");
        return resetErrorCountGL();
    }
}
else enum hasARBSampleShading = false;

// ARB_texture_compression_bptc
version(GL_ARB) enum useARBTextureCompressionBPTC = true;
else version(GL_ARB_texture_compression_bptc) enum useARBTextureCompressionBPTC = true;
else enum useARBTextureCompressionBPTC = false;

static if(useARBTextureCompressionBPTC) {
    private bool _hasARBTextureCompressionBPTC;
    bool hasARBTextureCompressionBPTC() { return _hasARBTextureCompressionBPTC; }

    enum : uint {
        GL_COMPRESSED_RGBA_BPTC_UNORM_ARB = 0x8E8C,
        GL_COMPRESSED_SRGB_ALPHA_BPTC_UNORM_ARB = 0x8E8D,
        GL_COMPRESSED_RGB_BPTC_SIGNED_FLOAT_ARB = 0x8E8E,
        GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT_ARB = 0x8E8F,
    }
}
else enum hasARBTextureCompressionBPTC = false;

// ARB_texture_cube_map_array
version(GL_ARB) enum useARBTextureCubeMapArray = true;
else version(GL_ARB_texture_cube_map_array) enum useARBTextureCubeMapArray = true;
else enum useARBTextureCubeMapArray = false;

static if(useARBTextureCubeMapArray) {
    private bool _hasARBTextureCubeMapArray;
    bool hasARBTextureCubeMapArray() { return _hasARBTextureCubeMapArray; }

    enum : uint {
        GL_TEXTURE_CUBE_MAP_ARRAY_ARB     = 0x9009,
        GL_TEXTURE_BINDING_CUBE_MAP_ARRAY_ARB = 0x900A,
        GL_PROXY_TEXTURE_CUBE_MAP_ARRAY_ARB = 0x900B,
        GL_SAMPLER_CUBE_MAP_ARRAY_ARB     = 0x900C,
        GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW_ARB = 0x900D,
        GL_INT_SAMPLER_CUBE_MAP_ARRAY_ARB = 0x900E,
        GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY_ARB = 0x900F,
    }
}
else enum hasARBTextureCubeMapArray = false;

// ARB_texture_gather
version(GL_ARB) enum useARBTextureGather = true;
else version(GL_ARB_texture_gather) enum useARBTextureGather = true;
else enum useARBTextureGather = false;

static if(useARBTextureGather) {
    private bool _hasARBTextureGather;
    bool hasARBTextureGather() { return _hasARBTextureGather; }

    enum : uint {
        GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = 0x8E5E,
        GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = 0x8E5F,
    }
}
else enum hasARBTextureGather = false;

// ARB_transform_feedback_overflow_query
version(GL_ARB) enum useARBTransformFeedbackOverflowQuery = true;
else version(GL_ARB_transform_feedback_overflow_query) enum useARBTransformFeedbackOverflowQuery = true;
else enum useARBTransformFeedbackOverflowQuery = false;

static if(useARBTransformFeedbackOverflowQuery) {
    private bool _hasARBTransformFeedbackOverflowQuery;
    bool hasARBTransformFeedbackOverflowQuery() { return _hasARBTransformFeedbackOverflowQuery; }

    enum : uint {
        GL_TRANSFORM_FEEDBACK_OVERFLOW_ARB          = 0x82EC,
        GL_TRANSFORM_FEEDBACK_STREAM_OVERFLOW_ARB   = 0x82ED,
    }
}
else enum hasARBTransformFeedbackOverflowQuery = false;

package @nogc nothrow
void loadARB_01(SharedLib lib, GLSupport contextVersion)
{
    static if(useARBBindlessTexture) _hasARBBindlessTexture =
            hasExtension(contextVersion, "GL_ARB_bindless_texture") &&
            lib.loadARBBindlessTexture(contextVersion);

    static if(useARBCLEvent) _hasARBCLEvent =
            hasExtension(contextVersion, "GL_ARB_cl_event") &&
            lib.loadARBCLEvent(contextVersion);

    static if(useARBComputeVariableGroupSize) _hasARBComputeVariableGroupSize =
            hasExtension(contextVersion, "GL_ARB_compute_variable_group_size") &&
            lib.loadARBComputeVariableGroupSize(contextVersion);

    static if(useARBDebugOutput) _hasARBDebugOutput =
            hasExtension(contextVersion, "GL_ARB_debug_output") &&
            lib.loadARBDebugOutput(contextVersion);

    static if(useARBFramebufferSRGB) _hasARBFramebufferSRGB =
            hasExtension(contextVersion, "GL_ARB_framebuffer_sRGB");

    static if(useARBGeometryShader4) _hasARBGeometryShader4 =
            hasExtension(contextVersion, "GL_ARB_geometry_shader4") &&
            lib.loadARBGeometryShader4(contextVersion);

    static if(useARBPipelineStatisticsQuery) _hasARBPipelineStatisticsQuery =
            hasExtension(contextVersion, "GL_ARB_pipeline_statistics_query");

    static if(useARBRobustnessIsolation) _hasARBRobustnessIsolation =
            hasExtension(contextVersion, "GL_ARB_robustness_isolation");

    static if(useARBSampleShading ) _hasARBSampleShading  =
            hasExtension(contextVersion, "GL_ARB_sample_shading") &&
            lib.loadARBSampleShading (contextVersion);

    static if(useARBTextureCompressionBPTC) _hasARBTextureCompressionBPTC =
            hasExtension(contextVersion, "GL_ARB_texture_compression_bptc");

    static if(useARBTextureCubeMapArray) _hasARBTextureCubeMapArray =
            hasExtension(contextVersion, "GL_ARB_texture_cube_map_array");

    static if(useARBTextureGather) _hasARBTextureGather =
            hasExtension(contextVersion, "GL_ARB_texture_gather");

    static if(useARBTransformFeedbackOverflowQuery) _hasARBTransformFeedbackOverflowQuery =
            hasExtension(contextVersion, "GL_ARB_transform_feedback_overflow_query");
}