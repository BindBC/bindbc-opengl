//          Copyright 2023 Inochi2D Project
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)
module bindbc.opengl.bind.khr;

import bindbc.loader.sharedlib;
import bindbc.opengl.config;

public import bindbc.opengl.bind.khr.khr_01;

package(bindbc.opengl) void loadKHR(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
	loadKHR_01(lib, contextVersion);
}
