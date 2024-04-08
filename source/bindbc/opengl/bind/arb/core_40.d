/+
+            Copyright 2022 – 2024 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opengl.bind.arb.core_40;

import bindbc.loader;
import bindbc.opengl.config, bindbc.opengl.context, bindbc.opengl.bind.types;

enum has40 = glSupport >= GLSupport.gl40;

/+
//ARB_occlusion_query2
enum useARBOcclusionQuery2 = (){
	version(GL_ARB)                       return true;
	else version(GL_ARB_occlusion_query2) return true;
	else return has33;
}();

private bool _hasARBOcclusionQuery2 = false;
bool hasARBOcclusionQuery2() nothrow @nogc @safe{ return _hasARBOcclusionQuery2; }

static if(useARBOcclusionQuery2){
}
+/

//ARB_gpu_shader5
enum useARBGPUShader5 = (){
	version(GL_ARB)                  return true;
	else version(GL_ARB_gpu_shader5) return true;
	else return has40;
}();

bool _hasARBGPUShader5 = false;
bool hasARBGPUShader5() nothrow @nogc @safe{ return _hasARBGPUShader5; }

static if(useARBGPUShader5){
	enum: uint{
		GL_GEOMETRY_SHADER_INVOCATIONS        = 0x887F,
		GL_MAX_GEOMETRY_SHADER_INVOCATIONS    = 0x8E5A,
		GL_MIN_FRAGMENT_INTERPOLATION_OFFSET  = 0x8E5B,
		GL_MAX_FRAGMENT_INTERPOLATION_OFFSET  = 0x8E5C,
		GL_FRAGMENT_INTERPOLATION_OFFSET_BITS = 0x8E5D,
	}
}

//ARB_draw_indirect
enum useARBDrawIndirect = (){
	version(GL_ARB)                    return true;
	else version(GL_ARB_draw_indirect) return true;
	else return has40;
}();

bool _hasARBDrawIndirect = false;
bool hasARBDrawIndirect() nothrow @nogc @safe{ return _hasARBDrawIndirect; }

static if(useARBDrawIndirect){
	enum: uint{
		GL_DRAW_INDIRECT_BUFFER         = 0x8F3F,
		GL_DRAW_INDIRECT_BUFFER_BINDING = 0x8F43,
	}
	
	extern(System) nothrow @nogc{
		alias pglDrawArraysIndirect = void function(GLenum, const(GLvoid)*);
		alias pglDrawElementsIndirect = void function(GLenum, GLenum, const(GLvoid)*);
	}
	
	__gshared{
		pglDrawArraysIndirect glDrawArraysIndirect;
		pglDrawElementsIndirect glDrawElementsIndirect;
	}
	
	private bool loadARBDrawIndirect(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glDrawArraysIndirect, "glDrawArraysIndirect");
		lib.bindGLSymbol(cast(void**)&glDrawElementsIndirect, "glDrawElementsIndirect");
		return resetErrorCountGL();
	}
}

//ARB_gpu_shader_fp64
enum useARBGPUShaderFP64 = (){
	version(GL_ARB)                      return true;
	else version(GL_ARB_gpu_shader_fp64) return true;
	else return has40;
}();

bool _hasARBGPUShaderFP64 = false;
bool hasARBGPUShaderFP64() nothrow @nogc @safe{ return _hasARBGPUShaderFP64; }

