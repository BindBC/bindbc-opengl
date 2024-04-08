/+
+            Copyright 2022 – 2024 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opengl.bind.arb.arb_01;

import bindbc.loader;
import bindbc.opengl.config, bindbc.opengl.context;
import bindbc.opengl.bind.types;

//ARB_bindless_texture
enum useARBBindlessTexture = (){
	version(GL_ARB)                       return true;
	else version(GL_ARB_bindless_texture) return true;
	else return false;
}();

private bool _hasARBBindlessTexture = false;
bool hasARBBindlessTexture() nothrow @nogc @safe{ return _hasARBBindlessTexture; }

static if(useARBBindlessTexture){
	enum: uint{
		GL_UNSIGNED_INT64_ARB = 0x140F,
	}
	
	extern(System) nothrow @nogc{
		alias pglGetTextureHandleARB = GLuint64 function(GLuint);
		alias pglGetTextureSamplerHandleARB = GLuint64 function(GLuint, GLuint);
		alias pglMakeTextureHandleResidentARB = void function(GLuint64);
		alias pglMakeTextureHandleNonResidentARB = void function(GLuint64);
		alias pglGetImageHandleARB = GLuint64 function(GLuint, GLint, GLboolean, GLint, GLenum);
		alias pglMakeImageHandleResidentARB = void function(GLuint64, GLenum);
		alias pglMakeImageHandleNonResidentARB = void function(GLuint64);
		alias pglUniformHandleui64ARB = void function(GLint, GLuint64);
		alias pglUniformHandleui64vARB = void function(GLint, GLsizei, const(GLuint64)*);
		alias pglProgramUniformHandleui64ARB = void function(GLuint, GLint, GLuint64);
		alias pglProgramUniformHandleui64vARB = void function(GLuint, GLint, GLsizei, const(GLuint64)*);
		alias pglIsTextureHandleResidentARB = GLboolean function(GLuint64);
		alias pglIsImageHandleResidentARB = GLboolean function(GLuint64);
		alias pglVertexAttribL1ui64ARB = void function(GLuint, GLuint64);
		alias pglVertexAttribL1ui64vARB = void function(GLuint, const(GLuint64)*);
		alias pglGetVertexAttribLui64vARB = void function(GLuint, GLenum, GLuint64*);
	}
	
	__gshared{
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
	
	private bool loadARBBindlessTexture(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
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

//ARB_cl_event
enum useARBCLEvent = (){
	version(GL_ARB)               return true;
	else version(GL_ARB_cl_event) return true;
	else return false;
}();

private bool _hasARBCLEvent = false;
bool hasARBCLEvent() nothrow @nogc @safe{ return _hasARBCLEvent; }

static if(useARBCLEvent){
	struct _cl_context;
	struct _cl_event;
	
	enum: uint{
		GL_SYNC_CL_EVENT_ARB          = 0x8240,
		GL_SYNC_CL_EVENT_COMPLETE_ARB = 0x8241,
	}
	
	extern(System) nothrow @nogc{
		import bindbc.opengl.bind.arb.core_32: GLsync;
		alias pglCreateSyncFromCLeventARB = GLsync function(_cl_context*, _cl_event*, GLbitfield);
	}
	
	__gshared{
		pglCreateSyncFromCLeventARB glCreateSyncFromCLeventARB;
	}
	
	private bool loadARBCLEvent(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glCreateSyncFromCLeventARB, "glCreateSyncFromCLeventARB");
		return resetErrorCountGL();
	}
}

//ARB_compute_variable_group_size
enum useARBComputeVariableGroupSize = (){
	version(GL_ARB)                                  return true;
	else version(GL_ARB_compute_variable_group_size) return true;
	else return false;
}();

private bool _hasARBComputeVariableGroupSize = false;
bool hasARBComputeVariableGroupSize() nothrow @nogc @safe{ return _hasARBComputeVariableGroupSize; }

static if(useARBComputeVariableGroupSize){
	enum: uint{
		GL_MAX_COMPUTE_VARIABLE_GROUP_INVOCATIONS_ARB = 0x9344,
		GL_MAX_COMPUTE_FIXED_GROUP_INVOCATIONS_ARB    = 0x90EB,
		GL_MAX_COMPUTE_VARIABLE_GROUP_SIZE_ARB        = 0x9345,
		GL_MAX_COMPUTE_FIXED_GROUP_SIZE_ARB           = 0x91BF,
	}
	
	extern(System) nothrow @nogc{
		alias pglDispatchComputeGroupSizeARB = GLsync function(GLuint, GLuint, GLuint, GLuint, GLuint, GLuint);
	}
	
	__gshared{
		pglDispatchComputeGroupSizeARB glDispatchComputeGroupSizeARB;
	}
	
	private	bool loadARBComputeVariableGroupSize(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glDispatchComputeGroupSizeARB, "glDispatchComputeGroupSizeARB");
		return resetErrorCountGL();
	}
}

//ARB_debug_output
enum useARBDebugOutput = (){
	version(GL_ARB)                   return true;
	else version(GL_ARB_debug_output) return true;
	else return false;
}();

private bool _hasARBDebugOutput = false;
bool hasARBDebugOutput() nothrow @nogc @safe{ return _hasARBDebugOutput; }

static if(useARBDebugOutput){
	enum: uint{
		GL_DEBUG_OUTPUT_SYNCHRONOUS_ARB         = 0x8242,
		GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH_ARB = 0x8243,
		GL_DEBUG_CALLBACK_FUNCTION_ARB          = 0x8244,
		GL_DEBUG_CALLBACK_USER_PARAM_ARB        = 0x8245,
		GL_DEBUG_SOURCE_API_ARB                 = 0x8246,
		GL_DEBUG_SOURCE_WINDOW_SYSTEM_ARB       = 0x8247,
		GL_DEBUG_SOURCE_SHADER_COMPILER_ARB     = 0x8248,
		GL_DEBUG_SOURCE_THIRD_PARTY_ARB         = 0x8249,
		GL_DEBUG_SOURCE_APPLICATION_ARB         = 0x824A,
		GL_DEBUG_SOURCE_OTHER_ARB               = 0x824B,
		GL_DEBUG_TYPE_ERROR_ARB                 = 0x824C,
		GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR_ARB   = 0x824D,
		GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR_ARB    = 0x824E,
		GL_DEBUG_TYPE_PORTABILITY_ARB           = 0x824F,
		GL_DEBUG_TYPE_PERFORMANCE_ARB           = 0x8250,
		GL_DEBUG_TYPE_OTHER_ARB                 = 0x8251,
		GL_MAX_DEBUG_MESSAGE_LENGTH_ARB         = 0x9143,
		GL_MAX_DEBUG_LOGGED_MESSAGES_ARB        = 0x9144,
		GL_DEBUG_LOGGED_MESSAGES_ARB            = 0x9145,
		GL_DEBUG_SEVERITY_HIGH_ARB              = 0x9146,
		GL_DEBUG_SEVERITY_MEDIUM_ARB            = 0x9147,
		GL_DEBUG_SEVERITY_LOW_ARB               = 0x9148,
	}
	
	extern(System) nothrow{
		alias GLDEBUGPROCARB = void function(GLenum, GLenum, GLuint, GLenum, GLsizei, const(GLchar)*, GLvoid*);
		alias GLDEBUGPROCAMD = void function(GLuint, GLenum, GLenum, GLsizei, const(GLchar)*, GLvoid*);
	}
	
	extern(System) nothrow @nogc{
		alias pglDebugMessageControlARB = void function(GLenum, GLenum, GLenum, GLsizei, const(GLuint)*, GLboolean);
		alias pglDebugMessageInsertARB = void function(GLenum, GLenum, GLuint, GLenum, GLsizei, const(GLchar)*);
		alias pglGetDebugMessageLogARB = void function(GLuint, GLsizei, GLenum*, GLenum*, GLuint*, GLenum*, GLsizei*, GLchar*);
		alias pglDebugMessageCallbackARB = void function(GLDEBUGPROCARB, const(GLvoid)*);
	}
	
	__gshared{
		pglDebugMessageControlARB glDebugMessageControlARB;
		pglDebugMessageInsertARB glDebugMessageInsertARB;
		pglDebugMessageCallbackARB glDebugMessageCallbackARB;
		pglGetDebugMessageLogARB glGetDebugMessageLogARB;
	}
	
	private bool loadARBDebugOutput(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glDebugMessageControlARB, "glDebugMessageControlARB");
		lib.bindGLSymbol(cast(void**)&glDebugMessageInsertARB, "glDebugMessageInsertARB");
		lib.bindGLSymbol(cast(void**)&glDebugMessageCallbackARB, "glDebugMessageCallbackARB");
		lib.bindGLSymbol(cast(void**)&glGetDebugMessageLogARB, "glGetDebugMessageLogARB");
		return resetErrorCountGL();
	}
}

