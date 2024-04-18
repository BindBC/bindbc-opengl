/+
+            Copyright 2022 – 2024 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opengl.bind.arb.core_45;

import bindbc.loader;
import bindbc.opengl.config, bindbc.opengl.context, bindbc.opengl.bind.types;

enum has45 = glSupport >= GLSupport.gl45;

//ARB_clip_control
enum useARBClipControl = (){
	version(GL_ARB)                   return true;
	else version(GL_ARB_clip_control) return true;
	else return has45;
}();

bool _hasARBClipControl = false;
bool hasARBClipControl() nothrow @nogc @safe{ return _hasARBClipControl; }

static if(useARBClipControl){
	enum: uint{
		GL_NEGATIVE_ONE_TO_ONE = 0x935E,
		GL_ZERO_TO_ONE         = 0x935F,
		GL_CLIP_ORIGIN         = 0x935C,
		GL_CLIP_DEPTH_MODE     = 0x935D,
	}
	
	extern(System) nothrow @nogc{
		alias pglClipControl = void function(GLenum, GLenum);
	}
	
	__gshared{
		pglClipControl glClipControl;
	}
	
	private bool loadARBClipControl(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glClipControl, "glClipControl");
		return resetErrorCountGL;
	}
}

//ARB_conditional_render_inverted
enum useARBConditionalRenderInverted = (){
	version(GL_ARB)                                  return true;
	else version(GL_ARB_conditional_render_inverted) return true;
	else return has45;
}();

bool _hasARBConditionalRenderInverted = false;
bool hasARBConditionalRenderInverted() nothrow @nogc @safe{ return _hasARBConditionalRenderInverted; }

static if(useARBConditionalRenderInverted){
	enum: uint{
		GL_QUERY_WAIT_INVERTED              = 0x8E17,
		GL_QUERY_NO_WAIT_INVERTED           = 0x8E18,
		GL_QUERY_BY_REGION_WAIT_INVERTED    = 0x8E19,
		GL_QUERY_BY_REGION_NO_WAIT_INVERTED = 0x8E1A,
	}
}

//ARB_cull_distance
enum useARBCullDistance = (){
	version(GL_ARB)                    return true;
	else version(GL_ARB_cull_distance) return true;
	else return has45;
}();

bool _hasARBCullDistance = false;
bool hasARBCullDistance() nothrow @nogc @safe{ return _hasARBCullDistance; }

static if(useARBCullDistance){
	enum: uint{
		GL_MAX_CULL_DISTANCES                   = 0x82F9,
		GL_MAX_COMBINED_CLIP_AND_CULL_DISTANCES = 0x82FA,
	}
}

//ARB_direct_state_access
enum useARBDirectStateAccess = (){
	version(GL_ARB)                          return true;
	else version(GL_ARB_direct_state_access) return true;
	else return has45;
}();

bool _hasARBDirectStateAccess = false;
bool hasARBDirectStateAccess() nothrow @nogc @safe{ return _hasARBDirectStateAccess; }

