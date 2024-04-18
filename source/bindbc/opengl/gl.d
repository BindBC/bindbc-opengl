/+
+            Copyright 2022 – 2024 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opengl.gl;

import bindbc.loader;
import bindbc.opengl.config, bindbc.opengl.context;

nothrow @nogc:

private{
	SharedLib lib;
	GLSupport contextVersion = GLSupport.noContext;
	GLSupport loadedVersion = GLSupport.noContext;
	GLLoadStatus[18] loadedStatus;
	@property size_t loadedStatusIndex(GLSupport ver) @safe{
		with(GLSupport) switch(ver){
			case gl11: return  0;
			case gl12: return  1;
			case gl13: return  2;
			case gl14: return  3;
			case gl15: return  4;
			case gl20: return  5;
			case gl21: return  6;
			case gl30: return  7;
			case gl31: return  8;
			case gl32: return  9;
			case gl33: return 10;
			case gl40: return 11;
			case gl41: return 12;
			case gl42: return 13;
			case gl43: return 14;
			case gl44: return 15;
			case gl45: return 16;
			case gl46: return 17;
			default: assert(0);
		}
	}
}

GLLoadStatus versionLoadedStatus(GLSupport ver) @safe{
	return loadedStatus[ver.loadedStatusIndex];
}

GLSupport openGLContextVersion() @safe{ return contextVersion; }
GLSupport loadedOpenGLVersion() @safe{ return loadedVersion; }
bool isOpenGLLoaded() @safe{ return lib != invalidHandle; }

void unloadOpenGL(){
	if(lib != invalidHandle){
		lib.unload();
		version(Posix) unloadContext();
		contextVersion = loadedVersion = GLSupport.noContext;
	}
}

GLSupport loadOpenGL(){
	version(Windows){
		const(char)[][1] libNames = [
			"OpenGL32.dll",
		];
	}else version(OSX){
		const(char)[][3] libNames = [
			"../Frameworks/OpenGL.framework/OpenGL",
			"/Library/Frameworks/OpenGL.framework/OpenGL",
			"/System/Library/Frameworks/OpenGL.framework/OpenGL",
		];
	}else version(Posix){
		const(char)[][2] libNames = [
			"libGL.so.1",
			"libGL.so",
		];
	}else static assert(0, "BindBC-OpenGL does not have library paths set up for this platform");
	
	GLSupport ret;
	foreach(name; libNames){
		ret = loadOpenGL(name.ptr);
		if(ret != GLSupport.noLibrary) break;
	}
	return ret;
}

GLSupport loadOpenGL(const(char)* libName){
	import bindbc.opengl.bind;
	
	// If the library isn't yet loaded, load it now.
	if(lib == invalidHandle){
		lib = load(libName);
		if(lib == invalidHandle){
			return GLSupport.noLibrary;
		}
	}
	
	// Before attempting to load *any* symbols, make sure a context
	// has been activated. This is only a requirement on Windows, and
	// only in specific cases, but always checking for it makes for
	// uniformity across platforms and no surprises when porting client
	// code from other platforms to Windows.
	contextVersion = getContextVersion(lib);
	if(contextVersion < GLSupport.gl11) return contextVersion;
	
	// Load the base library
	if(!lib.loadGL11()) return GLSupport.badLibrary;
	else loadedVersion = GLSupport.gl11;
	
	with(GLSupport){
		loadedStatus[gl11.loadedStatusIndex] |= GLLoadStatus.loaded;
		
		// Now load the context-dependent stuff. `glSupport` is set to OpenGL 2.1
		// by default and can't be lower. Load higher only if configured to do so.
		static foreach(ver; [
			gl12, gl13, gl14, gl15,
			gl20, gl21,
			gl30, gl31, gl32, gl33,
			gl40, gl41, gl42, gl43, gl44, gl45, gl46,
		]){
			static if(ver <= glSupport){
				//lib.loadGL30(contextVersion)
				if(mixin("lib.loadGL" ~ (cast(int)ver).stringof ~ "(contextVersion)")){
					loadedStatus[ver.loadedStatusIndex] = GLLoadStatus.loaded;
					loadedVersion = ver;
				}else{
					loadedStatus[ver.loadedStatusIndex] = GLLoadStatus.notLoaded;
				}
			}
		}
		
		// From any GL versions higher than the one loaded, load the core ARB
		// extensions.
		static foreach(ver; [
			gl30, gl31, gl32, gl33,
			gl40, gl41, gl42, gl43, gl44, gl45, gl46,
		]){
			if(ver > loadedVersion){
				//lib.loadARB30(contextVersion)
				mixin("lib.loadARB" ~ (cast(int)ver).stringof ~ "(loadedVersion);");
			}
		}
	}
	
	// Load all other supported extensions
	loadARB(lib, contextVersion);
	loadNV(lib, contextVersion);
	loadKHR(lib, contextVersion);
	
	return loadedVersion;
}

package SharedLib libGL() @safe{ return lib; }