//ARB_framebuffer_sRGB
enum useARBFramebufferSRGB = (){
	version(GL_ARB)                       return true;
	else version(GL_ARB_framebuffer_sRGB) return true;
	else return false;
}();

private bool _hasARBFramebufferSRGB = false;
bool hasARBFramebufferSRGB() nothrow @nogc @safe{ return _hasARBFramebufferSRGB; }

static if(useARBFramebufferSRGB){
	enum: uint{
		GL_FRAMEBUFFER_SRGB = 0x8DB9,
	}
}

//ARB_geometry_shader4
enum useARBGeometryShader4 = (){
	version(GL_ARB)                       return true;
	else version(GL_ARB_geometry_shader4) return true;
	else return false;
}();

private bool _hasARBGeometryShader4 = false;
bool hasARBGeometryShader4() nothrow @nogc @safe{ return _hasARBGeometryShader4; }

static if(useARBGeometryShader4){
	enum: uint{
		GL_LINES_ADJACENCY_ARB                      = 0x000A,
		GL_LINE_STRIP_ADJACENCY_ARB                 = 0x000B,
		GL_TRIANGLES_ADJACENCY_ARB                  = 0x000C,
		GL_TRIANGLE_STRIP_ADJACENCY_ARB             = 0x000D,
		GL_PROGRAM_POINT_SIZE_ARB                   = 0x8642,
		GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_ARB     = 0x8C29,
		GL_FRAMEBUFFER_ATTACHMENT_LAYERED_ARB       = 0x8DA7,
		GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_ARB = 0x8DA8,
		GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_ARB   = 0x8DA9,
		GL_GEOMETRY_SHADER_ARB                      = 0x8DD9,
		GL_GEOMETRY_VERTICES_OUT_ARB                = 0x8DDA,
		GL_GEOMETRY_INPUT_TYPE_ARB                  = 0x8DDB,
		GL_GEOMETRY_OUTPUT_TYPE_ARB                 = 0x8DDC,
		GL_MAX_GEOMETRY_VARYING_COMPONENTS_ARB      = 0x8DDD,
		GL_MAX_VERTEX_VARYING_COMPONENTS_ARB        = 0x8DDE,
		GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_ARB      = 0x8DDF,
		GL_MAX_GEOMETRY_OUTPUT_VERTICES_ARB         = 0x8DE0,
		GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_ARB = 0x8DE1,
	}
	
	extern(System) nothrow @nogc{
		alias pglProgramParameteriARB = void function(GLuint, GLenum, GLint);
		alias pglFramebufferTextureARB = void function(GLuint, GLenum, GLuint, GLint);
		alias pglFramebufferTextureLayerARB = void function(GLuint, GLenum, GLuint, GLint, GLint);
		alias pglFramebufferTextureFaceARB = void function(GLuint, GLenum, GLuint, GLint, GLenum);
	}
	
	__gshared{
		pglProgramParameteriARB glProgramParameteriARB;
		pglFramebufferTextureARB glFramebufferTextureARB;
		pglFramebufferTextureLayerARB glFramebufferTextureLayerARB;
		pglFramebufferTextureFaceARB glFramebufferTextureFaceARB;
	}
	
	private bool loadARBGeometryShader4(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glProgramParameteriARB,"glProgramParameteriARB");
		lib.bindGLSymbol(cast(void**)&glFramebufferTextureARB,"glFramebufferTextureARB");
		lib.bindGLSymbol(cast(void**)&glFramebufferTextureLayerARB,"glFramebufferTextureLayerARB");
		lib.bindGLSymbol(cast(void**)&glFramebufferTextureFaceARB,"glFramebufferTextureFaceARB");
		return resetErrorCountGL();
	}
}