static if(useARBGPUShaderFP64){
	enum: uint{
		GL_DOUBLE_VEC2   = 0x8FFC,
		GL_DOUBLE_VEC3   = 0x8FFD,
		GL_DOUBLE_VEC4   = 0x8FFE,
		GL_DOUBLE_MAT2   = 0x8F46,
		GL_DOUBLE_MAT3   = 0x8F47,
		GL_DOUBLE_MAT4   = 0x8F48,
		GL_DOUBLE_MAT2x3 = 0x8F49,
		GL_DOUBLE_MAT2x4 = 0x8F4A,
		GL_DOUBLE_MAT3x2 = 0x8F4B,
		GL_DOUBLE_MAT3x4 = 0x8F4C,
		GL_DOUBLE_MAT4x2 = 0x8F4D,
		GL_DOUBLE_MAT4x3 = 0x8F4E,
	}
	
	extern(System) nothrow @nogc{
		alias pglUniform1d = void function(GLint, GLdouble);
		alias pglUniform2d = void function(GLint, GLdouble, GLdouble);
		alias pglUniform3d = void function(GLint, GLdouble, GLdouble, GLdouble);
		alias pglUniform4d = void function(GLint, GLdouble, GLdouble, GLdouble, GLdouble);
		alias pglUniform1dv = void function(GLint, GLsizei, const(GLdouble)*);
		alias pglUniform2dv = void function(GLint, GLsizei, const(GLdouble)*);
		alias pglUniform3dv = void function(GLint, GLsizei, const(GLdouble)*);
		alias pglUniform4dv = void function(GLint, GLsizei, const(GLdouble)*);
		alias pglUniformMatrix2dv = void function(GLint, GLsizei, GLboolean, const(GLdouble)*);
		alias pglUniformMatrix3dv = void function(GLint, GLsizei, GLboolean, const(GLdouble)*);
		alias pglUniformMatrix4dv = void function(GLint, GLsizei, GLboolean, const(GLdouble)*);
		alias pglUniformMatrix2x3dv = void function(GLint, GLsizei, GLboolean, const(GLdouble)*);
		alias pglUniformMatrix2x4dv = void function(GLint, GLsizei, GLboolean, const(GLdouble)*);
		alias pglUniformMatrix3x2dv = void function(GLint, GLsizei, GLboolean, const(GLdouble)*);
		alias pglUniformMatrix3x4dv = void function(GLint, GLsizei, GLboolean, const(GLdouble)*);
		alias pglUniformMatrix4x2dv = void function(GLint, GLsizei, GLboolean, const(GLdouble)*);
		alias pglUniformMatrix4x3dv = void function(GLint, GLsizei, GLboolean, const(GLdouble)*);
		alias pglGetUniformdv = void function(GLuint, GLint, GLdouble*);
	}
	
	__gshared{
		pglUniform1d glUniform1d;
		pglUniform2d glUniform2d;
		pglUniform3d glUniform3d;
		pglUniform4d glUniform4d;
		pglUniform1dv glUniform1dv;
		pglUniform2dv glUniform2dv;
		pglUniform3dv glUniform3dv;
		pglUniform4dv glUniform4dv;
		pglUniformMatrix2dv glUniformMatrix2dv;
		pglUniformMatrix3dv glUniformMatrix3dv;
		pglUniformMatrix4dv glUniformMatrix4dv;
		pglUniformMatrix2x3dv glUniformMatrix2x3dv;
		pglUniformMatrix2x4dv glUniformMatrix2x4dv;
		pglUniformMatrix3x2dv glUniformMatrix3x2dv;
		pglUniformMatrix3x4dv glUniformMatrix3x4dv;
		pglUniformMatrix4x2dv glUniformMatrix4x2dv;
		pglUniformMatrix4x3dv glUniformMatrix4x3dv;
		pglGetUniformdv glGetUniformdv;
	}
	
	private bool loadARBGPUShaderFP64(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glUniform1d,"glUniform1d");
		lib.bindGLSymbol(cast(void**)&glUniform2d,"glUniform2d");
		lib.bindGLSymbol(cast(void**)&glUniform3d,"glUniform3d");
		lib.bindGLSymbol(cast(void**)&glUniform4d,"glUniform4d");
		lib.bindGLSymbol(cast(void**)&glUniform1dv,"glUniform1dv");
		lib.bindGLSymbol(cast(void**)&glUniform2dv,"glUniform2dv");
		lib.bindGLSymbol(cast(void**)&glUniform3dv,"glUniform3dv");
		lib.bindGLSymbol(cast(void**)&glUniform4dv,"glUniform4dv");
		lib.bindGLSymbol(cast(void**)&glUniformMatrix2dv,"glUniformMatrix2dv");
		lib.bindGLSymbol(cast(void**)&glUniformMatrix3dv,"glUniformMatrix3dv");
		lib.bindGLSymbol(cast(void**)&glUniformMatrix4dv,"glUniformMatrix4dv");
		lib.bindGLSymbol(cast(void**)&glUniformMatrix2x3dv,"glUniformMatrix2x3dv");
		lib.bindGLSymbol(cast(void**)&glUniformMatrix2x4dv,"glUniformMatrix2x4dv");
		lib.bindGLSymbol(cast(void**)&glUniformMatrix3x2dv,"glUniformMatrix3x2dv");
		lib.bindGLSymbol(cast(void**)&glUniformMatrix3x4dv,"glUniformMatrix3x4dv");
		lib.bindGLSymbol(cast(void**)&glUniformMatrix4x2dv,"glUniformMatrix4x2dv");
		lib.bindGLSymbol(cast(void**)&glUniformMatrix4x3dv,"glUniformMatrix4x3dv");
		lib.bindGLSymbol(cast(void**)&glGetUniformdv,"glGetUniformdv");
		return resetErrorCountGL();
	}
}