static if(useARBDirectStateAccess){
	enum: uint{
		GL_TEXTURE_TARGET = 0x1006,
		GL_QUERY_TARGET   = 0x82EA,
	}
	
	extern(System) nothrow @nogc{
		alias pglCreateTransformFeedbacks = void function(GLsizei, GLuint*);
		alias pglTransformFeedbackBufferBase = void function(GLsizei, GLuint, GLuint);
		alias pglTransformFeedbackBufferRange = void function(GLuint, GLuint, GLuint, GLintptr, GLsizei);
		alias pglGetTransformFeedbackiv = void function(GLuint, GLenum, GLint*);
		alias pglGetTransformFeedbacki_v = void function(GLuint, GLenum, GLuint, GLint*);
		alias pglGetTransformFeedbacki64_v = void function(GLuint, GLenum, GLuint, GLint64*);
		alias pglCreateBuffers = void function(GLsizei, GLuint*);
		alias pglNamedBufferStorage = void function(GLuint, GLsizeiptr, const(void)*, GLbitfield);
		alias pglNamedBufferData = void function(GLuint, GLsizeiptr, const(void)*, GLenum);
		alias pglNamedBufferSubData = void function(GLuint, GLintptr, GLsizeiptr, const(void)*);
		alias pglCopyNamedBufferSubData = void function(GLuint, GLuint, GLintptr, GLintptr, GLsizeiptr);
		alias pglClearNamedBufferData = void function(GLuint, GLenum, GLenum, GLenum, const(void)*);
		alias pglClearNamedBufferSubData = void function(GLuint, GLenum, GLintptr, GLsizeiptr, GLenum, GLenum, const(void)*);
		alias pglMapNamedBuffer = void* function(GLuint, GLenum);
		alias pglMapNamedBufferRange = void* function(GLuint, GLintptr, GLsizeiptr, GLbitfield);
		alias pglUnmapNamedBuffer = GLboolean function(GLuint);
		alias pglFlushMappedNamedBufferRange = void function(GLuint, GLintptr, GLsizeiptr);
		alias pglGetNamedBufferParameteriv = void function(GLuint, GLenum, GLint*);
		alias pglGetNamedBufferParameteri64v = void function(GLuint, GLenum, GLint64*);
		alias pglGetNamedBufferPointerv = void function(GLuint, GLenum, void**);
		alias pglGetNamedBufferSubData = void function(GLuint, GLintptr, GLsizeiptr, void*);
		alias pglCreateFramebuffers = void function(GLsizei, GLuint*);
		alias pglNamedFramebufferRenderbuffer = void function(GLuint, GLenum, GLenum, GLuint);
		alias pglNamedFramebufferParameteri = void function(GLuint, GLenum, GLint);
		alias pglNamedFramebufferTexture = void function(GLuint, GLenum, GLuint, GLint);
		alias pglNamedFramebufferTextureLayer = void function(GLuint, GLenum, GLuint, GLint, GLint);
		alias pglNamedFramebufferDrawBuffer = void function(GLuint, GLenum);
		alias pglNamedFramebufferDrawBuffers = void function(GLuint, GLsizei, const(GLenum)*);
		alias pglNamedFramebufferReadBuffer = void function(GLuint, GLenum);
		alias pglInvalidateNamedFramebufferData = void function(GLuint, GLsizei, const(GLenum)*);
		alias pglInvalidateNamedFramebufferSubData = void function(GLuint, GLsizei, const(GLenum)*, GLint, GLint, GLsizei, GLsizei);
		alias pglClearNamedFramebufferiv = void function(GLuint, GLenum, GLint, const(GLint)*);
		alias pglClearNamedFramebufferuiv = void function(GLuint, GLenum, GLint, const(GLuint)*);
		alias pglClearNamedFramebufferfv = void function(GLuint, GLenum, GLint, const(GLfloat)*);
		alias pglClearNamedFramebufferfi = void function(GLuint, GLenum, GLint, GLfloat, GLint);
		alias pglBlitNamedFramebuffer = void function(GLuint, GLuint, GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLbitfield, GLenum);
		alias pglCheckNamedFramebufferStatus = GLenum function(GLuint, GLenum);
		alias pglGetNamedFramebufferParameteriv = void function(GLuint, GLenum, GLint*);
		alias pglGetNamedFramebufferAttachmentParameteriv = void function(GLuint, GLenum, GLenum, GLint*);
		alias pglCreateRenderbuffers = void function(GLsizei, GLuint*);
		alias pglNamedRenderbufferStorage = void function(GLuint, GLenum, GLsizei, GLsizei);
		alias pglNamedRenderbufferStorageMultisample = void function(GLuint, GLsizei, GLenum, GLsizei, GLsizei);
		alias pglGetNamedRenderbufferParameteriv = void function(GLuint, GLenum, GLint*);
		alias pglCreateTextures = void function(GLenum, GLsizei, GLuint*);
		alias pglTextureBuffer = void function(GLuint, GLenum, GLuint);
		alias pglTextureBufferRange = void function(GLuint, GLenum, GLuint, GLintptr, GLsizeiptr);
		alias pglTextureStorage1D = void function(GLuint, GLsizei, GLenum, GLsizei);
		alias pglTextureStorage2D = void function(GLuint, GLsizei, GLenum, GLsizei, GLsizei);
		alias pglTextureStorage3D = void function(GLuint, GLsizei, GLenum, GLsizei, GLsizei, GLsizei);
		alias pglTextureStorage2DMultisample = void function(GLuint, GLsizei, GLenum, GLsizei, GLsizei, GLboolean);
		alias pglTextureStorage3DMultisample = void function(GLuint, GLsizei, GLenum, GLsizei, GLsizei, GLsizei, GLboolean);
		alias pglTextureSubImage1D = void function(GLuint, GLint, GLint, GLsizei, GLenum, GLenum, const(void)*);
		alias pglTextureSubImage2D = void function(GLuint, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, const(void)*);
		alias pglTextureSubImage3D = void function(GLuint, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLenum, const(void)*);
		alias pglCompressedTextureSubImage1D = void function(GLuint, GLint, GLint, GLsizei, GLenum, GLsizei, const(void)*);
		alias pglCompressedTextureSubImage2D = void function(GLuint, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLsizei, const(void)*);
		alias pglCompressedTextureSubImage3D = void function(GLuint, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLsizei, const(void)*);
		alias pglCopyTextureSubImage1D = void function(GLuint, GLint, GLint, GLint, GLint, GLsizei);
		alias pglCopyTextureSubImage2D = void function(GLuint, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei);
		alias pglCopyTextureSubImage3D = void function(GLuint, GLint, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei);
		alias pglTextureParameterf = void function(GLuint, GLenum, GLfloat);
		alias pglTextureParameterfv = void function(GLuint, GLenum, const(GLfloat)*);
		alias pglTextureParameteri = void function(GLuint, GLenum, GLint);
		alias pglTextureParameterIiv = void function(GLuint, GLenum, const(GLint)*);
		alias pglTextureParameterIuiv = void function(GLuint, GLenum, const(GLuint)*);
		alias pglTextureParameteriv = void function(GLuint, GLenum, const(GLint)*);
		alias pglGenerateTextureMipmap = void function(GLuint);
		alias pglBindTextureUnit = void function(GLuint, GLuint);
		alias pglGetTextureImage = void function(GLuint, GLint, GLenum, GLenum, GLsizei, void*);
		alias pglGetCompressedTextureImage = void function(GLuint, GLint, GLsizei, void*);
		alias pglGetTextureLevelParameterfv = void function(GLuint, GLint, GLenum, GLfloat*);
		alias pglGetTextureLevelParameteriv = void function(GLuint, GLint, GLenum, GLint*);
		alias pglGetTextureParameterfv = void function(GLuint, GLenum, GLfloat*);
		alias pglGetTextureParameterIiv = void function(GLuint, GLenum, GLint*);
		alias pglGetTextureParameterIuiv = void function(GLuint, GLenum, GLuint*);
		alias pglGetTextureParameteriv = void function(GLuint, GLenum, GLint*);
		alias pglCreateVertexArrays = void function(GLsizei, GLuint*);
		alias pglDisableVertexArrayAttrib = void function(GLuint, GLuint);
		alias pglEnableVertexArrayAttrib = void function(GLuint, GLuint);
		alias pglVertexArrayElementBuffer = void function(GLuint, GLuint);
		alias pglVertexArrayVertexBuffer = void function(GLuint, GLuint, GLuint, GLintptr, GLsizei);
		alias pglVertexArrayVertexBuffers = void function(GLuint, GLuint, GLsizei, const(GLuint)*, const(GLintptr)*, const(GLsizei)*);
		alias pglVertexArrayAttribFormat = void function(GLuint, GLuint, GLint, GLenum, GLboolean, GLuint);
		alias pglVertexArrayAttribIFormat = void function(GLuint, GLuint, GLint, GLenum, GLuint);
		alias pglVertexArrayAttribLFormat = void function(GLuint, GLuint, GLint, GLenum, GLuint);
		alias pglVertexArrayAttribBinding = void function(GLuint, GLuint, GLuint);
		alias pglVertexArrayBindingDivisor = void function(GLuint, GLuint, GLuint);
		alias pglGetVertexArrayiv = void function(GLuint, GLenum, GLint*);
		alias pglGetVertexArrayIndexediv = void function(GLuint, GLuint, GLenum, GLint*);
		alias pglGetVertexArrayIndexed64iv = void function(GLuint, GLuint, GLenum, GLint64*);
		alias pglCreateSamplers = void function(GLsizei, GLuint*);
		alias pglCreateProgramPipelines = void function(GLsizei, GLuint*);
		alias pglCreateQueries = void function(GLenum, GLsizei, GLuint*);
		alias pglGetQueryBufferObjectiv = void function(GLuint, GLuint, GLenum, GLintptr);
		alias pglGetQueryBufferObjectuiv = void function(GLuint, GLuint, GLenum, GLintptr);
		alias pglGetQueryBufferObjecti64v = void function(GLuint, GLuint, GLenum, GLintptr);
		alias pglGetQueryBufferObjectui64v = void function(GLuint, GLuint, GLenum, GLintptr);
	}
	
	__gshared{
		pglCreateTransformFeedbacks glCreateTransformFeedbacks;
		pglTransformFeedbackBufferBase glTransformFeedbackBufferBase;
		pglTransformFeedbackBufferRange glTransformFeedbackBufferRange;
		pglGetTransformFeedbackiv glGetTransformFeedbackiv;
		pglGetTransformFeedbacki_v glGetTransformFeedbacki_v;
		pglGetTransformFeedbacki64_v glGetTransformFeedbacki64_v;
		pglCreateBuffers glCreateBuffers;
		pglNamedBufferStorage glNamedBufferStorage;
		pglNamedBufferData glNamedBufferData;
		pglNamedBufferSubData glNamedBufferSubData;
		pglCopyNamedBufferSubData glCopyNamedBufferSubData;
		pglClearNamedBufferData glClearNamedBufferData;
		pglClearNamedBufferSubData glClearNamedBufferSubData;
		pglMapNamedBuffer glMapNamedBuffer;
		pglMapNamedBufferRange glMapNamedBufferRange;
		pglUnmapNamedBuffer glUnmapNamedBuffer;
		pglFlushMappedNamedBufferRange glFlushMappedNamedBufferRange;
		pglGetNamedBufferParameteriv glGetNamedBufferParameteriv;
		pglGetNamedBufferParameteri64v glGetNamedBufferParameteri64v;
		pglGetNamedBufferPointerv glGetNamedBufferPointerv;
		pglGetNamedBufferSubData glGetNamedBufferSubData;
		pglCreateFramebuffers glCreateFramebuffers;
		pglNamedFramebufferRenderbuffer glNamedFramebufferRenderbuffer;
		pglNamedFramebufferParameteri glNamedFramebufferParameteri;
		pglNamedFramebufferTexture glNamedFramebufferTexture;
		pglNamedFramebufferTextureLayer glNamedFramebufferTextureLayer;
		pglNamedFramebufferDrawBuffer glNamedFramebufferDrawBuffer;
		pglNamedFramebufferDrawBuffers glNamedFramebufferDrawBuffers;
		pglNamedFramebufferReadBuffer glNamedFramebufferReadBuffer;
		pglInvalidateNamedFramebufferData glInvalidateNamedFramebufferData;
		pglInvalidateNamedFramebufferSubData glInvalidateNamedFramebufferSubData;
		pglClearNamedFramebufferiv glClearNamedFramebufferiv;
		pglClearNamedFramebufferuiv glClearNamedFramebufferuiv;
		pglClearNamedFramebufferfv glClearNamedFramebufferfv;
		pglClearNamedFramebufferfi glClearNamedFramebufferfi;
		pglBlitNamedFramebuffer glBlitNamedFramebuffer;
		pglCheckNamedFramebufferStatus glCheckNamedFramebufferStatus;
		pglGetNamedFramebufferParameteriv glGetNamedFramebufferParameteriv;
		pglGetNamedFramebufferAttachmentParameteriv glGetNamedFramebufferAttachmentParameteriv;
		pglCreateRenderbuffers glCreateRenderbuffers;
		pglNamedRenderbufferStorage glNamedRenderbufferStorage;
		pglNamedRenderbufferStorageMultisample glNamedRenderbufferStorageMultisample;
		pglGetNamedRenderbufferParameteriv glGetNamedRenderbufferParameteriv;
		pglCreateTextures glCreateTextures;
		pglTextureBuffer glTextureBuffer;
		pglTextureBufferRange glTextureBufferRange;
		pglTextureStorage1D glTextureStorage1D;
		pglTextureStorage2D glTextureStorage2D;
		pglTextureStorage3D glTextureStorage3D;
		pglTextureStorage2DMultisample glTextureStorage2DMultisample;
		pglTextureStorage3DMultisample glTextureStorage3DMultisample;
		pglTextureSubImage1D glTextureSubImage1D;
		pglTextureSubImage2D glTextureSubImage2D;
		pglTextureSubImage3D glTextureSubImage3D;
		pglCompressedTextureSubImage1D glCompressedTextureSubImage1D;
		pglCompressedTextureSubImage2D glCompressedTextureSubImage2D;
		pglCompressedTextureSubImage3D glCompressedTextureSubImage3D;
		pglCopyTextureSubImage1D glCopyTextureSubImage1D;
		pglCopyTextureSubImage2D glCopyTextureSubImage2D;
		pglCopyTextureSubImage3D glCopyTextureSubImage3D;
		pglTextureParameterf glTextureParameterf;
		pglTextureParameterfv glTextureParameterfv;
		pglTextureParameteri glTextureParameteri;
		pglTextureParameterIiv glTextureParameterIiv;
		pglTextureParameterIuiv glTextureParameterIuiv;
		pglTextureParameteriv glTextureParameteriv;
		pglGenerateTextureMipmap glGenerateTextureMipmap;
		pglBindTextureUnit glBindTextureUnit;
		pglGetTextureImage glGetTextureImage;
		pglGetCompressedTextureImage glGetCompressedTextureImage;
		pglGetTextureLevelParameterfv glGetTextureLevelParameterfv;
		pglGetTextureLevelParameteriv glGetTextureLevelParameteriv;
		pglGetTextureParameterfv glGetTextureParameterfv;
		pglGetTextureParameterIiv glGetTextureParameterIiv;
		pglGetTextureParameterIuiv glGetTextureParameterIuiv;
		pglGetTextureParameteriv glGetTextureParameteriv;
		pglCreateVertexArrays glCreateVertexArrays;
		pglDisableVertexArrayAttrib glDisableVertexArrayAttrib;
		pglEnableVertexArrayAttrib glEnableVertexArrayAttrib;
		pglVertexArrayElementBuffer glVertexArrayElementBuffer;
		pglVertexArrayVertexBuffer glVertexArrayVertexBuffer;
		pglVertexArrayVertexBuffers glVertexArrayVertexBuffers;
		pglVertexArrayAttribBinding glVertexArrayAttribBinding;
		pglVertexArrayAttribFormat glVertexArrayAttribFormat;
		pglVertexArrayAttribIFormat glVertexArrayAttribIFormat;
		pglVertexArrayAttribLFormat glVertexArrayAttribLFormat;
		pglVertexArrayBindingDivisor glVertexArrayBindingDivisor;
		pglGetVertexArrayiv glGetVertexArrayiv;
		pglGetVertexArrayIndexediv glGetVertexArrayIndexediv;
		pglGetVertexArrayIndexed64iv glGetVertexArrayIndexed64iv;
		pglCreateSamplers glCreateSamplers;
		pglCreateProgramPipelines glCreateProgramPipelines;
		pglCreateQueries glCreateQueries;
		pglGetQueryBufferObjecti64v glGetQueryBufferObjecti64v;
		pglGetQueryBufferObjectiv glGetQueryBufferObjectiv;
		pglGetQueryBufferObjectui64v glGetQueryBufferObjectui64v;
		pglGetQueryBufferObjectuiv glGetQueryBufferObjectuiv;
	}
	
	private bool loadARBDirectStateAccess(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glCreateTransformFeedbacks, "glCreateTransformFeedbacks");
		lib.bindGLSymbol(cast(void**)&glTransformFeedbackBufferBase, "glTransformFeedbackBufferBase");
		lib.bindGLSymbol(cast(void**)&glTransformFeedbackBufferRange, "glTransformFeedbackBufferRange");
		lib.bindGLSymbol(cast(void**)&glGetTransformFeedbackiv, "glGetTransformFeedbackiv");
		lib.bindGLSymbol(cast(void**)&glGetTransformFeedbacki_v, "glGetTransformFeedbacki_v");
		lib.bindGLSymbol(cast(void**)&glGetTransformFeedbacki64_v, "glGetTransformFeedbacki64_v");
		lib.bindGLSymbol(cast(void**)&glCreateBuffers, "glCreateBuffers");
		lib.bindGLSymbol(cast(void**)&glNamedBufferStorage, "glNamedBufferStorage");
		lib.bindGLSymbol(cast(void**)&glNamedBufferData, "glNamedBufferData");
		lib.bindGLSymbol(cast(void**)&glNamedBufferSubData, "glNamedBufferSubData");
		lib.bindGLSymbol(cast(void**)&glCopyNamedBufferSubData, "glCopyNamedBufferSubData");
		lib.bindGLSymbol(cast(void**)&glClearNamedBufferData, "glClearNamedBufferData");
		lib.bindGLSymbol(cast(void**)&glClearNamedBufferSubData, "glClearNamedBufferSubData");
		lib.bindGLSymbol(cast(void**)&glMapNamedBuffer, "glMapNamedBuffer");
		lib.bindGLSymbol(cast(void**)&glMapNamedBufferRange, "glMapNamedBufferRange");
		lib.bindGLSymbol(cast(void**)&glUnmapNamedBuffer, "glUnmapNamedBuffer");
		lib.bindGLSymbol(cast(void**)&glFlushMappedNamedBufferRange, "glFlushMappedNamedBufferRange");
		lib.bindGLSymbol(cast(void**)&glGetNamedBufferParameteriv, "glGetNamedBufferParameteriv");
		lib.bindGLSymbol(cast(void**)&glGetNamedBufferParameteri64v, "glGetNamedBufferParameteri64v");
		lib.bindGLSymbol(cast(void**)&glGetNamedBufferPointerv, "glGetNamedBufferPointerv");
		lib.bindGLSymbol(cast(void**)&glGetNamedBufferSubData, "glGetNamedBufferSubData");
		lib.bindGLSymbol(cast(void**)&glCreateFramebuffers, "glCreateFramebuffers");
		lib.bindGLSymbol(cast(void**)&glNamedFramebufferRenderbuffer, "glNamedFramebufferRenderbuffer");
		lib.bindGLSymbol(cast(void**)&glNamedFramebufferParameteri, "glNamedFramebufferParameteri");
		lib.bindGLSymbol(cast(void**)&glNamedFramebufferTexture, "glNamedFramebufferTexture");
		lib.bindGLSymbol(cast(void**)&glNamedFramebufferTextureLayer, "glNamedFramebufferTextureLayer");
		lib.bindGLSymbol(cast(void**)&glNamedFramebufferDrawBuffer, "glNamedFramebufferDrawBuffer");
		lib.bindGLSymbol(cast(void**)&glNamedFramebufferDrawBuffers, "glNamedFramebufferDrawBuffers");
		lib.bindGLSymbol(cast(void**)&glNamedFramebufferReadBuffer, "glNamedFramebufferReadBuffer");
		lib.bindGLSymbol(cast(void**)&glInvalidateNamedFramebufferData, "glInvalidateNamedFramebufferData");
		lib.bindGLSymbol(cast(void**)&glInvalidateNamedFramebufferSubData, "glInvalidateNamedFramebufferSubData");
		lib.bindGLSymbol(cast(void**)&glClearNamedFramebufferiv, "glClearNamedFramebufferiv");
		lib.bindGLSymbol(cast(void**)&glClearNamedFramebufferuiv, "glClearNamedFramebufferuiv");
		lib.bindGLSymbol(cast(void**)&glClearNamedFramebufferfv, "glClearNamedFramebufferfv");
		lib.bindGLSymbol(cast(void**)&glClearNamedFramebufferfi, "glClearNamedFramebufferfi");
		lib.bindGLSymbol(cast(void**)&glBlitNamedFramebuffer, "glBlitNamedFramebuffer");
		lib.bindGLSymbol(cast(void**)&glCheckNamedFramebufferStatus, "glCheckNamedFramebufferStatus");
		lib.bindGLSymbol(cast(void**)&glGetNamedFramebufferParameteriv, "glGetNamedFramebufferParameteriv");
		lib.bindGLSymbol(cast(void**)&glGetNamedFramebufferAttachmentParameteriv, "glGetNamedFramebufferAttachmentParameteriv");
		lib.bindGLSymbol(cast(void**)&glCreateRenderbuffers, "glCreateRenderbuffers");
		lib.bindGLSymbol(cast(void**)&glNamedRenderbufferStorage, "glNamedRenderbufferStorage");
		lib.bindGLSymbol(cast(void**)&glNamedRenderbufferStorageMultisample, "glNamedRenderbufferStorageMultisample");
		lib.bindGLSymbol(cast(void**)&glGetNamedRenderbufferParameteriv, "glGetNamedRenderbufferParameteriv");
		lib.bindGLSymbol(cast(void**)&glCreateTextures, "glCreateTextures");
		lib.bindGLSymbol(cast(void**)&glTextureBuffer, "glTextureBuffer");
		lib.bindGLSymbol(cast(void**)&glTextureBufferRange, "glTextureBufferRange");
		lib.bindGLSymbol(cast(void**)&glTextureStorage1D, "glTextureStorage1D");
		lib.bindGLSymbol(cast(void**)&glTextureStorage2D, "glTextureStorage2D");
		lib.bindGLSymbol(cast(void**)&glTextureStorage3D, "glTextureStorage3D");
		lib.bindGLSymbol(cast(void**)&glTextureStorage2DMultisample, "glTextureStorage2DMultisample");
		lib.bindGLSymbol(cast(void**)&glTextureStorage3DMultisample, "glTextureStorage3DMultisample");
		lib.bindGLSymbol(cast(void**)&glTextureSubImage1D, "glTextureSubImage1D");
		lib.bindGLSymbol(cast(void**)&glTextureSubImage2D, "glTextureSubImage2D");
		lib.bindGLSymbol(cast(void**)&glTextureSubImage3D, "glTextureSubImage3D");
		lib.bindGLSymbol(cast(void**)&glCompressedTextureSubImage1D, "glCompressedTextureSubImage1D");
		lib.bindGLSymbol(cast(void**)&glCompressedTextureSubImage2D, "glCompressedTextureSubImage2D");
		lib.bindGLSymbol(cast(void**)&glCompressedTextureSubImage3D, "glCompressedTextureSubImage3D");
		lib.bindGLSymbol(cast(void**)&glCopyTextureSubImage1D, "glCopyTextureSubImage1D");
		lib.bindGLSymbol(cast(void**)&glCopyTextureSubImage2D, "glCopyTextureSubImage2D");
		lib.bindGLSymbol(cast(void**)&glCopyTextureSubImage3D, "glCopyTextureSubImage3D");
		lib.bindGLSymbol(cast(void**)&glTextureParameterf, "glTextureParameterf");
		lib.bindGLSymbol(cast(void**)&glTextureParameterfv, "glTextureParameterfv");
		lib.bindGLSymbol(cast(void**)&glTextureParameteri, "glTextureParameteri");
		lib.bindGLSymbol(cast(void**)&glTextureParameterIiv, "glTextureParameterIiv");
		lib.bindGLSymbol(cast(void**)&glTextureParameterIuiv, "glTextureParameterIuiv");
		lib.bindGLSymbol(cast(void**)&glTextureParameteriv, "glTextureParameteriv");
		lib.bindGLSymbol(cast(void**)&glGenerateTextureMipmap, "glGenerateTextureMipmap");
		lib.bindGLSymbol(cast(void**)&glBindTextureUnit, "glBindTextureUnit");
		lib.bindGLSymbol(cast(void**)&glGetTextureImage, "glGetTextureImage");
		lib.bindGLSymbol(cast(void**)&glGetCompressedTextureImage, "glGetCompressedTextureImage");
		lib.bindGLSymbol(cast(void**)&glGetTextureLevelParameterfv, "glGetTextureLevelParameterfv");
		lib.bindGLSymbol(cast(void**)&glGetTextureLevelParameteriv, "glGetTextureLevelParameteriv");
		lib.bindGLSymbol(cast(void**)&glGetTextureParameterfv, "glGetTextureParameterfv");
		lib.bindGLSymbol(cast(void**)&glGetTextureParameterIiv, "glGetTextureParameterIiv");
		lib.bindGLSymbol(cast(void**)&glGetTextureParameterIuiv, "glGetTextureParameterIuiv");
		lib.bindGLSymbol(cast(void**)&glGetTextureParameteriv, "glGetTextureParameteriv");
		lib.bindGLSymbol(cast(void**)&glCreateVertexArrays, "glCreateVertexArrays");
		lib.bindGLSymbol(cast(void**)&glDisableVertexArrayAttrib, "glDisableVertexArrayAttrib");
		lib.bindGLSymbol(cast(void**)&glEnableVertexArrayAttrib, "glEnableVertexArrayAttrib");
		lib.bindGLSymbol(cast(void**)&glVertexArrayElementBuffer, "glVertexArrayElementBuffer");
		lib.bindGLSymbol(cast(void**)&glVertexArrayVertexBuffer, "glVertexArrayVertexBuffer");
		lib.bindGLSymbol(cast(void**)&glVertexArrayVertexBuffers, "glVertexArrayVertexBuffers");
		lib.bindGLSymbol(cast(void**)&glVertexArrayAttribBinding, "glVertexArrayAttribBinding");
		lib.bindGLSymbol(cast(void**)&glVertexArrayAttribFormat, "glVertexArrayAttribFormat");
		lib.bindGLSymbol(cast(void**)&glVertexArrayAttribIFormat, "glVertexArrayAttribIFormat");
		lib.bindGLSymbol(cast(void**)&glVertexArrayAttribLFormat, "glVertexArrayAttribLFormat");
		lib.bindGLSymbol(cast(void**)&glVertexArrayBindingDivisor, "glVertexArrayBindingDivisor");
		lib.bindGLSymbol(cast(void**)&glGetVertexArrayiv, "glGetVertexArrayiv");
		lib.bindGLSymbol(cast(void**)&glGetVertexArrayIndexediv, "glGetVertexArrayIndexediv");
		lib.bindGLSymbol(cast(void**)&glGetVertexArrayIndexed64iv, "glGetVertexArrayIndexed64iv");
		lib.bindGLSymbol(cast(void**)&glCreateSamplers, "glCreateSamplers");
		lib.bindGLSymbol(cast(void**)&glCreateProgramPipelines, "glCreateProgramPipelines");
		lib.bindGLSymbol(cast(void**)&glCreateQueries, "glCreateQueries");
		lib.bindGLSymbol(cast(void**)&glGetQueryBufferObjecti64v, "glGetQueryBufferObjecti64v");
		lib.bindGLSymbol(cast(void**)&glGetQueryBufferObjectiv, "glGetQueryBufferObjectiv");
		lib.bindGLSymbol(cast(void**)&glGetQueryBufferObjectui64v, "glGetQueryBufferObjectui64v");
		lib.bindGLSymbol(cast(void**)&glGetQueryBufferObjectuiv, "glGetQueryBufferObjectuiv");
		return resetErrorCountGL();
	}
}