//ARB_gl_spirv
enum useARBGLSPIRV = (){
	version(GL_ARB)               return true;
	else version(GL_ARB_gl_spirv) return true;
	else return false;
}();

private bool _hasARBGLSPIRV = false;
bool hasARBGLSPIRV() nothrow @nogc @safe{ return _hasARBGLSPIRV; }

static if(useARBGLSPIRV){
	enum: uint{
		GL_SHADER_BINARY_FORMAT_SPIR_V_ARB = 0x9551,
		GL_SPIR_V_BINARY_ARB               = 0x9552,
	}
	
	extern(System) nothrow @nogc{
		alias pglSpecializeShaderARB = void function(GLuint, const(char)*, GLuint, const(GLuint)*, const(GLuint)*);
	}
	
	__gshared{
		pglSpecializeShaderARB glSpecializeShaderARB;
		alias glSpecialiseShaderARB = glSpecializeShaderARB;
	}
	
	private bool loadARBGLSPIRV(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glSpecializeShaderARB,"glSpecializeShaderARB");
		return resetErrorCountGL();
	}
}

//ARB_gpu_shader_int64
enum useARBGPUShaderInt64 = (){
	version(GL_ARB)                       return true;
	else version(GL_ARB_gpu_shader_int64) return true;
	else return false;
}();

private bool _hasARBGPUShaderInt64 = false;
bool hasARBGPUShaderInt64() nothrow @nogc @safe{ return _hasARBGPUShaderInt64; }

