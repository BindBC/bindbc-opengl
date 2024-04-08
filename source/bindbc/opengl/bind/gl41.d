/+
+            Copyright 2022 – 2024 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opengl.bind.gl41;

import bindbc.opengl.config;

static if(glSupport >= GLSupport.gl41):
import bindbc.loader: SharedLib;
import bindbc.opengl.context;

package(bindbc.opengl) bool loadGL41(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
	import bindbc.opengl.bind.arb: loadARB41;
	
	if(contextVersion >= GLSupport.gl41){
		if(errorCountGL() == 0 && loadARB41(lib, contextVersion)) return true;
	}
	return false;
}
