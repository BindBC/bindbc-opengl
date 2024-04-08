/+
+            Copyright 2022 – 2024 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opengl.bind.arb.core_44;

import bindbc.loader;
import bindbc.opengl.config, bindbc.opengl.context, bindbc.opengl.bind.types;

enum has44 = glSupport >= GLSupport.gl44;

//ARB_buffer_storage
enum useARBBufferStorage = (){
	version(GL_ARB)                     return true;
	else version(GL_ARB_buffer_storage) return true;
	else return has44;
}();

bool _hasARBBufferStorage = false;
bool hasARBBufferStorage() nothrow @nogc @safe{ return _hasARBBufferStorage; }

static if(useARBBufferStorage){
	enum: uint{
		GL_MAP_PERSISTENT_BIT               = 0x0040,
		GL_MAP_COHERENT_BIT                 = 0x0080,
		GL_DYNAMIC_STORAGE_BIT              = 0x0100,
		GL_CLIENT_STORAGE_BIT               = 0x0200,
		GL_CLIENT_MAPPED_BUFFER_BARRIER_BIT = 0x00004000,
		GL_BUFFER_IMMUTABLE_STORAGE         = 0x821F,
		GL_BUFFER_STORAGE_FLAGS             = 0x8220,
	}
	
	extern(System) nothrow @nogc{
		alias pglBufferStorage = void function(GLenum, GLsizeiptr, const(void)*, GLbitfield);
		alias pglNamedBufferStorageEXT = void function(GLuint, GLsizeiptr, const(void)*, GLbitfield);
	}
	
	__gshared{
		pglBufferStorage glBufferStorage;
		pglNamedBufferStorageEXT glNamedBufferStorageEXT;
	}
	
	private bool loadARBBufferStorage(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glBufferStorage, "glBufferStorage");
		
		// The previous function is required when loading GL 4.3,
		// the next one is not. Save the result of resetErrorCountGL and
		// use that for the return value.
		bool ret = resetErrorCountGL();
		if(hasExtension(contextVersion, "GL_EXT_direct_state_access ")){
			lib.bindGLSymbol(cast(void**)&glNamedBufferStorageEXT, "glNamedBufferStorageEXT");
			
			// Ignore errors.
			resetErrorCountGL();
		}
		return ret;
	}
}

//ARB_clear_texture
enum useARBClearTexture = (){
	version(GL_ARB)                    return true;
	else version(GL_ARB_clear_texture) return true;
	else return has44;
}();

bool _hasARBClearTexture = false;
bool hasARBClearTexture() nothrow @nogc @safe{ return _hasARBClearTexture; }

static if(useARBClearTexture){
	enum: uint{
		GL_CLEAR_TEXTURE = 0x9365,
	}
	
	extern(System) nothrow @nogc{
		alias pglClearTexImage = void function(GLuint, GLint, GLenum, GLenum, const(void)*);
		alias pglClearTexSubImage = void function(GLuint, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLenum, const(void)*);
	}
	
	__gshared{
		pglClearTexImage glClearTexImage;
		pglClearTexSubImage glClearTexSubImage;
	}
	
	private bool loadARBClearTexture(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glClearTexImage, "glClearTexImage");
		lib.bindGLSymbol(cast(void**)&glClearTexSubImage, "glClearTexSubImage");
		return resetErrorCountGL();
	}
}

//ARB_enhanced_layouts
enum useARBEnhancedLayouts = (){
	version(GL_ARB)                       return true;
	else version(GL_ARB_enhanced_layouts) return true;
	else return has44;
}();

bool _hasARBEnhancedLayouts = false;
bool hasARBEnhancedLayouts() nothrow @nogc @safe{ return _hasARBEnhancedLayouts; }

static if(useARBEnhancedLayouts){
	enum: uint{
		GL_LOCATION_COMPONENT               = 0x934A,
		GL_TRANSFORM_FEEDBACK_BUFFER_INDEX  = 0x934B,
		GL_TRANSFORM_FEEDBACK_BUFFER_STRIDE = 0x934C,
	}
}

//ARB_multi_bind
enum useARBMultBind = (){
	version(GL_ARB)                 return true;
	else version(GL_ARB_multi_bind) return true;
	else return has44;
}();

bool _hasARBMultBind = false;
bool hasARBMultBind() nothrow @nogc @safe{ return _hasARBMultBind; }

