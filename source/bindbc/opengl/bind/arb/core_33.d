/+
+            Copyright 2022 – 2024 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opengl.bind.arb.core_33;

import bindbc.loader;
import bindbc.opengl.config, bindbc.opengl.context, bindbc.opengl.bind.types;

enum has33 = glSupport >= GLSupport.gl33;

//ARB_occlusion_query2
enum useARBOcclusionQuery2 = (){
	version(GL_ARB)                       return true;
	else version(GL_ARB_occlusion_query2) return true;
	else return has33;
}();

bool _hasARBOcclusionQuery2 = false;
bool hasARBOcclusionQuery2() nothrow @nogc @safe{ return _hasARBOcclusionQuery2; }

static if(useARBOcclusionQuery2){
	enum: uint{
		GL_ANY_SAMPLES_PASSED = 0x8C2F,
	}
}

//ARB_texture_rgb10_a2ui
enum useARBTextureRGB10A2UI = (){
	version(GL_ARB)                  return true;
	else version(GL_ARB_timer_query) return true;
	else return has33;
}();

private bool _hasARBTextureRGB10A2UI = false;
bool hasARBTextureRGB10A2UI() nothrow @nogc @safe{ return _hasARBTextureRGB10A2UI; }

static if(useARBTextureRGB10A2UI){
	enum: uint{
		GL_RGB10_A2UI = 0x906F,
	}
}

//ARB_texture_swizzle
enum useARBTextureSwizzle = (){
	version(GL_ARB)                      return true;
	else version(GL_ARB_texture_swizzle) return true;
	else return has33;
}();

bool _hasARBTextureSwizzle = false;
bool hasARBTextureSwizzle() nothrow @nogc @safe{ return _hasARBTextureSwizzle; }

static if(useARBTextureSwizzle){
	enum: uint{
		GL_TEXTURE_SWIZZLE_R    = 0x8E42,
		GL_TEXTURE_SWIZZLE_G    = 0x8E43,
		GL_TEXTURE_SWIZZLE_B    = 0x8E44,
		GL_TEXTURE_SWIZZLE_A    = 0x8E45,
		GL_TEXTURE_SWIZZLE_RGBA = 0x8E46,
	}
}

// ARB_blend_func_extended
enum useARBBlendFuncExtended = (){
	version(GL_ARB)                          return true;
	else version(GL_ARB_blend_func_extended) return true;
	else return has33;
}();

bool _hasARBBlendFuncExtended = false;
bool hasARBBlendFuncExtended() nothrow @nogc @safe{ return _hasARBBlendFuncExtended; }

static if(useARBBlendFuncExtended){
	enum: uint{
		GL_SRC1_COLOR                   = 0x88F9,
		GL_SRC1_COLOUR                  = GL_SRC1_COLOR,
		GL_ONE_MINUS_SRC1_COLOR         = 0x88FA,
		GL_ONE_MINUS_SRC1_COLOUR        = GL_ONE_MINUS_SRC1_COLOR,
		GL_ONE_MINUS_SRC1_ALPHA         = 0x88FB,
		GL_MAX_DUAL_SOURCE_DRAW_BUFFERS = 0x88FC,
	}
	
	extern(System) nothrow @nogc{
		alias pglBindFragDataLocationIndexed = void function(GLuint, GLuint, GLuint, const(GLchar)*);
		alias pglGetFragDataIndex = GLint function(GLuint, const(GLchar)*);
	}
	
	__gshared{
		pglBindFragDataLocationIndexed glBindFragDataLocationIndexed;
		pglGetFragDataIndex glGetFragDataIndex;
	}
	
	private bool loadARBBlendFuncExtended(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glBindFragDataLocationIndexed, "glBindFragDataLocationIndexed");
		lib.bindGLSymbol(cast(void**)&glGetFragDataIndex, "glGetFragDataIndex");
		return resetErrorCountGL();
	}
}