//ARB_ES3_1_compatibility
enum useARBES31Compatibility = (){
	version(GL_ARB)                          return true;
	else version(GL_ARB_ES3_1_compatibility) return true;
	else return has45;
}();

bool _hasARBES31Compatibility = false;
bool hasARBES31Compatibility() nothrow @nogc @safe{ return _hasARBES31Compatibility; }

static if(useARBES31Compatibility){
	extern(System) nothrow @nogc{
		alias pglMemoryBarrierByRegion = void function(GLbitfield);
	}
	
	__gshared{
		pglMemoryBarrierByRegion glMemoryBarrierByRegion;
	}
	
	private bool loadARBES31Compatibility(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glMemoryBarrierByRegion, "glMemoryBarrierByRegion");
		return resetErrorCountGL;
	}
}

//ARB_get_texture_sub_image
enum useARBGetTextureSubImage = (){
	version(GL_ARB)                            return true;
	else version(GL_ARB_get_texture_sub_image) return true;
	else return has45;
}();

bool _hasARBGetTextureSubImage = false;
bool hasARBGetTextureSubImage() nothrow @nogc @safe{ return _hasARBGetTextureSubImage; }

static if(useARBGetTextureSubImage){
	extern(System) nothrow @nogc{
		alias pglGetTextureSubImage = void function(GLuint, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLenum, GLsizei, void*);
		alias pglGetCompressedTextureSubImage = void function(GLuint, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLsizei, void*);
	}
	
	__gshared{
		pglGetTextureSubImage glGetTextureSubImage;
		pglGetCompressedTextureSubImage glGetCompressedTextureSubImage;
	}
	
	private bool loadARBGetTextureSubImage(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glGetTextureSubImage,"glGetTextureSubImage");
		lib.bindGLSymbol(cast(void**)&glGetCompressedTextureSubImage,"glGetCompressedTextureSubImage");
		return resetErrorCountGL;
	}
}