//ARB_shader_subroutine
enum useARBShaderSubroutine = (){
	version(GL_ARB)                        return true;
	else version(GL_ARB_shader_subroutine) return true;
	else return has40;
}();

bool _hasARBShaderSubroutine = false;
bool hasARBShaderSubroutine() nothrow @nogc @safe{ return _hasARBShaderSubroutine; }

static if(useARBShaderSubroutine){
	enum: uint{
		GL_ACTIVE_SUBROUTINES                   = 0x8DE5,
		GL_ACTIVE_SUBROUTINE_UNIFORMS           = 0x8DE6,
		GL_ACTIVE_SUBROUTINE_UNIFORM_LOCATIONS  = 0x8E47,
		GL_ACTIVE_SUBROUTINE_MAX_LENGTH         = 0x8E48,
		GL_ACTIVE_SUBROUTINE_UNIFORM_MAX_LENGTH = 0x8E49,
		GL_MAX_SUBROUTINES                      = 0x8DE7,
		GL_MAX_SUBROUTINE_UNIFORM_LOCATIONS     = 0x8DE8,
		GL_NUM_COMPATIBLE_SUBROUTINES           = 0x8E4A,
		GL_COMPATIBLE_SUBROUTINES               = 0x8E4B,
	}
	
	extern(System) nothrow @nogc{
		alias pglGetSubroutineUniformLocation = GLint function(GLuint, GLenum, const(GLchar)*);
		alias pglGetSubroutineIndex = GLuint function(GLuint, GLenum, const(GLchar)*);
		alias pglGetActiveSubroutineUniformiv = void function(GLuint, GLenum, GLuint, GLenum, GLint*);
		alias pglGetActiveSubroutineUniformName = void function(GLuint, GLenum, GLuint, GLsizei, GLsizei*, GLchar*);
		alias pglGetActiveSubroutineName = void function(GLuint, GLenum, GLuint, GLsizei, GLsizei*, GLchar*);
		alias pglUniformSubroutinesuiv = void function(GLenum, GLsizei, const(GLuint)*);
		alias pglGetUniformSubroutineuiv = void function(GLenum, GLint, GLuint*);
		alias pglGetProgramStageiv = void function(GLuint, GLenum, GLenum, GLint*);
	}
	
	__gshared{
		pglGetSubroutineUniformLocation glGetSubroutineUniformLocation;
		pglGetSubroutineIndex glGetSubroutineIndex;
		pglGetActiveSubroutineUniformiv glGetActiveSubroutineUniformiv;
		pglGetActiveSubroutineUniformName glGetActiveSubroutineUniformName;
		pglGetActiveSubroutineName glGetActiveSubroutineName;
		pglUniformSubroutinesuiv glUniformSubroutinesuiv;
		pglGetUniformSubroutineuiv glGetUniformSubroutineuiv;
		pglGetProgramStageiv glGetProgramStageiv;
	}
	
	private bool loadARBShaderSubroutine(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glGetSubroutineUniformLocation, "glGetSubroutineUniformLocation");
		lib.bindGLSymbol(cast(void**)&glGetSubroutineIndex, "glGetSubroutineIndex");
		lib.bindGLSymbol(cast(void**)&glGetActiveSubroutineUniformiv, "glGetActiveSubroutineUniformiv");
		lib.bindGLSymbol(cast(void**)&glGetActiveSubroutineUniformName, "glGetActiveSubroutineUniformName");
		lib.bindGLSymbol(cast(void**)&glGetActiveSubroutineName, "glGetActiveSubroutineName");
		lib.bindGLSymbol(cast(void**)&glUniformSubroutinesuiv, "glUniformSubroutinesuiv");
		lib.bindGLSymbol(cast(void**)&glGetUniformSubroutineuiv, "glGetUniformSubroutineuiv");
		lib.bindGLSymbol(cast(void**)&glGetProgramStageiv, "glGetProgramStageiv");
		return resetErrorCountGL();
	}
}