// ARB_sampler_objects
enum useARBSamplerObjects = (){
	version(GL_ARB)                      return true;
	else version(GL_ARB_sampler_objects) return true;
	else return has33;
}();

bool _hasARBSamplerObjects = false;
bool hasARBSamplerObjects() nothrow @nogc @safe{ return _hasARBSamplerObjects; }

static if(useARBSamplerObjects){
	enum: uint{
		GL_SAMPLER_BINDING = 0x8919,
	}

	extern(System) nothrow @nogc{
		alias pglGenSamplers = void function(GLsizei, GLuint*);
		alias pglDeleteSamplers = void function(GLsizei, const(GLuint)*);
		alias pglIsSampler = GLboolean function(GLuint);
		alias pglBindSampler = void function(GLuint, GLuint);
		alias pglSamplerParameteri = void function(GLuint, GLenum, GLint);
		alias pglSamplerParameteriv = void function(GLuint, GLenum, const(GLint)*);
		alias pglSamplerParameterf = void function(GLuint, GLenum, GLfloat);
		alias pglSamplerParameterfv = void function(GLuint, GLenum, const(GLfloat)*);
		alias pglSamplerParameterIiv = void function(GLuint, GLenum, const(GLint)*);
		alias pglSamplerParameterIuiv = void function(GLuint, GLenum, const(GLuint)*);
		alias pglGetSamplerParameteriv = void function(GLuint, GLenum, GLint*);
		alias pglGetSamplerParameterIiv = void function(GLuint, GLenum, GLint*);
		alias pglGetSamplerParameterfv = void function(GLuint, GLenum, GLfloat*);
		alias pglGetSamplerParameterIuiv = void function(GLuint, GLenum, GLuint*);
	}
	
	__gshared{
		pglGenSamplers glGenSamplers;
		pglDeleteSamplers glDeleteSamplers;
		pglIsSampler glIsSampler;
		pglBindSampler glBindSampler;
		pglSamplerParameteri glSamplerParameteri;
		pglSamplerParameteriv glSamplerParameteriv;
		pglSamplerParameterf glSamplerParameterf;
		pglSamplerParameterfv glSamplerParameterfv;
		pglSamplerParameterIiv glSamplerParameterIiv;
		pglSamplerParameterIuiv glSamplerParameterIuiv;
		pglGetSamplerParameteriv glGetSamplerParameteriv;
		pglGetSamplerParameterIiv glGetSamplerParameterIiv;
		pglGetSamplerParameterfv glGetSamplerParameterfv;
		pglGetSamplerParameterIuiv glGetSamplerParameterIuiv;
	}
	
	private bool loadARBSamplerObjects(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glGenSamplers, "glGenSamplers");
		lib.bindGLSymbol(cast(void**)&glDeleteSamplers, "glDeleteSamplers");
		lib.bindGLSymbol(cast(void**)&glIsSampler, "glIsSampler");
		lib.bindGLSymbol(cast(void**)&glBindSampler, "glBindSampler");
		lib.bindGLSymbol(cast(void**)&glSamplerParameteri, "glSamplerParameteri");
		lib.bindGLSymbol(cast(void**)&glSamplerParameteriv, "glSamplerParameteriv");
		lib.bindGLSymbol(cast(void**)&glSamplerParameterf, "glSamplerParameterf");
		lib.bindGLSymbol(cast(void**)&glSamplerParameterfv, "glSamplerParameterfv");
		lib.bindGLSymbol(cast(void**)&glSamplerParameterIiv, "glSamplerParameterIiv");
		lib.bindGLSymbol(cast(void**)&glSamplerParameterIuiv, "glSamplerParameterIuiv");
		lib.bindGLSymbol(cast(void**)&glGetSamplerParameteriv, "glGetSamplerParameteriv");
		lib.bindGLSymbol(cast(void**)&glGetSamplerParameterIiv, "glGetSamplerParameterIiv");
		lib.bindGLSymbol(cast(void**)&glGetSamplerParameterfv, "glGetSamplerParameterfv");
		lib.bindGLSymbol(cast(void**)&glGetSamplerParameterIuiv, "glGetSamplerParameterIuiv");
		return resetErrorCountGL();
	}
}

