module bindbc.opengl.bind.khr.khr_01;

import bindbc.loader;
import bindbc.opengl.config, bindbc.opengl.context;
import bindbc.opengl.bind.types;

//KHR_blend_equation_advanced
enum useKHRBlendEquationAdvanced = (){
	version(GL_KHR)                                       return true;
	else version(GL_KHR_blend_equation_advanced)          return true;
	else version(GL_KHR_blend_equation_advanced_coherent) return true;
	else return false;
}();

private bool _hasKHRBlendEquationAdvanced = false;
private bool _hasKHRBlendEquationAdvancedCoherent = false;
bool hasKHRBlendEquationAdvanced() nothrow @nogc @safe{ return _hasKHRBlendEquationAdvanced; }
bool hasKHRBlendEquationAdvancedCoherent() nothrow @nogc @safe{ return _hasKHRBlendEquationAdvancedCoherent; }

static if(useKHRBlendEquationAdvanced){
	enum: uint{
		GL_BLEND_ADVANCED_COHERENT_KHR = 0x9285,
		
		GL_MULTIPLY_KHR       = 0x9294,
		GL_SCREEN_KHR         = 0x9295,
		GL_OVERLAY_KHR        = 0x9296,
		GL_DARKEN_KHR         = 0x9297,
		GL_LIGHTEN_KHR        = 0x9298,
		GL_COLORDODGE_KHR     = 0x9299,
		GL_COLORBURN_KHR      = 0x929A,
		GL_HARDLIGHT_KHR      = 0x929B,
		GL_SOFTLIGHT_KHR      = 0x929C,
		GL_DIFFERENCE_KHR     = 0x929E,
		GL_EXCLUSION_KHR      = 0x92A0,
		GL_HSL_HUE_KHR        = 0x92AD,
		GL_HSL_SATURATION_KHR = 0x92AE,
		GL_HSL_COLOR_KHR      = 0x92AF,
		GL_HSL_LUMINOSITY_KHR = 0x92B0,
	}
	
	extern(System) nothrow @nogc{
		alias pglBlendBarrierKHR = void function();
	}
	
	__gshared{
		pglBlendBarrierKHR glBlendBarrierKHR;
	}
	
	private bool loadKHRBlendEquationAdvanced(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
		lib.bindGLSymbol(cast(void**)&glBlendBarrierKHR, "glBlendBarrierKHR");
		return resetErrorCountGL();
	}
}

package void loadKHR_01(SharedLib lib, GLSupport contextVersion) nothrow @nogc{
	static if(useKHRBlendEquationAdvanced){
		_hasKHRBlendEquationAdvanced =
			hasExtension(contextVersion, "GL_KHR_blend_equation_advanced") &&
			lib.loadKHRBlendEquationAdvanced(contextVersion);
		_hasKHRBlendEquationAdvancedCoherent = hasExtension(contextVersion, "GL_KHR_blend_equation_advanced_coherent");
	}
}
