/+
+            Copyright 2022 – 2024 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opengl.bind.arb.core_32;

import bindbc.loader;
import bindbc.opengl.config, bindbc.opengl.context, bindbc.opengl.bind.types;

enum has32 = glSupport >= GLSupport.gl32;

//ARB_depth_clamp
enum useARBDepthClamp = (){
	version(GL_ARB)                  return true;
	else version(GL_ARB_depth_clamp) return true;
	else return has32;
}();

bool _hasARBDepthClamp = false;
bool hasARBDepthClamp() nothrow @nogc @safe{ return _hasARBDepthClamp; }

static if(useARBDepthClamp){
	enum: uint{
		GL_DEPTH_CLAMP = 0x864F,
	}
}

//ARB_provoking_vertex
enum useARBProvokingVertex = (){
	version(GL_ARB)                       return true;
	else version(GL_ARB_provoking_vertex) return true;
	else return has32;
}();

bool _hasARBProvokingVertex = false;
bool hasARBProvokingVertex() nothrow @nogc @safe{ return _hasARBProvokingVertex; }

static if(useARBProvokingVertex){
	enum: uint{
		GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION = 0x8E4C,
		GL_FIRST_VERTEX_CONVENTION                  = 0x8E4D,
		GL_LAST_VERTEX_CONVENTION                   = 0x8E4E,
		GL_PROVOKING_VERTEX                         = 0x8E4F,
	}
	
	extern(System) nothrow @nogc{
		alias pglProvokingVertex = void function(GLenum);
	}
	
	__gshared{
		pglProvokingVertex glProvokingVertex;
	}
	
	private bool loadARBProvokingVertex(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glProvokingVertex, "glProvokingVertex");
		return resetErrorCountGL();
	}
}

//ARB_seamless_cube_map
enum useARBSeamlessCubeMap = (){
	version(GL_ARB)                        return true;
	else version(GL_ARB_seamless_cube_map) return true;
	else return has32;
}();

bool _hasARBSeamlessCubeMap = false;
bool hasARBSeamlessCubeMap() nothrow @nogc @safe{ return _hasARBSeamlessCubeMap; }

static if(useARBSeamlessCubeMap){
	enum: uint{
		GL_TEXTURE_CUBE_MAP_SEAMLESS = 0x884F,
	}
}

//ARB_draw_elements_base_vertex
enum useARBDrawElementsBaseVertex = (){
	version(GL_ARB)                                return true;
	else version(GL_ARB_draw_elements_base_vertex) return true;
	else return has32;
}();

bool _hasARBDrawElementsBaseVertex = false;
bool hasARBDrawElementsBaseVertex() nothrow @nogc @safe{ return _hasARBDrawElementsBaseVertex; }

static if(useARBDrawElementsBaseVertex){
	extern(System) nothrow @nogc{
		alias pglDrawElementsBaseVertex = void function(GLenum, GLsizei, GLenum, const(GLvoid)*, GLint);
		alias pglDrawRangeElementsBaseVertex = void function(GLenum, GLuint, GLuint, GLsizei, GLenum, const(GLvoid)*, GLint);
		alias pglDrawElementsInstancedBaseVertex = void function(GLenum, GLsizei, GLenum, const(GLvoid)*, GLsizei, GLint);
		alias pglMultiDrawElementsBaseVertex = void function(GLenum, const(GLsizei)*, GLenum, const(GLvoid*)*, GLsizei, const(GLint)*);
	}
	
	__gshared{
		pglDrawElementsBaseVertex glDrawElementsBaseVertex;
		pglDrawRangeElementsBaseVertex glDrawRangeElementsBaseVertex;
		pglDrawElementsInstancedBaseVertex glDrawElementsInstancedBaseVertex;
		pglMultiDrawElementsBaseVertex glMultiDrawElementsBaseVertex;
	}
	
	private bool loadARBDrawElementsBaseVertex(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glDrawElementsBaseVertex, "glDrawElementsBaseVertex");
		lib.bindGLSymbol(cast(void**)&glDrawRangeElementsBaseVertex, "glDrawRangeElementsBaseVertex");
		lib.bindGLSymbol(cast(void**)&glDrawElementsInstancedBaseVertex, "glDrawElementsInstancedBaseVertex");
		lib.bindGLSymbol(cast(void**)&glMultiDrawElementsBaseVertex, "glMultiDrawElementsBaseVertex");
		return resetErrorCountGL();
	}
}