//ARB_timer_query
enum useARBTimerQuery = (){
	version(GL_ARB)                  return true;
	else version(GL_ARB_timer_query) return true;
	else return has33;
}();

bool _hasARBTimerQuery = false;
bool hasARBTimerQuery() nothrow @nogc @safe{ return _hasARBTimerQuery; }

static if(useARBTimerQuery){
	enum: uint{
		GL_TIME_ELAPSED = 0x88BF,
		GL_TIMESTAMP    = 0x8E28,
	}
	
	extern(System) nothrow @nogc{
		alias pglQueryCounter = void function(GLuint, GLenum);
		alias pglGetQueryObjecti64v = void function(GLuint, GLenum, GLint64*);
		alias pglGetQueryObjectui64v = void function(GLuint, GLenum, GLuint64*);
	}
	
	__gshared{
		pglQueryCounter glQueryCounter;
		pglGetQueryObjecti64v glGetQueryObjecti64v;
		pglGetQueryObjectui64v glGetQueryObjectui64v;
	}
	
	private bool loadARBTimerQuery(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glQueryCounter, "glQueryCounter");
		lib.bindGLSymbol(cast(void**)&glGetQueryObjecti64v, "glGetQueryObjecti64v");
		lib.bindGLSymbol(cast(void**)&glGetQueryObjectui64v, "glGetQueryObjectui64v");
		return resetErrorCountGL();
	}
}

//ARB_vertex_type_2_10_10_10_rev
enum useARBVertexType2101010Rev = (){
	version(GL_ARB)                                 return true;
	else version(GL_ARB_vertex_type_2_10_10_10_rev) return true;
	else return has33;
}();

bool _hasARBVertexType2101010Rev = false;
bool hasARBVertexType2101010Rev() nothrow @nogc @safe{ return _hasARBVertexType2101010Rev; }

