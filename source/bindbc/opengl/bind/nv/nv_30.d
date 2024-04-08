/+
+            Copyright 2022 – 2024 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opengl.bind.nv.nv_30;

import bindbc.loader;
import bindbc.opengl.config, bindbc.opengl.context;
import bindbc.opengl.bind.types;

//NV_shader_buffer_load
enum useNVShaderBufferLoad = (){
	version(GL_NV)                         return true;
	else version(GL_NV_shader_buffer_load) return true;
	else return false;
}();

private bool _hasNVShaderBufferLoad = false;
bool hasNVShaderBufferLoad() nothrow @nogc @safe{ return _hasNVShaderBufferLoad; }

static if(useNVShaderBufferLoad){
	enum: uint{
		GL_BUFFER_GPU_ADDRESS_NV        = 0x8F1D,
		GL_GPU_ADDRESS_NV               = 0x8F34,
		GL_MAX_SHADER_BUFFER_ADDRESS_NV = 0x8F35,
	}
	
	extern(System) nothrow @nogc{
		alias pglMakeBufferResidentNV = void function(GLenum, GLenum);
		alias pglMakeBufferNonResidentNV = void function(GLenum);
		alias pglIsBufferResidentNV = GLboolean function(GLenum);
		alias pglMakeNamedBufferResidentNV = void function(GLuint, GLenum);
		alias pglMakeNamedBufferNonResidentNV = void function(GLuint);
		alias pglIsNamedBufferResidentNV = GLboolean function(GLuint);
		alias pglGetBufferParameterui64vNV = void function(GLenum, GLenum, GLuint64*);
		alias pglGetNamedBufferParameterui64vNV = void function(GLuint, GLenum, GLuint64*);
		alias pglGetIntegerui64vNV = void function(GLenum, GLuint64*);
		alias pglUniformui64NV = void function(GLint, GLuint64);
		alias pglUniformui64vNV = void function(GLint, GLsizei, const(GLuint64)*);
		alias pglGetUniformui64vNV = void function(GLuint, GLint, GLuint64*);
		alias pglProgramUniformui64NV = void function(GLuint, GLint, GLuint64);
		alias pglProgramUniformui64vNV = void function(GLuint, GLint, GLsizei, const(GLuint64)*);
	}
	
	__gshared{
		pglMakeBufferResidentNV glMakeBufferResidentNV;
		pglMakeBufferNonResidentNV glMakeBufferNonResidentNV;
		pglIsBufferResidentNV glIsBufferResidentNV;
		pglMakeNamedBufferResidentNV glMakeNamedBufferResidentNV;
		pglMakeNamedBufferNonResidentNV glMakeNamedBufferNonResidentNV;
		pglIsNamedBufferResidentNV glIsNamedBufferResidentNV;
		pglGetBufferParameterui64vNV glGetBufferParameterui64vNV;
		pglGetNamedBufferParameterui64vNV glGetNamedBufferParameterui64vNV;
		pglGetIntegerui64vNV glGetIntegerui64vNV;
		pglUniformui64NV glUniformui64NV;
		pglUniformui64vNV glUniformui64vNV;
		pglGetUniformui64vNV glGetUniformui64vNV;
		pglProgramUniformui64NV glProgramUniformui64NV;
		pglProgramUniformui64vNV glProgramUniformui64vNV;
	}
	
	private bool loadNVShaderBufferLoad(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glMakeBufferResidentNV, "glMakeBufferResidentNV");
		lib.bindGLSymbol(cast(void**)&glMakeBufferNonResidentNV, "glMakeBufferNonResidentNV");
		lib.bindGLSymbol(cast(void**)&glIsBufferResidentNV, "glIsBufferResidentNV");
		lib.bindGLSymbol(cast(void**)&glMakeNamedBufferResidentNV, "glMakeNamedBufferResidentNV");
		lib.bindGLSymbol(cast(void**)&glMakeNamedBufferNonResidentNV, "glMakeNamedBufferNonResidentNV");
		lib.bindGLSymbol(cast(void**)&glIsNamedBufferResidentNV, "glIsNamedBufferResidentNV");
		lib.bindGLSymbol(cast(void**)&glGetBufferParameterui64vNV, "glGetBufferParameterui64vNV");
		lib.bindGLSymbol(cast(void**)&glGetNamedBufferParameterui64vNV, "glGetNamedBufferParameterui64vNV");
		lib.bindGLSymbol(cast(void**)&glGetIntegerui64vNV, "glGetIntegerui64vNV");
		lib.bindGLSymbol(cast(void**)&glUniformui64NV, "glUniformui64NV");
		lib.bindGLSymbol(cast(void**)&glUniformui64vNV, "glUniformui64vNV");
		lib.bindGLSymbol(cast(void**)&glGetUniformui64vNV, "glGetUniformui64vNV");
		lib.bindGLSymbol(cast(void**)&glProgramUniformui64NV, "glProgramUniformui64NV");
		lib.bindGLSymbol(cast(void**)&glProgramUniformui64vNV, "glProgramUniformui64vNV  ");
		return resetErrorCountGL;
	}
}

package void loadNV_30(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
	static if(useNVShaderBufferLoad) _hasNVShaderBufferLoad =
		hasExtension(contextVersion, "GL_NV_shader_buffer_load") &&
		lib.loadNVShaderBufferLoad(contextVersion);
}
