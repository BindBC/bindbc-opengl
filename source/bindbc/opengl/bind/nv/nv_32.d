/+
+            Copyright 2022 – 2024 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opengl.bind.nv.nv_32;

import bindbc.loader;
import bindbc.opengl.config, bindbc.opengl.context;
import bindbc.opengl.bind.types;

//NV_vertex_buffer_unified_memory
enum useNVVertexBufferUnifiedMemory = (){
	version(GL_NV)                                   return true;
	else version(GL_NV_vertex_buffer_unified_memory) return true;
	else return false;
}();

private bool _hasNVVertexBufferUnifiedMemory = false;
bool hasNVVertexBufferUnifiedMemory() nothrow @nogc @safe{ return _hasNVVertexBufferUnifiedMemory; }

static if(useNVVertexBufferUnifiedMemory){
	enum: uint{
		GL_VERTEX_ATTRIB_ARRAY_UNIFIED_NV   = 0x8F1E,
		GL_ELEMENT_ARRAY_UNIFIED_NV         = 0x8F1F,
		GL_VERTEX_ATTRIB_ARRAY_ADDRESS_NV   = 0x8F20,
		GL_TEXTURE_COORD_ARRAY_ADDRESS_NV   = 0x8F25,
		GL_VERTEX_ARRAY_ADDRESS_NV          = 0x8F21,
		GL_NORMAL_ARRAY_ADDRESS_NV          = 0x8F22,
		GL_COLOR_ARRAY_ADDRESS_NV           = 0x8F23,
		GL_INDEX_ARRAY_ADDRESS_NV           = 0x8F24,
		GL_EDGE_FLAG_ARRAY_ADDRESS_NV       = 0x8F26,
		GL_SECONDARY_COLOR_ARRAY_ADDRESS_NV = 0x8F27,
		GL_FOG_COORD_ARRAY_ADDRESS_NV       = 0x8F28,
		GL_ELEMENT_ARRAY_ADDRESS_NV         = 0x8F29,
		GL_VERTEX_ATTRIB_ARRAY_LENGTH_NV    = 0x8F2A,
		GL_TEXTURE_COORD_ARRAY_LENGTH_NV    = 0x8F2F,
		GL_VERTEX_ARRAY_LENGTH_NV           = 0x8F2B,
		GL_NORMAL_ARRAY_LENGTH_NV           = 0x8F2C,
		GL_COLOR_ARRAY_LENGTH_NV            = 0x8F2D,
		GL_INDEX_ARRAY_LENGTH_NV            = 0x8F2E,
		GL_EDGE_FLAG_ARRAY_LENGTH_NV        = 0x8F30,
		GL_SECONDARY_COLOR_ARRAY_LENGTH_NV  = 0x8F31,
		GL_FOG_COORD_ARRAY_LENGTH_NV        = 0x8F32,
		GL_ELEMENT_ARRAY_LENGTH_NV          = 0x8F33,
	}
	
	extern(System) nothrow @nogc{
		alias pglBufferAddressRangeNV = void function(GLenum, GLuint, GLuint64, GLsizeiptr);
		alias pglVertexFormatNV = void function(GLint, GLenum, GLsizei);
		alias pglNormalFormatNV = void function(GLenum, GLsizei);
		alias pglColorFormatNV = void function(GLint, GLenum, GLsizei);
		alias pglIndexFormatNV = void function(GLenum, GLsizei);
		alias pglTexCoordFormatNV = void function(GLint, GLenum, GLsizei);
		alias pglEdgeFlagFormatNV = void function(GLsizei);
		alias pglSecondaryColorFormatNV = void function(GLint, GLenum, GLsizei);
		alias pglFogCoordFormatNV = void function(GLenum, GLsizei);
		alias pglVertexAttribFormatNV = void function(GLuint, GLint, GLenum, GLboolean, GLsizei);
		alias pglVertexAttribIFormatNV = void function(GLuint, GLint, GLenum, GLsizei);
		alias pglGetIntegerui64i_vNV = void function(GLenum, GLuint, GLuint64*);
	}
	
	__gshared{
		pglBufferAddressRangeNV glBufferAddressRangeNV;
		pglVertexFormatNV glVertexFormatNV;
		pglNormalFormatNV glNormalFormatNV;
		pglColorFormatNV glColorFormatNV;
		pglIndexFormatNV glIndexFormatNV;
		pglTexCoordFormatNV glTexCoordFormatNV;
		pglEdgeFlagFormatNV glEdgeFlagFormatNV;
		pglSecondaryColorFormatNV glSecondaryColorFormatNV;
		pglFogCoordFormatNV glFogCoordFormatNV;
		pglVertexAttribFormatNV glVertexAttribFormatNV;
		pglVertexAttribIFormatNV glVertexAttribIFormatNV;
		pglGetIntegerui64i_vNV glGetIntegerui64i_vNV;
	}
	
	private	bool loadNVShaderBufferLoad(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glBufferAddressRangeNV, "glBufferAddressRangeNV");
		lib.bindGLSymbol(cast(void**)&glVertexFormatNV, "glVertexFormatNV");
		lib.bindGLSymbol(cast(void**)&glNormalFormatNV, "glNormalFormatNV");
		lib.bindGLSymbol(cast(void**)&glColorFormatNV, "glColorFormatNV");
		lib.bindGLSymbol(cast(void**)&glIndexFormatNV, "glIndexFormatNV");
		lib.bindGLSymbol(cast(void**)&glTexCoordFormatNV, "glTexCoordFormatNV");
		lib.bindGLSymbol(cast(void**)&glEdgeFlagFormatNV, "glEdgeFlagFormatNV");
		lib.bindGLSymbol(cast(void**)&glSecondaryColorFormatNV, "glSecondaryColorFormatNV");
		lib.bindGLSymbol(cast(void**)&glFogCoordFormatNV, "glFogCoordFormatNV");
		lib.bindGLSymbol(cast(void**)&glVertexAttribFormatNV, "glVertexAttribFormatNV");
		lib.bindGLSymbol(cast(void**)&glVertexAttribIFormatNV, "glVertexAttribIFormatNV");
		lib.bindGLSymbol(cast(void**)&glGetIntegerui64i_vNV, "glGetIntegerui64i_vNV");
		return resetErrorCountGL;
	}
}

package void loadNV_32(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
	static if(useNVVertexBufferUnifiedMemory){
		_hasNVVertexBufferUnifiedMemory =
			hasExtension(contextVersion, "GL_NV_vertex_buffer_unified_memory") &&
			lib.loadNVShaderBufferLoad(contextVersion);
	}
}
