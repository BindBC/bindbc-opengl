/+
+            Copyright 2022 – 2024 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opengl.bind.nv;

public import
	bindbc.opengl.bind.nv.nv_30,
	bindbc.opengl.bind.nv.nv_32,
	bindbc.opengl.bind.nv.nv_44;

import bindbc.loader.sharedlib;
import bindbc.opengl.config;

package(bindbc.opengl) void loadNV(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
	loadNV_30(lib, contextVersion);
	loadNV_32(lib, contextVersion);
	loadNV_44(lib, contextVersion);
}