//ARB_texture_barrier
enum useARBTextureBarrier = (){
	version(GL_ARB)                      return true;
	else version(GL_ARB_texture_barrier) return true;
	else return has45;
}();

bool _hasARBTextureBarrier = false;
bool hasARBTextureBarrier() nothrow @nogc @safe{ return _hasARBTextureBarrier; }

static if(useARBTextureBarrier){
	extern(System) nothrow @nogc{
		alias pglTextureBarrier = void function();
	}
	
	__gshared{
		pglTextureBarrier glTextureBarrier;
	}
	
	private bool loadARBTextureBarrier(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glTextureBarrier, "glTextureBarrier");
		return resetErrorCountGL;
	}
}

//KHR_context_flush_control
enum useKHRContextFlushControl = (){
	version(GL_ARB)                            return true;
	else version(GL_KHR_context_flush_control) return true;
	else return has45;
}();

bool _hasKHRContextFlushControl = false;
bool hasKHRContextFlushControl() nothrow @nogc @safe{ return _hasKHRContextFlushControl; }

static if(useKHRContextFlushControl){
	enum: uint{
		GL_CONTEXT_RELEASE_BEHAVIOR       = 0x82FB,
		GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = 0x82FC,
	}
}

//KHR_robustness
enum useKHRRobustness = (){
	version(GL_ARB)                 return true;
	else version(GL_KHR_robustness) return true;
	else return has45;
}();

