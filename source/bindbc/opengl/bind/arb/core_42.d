/+
+            Copyright 2022 – 2024 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opengl.bind.arb.core_42;

import bindbc.loader;
import bindbc.opengl.config, bindbc.opengl.context, bindbc.opengl.bind.types;

enum has42 = glSupport >= GLSupport.gl42;

//ARB_base_instance
enum useARBBaseInstance = (){
	version(GL_ARB)                    return true;
	else version(GL_ARB_base_instance) return true;
	else return has42;
}();

bool _hasARBBaseInstance = false;
bool hasARBBaseInstance() nothrow @nogc @safe{ return _hasARBBaseInstance; }

static if(useARBBaseInstance){
	extern(System) nothrow @nogc{
		alias pglDrawArraysInstancedBaseInstance = void function(GLenum, GLint, GLsizei, GLsizei, GLuint);
		alias pglDrawElementsInstancedBaseInstance = void function(GLenum, GLsizei, GLenum, const(void)*, GLsizei, GLuint);
		alias pglDrawElementsInstancedBaseVertexBaseInstance = void function(GLenum, GLsizei, GLenum, const(void)*, GLsizei, GLint, GLuint);
	}
	
	__gshared{
		pglDrawArraysInstancedBaseInstance glDrawArraysInstancedBaseInstance;
		pglDrawElementsInstancedBaseInstance glDrawElementsInstancedBaseInstance;
		pglDrawElementsInstancedBaseVertexBaseInstance glDrawElementsInstancedBaseVertexBaseInstance;
	}
	
	private bool loadARBBaseInstance(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glDrawArraysInstancedBaseInstance, "glDrawArraysInstancedBaseInstance");
		lib.bindGLSymbol(cast(void**)&glDrawElementsInstancedBaseInstance, "glDrawElementsInstancedBaseInstance");
		lib.bindGLSymbol(cast(void**)&glDrawElementsInstancedBaseVertexBaseInstance, "glDrawElementsInstancedBaseVertexBaseInstance");
		return resetErrorCountGL();
	}
}

//ARB_compressed_texture_pixel_storage
enum useARBCompressedTexturePixelStorage = (){
	version(GL_ARB)                                       return true;
	else version(GL_ARB_compressed_texture_pixel_storage) return true;
	else return has42;
}();

bool _hasARBCompressedTexturePixelStorage = false;
bool hasARBCompressedTexturePixelStorage() nothrow @nogc @safe{ return _hasARBCompressedTexturePixelStorage; }

static if(useARBCompressedTexturePixelStorage){
	enum: uint{
		GL_UNPACK_COMPRESSED_BLOCK_WIDTH  = 0x9127,
		GL_UNPACK_COMPRESSED_BLOCK_HEIGHT = 0x9128,
		GL_UNPACK_COMPRESSED_BLOCK_DEPTH  = 0x9129,
		GL_UNPACK_COMPRESSED_BLOCK_SIZE   = 0x912A,
		GL_PACK_COMPRESSED_BLOCK_WIDTH    = 0x912B,
		GL_PACK_COMPRESSED_BLOCK_HEIGHT   = 0x912C,
		GL_PACK_COMPRESSED_BLOCK_DEPTH    = 0x912D,
		GL_PACK_COMPRESSED_BLOCK_SIZE     = 0x912E,
	}
}

//ARB_internalformat_query
enum useARBInternalFormatQuery = (){
	version(GL_ARB)                           return true;
	else version(GL_ARB_internalformat_query) return true;
	else return has42;
}();

bool _hasARBInternalFormatQuery = false;
bool hasARBInternalFormatQuery() nothrow @nogc @safe{ return _hasARBInternalFormatQuery; }

static if(useARBInternalFormatQuery){
	enum: uint{
		GL_NUM_SAMPLE_COUNTS = 0x9380,
	}
	
	extern(System) nothrow @nogc{
		alias pglGetInternalformativ = void function(GLenum, GLenum, GLenum, GLsizei, GLint*);
	}
	
	__gshared{
		pglGetInternalformativ glGetInternalformativ;
	}
	
	private bool loadARBInternalFormatQuery(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glGetInternalformativ, "glGetInternalformativ");
		return resetErrorCountGL();
	}
}