static if(useARBGPUShaderInt64){
	enum: uint{
		GL_INT64_ARB               = 0x140E,
		GL_INT64_VEC2_ARB          = 0x8FE9,
		GL_INT64_VEC3_ARB          = 0x8FEA,
		GL_INT64_VEC4_ARB          = 0x8FEB,
		GL_UNSIGNED_INT64_VEC2_ARB = 0x8FF5,
		GL_UNSIGNED_INT64_VEC3_ARB = 0x8FF6,
		GL_UNSIGNED_INT64_VEC4_ARB = 0x8FF7,
	}
	
	extern(System) nothrow @nogc{
		alias pglUniform1i64ARB = void function(GLint, GLint64);
		alias pglUniform2i64ARB = void function(GLint, GLint64, GLint64);
		alias pglUniform3i64ARB = void function(GLint, GLint64, GLint64, GLint64);
		alias pglUniform4i64ARB = void function(GLint, GLint64, GLint64, GLint64, GLint64);
		alias pglUniform1i64vARB = void function(GLint, GLsizei, const(GLint64)*);
		alias pglUniform2i64vARB = void function(GLint, GLsizei, const(GLint64)*);
		alias pglUniform3i64vARB = void function(GLint, GLsizei, const(GLint64)*);
		alias pglUniform4i64vARB = void function(GLint, GLsizei, const(GLint64)*);
		alias pglUniform1ui64ARB = void function(GLint, GLuint64);
		alias pglUniform2ui64ARB = void function(GLint, GLuint64, GLuint64);
		alias pglUniform3ui64ARB = void function(GLint, GLuint64, GLuint64, GLuint64);
		alias pglUniform4ui64ARB = void function(GLint, GLuint64, GLuint64, GLuint64, GLuint64);
		alias pglUniform1ui64vARB = void function(GLint, GLsizei, const(GLuint64)*);
		alias pglUniform2ui64vARB = void function(GLint, GLsizei, const(GLuint64)*);
		alias pglUniform3ui64vARB = void function(GLint, GLsizei, const(GLuint64)*);
		alias pglUniform4ui64vARB = void function(GLint, GLsizei, const(GLuint64)*);
		alias pglGetUniformi64vARB = void function(GLuint, GLint, GLint64*);
		alias pglGetUniformui64vARB = void function(GLuint, GLint, GLuint64*);
		alias pglGetnUniformi64vARB = void function(GLuint, GLint, GLsizei, GLint64*);
		alias pglGetnUniformui64vARB = void function(GLuint, GLint, GLsizei, GLuint64*);
		alias pglProgramUniform1i64ARB = void function(GLuint, GLint, GLint64);
		alias pglProgramUniform2i64ARB = void function(GLuint, GLint, GLint64, GLint64);
		alias pglProgramUniform3i64ARB = void function(GLuint, GLint, GLint64, GLint64, GLint64);
		alias pglProgramUniform4i64ARB = void function(GLuint, GLint, GLint64, GLint64, GLint64, GLint64);
		alias pglProgramUniform1i64vARB = void function(GLuint, GLint, GLsizei, const(GLint64)*);
		alias pglProgramUniform2i64vARB = void function(GLuint, GLint, GLsizei, const(GLint64)*);
		alias pglProgramUniform3i64vARB = void function(GLuint, GLint, GLsizei, const(GLint64)*);
		alias pglProgramUniform4i64vARB = void function(GLuint, GLint, GLsizei, const(GLint64)*);
		alias pglProgramUniform1ui64ARB = void function(GLuint, GLint, GLsizei, GLuint64);
		alias pglProgramUniform2ui64ARB = void function(GLuint, GLint, GLsizei, GLuint64, GLuint64);
		alias pglProgramUniform3ui64ARB = void function(GLuint, GLint, GLsizei, GLuint64, GLuint64, GLuint64);
		alias pglProgramUniform4ui64ARB = void function(GLuint, GLint, GLsizei, GLuint64, GLuint64, GLuint64, GLuint64);
		alias pglProgramUniform1ui64vARB = void function(GLuint, GLint, GLsizei, const(GLuint)*);
		alias pglProgramUniform2ui64vARB = void function(GLuint, GLint, GLsizei, const(GLuint)*);
		alias pglProgramUniform3ui64vARB = void function(GLuint, GLint, GLsizei, const(GLuint)*);
		alias pglProgramUniform4ui64vARB = void function(GLuint, GLint, GLsizei, const(GLuint)*);
	}
	
	__gshared{
		pglUniform1i64ARB glUniform1i64ARB;
		pglUniform2i64ARB glUniform2i64ARB;
		pglUniform3i64ARB glUniform3i64ARB;
		pglUniform4i64ARB glUniform4i64ARB;
		pglUniform1i64vARB glUniform1i64vARB;
		pglUniform2i64vARB glUniform2i64vARB;
		pglUniform3i64vARB glUniform3i64vARB;
		pglUniform4i64vARB glUniform4i64vARB;
		pglUniform1ui64ARB glUniform1ui64ARB;
		pglUniform2ui64ARB glUniform2ui64ARB;
		pglUniform3ui64ARB glUniform3ui64ARB;
		pglUniform4ui64ARB glUniform4ui64ARB;
		pglUniform1ui64vARB glUniform1ui64vARB;
		pglUniform2ui64vARB glUniform2ui64vARB;
		pglUniform3ui64vARB glUniform3ui64vARB;
		pglUniform4ui64vARB glUniform4ui64vARB;
		pglGetUniformi64vARB glGetUniformi64vARB;
		pglGetUniformui64vARB glGetUniformui64vARB;
		pglGetnUniformi64vARB glGetnUniformi64vARB;
		pglGetnUniformui64vARB glGetnUniformui64vARB;
		pglProgramUniform1i64ARB glProgramUniform1i64ARB;
		pglProgramUniform2i64ARB glProgramUniform2i64ARB;
		pglProgramUniform3i64ARB glProgramUniform3i64ARB;
		pglProgramUniform4i64ARB glProgramUniform4i64ARB;
		pglProgramUniform1i64vARB glProgramUniform1i64vARB;
		pglProgramUniform2i64vARB glProgramUniform2i64vARB;
		pglProgramUniform3i64vARB glProgramUniform3i64vARB;
		pglProgramUniform4i64vARB glProgramUniform4i64vARB;
		pglProgramUniform1ui64ARB glProgramUniform1ui64ARB;
		pglProgramUniform2ui64ARB glProgramUniform2ui64ARB;
		pglProgramUniform3ui64ARB glProgramUniform3ui64ARB;
		pglProgramUniform4ui64ARB glProgramUniform4ui64ARB;
		pglProgramUniform1ui64vARB glProgramUniform1ui64vARB;
		pglProgramUniform2ui64vARB glProgramUniform2ui64vARB;
		pglProgramUniform3ui64vARB glProgramUniform3ui64vARB;
		pglProgramUniform4ui64vARB glProgramUniform4ui64vARB;
	}
	
	private bool loadARBGPUShaderInt64(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glUniform1i64ARB,"glUniform1i64ARB");
		lib.bindGLSymbol(cast(void**)&glUniform2i64ARB,"glUniform2i64ARB");
		lib.bindGLSymbol(cast(void**)&glUniform3i64ARB,"glUniform3i64ARB");
		lib.bindGLSymbol(cast(void**)&glUniform4i64ARB,"glUniform4i64ARB");
		lib.bindGLSymbol(cast(void**)&glUniform1i64vARB,"glUniform1i64vARB");
		lib.bindGLSymbol(cast(void**)&glUniform2i64vARB,"glUniform2i64vARB");
		lib.bindGLSymbol(cast(void**)&glUniform3i64vARB,"glUniform3i64vARB");
		lib.bindGLSymbol(cast(void**)&glUniform4i64vARB,"glUniform4i64vARB");
		lib.bindGLSymbol(cast(void**)&glUniform1ui64ARB,"glUniform1ui64ARB");
		lib.bindGLSymbol(cast(void**)&glUniform2ui64ARB,"glUniform2ui64ARB");
		lib.bindGLSymbol(cast(void**)&glUniform3ui64ARB,"glUniform3ui64ARB");
		lib.bindGLSymbol(cast(void**)&glUniform4ui64ARB,"glUniform4ui64ARB");
		lib.bindGLSymbol(cast(void**)&glUniform1ui64vARB,"glUniform1ui64vARB");
		lib.bindGLSymbol(cast(void**)&glUniform2ui64vARB,"glUniform2ui64vARB");
		lib.bindGLSymbol(cast(void**)&glUniform3ui64vARB,"glUniform3ui64vARB");
		lib.bindGLSymbol(cast(void**)&glUniform4ui64vARB,"glUniform4ui64vARB");
		lib.bindGLSymbol(cast(void**)&glGetUniformi64vARB,"glGetUniformi64vARB");
		lib.bindGLSymbol(cast(void**)&glGetUniformui64vARB,"glGetUniformui64vARB");
		lib.bindGLSymbol(cast(void**)&glGetnUniformi64vARB,"glGetnUniformi64vARB");
		lib.bindGLSymbol(cast(void**)&glGetnUniformui64vARB,"glGetnUniformui64vARB");
		lib.bindGLSymbol(cast(void**)&glProgramUniform1i64ARB,"glProgramUniform1i64ARB");
		lib.bindGLSymbol(cast(void**)&glProgramUniform2i64ARB,"glProgramUniform2i64ARB");
		lib.bindGLSymbol(cast(void**)&glProgramUniform3i64ARB,"glProgramUniform3i64ARB");
		lib.bindGLSymbol(cast(void**)&glProgramUniform4i64ARB,"glProgramUniform4i64ARB");
		lib.bindGLSymbol(cast(void**)&glProgramUniform1i64vARB,"glProgramUniform1i64vARB");
		lib.bindGLSymbol(cast(void**)&glProgramUniform2i64vARB,"glProgramUniform2i64vARB");
		lib.bindGLSymbol(cast(void**)&glProgramUniform3i64vARB,"glProgramUniform3i64vARB");
		lib.bindGLSymbol(cast(void**)&glProgramUniform4i64vARB,"glProgramUniform4i64vARB");
		lib.bindGLSymbol(cast(void**)&glProgramUniform1ui64ARB,"glProgramUniform1ui64ARB");
		lib.bindGLSymbol(cast(void**)&glProgramUniform2ui64ARB,"glProgramUniform2ui64ARB");
		lib.bindGLSymbol(cast(void**)&glProgramUniform3ui64ARB,"glProgramUniform3ui64ARB");
		lib.bindGLSymbol(cast(void**)&glProgramUniform4ui64ARB,"glProgramUniform4ui64ARB");
		lib.bindGLSymbol(cast(void**)&glProgramUniform1ui64vARB,"glProgramUniform1ui64vARB");
		lib.bindGLSymbol(cast(void**)&glProgramUniform2ui64vARB,"glProgramUniform2ui64vARB");
		lib.bindGLSymbol(cast(void**)&glProgramUniform3ui64vARB,"glProgramUniform3ui64vARB");
		lib.bindGLSymbol(cast(void**)&glProgramUniform4ui64vARB,"glProgramUniform4ui64vARB");
		return resetErrorCountGL();
	}
}