bool _hasKHRRobustness = false;
bool hasKHRRobustness() nothrow @nogc @safe{ return _hasKHRRobustness; }

static if(useKHRRobustness){
	enum: uint{
		GL_GUILTY_CONTEXT_RESET        = 0x8253,
		GL_INNOCENT_CONTEXT_RESET      = 0x8254,
		GL_UNKNOWN_CONTEXT_RESET       = 0x8255,
		GL_RESET_NOTIFICATION_STRATEGY = 0x8256,
		GL_LOSE_CONTEXT_ON_RESET       = 0x8252,
		GL_NO_RESET_NOTIFICATION       = 0x8261,
		GL_CONTEXT_LOST                = 0x0507,
		GL_CONTEXT_ROBUST_ACCESS       = 0x90F3,
	}
	
	extern(System) nothrow @nogc{
		alias pglGetGraphicsResetStatus = GLenum function();
		alias pglReadnPixels = void function(GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, GLsizei, void*);
		alias pglGetnUniformfv = void function(GLuint, GLint, GLsizei, GLfloat*);
		alias pglGetnUniformiv = void function(GLuint, GLint, GLsizei, GLint*);
		alias pglGetnUniformuiv = void function(GLuint, GLint, GLsizei, GLuint*);
	}
	
	__gshared{
		pglGetGraphicsResetStatus glGetGraphicsResetStatus;
		pglReadnPixels glReadnPixels;
		pglGetnUniformfv glGetnUniformfv;
		pglGetnUniformiv glGetnUniformiv;
		pglGetnUniformuiv glGetnUniformuiv;
	}
	
	private bool loadKHRRobustness(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glGetGraphicsResetStatus, "glGetGraphicsResetStatus");
		lib.bindGLSymbol(cast(void**)&glReadnPixels, "glReadnPixels");
		lib.bindGLSymbol(cast(void**)&glGetnUniformfv, "glGetnUniformfv");
		lib.bindGLSymbol(cast(void**)&glGetnUniformiv, "glGetnUniformiv");
		lib.bindGLSymbol(cast(void**)&glGetnUniformuiv, "glGetnUniformuiv");
		return resetErrorCountGL;
	}
}