//ARB_map_buffer_alignment
enum useARBMapBufferAlignment = (){
	version(GL_ARB)                           return true;
	else version(GL_ARB_map_buffer_alignment) return true;
	else return has42;
}();

bool _hasARBMapBufferAlignment = false;
bool hasARBMapBufferAlignment() nothrow @nogc @safe{ return _hasARBMapBufferAlignment; }

static if(useARBMapBufferAlignment){
	enum: uint{
		GL_MIN_MAP_BUFFER_ALIGNMENT = 0x90BC,
	}
}

//ARB_shader_atomic_counters
enum useARBShaderAtomicCounters = (){
	version(GL_ARB)                             return true;
	else version(GL_ARB_shader_atomic_counters) return true;
	else return has42;
}();

bool _hasARBShaderAtomicCounters = false;
bool hasARBShaderAtomicCounters() nothrow @nogc @safe{ return _hasARBShaderAtomicCounters; }

static if(useARBShaderAtomicCounters){
	enum: uint{
		GL_ATOMIC_COUNTER_BUFFER                                      = 0x92C0,
		GL_ATOMIC_COUNTER_BUFFER_BINDING                              = 0x92C1,
		GL_ATOMIC_COUNTER_BUFFER_START                                = 0x92C2,
		GL_ATOMIC_COUNTER_BUFFER_SIZE                                 = 0x92C3,
		GL_ATOMIC_COUNTER_BUFFER_DATA_SIZE                            = 0x92C4,
		GL_ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTERS               = 0x92C5,
		GL_ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTER_INDICES        = 0x92C6,
		GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_VERTEX_SHADER          = 0x92C7,
		GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_CONTROL_SHADER    = 0x92C8,
		GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_EVALUATION_SHADER = 0x92C9,
		GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_GEOMETRY_SHADER        = 0x92CA,
		GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_FRAGMENT_SHADER        = 0x92CB,
		GL_MAX_VERTEX_ATOMIC_COUNTER_BUFFERS                          = 0x92CC,
		GL_MAX_TESS_CONTROL_ATOMIC_COUNTER_BUFFERS                    = 0x92CD,
		GL_MAX_TESS_EVALUATION_ATOMIC_COUNTER_BUFFERS                 = 0x92CE,
		GL_MAX_GEOMETRY_ATOMIC_COUNTER_BUFFERS                        = 0x92CF,
		GL_MAX_FRAGMENT_ATOMIC_COUNTER_BUFFERS                        = 0x92D0,
		GL_MAX_COMBINED_ATOMIC_COUNTER_BUFFERS                        = 0x92D1,
		GL_MAX_VERTEX_ATOMIC_COUNTERS                                 = 0x92D2,
		GL_MAX_TESS_CONTROL_ATOMIC_COUNTERS                           = 0x92D3,
		GL_MAX_TESS_EVALUATION_ATOMIC_COUNTERS                        = 0x92D4,
		GL_MAX_GEOMETRY_ATOMIC_COUNTERS                               = 0x92D5,
		GL_MAX_FRAGMENT_ATOMIC_COUNTERS                               = 0x92D6,
		GL_MAX_COMBINED_ATOMIC_COUNTERS                               = 0x92D7,
		GL_MAX_ATOMIC_COUNTER_BUFFER_SIZE                             = 0x92D8,
		GL_MAX_ATOMIC_COUNTER_BUFFER_BINDINGS                         = 0x92DC,
		GL_ACTIVE_ATOMIC_COUNTER_BUFFERS                              = 0x92D9,
		GL_UNIFORM_ATOMIC_COUNTER_BUFFER_INDEX                        = 0x92DA,
		GL_UNSIGNED_INT_ATOMIC_COUNTER                                = 0x92DB,
	}
	
	extern(System) nothrow @nogc{
		alias pglGetActiveAtomicCounterBufferiv = void function(GLuint, GLuint, GLenum, GLint*);
	}
	
	__gshared{
		pglGetActiveAtomicCounterBufferiv glGetActiveAtomicCounterBufferiv;
	}
	
	private bool loadARBShaderAtomicCounters(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glGetActiveAtomicCounterBufferiv, "glGetActiveAtomicCounterBufferiv");
		return resetErrorCountGL();
	}
}

//ARB_shader_image_load_store
enum useARBShaderImageLoadStore = (){
	version(GL_ARB)                              return true;
	else version(GL_ARB_shader_image_load_store) return true;
	else return has42;
}();