//ARB_indirect_parameters
enum useARBIndirectParameters = (){
	version(GL_ARB)                          return true;
	else version(GL_ARB_indirect_parameters) return true;
	else return false;
}();

private bool _hasARBIndirectParameters = false;
bool hasARBIndirectParameters() nothrow @nogc @safe{ return _hasARBIndirectParameters; }

static if(useARBIndirectParameters){
	enum: uint{
		GL_PARAMETER_BUFFER_ARB         = 0x80EE,
		GL_PARAMETER_BUFFER_BINDING_ARB = 0x80EF,
	}
	
	extern(System) nothrow @nogc{
		alias pglMultiDrawArraysIndirectCountARB = void function(GLenum, const(void)*, GLintptr, GLsizei, GLsizei);
		alias pglMultiDrawElementsIndirectCountARB = void function(GLenum, GLenum, const(void)*, GLintptr, GLsizei, GLsizei);
	}
	
	__gshared{
		pglMultiDrawArraysIndirectCountARB glMultiDrawArraysIndirectCountARB;
		pglMultiDrawElementsIndirectCountARB glMultiDrawElementsIndirectCountARB;
	}
	
	private	bool loadARBIndirectParameters(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glMultiDrawArraysIndirectCountARB,"glMultiDrawArraysIndirectCountARB");
		lib.bindGLSymbol(cast(void**)&glMultiDrawElementsIndirectCountARB,"glMultiDrawElementsIndirectCountARB");
		return resetErrorCountGL();
	}
}

//ARB_instanced_arrays
enum useARBInstancedArrays = (){
	version(GL_ARB)                       return true;
	else version(GL_ARB_instanced_arrays) return true;
	else return false;
}();

