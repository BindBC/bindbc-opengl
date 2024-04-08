/+
+            Copyright 2022 – 2024 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opengl.context;

import bindbc.loader;
import bindbc.opengl.config;

private{
	enum: uint{
		glVersion = 0x1F02,
		glExtensions = 0x1F03,
		glNumExtensions = 0x821D,
	}
	
	extern(System) nothrow @nogc{
		alias GetString = const(char)* function(uint);
		alias GetStringi = const(char)* function(uint, uint);
		alias GetIntegerv = void function(uint, int*);
	}
	
	__gshared{
		GetString getString;
		GetStringi getStringi;
		GetIntegerv getIntegerv;
	}
	
	extern(System) nothrow @nogc{
		alias GetCurrentContext = void* function();
		alias GetProcAddress = void* function(const(char)*);
	}
	
	__gshared{
		GetCurrentContext getCurrentContext;
		GetProcAddress getProcAddress;
	}
	
	version(Windows){
		enum getCurrentContextName = "wglGetCurrentContext";
		enum getProcAddressName = "wglGetProcAddress";
	}else version(OSX){
		enum getCurrentContextName = "CGLGetCurrentContext";
	}else version(Posix){
		enum getCurrentContextName = "glXGetCurrentContext";
		enum getProcAddressName = "glXGetProcAddress";
		enum getCurrentContextNameEGL = "eglGetCurrentContext";
		enum getProcAddressNameEGL = "eglGetProcAddress";
		enum sessionTypeEnv = "XDG_SESSION_TYPE";
		
		const(char)[][2] eglNames = [
			"libEGL.so.1",
			"libEGL.so"
		];
		
		SharedLib libEGL;
	}else static assert(0, "EGL not set up for this platform.");
}

package nothrow @nogc:

version(Posix) void unloadContext(){
	version(OSX){
	}else{
		if(libEGL != invalidHandle){
			libEGL.unload();
			libEGL = invalidHandle;
		}
	}
}