bool _hasARBShaderImageLoadStore = false;
bool hasARBShaderImageLoadStore() nothrow @nogc @safe{ return _hasARBShaderImageLoadStore; }

static if(useARBShaderImageLoadStore){
	enum: uint{
		GL_VERTEX_ATTRIB_ARRAY_BARRIER_BIT               = 0x00000001,
		GL_ELEMENT_ARRAY_BARRIER_BIT                     = 0x00000002,
		GL_UNIFORM_BARRIER_BIT                           = 0x00000004,
		GL_TEXTURE_FETCH_BARRIER_BIT                     = 0x00000008,
		GL_SHADER_IMAGE_ACCESS_BARRIER_BIT               = 0x00000020,
		GL_COMMAND_BARRIER_BIT                           = 0x00000040,
		GL_PIXEL_BUFFER_BARRIER_BIT                      = 0x00000080,
		GL_TEXTURE_UPDATE_BARRIER_BIT                    = 0x00000100,
		GL_BUFFER_UPDATE_BARRIER_BIT                     = 0x00000200,
		GL_FRAMEBUFFER_BARRIER_BIT                       = 0x00000400,
		GL_TRANSFORM_FEEDBACK_BARRIER_BIT                = 0x00000800,
		GL_ATOMIC_COUNTER_BARRIER_BIT                    = 0x00001000,
		GL_ALL_BARRIER_BITS                              = 0xFFFFFFFF,
		GL_MAX_IMAGE_UNITS                               = 0x8F38,
		GL_MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS = 0x8F39,
		GL_IMAGE_BINDING_NAME                            = 0x8F3A,
		GL_IMAGE_BINDING_LEVEL                           = 0x8F3B,
		GL_IMAGE_BINDING_LAYERED                         = 0x8F3C,
		GL_IMAGE_BINDING_LAYER                           = 0x8F3D,
		GL_IMAGE_BINDING_ACCESS                          = 0x8F3E,
		GL_IMAGE_1D                                      = 0x904C,
		GL_IMAGE_2D                                      = 0x904D,
		GL_IMAGE_3D                                      = 0x904E,
		GL_IMAGE_2D_RECT                                 = 0x904F,
		GL_IMAGE_CUBE                                    = 0x9050,
		GL_IMAGE_BUFFER                                  = 0x9051,
		GL_IMAGE_1D_ARRAY                                = 0x9052,
		GL_IMAGE_2D_ARRAY                                = 0x9053,
		GL_IMAGE_CUBE_MAP_ARRAY                          = 0x9054,
		GL_IMAGE_2D_MULTISAMPLE                          = 0x9055,
		GL_IMAGE_2D_MULTISAMPLE_ARRAY                    = 0x9056,
		GL_INT_IMAGE_1D                                  = 0x9057,
		GL_INT_IMAGE_2D                                  = 0x9058,
		GL_INT_IMAGE_3D                                  = 0x9059,
		GL_INT_IMAGE_2D_RECT                             = 0x905A,
		GL_INT_IMAGE_CUBE                                = 0x905B,
		GL_INT_IMAGE_BUFFER                              = 0x905C,
		GL_INT_IMAGE_1D_ARRAY                            = 0x905D,
		GL_INT_IMAGE_2D_ARRAY                            = 0x905E,
		GL_INT_IMAGE_CUBE_MAP_ARRAY                      = 0x905F,
		GL_INT_IMAGE_2D_MULTISAMPLE                      = 0x9060,
		GL_INT_IMAGE_2D_MULTISAMPLE_ARRAY                = 0x9061,
		GL_UNSIGNED_INT_IMAGE_1D                         = 0x9062,
		GL_UNSIGNED_INT_IMAGE_2D                         = 0x9063,
		GL_UNSIGNED_INT_IMAGE_3D                         = 0x9064,
		GL_UNSIGNED_INT_IMAGE_2D_RECT                    = 0x9065,
		GL_UNSIGNED_INT_IMAGE_CUBE                       = 0x9066,
		GL_UNSIGNED_INT_IMAGE_BUFFER                     = 0x9067,
		GL_UNSIGNED_INT_IMAGE_1D_ARRAY                   = 0x9068,
		GL_UNSIGNED_INT_IMAGE_2D_ARRAY                   = 0x9069,
		GL_UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY             = 0x906A,
		GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE             = 0x906B,
		GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY       = 0x906C,
		GL_MAX_IMAGE_SAMPLES                             = 0x906D,
		GL_IMAGE_BINDING_FORMAT                          = 0x906E,
		GL_IMAGE_FORMAT_COMPATIBILITY_TYPE               = 0x90C7,
		GL_IMAGE_FORMAT_COMPATIBILITY_BY_SIZE            = 0x90C8,
		GL_IMAGE_FORMAT_COMPATIBILITY_BY_CLASS           = 0x90C9,
		GL_MAX_VERTEX_IMAGE_UNIFORMS                     = 0x90CA,
		GL_MAX_TESS_CONTROL_IMAGE_UNIFORMS               = 0x90CB,
		GL_MAX_TESS_EVALUATION_IMAGE_UNIFORMS            = 0x90CC,
		GL_MAX_GEOMETRY_IMAGE_UNIFORMS                   = 0x90CD,
		GL_MAX_FRAGMENT_IMAGE_UNIFORMS                   = 0x90CE,
		GL_MAX_COMBINED_IMAGE_UNIFORMS                   = 0x90CF,
	}
	
	extern(System) nothrow @nogc{
		alias pglBindImageTexture = void function(GLuint, GLuint, GLint, GLboolean, GLint, GLenum, GLenum);
		alias pglMemoryBarrier = void function(GLbitfield);
	}
	
	__gshared{
		pglBindImageTexture glBindImageTexture;
		pglMemoryBarrier glMemoryBarrier;
	}
	
	private bool loadARBShaderImageLoadStore(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glBindImageTexture, "glBindImageTexture");
		lib.bindGLSymbol(cast(void**)&glMemoryBarrier, "glMemoryBarrier");
		return resetErrorCountGL();
	}
}

