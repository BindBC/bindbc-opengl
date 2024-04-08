/+
+            Copyright 2022 – 2024 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opengl.bind.gl44;

import bindbc.opengl.config;

static if(glSupport >= GLSupport.gl44):
import bindbc.loader: SharedLib;
import bindbc.opengl.context;

enum: uint{
	GL_MAX_VERTEX_ATTRIB_STRIDE                = 0x82E5,
	GL_PRIMITIVE_RESTART_FOR_PATCHES_SUPPORTED = 0x8221,
	GL_TEXTURE_BUFFER_BINDING                  = 0x8C2A,
}

package(bindbc.opengl) bool loadGL44(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
	import bindbc.opengl.bind.arb: loadARB44;
	
	if(contextVersion >= GLSupport.gl44){
		if(errorCountGL() == 0 && loadARB44(lib, contextVersion)) return true;
	}
	return false;
}