GLSupport getContextVersion(SharedLib lib){
	// Lazy load the appropriate symbols for fetching the current context
	// and getting OpenGL symbols from it.
	if(getCurrentContext is null){
		bool loaded = false;
		
		// On Posix systems other than OSX, check if we're running under Wayland,
		// and load the appropriate symbols from libEGL if so.
		version(Posix){
			version(OSX){
			}else{
				import core.stdc.string: strcmp;
				import core.stdc.stdlib: getenv;
				char* sessionType = getenv(sessionTypeEnv);
				if(sessionType !is null && strcmp(sessionType, "wayland") == 0){
					if(libEGL == invalidHandle){
						foreach(libName; eglNames){
							libEGL = load(libName.ptr);
							if(libEGL != invalidHandle) break;
						}
						
						if(libEGL != invalidHandle){
							libEGL.bindSymbol(cast(void**)&getCurrentContext, getCurrentContextNameEGL);
							libEGL.bindSymbol(cast(void**)&getProcAddress, getProcAddressNameEGL);
							
							/*
							If the symbols were loaded successfully, that's not enough. For example, on Ubuntu 22.04
							using GLFW configured for X11, eglGetCurrentContext returns null, but glXGetCurrentContext
							returns a valid pointer, even though we're in a Wayland session. So here, if getCurrentContext
							returns null, then that means one of things: either no context has been created, or it was
							created through X. So only set loaded to true if getCurrentContext returns non-null. Then
							then a second attempt can be made via the glX stuff.
							*/
							if(getCurrentContext !is null && getProcAddress !is null && getCurrentContext() !is null){
								loaded = true;
							}else{
								unloadContext();
								getCurrentContext = null;
								getProcAddress = null;
							}
						}else return GLSupport.noLibrary;
					}
				}
			}
		}
		
		/*
		If loaded is false at this point, then one of four things is true:
			1. We aren't on Posix
			2. We're on Posix in an X11 session
			3. We're on Posix in a Wayland session, but the context was created through X
			4. We're on Posix in a Wayland session, but no context has been created
		*/
		if(!loaded){
			lib.bindSymbol(cast(void**)&getCurrentContext, getCurrentContextName);
			if(getCurrentContext is null) return GLSupport.badLibrary;
			
			version(OSX){
			}else{
				lib.bindSymbol(cast(void**)&getProcAddress, getProcAddressName);
				if(getProcAddress is null) return GLSupport.badLibrary;
			}
		}
	}
	
	// Check if a context is current
	if(getCurrentContext() is null) return GLSupport.noContext;
	
	// Lazy load glGetString to check the context version
	if(getString is null){
		lib.bindSymbol(cast(void**)&getString, "glGetString");
		if(getString is null) return GLSupport.badLibrary;
	}
	
	/*
	glGetString(GL_VERSION) is guaranteed to return a constant string
	of the format "[major].[minor].[build] xxxx", where xxxx is vendor-specific
	information. Here, I'm pulling two characters out of the string, the major
	and minor version numbers.
	*/
	auto verstr = getString(glVersion);
	char major = *verstr;
	char minor = *(verstr + 2);
	
	GLSupport support = GLSupport.noLibrary;
	
	switch(major){
		case '4':
			switch(minor){
				case '6': support = GLSupport.gl46; break;
				case '5': support = GLSupport.gl45; break;
				case '4': support = GLSupport.gl44; break;
				case '3': support = GLSupport.gl43; break;
				case '2': support = GLSupport.gl42; break;
				case '1': support = GLSupport.gl41; break;
				case '0': support = GLSupport.gl40; break;
				default: /* Nothing here, since it's possible for new minor
				versions of the 4.x series to be released before
				support is added. That case is handled outside
				of the switch. When no more 4.x versions are released,
				this should be changed to return GL40 by default. */
			}
			break;
		case '3':
			switch(minor){
				case '3': support = GLSupport.gl33; break;
				case '2': support = GLSupport.gl32; break;
				case '1': support = GLSupport.gl31; break;
				default:  support = GLSupport.gl30;
			}
			break;
		case '2':
			switch(minor){
				case '1': support = GLSupport.gl21; break;
				default:  support = GLSupport.gl20;
			}
			break;
		case '1':
			switch(minor){
				case '5': support = GLSupport.gl15; break;
				case '4': support = GLSupport.gl14; break;
				case '3': support = GLSupport.gl13; break;
				case '2': support = GLSupport.gl12; break;
				default:  support = GLSupport.gl11;
			}
			break;
		default:
			/* glGetString(GL_VERSION) is guaranteed to return a result of
			a specific format, so if this point is reached it is going
			to be because a major version higher than what BindBC supports
			was encountered. That case is handled outside the switch. */
	}
	
	// If support hasn't yet been set, it means the context has a higher
	// version than the binding knows about. Set to the compile-time version.
	if(support == GLSupport.noLibrary) support = glSupport;
	
	// For contexts >= 3.0, make sure glGetStringi & glGetIntegerv are avaliable.
	if(support >= GLSupport.gl30){
		lib.bindGLSymbol(cast(void**)&getStringi, "glGetStringi");
		
		// Use bindSymbol here, since it's a base function
		lib.bindSymbol(cast(void**)&getIntegerv, "glGetIntegerv");
		
		if(getStringi is null || getIntegerv is null)
			return GLSupport.badLibrary;
	}
	
	return support;
}

private uint numErrors;

package(bindbc.opengl):

uint errorCountGL() @safe{ return numErrors; }

bool resetErrorCountGL() @safe{
	if(numErrors != 0){
		numErrors = 0;
		return false;
	}
	return true;
}

void bindGLSymbol(SharedLib lib, void** ptr, const(char)* symName){
	// Use dlopen on Mac
	version(OSX){
		auto startErrorCount = errorCount();
		lib.bindSymbol(ptr, symName);
		numErrors += errorCount() - startErrorCount;
	}else{
		*ptr = getProcAddress(symName);
		if(*ptr is null) ++numErrors;
	}
}

bool hasExtension(GLSupport contextVersion, const(char)* extName){
	import core.stdc.string: strcmp, strstr, strlen;
	
	// With a modern context, use the modern approach
	if(contextVersion >= GLSupport.gl30){
		int count;
		getIntegerv(glNumExtensions, &count);
		
		const(char)* ext;
		for(int i=0; i<count; ++i){
			ext = getStringi(glExtensions, i);
			if(ext && strcmp(ext, extName) == 0) return true;
		}
	}else{ // Otherwise, use the classic approach
		auto extstr = getString(glExtensions);
		if(!extstr) return false;
		
		auto len = strlen(extName);
		auto ext = strstr(extstr, extName);
		while(ext){
			/* It's possible that the extension name is actually a substring of
			another extension. If not, then the character following the name in
			the extension string should be a space (or possibly the null character). */
			if(ext[len] == ' ' || ext[len] == '\0') return true;
			ext = strstr(ext + len, extName);
		}
	}
	
	return false;
}