//ARB_texture_storage
enum useARBTextureStorage = (){
	version(GL_ARB)                      return true;
	else version(GL_ARB_texture_storage) return true;
	else return has42;
}();

bool _hasARBTextureStorage = false;
bool hasARBTextureStorage() nothrow @nogc @safe{ return _hasARBTextureStorage; }

static if(useARBTextureStorage){
	enum: uint{
		GL_TEXTURE_IMMUTABLE_FORMAT = 0x912F,
	}
	
	extern(System) nothrow @nogc{
		alias pglTexStorage1D = void function(GLenum, GLsizei, GLenum, GLsizei);
		alias pglTexStorage2D = void function(GLenum, GLsizei, GLenum, GLsizei, GLsizei);
		alias pglTexStorage3D = void function(GLenum, GLsizei, GLenum, GLsizei, GLsizei, GLsizei);
		alias pglTextureStorage1DEXT = void function(GLuint, GLenum, GLsizei, GLenum, GLsizei);
		alias pglTextureStorage2DEXT = void function(GLuint, GLenum, GLsizei, GLenum, GLsizei, GLsizei);
		alias pglTextureStorage3DEXT = void function(GLuint, GLenum, GLsizei, GLenum, GLsizei, GLsizei, GLsizei);
	}
	
	__gshared{
		pglTexStorage1D glTexStorage1D;
		pglTexStorage2D glTexStorage2D;
		pglTexStorage3D glTexStorage3D;
		pglTextureStorage1DEXT glTextureStorage1DEXT;
		pglTextureStorage2DEXT glTextureStorage2DEXT;
		pglTextureStorage3DEXT glTextureStorage3DEXT;
	}
	
	private bool loadARBTextureStorage(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glTexStorage1D, "glTexStorage1D");
		lib.bindGLSymbol(cast(void**)&glTexStorage2D, "glTexStorage2D");
		lib.bindGLSymbol(cast(void**)&glTexStorage3D, "glTexStorage3D");
		
		// The previous three functions are required when loading GL 4.2,
		// the next three are not. Save the result of resetErrorCountGL and
		// use that for the return value.
		bool ret = resetErrorCountGL();
		if(hasExtension(contextVersion, "GL_EXT_direct_state_access ")){
			lib.bindGLSymbol(cast(void**)&glTextureStorage1DEXT, "glTextureStorage1DEXT");
			lib.bindGLSymbol(cast(void**)&glTextureStorage2DEXT, "glTextureStorage2DEXT");
			lib.bindGLSymbol(cast(void**)&glTextureStorage3DEXT, "glTextureStorage3DEXT");
			
			// Ignore errors.
			resetErrorCountGL();
		}
		return ret;
	}
}