private bool _hasARBInstancedArrays = false;
bool hasARBInstancedArrays() nothrow @nogc @safe{ return _hasARBInstancedArrays; }

static if(useARBInstancedArrays){
	enum: uint{
		GL_VERTEX_ATTRIB_ARRAY_DIVISOR_ARB = 0x88FE,
	}
	
	extern(System) nothrow @nogc{
		alias pglVertexAttribDivisorARB = void function(GLuint, GLuint);
		alias pglVertexArrayVertexAttribDivisorEXT = void function(GLuint, GLuint, GLuint);
	}
	
	__gshared{
		pglVertexAttribDivisorARB glVertexAttribDivisorARB;
		pglVertexArrayVertexAttribDivisorEXT glVertexArrayVertexAttribDivisorEXT;
	}
	
	private	bool loadARBInstancedArrays(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glVertexAttribDivisorARB,"glVertexAttribDivisorARB");
		
		// glVertexArrayVertexAttribDivisorEXT is only available when EXT_direct_state_access is supported.
		// Save the error count to return and ignore the error if the EXT function isn't available.
		bool ret = resetErrorCountGL();
		if(hasExtension(contextVersion, "GL_EXT_direct_state_access ")){
			lib.bindGLSymbol(cast(void**)&glVertexArrayVertexAttribDivisorEXT, "glVertexArrayVertexAttribDivisorEXT");
			resetErrorCountGL();
		}
		return ret;
	}
}

//ARB_pipeline_statistics_query
enum useARBPipelineStatisticsQuery = (){
	version(GL_ARB)                                return true;
	else version(GL_ARB_pipeline_statistics_query) return true;
	else return false;
}();

private bool _hasARBPipelineStatisticsQuery = false;
bool hasARBPipelineStatisticsQuery() nothrow @nogc @safe{ return _hasARBPipelineStatisticsQuery; }

static if(useARBPipelineStatisticsQuery){
	enum: uint{
		GL_VERTICES_SUBMITTED_ARB                 = 0x82EE,
		GL_PRIMITIVES_SUBMITTED_ARB               = 0x82EF,
		GL_VERTEX_SHADER_INVOCATIONS_ARB          = 0x82F0,
		GL_TESS_CONTROL_SHADER_PATCHES_ARB        = 0x82F1,
		GL_TESS_EVALUATION_SHADER_INVOCATIONS_ARB = 0x82F2,
		GL_GEOMETRY_SHADER_PRIMITIVES_EMITTED_ARB = 0x82F3,
		GL_FRAGMENT_SHADER_INVOCATIONS_ARB        = 0x82F4,
		GL_COMPUTE_SHADER_INVOCATIONS_ARB         = 0x82F5,
		GL_CLIPPING_INPUT_PRIMITIVES_ARB          = 0x82F6,
		GL_CLIPPING_OUTPUT_PRIMITIVES_ARB         = 0x82F7,
	}
}

//ARB_robustness_isolation
enum useARBRobustnessIsolation = (){
	version(GL_ARB)                           return true;
	else version(GL_ARB_robustness_isolation) return true;
	else return false;
}();

private bool _hasARBRobustnessIsolation = false;
bool hasARBRobustnessIsolation() nothrow @nogc @safe{ return _hasARBRobustnessIsolation; }

static if(useARBRobustnessIsolation){
}

//ARB_sample_shading
enum useARBSampleShading = (){
	version(GL_ARB)                     return true;
	else version(GL_ARB_sample_shading) return true;
	else return false;
}();

private bool _hasARBSampleShading = false;
bool hasARBSampleShading() nothrow @nogc @safe{ return _hasARBSampleShading; }

static if(useARBSampleShading){
	enum: uint{
		GL_SAMPLE_SHADING_ARB           = 0x8C36,
		GL_MIN_SAMPLE_SHADING_VALUE_ARB = 0x8C37,
	}
	
	extern(System) nothrow @nogc{
		alias pglMinSampleShadingARB = void function(GLclampf);
	}
	
	__gshared{
		pglMinSampleShadingARB glMinSampleShadingARB;
	}
	
	private bool loadARBSampleShading(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glMinSampleShadingARB,"glMinSampleShadingARB");
		return resetErrorCountGL();
	}
}

//ARB_texture_buffer_object
enum useARBTextureBufferObject = (){
	version(GL_ARB)                            return true;
	else version(GL_ARB_texture_buffer_object) return true;
	else return false;
}();

private bool _hasARBTextureBufferObject = false;
bool hasARBTextureBufferObject() nothrow @nogc @safe{ return _hasARBTextureBufferObject; }

static if(useARBTextureBufferObject){
	enum: uint{
		GL_TEXTURE_BUFFER_ARB =                    0x8C2A,
		GL_MAX_TEXTURE_BUFFER_SIZE_ARB =           0x8C2B,
		GL_TEXTURE_BINDING_BUFFER_ARB =            0x8C2C,
		GL_TEXTURE_BUFFER_DATA_STORE_BINDING_ARB = 0x8C2D,
		GL_TEXTURE_BUFFER_FORMAT_ARB =             0x8C2E,
	}
	
	extern(System) nothrow @nogc{
		alias pglTexBufferARB = void function(GLenum, GLenum, GLuint);
	}
	
	__gshared{
		pglTexBufferARB glTexBufferARB;
	}
	
	private bool loadARBTextureBufferObject(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glTexBufferARB,"glTexBufferARB");
		return resetErrorCountGL();
	}
}

