module bindbc.opengl.bind.khr.khr_01;

import bindbc.loader;
import bindbc.opengl.config,
       bindbc.opengl.context;
import bindbc.opengl.bind.types;


// KHR_blend_equation_advanced
version(GL_KHR) enum useKHRBlendEquationAdvanced = true;
else version(GL_KHR_blend_equation_advanced) enum useKHRBlendEquationAdvanced = true;
else version(GL_KHR_blend_equation_advanced_coherent) enum useKHRBlendEquationAdvanced = true;
else enum useKHRBlendEquationAdvanced = false;

static if(useKHRBlendEquationAdvanced) {
    private bool _hasKHRBlendEquationAdvanced;
    private bool _hasKHRBlendEquationAdvancedCoherent;
    @nogc nothrow bool hasKHRBlendEquationAdvanced() { return _hasKHRBlendEquationAdvanced; }
    @nogc nothrow bool hasKHRBlendEquationAdvancedCoherent() { return _hasKHRBlendEquationAdvancedCoherent; }

    enum uint GL_BLEND_ADVANCED_COHERENT_KHR = 0x9285;
    
    enum uint GL_MULTIPLY_KHR = 0x9294;
    enum uint GL_SCREEN_KHR = 0x9295;
    enum uint GL_OVERLAY_KHR = 0x9296;
    enum uint GL_DARKEN_KHR = 0x9297;
    enum uint GL_LIGHTEN_KHR = 0x9298;
    enum uint GL_COLORDODGE_KHR = 0x9299;
    enum uint GL_COLORBURN_KHR = 0x929A;
    enum uint GL_HARDLIGHT_KHR = 0x929B;
    enum uint GL_SOFTLIGHT_KHR = 0x929C;
    enum uint GL_DIFFERENCE_KHR = 0x929E;
    enum uint GL_EXCLUSION_KHR = 0x92A0;
    enum uint GL_HSL_HUE_KHR = 0x92AD;
    enum uint GL_HSL_SATURATION_KHR = 0x92AE;
    enum uint GL_HSL_COLOR_KHR = 0x92AF;
    enum uint GL_HSL_LUMINOSITY_KHR = 0x92B0;


    extern(System) @nogc nothrow  {
        alias pglBlendBarrierKHR = void function();
    }

    __gshared {
        pglBlendBarrierKHR glBlendBarrierKHR;
    }

    private @nogc nothrow
    bool loadKHRBlendEquationAdvanced(SharedLib lib, GLSupport contextVersion)
    {
        lib.bindGLSymbol(cast(void**)&glBlendBarrierKHR, "glBlendBarrierKHR");
        return resetErrorCountGL();
    }
} else {
    enum hasKHRBlendEquationAdvanced = false;
    enum hasKHRBlendEquationAdvancedCoherent = false;
}

package @nogc nothrow
void loadKHR_01(SharedLib lib, GLSupport contextVersion) {
    static if(useKHRBlendEquationAdvanced) {
        _hasKHRBlendEquationAdvanced =
            hasExtension(contextVersion, "GL_KHR_blend_equation_advanced") &&
            lib.loadKHRBlendEquationAdvanced(contextVersion);
        _hasKHRBlendEquationAdvancedCoherent = hasExtension(contextVersion, "GL_KHR_blend_equation_advanced_coherent");
    }
}
