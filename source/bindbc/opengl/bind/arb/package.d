/+
+            Copyright 2022 – 2024 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opengl.bind.arb;

public import
	bindbc.opengl.bind.arb.core_30,
	bindbc.opengl.bind.arb.core_31,
	bindbc.opengl.bind.arb.core_32,
	bindbc.opengl.bind.arb.core_33,
	bindbc.opengl.bind.arb.core_40,
	bindbc.opengl.bind.arb.core_41,
	bindbc.opengl.bind.arb.core_42,
	bindbc.opengl.bind.arb.core_43,
	bindbc.opengl.bind.arb.core_44,
	bindbc.opengl.bind.arb.core_45,
	bindbc.opengl.bind.arb.core_46,
	bindbc.opengl.bind.arb.arb_01;

import bindbc.loader.sharedlib;
import bindbc.opengl.config;

package(bindbc.opengl) void loadARB(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
	loadARB_01(lib, contextVersion);
}