//ARB_texture_compression_bptc
enum useARBTextureCompressionBPTC = (){
	version(GL_ARB)                               return true;
	else version(GL_ARB_texture_compression_bptc) return true;
	else return false;
}();

private bool _hasARBTextureCompressionBPTC = false;
bool hasARBTextureCompressionBPTC() nothrow @nogc @safe{ return _hasARBTextureCompressionBPTC; }

static if(useARBTextureCompressionBPTC){
	enum: uint{
		GL_COMPRESSED_RGBA_BPTC_UNORM_ARB         = 0x8E8C,
		GL_COMPRESSED_SRGB_ALPHA_BPTC_UNORM_ARB   = 0x8E8D,
		GL_COMPRESSED_RGB_BPTC_SIGNED_FLOAT_ARB   = 0x8E8E,
		GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT_ARB = 0x8E8F,
	}
}

//ARB_texture_cube_map_array
enum useARBTextureCubeMapArray = (){
	version(GL_ARB)                             return true;
	else version(GL_ARB_texture_cube_map_array) return true;
	else return false;
}();

private bool _hasARBTextureCubeMapArray = false;
bool hasARBTextureCubeMapArray() nothrow @nogc @safe{ return _hasARBTextureCubeMapArray; }

static if(useARBTextureCubeMapArray){
	enum: uint{
		GL_TEXTURE_CUBE_MAP_ARRAY_ARB              = 0x9009,
		GL_TEXTURE_BINDING_CUBE_MAP_ARRAY_ARB      = 0x900A,
		GL_PROXY_TEXTURE_CUBE_MAP_ARRAY_ARB        = 0x900B,
		GL_SAMPLER_CUBE_MAP_ARRAY_ARB              = 0x900C,
		GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW_ARB       = 0x900D,
		GL_INT_SAMPLER_CUBE_MAP_ARRAY_ARB          = 0x900E,
		GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY_ARB = 0x900F,
	}
}

//ARB_texture_gather
enum useARBTextureGather = (){
	version(GL_ARB)                     return true;
	else version(GL_ARB_texture_gather) return true;
	else return false;
}();

private bool _hasARBTextureGather = false;
bool hasARBTextureGather() nothrow @nogc @safe{ return _hasARBTextureGather; }

static if(useARBTextureGather){
	enum: uint{
		GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = 0x8E5E,
		GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = 0x8E5F,
	}
}

//ARB_transform_feedback_overflow_query
enum useARBTransformFeedbackOverflowQuery = (){
	version(GL_ARB)                                        return true;
	else version(GL_ARB_transform_feedback_overflow_query) return true;
	else return false;
}();

private bool _hasARBTransformFeedbackOverflowQuery = false;
bool hasARBTransformFeedbackOverflowQuery() nothrow @nogc @safe{ return _hasARBTransformFeedbackOverflowQuery; }

static if(useARBTransformFeedbackOverflowQuery){
	enum: uint{
		GL_TRANSFORM_FEEDBACK_OVERFLOW_ARB        = 0x82EC,
		GL_TRANSFORM_FEEDBACK_STREAM_OVERFLOW_ARB = 0x82ED,
	}
}

//ARB_sparse_texture
enum useARBSparseTexture = (){
	version(GL_ARB)                     return true;
	else version(GL_ARB_sparse_texture) return true;
	else return false;
}();

private bool _hasARBSparseTexture;
bool hasARBSparseTexture() nothrow @nogc @safe{ return _hasARBSparseTexture; }

static if(useARBSparseTexture){
	import bindbc.opengl.bind.arb.core_45: useARBDirectStateAccess, hasARBDirectStateAccess;
	
	enum: uint{
		GL_TEXTURE_SPARSE_ARB          = 0x91A6,
		GL_VIRTUAL_PAGE_SIZE_INDEX_ARB = 0x91A7,
		
		GL_NUM_SPARSE_LEVELS_ARB = 0x91AA,
		
		GL_NUM_VIRTUAL_PAGE_SIZES_ARB = 0x91A8,
		GL_VIRTUAL_PAGE_SIZE_X_ARB    = 0x9195,
		GL_VIRTUAL_PAGE_SIZE_Y_ARB    = 0x9196,
		GL_VIRTUAL_PAGE_SIZE_Z_ARB    = 0x9197,
		
		GL_MAX_SPARSE_TEXTURE_SIZE_ARB                = 0x9198,
		GL_MAX_SPARSE_3D_TEXTURE_SIZE_ARB             = 0x9199,
		GL_MAX_SPARSE_ARRAY_TEXTURE_LAYERS_ARB        = 0x919A,
		GL_SPARSE_TEXTURE_FULL_ARRAY_CUBE_MIPMAPS_ARB = 0x91A9
	}
	
	extern(System) nothrow @nogc{
		alias pglTexPageCommitmentARB = void function(GLenum, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLboolean);
		static if(useARBDirectStateAccess){
			alias pglTexturePageCommitmentEXT = void function(GLuint, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLboolean);
		}
	}
	
	__gshared{
		pglTexPageCommitmentARB glTexPageCommitmentARB;
		static if(useARBDirectStateAccess)
			pglTexturePageCommitmentEXT glTexturePageCommitmentEXT;
	}
	
	private	bool loadARBSparseTexture(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glTexPageCommitmentARB, "glTexPageCommitmentARB");
		
		static if(useARBDirectStateAccess){
			if(hasARBDirectStateAccess)
				lib.bindGLSymbol(cast(void**)&glTexturePageCommitmentEXT, "glTexturePageCommitmentEXT");
		}
		
		return resetErrorCountGL();
	}
}

