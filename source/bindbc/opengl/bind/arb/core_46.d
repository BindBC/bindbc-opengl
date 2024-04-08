/+
+            Copyright 2022 – 2024 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opengl.bind.arb.core_46;

import bindbc.loader;
import bindbc.opengl.config, bindbc.opengl.context, bindbc.opengl.bind.types;

enum has46 = glSupport >= GLSupport.gl46;

//ARB_polygon_offset_clamp
enum useARBPolygonOffsetClamp = (){
	version(GL_ARB)                           return true;
	else version(GL_ARB_polygon_offset_clamp) return true;
	else return has46;
}();

bool _hasARBPolygonOffsetClamp = false;
bool hasARBPolygonOffsetClamp() nothrow @nogc @safe{ return _hasARBPolygonOffsetClamp; }

static if(useARBPolygonOffsetClamp){
	enum: uint{
		GL_POLYGON_OFFSET_CLAMP = 0x8E1B,
	}
	
	extern(System) nothrow @nogc{
		alias pglPolygonOffsetClamp = void function(GLfloat, GLfloat, GLfloat);
	}
	
	__gshared{
		pglPolygonOffsetClamp glPolygonOffsetClamp;
	}
	
	private bool loadARBPolygonOffsetClamp(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glPolygonOffsetClamp, "glPolygonOffsetClamp");
		return resetErrorCountGL;
	}
}

//ARB_texture_filter_anisotropic
enum useARBTextureFilterAnisotropic = (){
	version(GL_ARB)                                 return true;
	else version(GL_ARB_texture_filter_anisotropic) return true;
	else return has46;
}();

bool _hasARBTextureFilterAnisotropic = false;
bool hasARBTextureFilterAnisotropic() nothrow @nogc @safe{ return _hasARBTextureFilterAnisotropic; }

static if(useARBTextureFilterAnisotropic){
	enum: uint{
		GL_TEXTURE_MAX_ANISOTROPY     = 0x84FE,
		GL_MAX_TEXTURE_MAX_ANISOTROPY = 0x84FF,
	}
}

package(bindbc.opengl) bool loadARB46(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
	static if(has46){
		if(contextVersion >= GLSupport.gl46){
			_hasARBTextureFilterAnisotropic = true;
			
			bool ret = true;
			ret = _hasARBPolygonOffsetClamp = lib.loadARBPolygonOffsetClamp(contextVersion);
			return ret;
		}
	}
	
	static if(useARBTextureFilterAnisotropic)
		_hasARBTextureFilterAnisotropic =
			hasExtension(contextVersion, "GL_ARB_texture_filter_anisotropic");
	
	static if(useARBPolygonOffsetClamp)
		_hasARBPolygonOffsetClamp =
			hasExtension(contextVersion, "GL_ARB_polygon_offset_clamp") &&
			lib.loadARBPolygonOffsetClamp(contextVersion);
	
	return true;
}
