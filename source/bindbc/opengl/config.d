/+
+            Copyright 2022 – 2024 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opengl.config;

enum GLSupport{
	noLibrary,
	badLibrary,
	noContext,
	gl11 = 11,
	gl12 = 12,
	gl13 = 13,
	gl14 = 14,
	gl15 = 15,
	gl20 = 20,
	gl21 = 21,
	gl30 = 30,
	gl31 = 31,
	gl32 = 32,
	gl33 = 33,
	gl40 = 40,
	gl41 = 41,
	gl42 = 42,
	gl43 = 43,
	gl44 = 44,
	gl45 = 45,
	gl46 = 46,
}

enum GLLoadStatus : ubyte{
	notLoaded           = 0x00, ///Version didn't load properly at all.
	loaded              = 0x01, ///Version loaded properly.
	loadedDeprecated    = 0x02, ///For denoting deprecated functionality support, unused for now.
	loadedARB           = 0x04, ///For denoting ARB support, unused for now.
}

enum glAllowDeprecated = (){
	version(GL_AllowDeprecated) return true;
	else return false;
}();

enum glSupport = (){
	version(GL_46)       return GLSupport.gl46;
	else version(GL_45)  return GLSupport.gl45;
	else version(GL_44)  return GLSupport.gl44;
	else version(GL_43)  return GLSupport.gl43;
	else version(GL_42)  return GLSupport.gl42;
	else version(GL_41)  return GLSupport.gl41;
	else version(GL_40)  return GLSupport.gl40;
	else version(GL_33)  return GLSupport.gl33;
	else version(GL_32)  return GLSupport.gl32;
	else version(GL_31)  return GLSupport.gl31;
	else version(GL_30)  return GLSupport.gl30;
	else                 return GLSupport.gl21;
}();
