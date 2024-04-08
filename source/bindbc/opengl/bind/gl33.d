/+
+            Copyright 2022 – 2024 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opengl.bind.gl33;

import bindbc.opengl.config;

static if(glSupport >= GLSupport.gl33):
import bindbc.loader: SharedLib;
import bindbc.opengl.context, bindbc.opengl.bind.types;

enum: uint{
	GL_VERTEX_ATTRIB_ARRAY_DIVISOR = 0x88FE,
}

extern(System) nothrow @nogc{
	alias da_glVertexAttribDivisor = void function(GLuint, GLuint);
}

__gshared{
	da_glVertexAttribDivisor glVertexAttribDivisor;
}

package(bindbc.opengl) bool loadGL33(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
	import bindbc.opengl.bind.arb: loadARB33;
	
	if(contextVersion >= GLSupport.gl33){
		lib.bindGLSymbol(cast(void**)&glVertexAttribDivisor, "glVertexAttribDivisor");
		if(errorCountGL() == 0 && loadARB33(lib, contextVersion)) return true;
	}
	return false;
}