//ARB_tessellation_shader
enum useARBTesselationShader = (){
	version(GL_ARB)                          return true;
	else version(GL_ARB_tessellation_shader) return true;
	else return has40;
}();

bool _hasARBTesselationShader = false;
bool hasARBTesselationShader() nothrow @nogc @safe{ return _hasARBTesselationShader; }

static if(useARBTesselationShader){
	enum: uint{
		GL_PATCHES                                            = 0x000E,
		GL_PATCH_VERTICES                                     = 0x8E72,
		GL_PATCH_DEFAULT_INNER_LEVEL                          = 0x8E73,
		GL_PATCH_DEFAULT_OUTER_LEVEL                          = 0x8E74,
		GL_TESS_CONTROL_OUTPUT_VERTICES                       = 0x8E75,
		GL_TESS_GEN_MODE                                      = 0x8E76,
		GL_TESS_GEN_SPACING                                   = 0x8E77,
		GL_TESS_GEN_VERTEX_ORDER                              = 0x8E78,
		GL_TESS_GEN_POINT_MODE                                = 0x8E79,
		GL_ISOLINES                                           = 0x8E7A,
		GL_FRACTIONAL_ODD                                     = 0x8E7B,
		GL_FRACTIONAL_EVEN                                    = 0x8E7C,
		GL_MAX_PATCH_VERTICES                                 = 0x8E7D,
		GL_MAX_TESS_GEN_LEVEL                                 = 0x8E7E,
		GL_MAX_TESS_CONTROL_UNIFORM_COMPONENTS                = 0x8E7F,
		GL_MAX_TESS_EVALUATION_UNIFORM_COMPONENTS             = 0x8E80,
		GL_MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS               = 0x8E81,
		GL_MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS            = 0x8E82,
		GL_MAX_TESS_CONTROL_OUTPUT_COMPONENTS                 = 0x8E83,
		GL_MAX_TESS_PATCH_COMPONENTS                          = 0x8E84,
		GL_MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS           = 0x8E85,
		GL_MAX_TESS_EVALUATION_OUTPUT_COMPONENTS              = 0x8E86,
		GL_MAX_TESS_CONTROL_UNIFORM_BLOCKS                    = 0x8E89,
		GL_MAX_TESS_EVALUATION_UNIFORM_BLOCKS                 = 0x8E8A,
		GL_MAX_TESS_CONTROL_INPUT_COMPONENTS                  = 0x886C,
		GL_MAX_TESS_EVALUATION_INPUT_COMPONENTS               = 0x886D,
		GL_MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS       = 0x8E1E,
		GL_MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS    = 0x8E1F,
		GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_CONTROL_SHADER    = 0x84F0,
		GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_EVALUATION_SHADER = 0x84F1,
		GL_TESS_EVALUATION_SHADER                             = 0x8E87,
		GL_TESS_CONTROL_SHADER                                = 0x8E88,
	}
	
	extern(System) nothrow @nogc{
		alias pglPatchParameteri = void function(GLenum, GLint);
		alias pglPatchParameterfv = void function(GLenum, const(GLfloat)*);
	}
	
	__gshared{
		pglPatchParameteri glPatchParameteri;
		pglPatchParameterfv glPatchParameterfv;
	}
	
	private bool loadARBTesselationShader(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glPatchParameteri, "glPatchParameteri");
		lib.bindGLSymbol(cast(void**)&glPatchParameterfv, "glPatchParameterfv");
		return resetErrorCountGL();
	}
}