//ARB_sync
enum useARBSync = (){
	version(GL_ARB)           return true;
	else version(GL_ARB_sync) return true;
	else return has32;
}();

alias GLint64 = long;
alias GLuint64 = ulong;
struct _GLsync;
alias GLsync = _GLsync*;

bool _hasARBSync = false;
bool hasARBSync() nothrow @nogc @safe{ return _hasARBSync; }

static if(useARBSync){
	enum: uint{
		GL_MAX_SERVER_WAIT_TIMEOUT    = 0x9111,
		GL_OBJECT_TYPE                = 0x9112,
		GL_SYNC_CONDITION             = 0x9113,
		GL_SYNC_STATUS                = 0x9114,
		GL_SYNC_FLAGS                 = 0x9115,
		GL_SYNC_FENCE                 = 0x9116,
		GL_SYNC_GPU_COMMANDS_COMPLETE = 0x9117,
		GL_UNSIGNALED                 = 0x9118,
		GL_SIGNALED                   = 0x9119,
		GL_ALREADY_SIGNALED           = 0x911A,
		GL_TIMEOUT_EXPIRED            = 0x911B,
		GL_CONDITION_SATISFIED        = 0x911C,
		GL_WAIT_FAILED                = 0x911D,
		GL_SYNC_FLUSH_COMMANDS_BIT    = 0x00000001,
	}
	
	extern(System) nothrow @nogc{
		alias pglFenceSync = GLsync function(GLenum, GLbitfield);
		alias pglIsSync = GLboolean function(GLsync);
		alias pglDeleteSync = void function(GLsync);
		alias pglClientWaitSync = GLenum function(GLsync, GLbitfield, GLuint64);
		alias pglWaitSync = void function(GLsync, GLbitfield, GLuint64);
		alias pglGetInteger64v = void function(GLenum, GLint64*);
		alias pglGetSynciv = void function(GLsync, GLenum, GLsizei, GLsizei*, GLint*);
	}
	
	__gshared{
		pglFenceSync glFenceSync;
		pglIsSync glIsSync;
		pglDeleteSync glDeleteSync;
		pglClientWaitSync glClientWaitSync;
		pglWaitSync glWaitSync;
		pglGetInteger64v glGetInteger64v;
		pglGetSynciv glGetSynciv;
	}
	
	private bool loadARBSync(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glFenceSync, "glFenceSync");
		lib.bindGLSymbol(cast(void**)&glIsSync, "glIsSync");
		lib.bindGLSymbol(cast(void**)&glDeleteSync, "glDeleteSync");
		lib.bindGLSymbol(cast(void**)&glClientWaitSync, "glClientWaitSync");
		lib.bindGLSymbol(cast(void**)&glWaitSync, "glWaitSync");
		lib.bindGLSymbol(cast(void**)&glGetInteger64v, "glGetInteger64v");
		lib.bindGLSymbol(cast(void**)&glGetSynciv, "glGetSynciv");
		return resetErrorCountGL();
	}
}

//ARB_texture_multisample
enum useARBTextureMultiSample = (){
	version(GL_ARB)                          return true;
	else version(GL_ARB_texture_multisample) return true;
	else return has32;
}();

bool _hasARBTextureMultiSample = false;
bool hasARBTextureMultiSample() nothrow @nogc @safe{ return _hasARBTextureMultiSample; }