package(bindbc.opengl) bool loadARB45(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
	static if(has45){
		if(contextVersion >= GLSupport.gl45){
			_hasARBConditionalRenderInverted = true;
			_hasARBCullDistance = true;
			_hasKHRContextFlushControl = true;
			
			bool ret = true;
			ret = _hasARBClipControl = lib.loadARBClipControl(contextVersion);
			ret = _hasARBDirectStateAccess = lib.loadARBDirectStateAccess(contextVersion);
			ret = _hasARBES31Compatibility = lib.loadARBES31Compatibility(contextVersion);
			ret = _hasARBGetTextureSubImage = lib.loadARBGetTextureSubImage(contextVersion);
			ret = _hasARBTextureBarrier = lib.loadARBTextureBarrier(contextVersion);
			ret = _hasKHRRobustness = lib.loadKHRRobustness(contextVersion);
			return ret;
		}
	}
	
	static if(useARBConditionalRenderInverted)
		_hasARBConditionalRenderInverted =
			hasExtension(contextVersion, "GL_ARB_conditional_render_inverted");
	
	static if(useARBCullDistance)
		_hasARBCullDistance =
			hasExtension(contextVersion, "GL_ARB_cull_distance");
	
	static if(useKHRContextFlushControl)
		_hasKHRContextFlushControl =
			hasExtension(contextVersion, "GL_KHR_context_flush_control");
	
	static if(useARBClipControl)
		_hasARBClipControl =
			hasExtension(contextVersion, "GL_ARB_clip_control") &&
			lib.loadARBClipControl(contextVersion);
	
	static if(useARBDirectStateAccess)
		_hasARBDirectStateAccess =
			hasExtension(contextVersion, "GL_ARB_direct_state_access") &&
			lib.loadARBDirectStateAccess(contextVersion);
	
	static if(useARBES31Compatibility)
		_hasARBES31Compatibility =
			hasExtension(contextVersion, "GL_ARB_ES3_1_compatibility") &&
			lib.loadARBES31Compatibility(contextVersion);
	
	static if(useARBGetTextureSubImage)
		_hasARBGetTextureSubImage =
			hasExtension(contextVersion, "GL_ARB_get_texture_sub_image") &&
			lib.loadARBGetTextureSubImage(contextVersion);
	
	static if(useARBTextureBarrier)
		_hasARBTextureBarrier =
			hasExtension(contextVersion, "GL_ARB_texture_barrier") &&
			lib.loadARBTextureBarrier(contextVersion);
	
	static if(useKHRRobustness)
		_hasKHRRobustness =
			hasExtension(contextVersion, "GL_KHR_robustness") &&
			lib.loadKHRRobustness(contextVersion);
	
	return true;
}
