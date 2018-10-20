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

    __gshared {
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
            hasExtension(contextVersion, "GL_ARB_compute_variable_group_size") &&
            lib.loadARBDebugOutput(contextVersion);
}