//ARB_transform_feedback2
enum useARBTransformFeedback2 = (){
	version(GL_ARB)                          return true;
	else version(GL_ARB_transform_feedback2) return true;
	else return has40;
}();

bool _hasARBTransformFeedback2 = false;
bool hasARBTransformFeedback2() nothrow @nogc @safe{ return _hasARBTransformFeedback2; }

static if(useARBTransformFeedback2){
	enum: uint{
		GL_TRANSFORM_FEEDBACK               = 0x8E22,
		GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED = 0x8E23,
		GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE = 0x8E24,
		GL_TRANSFORM_FEEDBACK_BINDING       = 0x8E25,
	}
	
	extern(System) nothrow @nogc{
		alias pglBindTransformFeedback = void function(GLenum, GLuint);
		alias pglDeleteTransformFeedbacks = void function(GLsizei, const(GLuint)*);
		alias pglGenTransformFeedbacks = void function(GLsizei, GLuint*);
		alias pglIsTransformFeedback = GLboolean function(GLuint);
		alias pglPauseTransformFeedback = void function();
		alias pglResumeTransformFeedback = void function();
		alias pglDrawTransformFeedback = void function(GLenum, GLuint);
	}
	
	__gshared{
		pglBindTransformFeedback glBindTransformFeedback;
		pglDeleteTransformFeedbacks glDeleteTransformFeedbacks;
		pglGenTransformFeedbacks glGenTransformFeedbacks;
		pglIsTransformFeedback glIsTransformFeedback;
		pglPauseTransformFeedback glPauseTransformFeedback;
		pglResumeTransformFeedback glResumeTransformFeedback;
		pglDrawTransformFeedback glDrawTransformFeedback;
	}
	
	private bool loadARBTransformFeedback2(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glBindTransformFeedback, "glBindTransformFeedback");
		lib.bindGLSymbol(cast(void**)&glDeleteTransformFeedbacks, "glDeleteTransformFeedbacks");
		lib.bindGLSymbol(cast(void**)&glGenTransformFeedbacks, "glGenTransformFeedbacks");
		lib.bindGLSymbol(cast(void**)&glIsTransformFeedback, "glIsTransformFeedback");
		lib.bindGLSymbol(cast(void**)&glPauseTransformFeedback, "glPauseTransformFeedback");
		lib.bindGLSymbol(cast(void**)&glResumeTransformFeedback, "glResumeTransformFeedback");
		lib.bindGLSymbol(cast(void**)&glDrawTransformFeedback, "glDrawTransformFeedback");
		return resetErrorCountGL();
	}
}

//ARB_transform_feedback3
enum useARBTransformFeedback3 = (){
	version(GL_ARB)                          return true;
	else version(GL_ARB_transform_feedback3) return true;
	else return has40;
}();

bool _hasARBTransformFeedback3 = false;
bool hasARBTransformFeedback3() nothrow @nogc @safe{ return _hasARBTransformFeedback3; }