static if(useARBVertexType2101010Rev){
	enum: uint{
		GL_INT_2_10_10_10_REV = 0x8D9F,
	}
	
	extern(System) nothrow @nogc{
		// A note in derelict says these aren't actually part of the core and doesn't
		// load them on Mac. Don't remember why I wrote that, so I need to dig into it.
		/+
		alias pglVertexP2ui = void function(GLenum, GLuint);
		alias pglVertexP2uiv = void function(GLenum, const(GLuint)*);
		alias pglVertexP3ui = void function(GLenum, GLuint);
		alias pglVertexP3uiv = void function(GLenum, const(GLuint)*);
		alias pglVertexP4ui = void function(GLenum, GLuint);
		alias pglVertexP4uiv = void function(GLenum, const(GLuint)*);
		alias pglTexCoordP1ui = void function(GLenum, GLuint);
		alias pglTexCoordP1uiv = void function(GLenum, const(GLuint)*);
		alias pglTexCoordP2ui = void function(GLenum, GLuint);
		alias pglTexCoordP2uiv = void function(GLenum, const(GLuint)*);
		alias pglTexCoordP3ui = void function(GLenum, GLuint);
		alias pglTexCoordP3uiv = void function(GLenum, const(GLuint)*);
		alias pglTexCoordP4ui = void function(GLenum, GLuint);
		alias pglTexCoordP4uiv = void function(GLenum, const(GLuint)*);
		alias pglMultiTexCoordP1ui = void function(GLenum, GLenum, GLuint);
		alias pglMultiTexCoordP1uiv = void function(GLenum, GLenum, const(GLuint)*);
		alias pglMultiTexCoordP2ui = void function(GLenum, GLenum, GLuint);
		alias pglMultiTexCoordP2uiv = void function(GLenum, GLenum, const(GLuint)*);
		alias pglMultiTexCoordP3ui = void function(GLenum, GLenum, GLuint);
		alias pglMultiTexCoordP3uiv = void function(GLenum, GLenum, const(GLuint)*);
		alias pglMultiTexCoordP4ui = void function(GLenum, GLenum, GLuint);
		alias pglMultiTexCoordP4uiv = void function(GLenum, GLenum, const(GLuint)*);
		alias pglNormalP3ui = void function(GLenum, GLuint);
		alias pglNormalP3uiv = void function(GLenum, const(GLuint)*);
		alias pglColorP3ui = void function(GLenum, GLuint);
		alias pglColorP3uiv = void function(GLenum, const(GLuint)*);
		alias pglColorP4ui = void function(GLenum, GLuint);
		alias pglColorP4uiv = void function(GLenum, const(GLuint)*);
		alias pglSecondaryColorP3ui = void function(GLenum, GLuint);
		alias pglSecondaryColorP3uiv = void function(GLenum, const(GLuint)*);
		+/
		alias pglVertexAttribP1ui = void function(GLuint, GLenum, GLboolean, GLuint);
		alias pglVertexAttribP1uiv = void function(GLuint, GLenum, GLboolean, const(GLuint)*);
		alias pglVertexAttribP2ui = void function(GLuint, GLenum, GLboolean, GLuint);
		alias pglVertexAttribP2uiv = void function(GLuint, GLenum, GLboolean, const(GLuint)*);
		alias pglVertexAttribP3ui = void function(GLuint, GLenum, GLboolean, GLuint);
		alias pglVertexAttribP3uiv = void function(GLuint, GLenum, GLboolean, const(GLuint)*);
		alias pglVertexAttribP4ui = void function(GLuint, GLenum, GLboolean, GLuint);
		alias pglVertexAttribP4uiv = void function(GLuint, GLenum, GLboolean, const(GLuint)*);
	}
	
	__gshared{
		/+
		pglVertexP2ui glVertexP2ui;
		pglVertexP2uiv glVertexP2uiv;
		pglVertexP3ui glVertexP3ui;
		pglVertexP3uiv glVertexP3uiv;
		pglVertexP4ui glVertexP4ui;
		pglVertexP4uiv glVertexP4uiv;
		pglTexCoordP1ui glTexCoordP1ui;
		pglTexCoordP1uiv glTexCoordP1uiv;
		pglTexCoordP2ui glTexCoordP2ui;
		pglTexCoordP2uiv glTexCoordP2uiv;
		pglTexCoordP3ui glTexCoordP3ui;
		pglTexCoordP3uiv glTexCoordP3uiv;
		pglTexCoordP4ui glTexCoordP4ui;
		pglTexCoordP4uiv glTexCoordP4uiv;
		pglMultiTexCoordP1ui glMultiTexCoordP1ui;
		pglMultiTexCoordP1uiv glMultiTexCoordP1uiv;
		pglMultiTexCoordP2ui glMultiTexCoordP2ui;
		pglMultiTexCoordP2uiv glMultiTexCoordP2uiv;
		pglMultiTexCoordP3ui glMultiTexCoordP3ui;
		pglMultiTexCoordP3uiv glMultiTexCoordP3uiv;
		pglMultiTexCoordP4ui glMultiTexCoordP4ui;
		pglMultiTexCoordP4uiv glMultiTexCoordP4uiv;
		pglNormalP3ui glNormalP3ui;
		pglNormalP3uiv glNormalP3uiv;
		pglColorP3ui glColorP3ui;
		alias glColourP3ui = glColorP3ui;
		pglColorP3uiv glColorP3uiv;
		alias glColourP3uiv = glColorP3uiv;
		pglColorP4ui glColorP4ui;
		alias glColourP4ui = glColorP4ui;
		pglColorP4uiv glColorP4uiv;
		alias glColourP4uiv = glColorP4uiv;
		pglSecondaryColorP3ui glSecondaryColorP3ui;
		alias glSecondaryColourP3ui = glSecondaryColorP3ui;
		pglSecondaryColorP3uiv glSecondaryColorP3uiv;
		alias glSecondaryColourP3uiv = glSecondaryColorP3uiv;
		+/
		pglVertexAttribP1ui glVertexAttribP1ui;
		pglVertexAttribP1uiv glVertexAttribP1uiv;
		pglVertexAttribP2ui glVertexAttribP2ui;
		pglVertexAttribP2uiv glVertexAttribP2uiv;
		pglVertexAttribP3ui glVertexAttribP3ui;
		pglVertexAttribP3uiv glVertexAttribP3uiv;
		pglVertexAttribP4ui glVertexAttribP4ui;
		pglVertexAttribP4uiv glVertexAttribP4uiv;
	}
	
	private bool loadARBVertexType2101010Rev(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glVertexAttribP1ui, "glVertexAttribP1ui");
		lib.bindGLSymbol(cast(void**)&glVertexAttribP1uiv, "glVertexAttribP1uiv");
		lib.bindGLSymbol(cast(void**)&glVertexAttribP2ui, "glVertexAttribP2ui");
		lib.bindGLSymbol(cast(void**)&glVertexAttribP2uiv, "glVertexAttribP2uiv");
		lib.bindGLSymbol(cast(void**)&glVertexAttribP3ui, "glVertexAttribP3ui");
		lib.bindGLSymbol(cast(void**)&glVertexAttribP3uiv, "glVertexAttribP3uiv");
		lib.bindGLSymbol(cast(void**)&glVertexAttribP4ui, "glVertexAttribP4ui");
		lib.bindGLSymbol(cast(void**)&glVertexAttribP4uiv, "glVertexAttribP4uiv");
		return resetErrorCountGL();
	}
}