static if(useARBMultBind){
	extern(System) nothrow @nogc{
		alias pglBindBuffersBase = void function(GLenum, GLuint, GLsizei, const(GLuint)*);
		alias pglBindBuffersRange = void function(GLenum, GLuint, GLsizei, const(GLuint)*, const(GLintptr)*, const(GLsizeiptr)*);
		alias pglBindTextures = void function(GLuint, GLsizei, const(GLuint)*);
		alias pglBindSamplers = void function(GLuint, GLsizei, const(GLuint)*);
		alias pglBindImageTextures = void function(GLuint, GLsizei, const(GLuint)*);
		alias pglBindVertexBuffers = void function(GLuint, GLsizei, const(GLuint)*, const(GLintptr)*, const(GLsizei)*);
	}
	
	__gshared{
		pglBindBuffersBase glBindBuffersBase;
		pglBindBuffersRange glBindBuffersRange;
		pglBindTextures glBindTextures;
		pglBindSamplers glBindSamplers;
		pglBindImageTextures glBindImageTextures;
		pglBindVertexBuffers glBindVertexBuffers;
	}
	
	private bool loadARBMultBind(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glBindBuffersBase, "glBindBuffersBase");
		lib.bindGLSymbol(cast(void**)&glBindBuffersRange, "glBindBuffersRange");
		lib.bindGLSymbol(cast(void**)&glBindTextures, "glBindTextures");
		lib.bindGLSymbol(cast(void**)&glBindSamplers, "glBindSamplers");
		lib.bindGLSymbol(cast(void**)&glBindImageTextures, "glBindImageTextures");
		lib.bindGLSymbol(cast(void**)&glBindVertexBuffers, "glBindVertexBuffers");
		return resetErrorCountGL();
	}
}

//ARB_query_buffer_object
enum useARBQueryBufferObject = (){
	version(GL_ARB)                          return true;
	else version(GL_ARB_query_buffer_object) return true;
	else return has44;
}();

bool _hasARBQueryBufferObject = false;
bool hasARBQueryBufferObject() nothrow @nogc @safe{ return _hasARBQueryBufferObject; }

static if(useARBQueryBufferObject){
	enum: uint{
		GL_QUERY_BUFFER             = 0x9192,
		GL_QUERY_BUFFER_BARRIER_BIT = 0x00008000,
		GL_QUERY_BUFFER_BINDING     = 0x9193,
		GL_QUERY_RESULT_NO_WAIT     = 0x9194,
	}
}

//ARB_texture_mirror_clamp_to_edge
enum useARBTextureMirrorClampToEdge = (){
	version(GL_ARB)                                   return true;
	else version(GL_ARB_texture_mirror_clamp_to_edge) return true;
	else return has44;
}();

bool _hasARBTextureMirrorClampToEdge = false;
bool hasARBTextureMirrorClampToEdge() nothrow @nogc @safe{ return _hasARBTextureMirrorClampToEdge; }

static if(useARBTextureMirrorClampToEdge){
	enum: uint{
		GL_MIRROR_CLAMP_TO_EDGE = 0x8743,
	}
}

package(bindbc.opengl) bool loadARB44(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
	static if(has44){
		if(contextVersion >= GLSupport.gl44){
			_hasARBEnhancedLayouts = true;
			_hasARBQueryBufferObject = true;
			_hasARBTextureMirrorClampToEdge = true;
			
			bool ret = true;
			ret = _hasARBBufferStorage = lib.loadARBBufferStorage(contextVersion);
			ret = _hasARBClearTexture = lib.loadARBClearTexture(contextVersion);
			ret = _hasARBMultBind = lib.loadARBMultBind(contextVersion);
			return ret;
		}
	}
	
	static if(useARBEnhancedLayouts)
		_hasARBEnhancedLayouts =
			hasExtension(contextVersion, "GL_ARB_enhanced_layouts");
	
	static if(useARBQueryBufferObject)
		_hasARBQueryBufferObject =
			hasExtension(contextVersion, "GL_ARB_query_buffer_object");
	
	static if(useARBTextureMirrorClampToEdge)
		_hasARBTextureMirrorClampToEdge =
			hasExtension(contextVersion, "GL_ARB_texture_mirror_clamp_to_edge");
	
	static if(useARBBufferStorage)
		_hasARBBufferStorage =
			hasExtension(contextVersion, "GL_ARB_buffer_storage") &&
			lib.loadARBBufferStorage(contextVersion);
	
	static if(useARBClearTexture)
		_hasARBClearTexture =
			hasExtension(contextVersion, "GL_ARB_clear_texture") &&
			lib.loadARBClearTexture(contextVersion);
	
	static if(useARBMultBind)
		_hasARBMultBind =
			hasExtension(contextVersion, "GL_ARB_multi_bind") &&
			lib.loadARBMultBind(contextVersion);
	
	return true;
}
