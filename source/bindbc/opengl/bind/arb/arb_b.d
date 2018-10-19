//          Copyright Michael D. Parker 2018.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.opengl.bind.arb.arb_b;

import bindbc.loader;
import bindbc.opengl.config,
       bindbc.opengl.context;
import bindbc.opengl.bind.types;

// ARB_bindless_texture
version(GL_ARB) enum useARBBindlessTexture = true;
else version(GL_ARB_base_instance) enum useARBBindlessTexture = true;
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


package @nogc nothrow
void loadARB_b(SharedLib lib, GLSupport contextVersion)
{
    static if(useARBBindlessTexture) _hasARBBindlessTexture =
            hasExtension(contextVersion, "GL_ARB_bindless_texture") &&
            lib.loadARBBindlessTexture(contextVersion);
}