package(bindbc.opengl) bool loadARB33(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
	static if(has33){
		if(contextVersion >= GLSupport.gl33){
			_hasARBOcclusionQuery2 = true;
			_hasARBTextureRGB10A2UI = true;
			_hasARBTextureSwizzle = true;
			
			bool ret = true;
			ret = _hasARBBlendFuncExtended = lib.loadARBBlendFuncExtended(contextVersion);
			ret = _hasARBSamplerObjects = lib.loadARBSamplerObjects(contextVersion);
			ret = _hasARBTimerQuery = lib.loadARBTimerQuery(contextVersion);
			ret = _hasARBVertexType2101010Rev = lib.loadARBVertexType2101010Rev(contextVersion);
			return ret;
		}
	}
	
	static if(useARBOcclusionQuery2)
		_hasARBOcclusionQuery2 =
			hasExtension(contextVersion, "GL_ARB_occlusion_query2");
	
	static if(useARBTextureRGB10A2UI)
		_hasARBTextureRGB10A2UI =
			hasExtension(contextVersion, "GL_ARB_texture_rgb10_a2ui");
	
	static if(useARBTextureSwizzle)
		_hasARBTextureSwizzle =
			hasExtension(contextVersion, "GL_ARB_texture_swizzle");
	
	static if(useARBBlendFuncExtended)
		_hasARBBlendFuncExtended =
			hasExtension(contextVersion, "GL_ARB_blend_func_extended") &&
			lib.loadARBBlendFuncExtended(contextVersion);
	
	static if(useARBSamplerObjects)
		_hasARBSamplerObjects =
			hasExtension(contextVersion, "GL_ARB_sampler_objects") &&
			lib.loadARBSamplerObjects(contextVersion);
	
	static if(useARBTimerQuery)
		_hasARBTimerQuery =
			hasExtension(contextVersion, "GL_ARB_timer_query") &&
			lib.loadARBTimerQuery(contextVersion);
	
	static if(useARBVertexType2101010Rev)
		_hasARBVertexType2101010Rev =
			hasExtension(contextVersion, "GL_ARB_vertex_type_2_10_10_10_rev") &&
			lib.loadARBVertexType2101010Rev(contextVersion);
	
	return true;
}