static if(useARBTextureMultiSample){
	enum: uint{
		GL_SAMPLE_POSITION                           = 0x8E50,
		GL_SAMPLE_MASK                               = 0x8E51,
		GL_SAMPLE_MASK_VALUE                         = 0x8E52,
		GL_MAX_SAMPLE_MASK_WORDS                     = 0x8E59,
		GL_TEXTURE_2D_MULTISAMPLE                    = 0x9100,
		GL_PROXY_TEXTURE_2D_MULTISAMPLE              = 0x9101,
		GL_TEXTURE_2D_MULTISAMPLE_ARRAY              = 0x9102,
		GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY        = 0x9103,
		GL_TEXTURE_BINDING_2D_MULTISAMPLE            = 0x9104,
		GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY      = 0x9105,
		GL_TEXTURE_SAMPLES                           = 0x9106,
		GL_TEXTURE_FIXED_SAMPLE_LOCATIONS            = 0x9107,
		GL_SAMPLER_2D_MULTISAMPLE                    = 0x9108,
		GL_INT_SAMPLER_2D_MULTISAMPLE                = 0x9109,
		GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE       = 0x910A,
		GL_SAMPLER_2D_MULTISAMPLE_ARRAY              = 0x910B,
		GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY          = 0x910C,
		GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910D,
		GL_MAX_COLOR_TEXTURE_SAMPLES                 = 0x910E,
		GL_MAX_DEPTH_TEXTURE_SAMPLES                 = 0x910F,
		GL_MAX_INTEGER_SAMPLES                       = 0x9110,
	}
	
	extern(System) nothrow @nogc{
		alias pglTexImage2DMultisample = void function(GLenum, GLsizei, GLint, GLsizei, GLsizei, GLboolean);
		alias pglTexImage3DMultisample = void function(GLenum, GLsizei, GLint, GLsizei, GLsizei, GLsizei, GLboolean);
		alias pglGetMultisamplefv = void function(GLenum, GLuint, GLfloat*);
		alias pglSampleMaski = void function(GLuint, GLbitfield);
	}
	
	__gshared{
		pglTexImage2DMultisample glTexImage2DMultisample;
		pglTexImage3DMultisample glTexImage3DMultisample;
		pglGetMultisamplefv glGetMultisamplefv;
		pglSampleMaski glSampleMaski;
	}
	
	private bool loadTextureMultiSample(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glTexImage2DMultisample, "glTexImage2DMultisample");
		lib.bindGLSymbol(cast(void**)&glTexImage3DMultisample, "glTexImage3DMultisample");
		lib.bindGLSymbol(cast(void**)&glGetMultisamplefv, "glGetMultisamplefv");
		lib.bindGLSymbol(cast(void**)&glSampleMaski, "glSampleMaski");
		return resetErrorCountGL();
	}
}

package(bindbc.opengl) bool loadARB32(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
	static if(has32){
		if(contextVersion >= GLSupport.gl32){
			_hasARBDepthClamp = true;
			_hasARBSeamlessCubeMap = true;
			
			bool ret = true;
			ret = _hasARBProvokingVertex = lib.loadARBProvokingVertex(contextVersion);
			ret = _hasARBDrawElementsBaseVertex = lib.loadARBDrawElementsBaseVertex(contextVersion);
			ret = _hasARBSync = lib.loadARBSync(contextVersion);
			ret = _hasARBTextureMultiSample = lib.loadTextureMultiSample(contextVersion);
			return ret;
		}
	}
	
	static if(useARBDepthClamp)
		_hasARBDepthClamp =
			hasExtension(contextVersion, "GL_ARB_depth_clamp");
	
	static if(useARBProvokingVertex)
		_hasARBProvokingVertex =
			hasExtension(contextVersion, "GL_ARB_provoking_vertex") &&
			lib.loadARBProvokingVertex(contextVersion);
	
	static if(useARBSeamlessCubeMap)
		_hasARBSeamlessCubeMap =
			hasExtension(contextVersion, "GL_ARB_seamless_cube_map");
	
	static if(useARBDrawElementsBaseVertex)
		_hasARBDrawElementsBaseVertex =
			hasExtension(contextVersion, "GL_ARB_draw_elements_base_vertex") &&
			lib.loadARBDrawElementsBaseVertex(contextVersion);
	
	static if(useARBSync)
		_hasARBSync =
			hasExtension(contextVersion, "GL_ARB_sync") &&
			lib.loadARBSync(contextVersion);
	
	static if(useARBTextureMultiSample)
		_hasARBTextureMultiSample =
			hasExtension(contextVersion, "GL_ARB_texture_multisample") &&
			lib.loadTextureMultiSample(contextVersion);
	
	return true;
}