static if(useARBTransformFeedback3){
	enum: uint{
		GL_MAX_TRANSFORM_FEEDBACK_BUFFERS = 0x8E70,
		GL_MAX_VERTEX_STREAMS             = 0x8E71,
	}
	
	extern(System) nothrow @nogc{
		alias pglDrawTransformFeedbackStream = void function(GLenum, GLuint, GLuint);
		alias pglBeginQueryIndexed = void function(GLenum, GLuint, GLuint);
		alias pglEndQueryIndexed = void function(GLenum, GLuint);
		alias pglGetQueryIndexediv = void function(GLenum, GLuint, GLenum, GLint*);
	}
	
	__gshared{
		pglDrawTransformFeedbackStream glDrawTransformFeedbackStream;
		pglBeginQueryIndexed glBeginQueryIndexed;
		pglEndQueryIndexed glEndQueryIndexed;
		pglGetQueryIndexediv glGetQueryIndexediv;
	}
	
	private bool loadARBTransformFeedback3(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glDrawTransformFeedbackStream, "glDrawTransformFeedbackStream");
		lib.bindGLSymbol(cast(void**)&glBeginQueryIndexed, "glBeginQueryIndexed");
		lib.bindGLSymbol(cast(void**)&glEndQueryIndexed, "glEndQueryIndexed");
		lib.bindGLSymbol(cast(void**)&glGetQueryIndexediv, "glGetQueryIndexediv");
		return resetErrorCountGL();
	}
}

package(bindbc.opengl) bool loadARB40(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
	static if(has40){
		if(contextVersion >= GLSupport.gl40){
			_hasARBGPUShader5 = true;
			
			bool ret = true;
			ret = _hasARBDrawIndirect = lib.loadARBDrawIndirect(contextVersion);
			ret = _hasARBGPUShaderFP64 = lib.loadARBGPUShaderFP64(contextVersion);
			ret = _hasARBShaderSubroutine = lib.loadARBShaderSubroutine(contextVersion);
			ret = _hasARBTesselationShader = lib.loadARBTesselationShader(contextVersion);
			ret = _hasARBTransformFeedback2 = lib.loadARBTransformFeedback2(contextVersion);
			ret = _hasARBTransformFeedback3 = lib.loadARBTransformFeedback3(contextVersion);
			return ret;
		}
	}
	
	static if(useARBGPUShader5)
		_hasARBGPUShader5 =
			hasExtension(contextVersion, "GL_ARB_gpu_shader5");
	
	static if(useARBDrawIndirect)
		_hasARBDrawIndirect =
			hasExtension(contextVersion, "GL_ARB_draw_indirect") &&
			lib.loadARBDrawIndirect(contextVersion);
	
	static if(useARBGPUShaderFP64)
		_hasARBGPUShaderFP64 =
			hasExtension(contextVersion, "GL_ARB_gpu_shader_fp64") &&
			lib.loadARBGPUShaderFP64(contextVersion);
	
	static if(useARBShaderSubroutine)
		_hasARBShaderSubroutine =
			hasExtension(contextVersion, "GL_ARB_shader_subroutine") &&
			lib.loadARBShaderSubroutine(contextVersion);
	
	static if(useARBTesselationShader)
		_hasARBTesselationShader =
			hasExtension(contextVersion, "GL_ARB_tessellation_shader") &&
			lib.loadARBTesselationShader(contextVersion);
	
	static if(useARBTransformFeedback2)
		_hasARBTransformFeedback2 =
			hasExtension(contextVersion, "GL_ARB_transform_feedback2") &&
			lib.loadARBTransformFeedback2(contextVersion);
	
	static if(useARBTransformFeedback3)
		_hasARBTransformFeedback3 =
			hasExtension(contextVersion, "GL_ARB_transform_feedback3") &&
			lib.loadARBTransformFeedback3(contextVersion);
	
	return true;
}