// ARB_transform_feedback_instanced
enum useARBTransformFeedbackInstanced = (){
	version(GL_ARB)                                   return true;
	else version(GL_ARB_transform_feedback_instanced) return true;
	else return has42;
}();

bool _hasARBTransformFeedbackInstanced = false;
bool hasARBTransformFeedbackInstanced() nothrow @nogc @safe{ return _hasARBTransformFeedbackInstanced; }

static if(useARBTransformFeedbackInstanced){
	extern(System) nothrow @nogc{
		alias pglDrawTransformFeedbackInstanced = void function(GLenum, GLuint, GLsizei);
		alias pglDrawTransformFeedbackStreamInstanced = void function(GLenum, GLuint, GLuint, GLsizei);
	}
	
	__gshared{
		pglDrawTransformFeedbackInstanced glDrawTransformFeedbackInstanced;
		pglDrawTransformFeedbackStreamInstanced glDrawTransformFeedbackStreamInstanced;
	}
	
	private bool loadARBTransformFeedbackInstanced(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glDrawTransformFeedbackInstanced, "glDrawTransformFeedbackInstanced");
		lib.bindGLSymbol(cast(void**)&glDrawTransformFeedbackStreamInstanced, "glDrawTransformFeedbackStreamInstanced");
		return resetErrorCountGL();
	}
}

package(bindbc.opengl) bool loadARB42(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
	static if(has42){
		if(contextVersion >= GLSupport.gl42){
			_hasARBCompressedTexturePixelStorage = true;
			_hasARBMapBufferAlignment = true;
			
			bool ret = true;
			ret = _hasARBBaseInstance = lib.loadARBBaseInstance(contextVersion);
			ret = _hasARBInternalFormatQuery = lib.loadARBInternalFormatQuery(contextVersion);
			ret = _hasARBShaderAtomicCounters = lib.loadARBShaderAtomicCounters(contextVersion);
			ret = _hasARBShaderImageLoadStore = lib.loadARBShaderImageLoadStore(contextVersion);
			ret = _hasARBTextureStorage = lib.loadARBTextureStorage(contextVersion);
			ret = _hasARBTransformFeedbackInstanced = lib.loadARBTransformFeedbackInstanced(contextVersion);
			return ret;
		}
	}
	
	static if(useARBCompressedTexturePixelStorage)
		_hasARBCompressedTexturePixelStorage =
			hasExtension(contextVersion, "GL_ARB_compressed_texture_pixel_storage");
	
	static if(useARBMapBufferAlignment)
		_hasARBMapBufferAlignment =
			hasExtension(contextVersion, "GL_ARB_map_buffer_alignment");
	
	static if(useARBBaseInstance)
		_hasARBBaseInstance =
			hasExtension(contextVersion, "GL_ARB_base_instance") &&
			lib.loadARBBaseInstance(contextVersion);
	
	static if(useARBInternalFormatQuery)
		_hasARBInternalFormatQuery =
			hasExtension(contextVersion, "GL_ARB_internalformat_query") &&
			lib.loadARBInternalFormatQuery(contextVersion);
	
	static if(useARBShaderAtomicCounters)
		_hasARBShaderAtomicCounters =
			hasExtension(contextVersion, "GL_ARB_shader_atomic_counters") &&
			lib.loadARBShaderAtomicCounters(contextVersion);
	
	static if(useARBShaderImageLoadStore)
		_hasARBShaderImageLoadStore =
			hasExtension(contextVersion, "GL_ARB_shader_image_load_store") &&
			lib.loadARBShaderImageLoadStore(contextVersion);
	
	static if(useARBTextureStorage)
		_hasARBTextureStorage =
			hasExtension(contextVersion, "GL_ARB_texture_storage") &&
			lib.loadARBTextureStorage(contextVersion);
	
	static if(useARBTransformFeedbackInstanced)
		_hasARBTransformFeedbackInstanced =
			hasExtension(contextVersion, "GL_ARB_transform_feedback_instanced") &&
			lib.loadARBTransformFeedbackInstanced(contextVersion);
	
	return true;
}