//ARB_sparse_texture2
enum useARBSparseTexture2 = (){
	version(GL_ARB)                      return true;
	else version(GL_ARB_sparse_texture2) return true;
	else return false;
}();

private bool _hasARBSparseTexture2;
bool hasARBSparseTexture2() nothrow @nogc @safe{ return _hasARBSparseTexture2; }

static if(useARBSparseTexture2){
}

//ARB_sparse_texture_clamp
enum useARBSparseTextureClamp = (){
	version(GL_ARB)                           return true;
	else version(GL_ARB_sparse_texture_clamp) return true;
	else return false;
}();

private bool _hasARBSparseTextureClamp;
bool hasARBSparseTextureClamp() nothrow @nogc @safe{ return _hasARBSparseTextureClamp; }

static if(useARBSparseTextureClamp){
}

package void loadARB_01(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
	static if(useARBBindlessTexture)
		_hasARBBindlessTexture =
			hasExtension(contextVersion, "GL_ARB_bindless_texture") &&
			lib.loadARBBindlessTexture(contextVersion);
	
	static if(useARBCLEvent)
		_hasARBCLEvent =
			hasExtension(contextVersion, "GL_ARB_cl_event") &&
			lib.loadARBCLEvent(contextVersion);
	
	static if(useARBComputeVariableGroupSize)
		_hasARBComputeVariableGroupSize =
			hasExtension(contextVersion, "GL_ARB_compute_variable_group_size") &&
			lib.loadARBComputeVariableGroupSize(contextVersion);
	
	static if(useARBDebugOutput)
		_hasARBDebugOutput =
			hasExtension(contextVersion, "GL_ARB_debug_output") &&
			lib.loadARBDebugOutput(contextVersion);
	
	static if(useARBFramebufferSRGB)
		_hasARBFramebufferSRGB =
			hasExtension(contextVersion, "GL_ARB_framebuffer_sRGB");
	
	static if(useARBGeometryShader4)
		_hasARBGeometryShader4 =
			hasExtension(contextVersion, "GL_ARB_geometry_shader4") &&
			lib.loadARBGeometryShader4(contextVersion);
	
	static if(useARBGLSPIRV)
		_hasARBGLSPIRV =
			hasExtension(contextVersion, "GL_ARB_gl_spirv") &&
			lib.loadARBGLSPIRV(contextVersion);
	
	static if(useARBGPUShaderInt64)
		_hasARBGPUShaderInt64 =
			hasExtension(contextVersion, "GL_ARB_gpu_shader_int64") &&
			lib.loadARBGPUShaderInt64(contextVersion);
	
	static if(useARBIndirectParameters)
		_hasARBIndirectParameters =
			hasExtension(contextVersion, "GL_ARB_indirect_parameters") &&
			lib.loadARBIndirectParameters(contextVersion);
	
	static if(useARBInstancedArrays)
		_hasARBInstancedArrays =
			hasExtension(contextVersion, "GL_ARB_instanced_arrays") &&
			lib.loadARBInstancedArrays(contextVersion);
	
	static if(useARBPipelineStatisticsQuery)
		_hasARBPipelineStatisticsQuery =
			hasExtension(contextVersion, "GL_ARB_pipeline_statistics_query");
	
	static if(useARBRobustnessIsolation)
		_hasARBRobustnessIsolation =
			hasExtension(contextVersion, "GL_ARB_robustness_isolation");
	
	static if(useARBSampleShading)
		_hasARBSampleShading  =
			hasExtension(contextVersion, "GL_ARB_sample_shading") &&
			lib.loadARBSampleShading (contextVersion);
	
	static if(useARBTextureBufferObject)
		_hasARBTextureBufferObject =
			hasExtension(contextVersion, "GL_ARB_texture_buffer_object") &&
			lib.loadARBTextureBufferObject(contextVersion);
	
	static if(useARBTextureCompressionBPTC)
		_hasARBTextureCompressionBPTC =
			hasExtension(contextVersion, "GL_ARB_texture_compression_bptc");
	
	static if(useARBTextureCubeMapArray)
		_hasARBTextureCubeMapArray =
			hasExtension(contextVersion, "GL_ARB_texture_cube_map_array");
	
	static if(useARBTextureGather)
		_hasARBTextureGather =
			hasExtension(contextVersion, "GL_ARB_texture_gather");
	
	static if(useARBTransformFeedbackOverflowQuery)
		_hasARBTransformFeedbackOverflowQuery =
			hasExtension(contextVersion, "GL_ARB_transform_feedback_overflow_query");
	
	static if(useARBSparseTexture)
		_hasARBSparseTexture =
			hasExtension(contextVersion, "GL_ARB_sparse_texture") &&
			lib.loadARBSparseTexture(contextVersion);
	
	static if(useARBSparseTexture2)
		_hasARBSparseTexture2 =
			hasExtension(contextVersion, "GL_ARB_sparse_texture2");
	
	static if(useARBSparseTextureClamp)
		_hasARBSparseTextureClamp =
			hasExtension(contextVersion, "GL_ARB_sparse_texture_clamp");
}
