# BindBC-OpenGL
This project provides dynamic bindings to [the OpenGL library](https://www.opengl.org/). It supports OpenGL versions up to and including 4.6, along with numerous extensions (if an extension you need is not yet supported, please submit a PR or open an issue). BindBC-OpenGL is compatible with `@nogc` and `nothrow` and can be compiled with BetterC compatibility. This package is intended as a replacement of [DerelictGL3](https://github.com/DerelictOrg/DerelictGL3), which does not provide the same level of compatibility.

__NOTE__: BindBC-OpenGL does not support static binding due to the nature of the OpenGL API.

__NOTE__: This documentation describes how to use BindBC-OpenGL. As the maintainer of this library, I do not provide instructions on using the OpenGL library. However, since this is a direct binding to the OpenGL API, existing OpenGL documentation and tutorials can be adapted to D with few modifications (those being minor differences in the language, such as array declaration syntax). [The tutorial at learnopengl.com](https://learnopengl.com/) is a particularly good introduction to OpenGL for those who have little or no experience with the API. For documentation, I prefer [the layout of docs.gl](https://docs.gl/) over [that of the Khronos site](https://www.khronos.org/registry/OpenGL-Refpages/gl4/).

## Add BindBC-OpenGL to your project
By default, BindBC-OpenGL is configured to compile with BetterC compatibility disabled and with support only for up to OpenGL 2.1 core. To use BindBC-OpenGL in this default mode, simply add the package as a dependency in your `dub.json` or `dub.sdl` recipe.

Example: __dub.json__
```
"dependencies": {
	"bindbc-opengl": "~>1.1.0"
}
```

Example: __dub.sdl__
```
dependency "bindbc-opengl" version="~>1.1.0"
```

## Enable BetterC support
If you are using BetterC, add the `dynamicBC` sub-configuration to your package recipe.

Example: __dub.json__
```
"subConfigurations": {
	"bindbc-opengl": "dynamicBC"
},
```

Example: __dub.sdl__
```
subConfiguration "bindbc-opengl" "dynamicBC"
```

## Enable support for OpenGL 3.0 and higher
Support for OpenGL versions can be configured at compile time by adding the appropriate version to a `versions` directive in your package configuration file (or on the command line if you are building with a tool other than dub).

BindBC-OpenGL supports a D version identifier for each OpenGL version. The following table lists each identifier and the OpenGL versions they enable.


| OpenGL versions |Version identifier|
|-----------------|------------------|
| 1.0&ndash;2.1   | Default          |
| 1.0&ndash;3.0   | `GL_30`          |
| 1.0&ndash;3.1   | `GL_31`          |
| 1.0&ndash;3.2   | `GL_32`          |
| 1.0&ndash;3.3   | `GL_33`          |
| 1.0&ndash;4.0   | `GL_40`          |
| 1.0&ndash;4.1   | `GL_41`          |
| 1.0&ndash;4.2   | `GL_42`          |
| 1.0&ndash;4.3   | `GL_43`          |
| 1.0&ndash;4.4   | `GL_44`          |
| 1.0&ndash;4.5   | `GL_45`          |
| 1.0&ndash;4.6   | `GL_46`          |

> [!NOTE]\
> If you use versions higher than OpenGL 4.1, then your application will not work on macOS; due to OpenGL being deprecated on macOS.

Adding one of these version identifiers to your package recipe will do two things:

* symbols for the core types and functions in the supported OpenGL versions will be declared and available in user code
* the `loadOpenGL` function will attempt to load all OpenGL versions for which support is enabled and which is supported by the OpenGL context at run time.

To load all functions and enable all constants from "classic" OpenGL versions, including those that have been deprecated, set the version identifier `GL_AllowDeprecated` in your build system. Note that doing so means you may need to take special steps to configure your OpenGL context to ensure the deprecated functions are made available by the driver. Check the documentation of the API you are using for OpenGL context creation.

The following examples are configured to load the core functions from all OpenGL versions up to OpenGL 4.1:

__dub.json__
```
"dependencies": {
	"bindbc-opengl": "~>1.1.0"
}
"versions": [
	"GL_41"
],
```

__dub.sdl__
```
dependency "bindbc-opengl" version="~>1.1.0"
versions "GL_41"
```

With this configuration, client code can make use of all core OpenGL types and functions up to OpenGL 4.1. At run time, if the context supports OpenGL 4.1 or higher, the loader will attempt to load up to OpenGL 4.1. If the highest OpenGL version the context supports is lower than 4.1, the loader will attempt to load up to that version.

To enable the loading of deprecated functions in the same configuration:

__dub.json__
```
"dependencies": {
	"bindbc-opengl": "~>1.1.0"
}
"versions": [
	"GL_41", "GL_AllowDeprecated"
],
```

__dub.sdl__
```
dependency "bindbc-opengl" version="~>1.1.0"
versions "GL_41" "GL_AllowDeprecated"
```

With this, all OpenGL functions, both core and deprecated, will be loaded if the context has been configured appropriately _and_ they are supported by the driver. Some deprecated features were removed from the specification in later versions of OpenGL.

`GL_AllowDeprecated` by itself enables support for deprecated functions and constants from OpenGL versions 1.0 - 2.1. When `GL_AllowDeprecated` is specified in conjunction with `GL_30` or higher, support for deprecated constants from OpenGL version 3.0 will be enabled.

## Enable support for extensions
Extension support is enabled on an as-needed basis. All supported ARB/KHR extensions can be enabled by adding the `GL_ARB` version identifier to your `dub.json` or `dub.sdl`. Supported NV (Nvidia) extensions are enabled via `GL_NV`.

For example, the following enables support for all core OpenGL functions up to and including GL 4.1, as well as all ARB/KHR extensions:

__dub.json__
```
"dependencies": {
	"bindbc-opengl": "~>1.1.0"
}
"versions": [
	"GL_41",
	"GL_ARB"
],
```

__dub.sdl__
```
dependency "bindbc-opengl" version="~>1.1.0"
versions "GL_41" "GL_ARB"
```

Extensions which were promoted to the core OpenGL API are loaded automatically along with the OpenGL version APIs to which they belong.

Specific extensions can be enabled using the extension's OpenGL name string as a version identifier. The name string for each extension is listed below. They the form of `GL_` prefixed to the extension name.

| Version added to core | OpenGL extension |Version identifier|
|-----------------------|------------------|------------------|
| N/A | ARB_bindless_texture | `GL_ARB_bindless_texture` |
| N/A | ARB_cl_event | `GL_ARB_cl_event` |
| N/A | ARB_compute_variable_group_size | `GL_ARB_compute_variable_group_size` |
| N/A | ARB_debug_output | `GL_ARB_debug_output` |
| N/A | ARB_framebuffer_sRGB | `GL_ARB_framebuffer_sRGB` |
| N/A | ARB_geometry_shader4 | `GL_ARB_geometry_shader4` |
| N/A | ARB_gl_spirv | `GL_ARB_gl_spirv` |
| N/A | ARB_gpu_shader_int64 | `GL_ARB_gpu_shader_int64` |
| N/A | ARB_indirect_parameters | `GL_ARB_indirect_parameters` |
| N/A | ARB_instanced_arrays | `GL_ARB_instanced_arrays` |
| N/A | ARB_pipeline_statistics_query | `GL_ARB_pipeline_statistics_query` |
| N/A | ARB_robustness_isolation | `GL_ARB_robustness_isolation` |
| N/A | ARB_sample_shading | `GL_ARB_sample_shading` |
| N/A | ARB_texture_buffer_object | `GL_ARB_texture_buffer_object` |
| N/A | ARB_texture_compression_bptc | `GL_ARB_texture_compression_bptc` |
| N/A | ARB_texture_cube_map_array | `GL_ARB_texture_cube_map_array` |
| N/A | ARB_texture_gather | `GL_ARB_texture_gather` |
| N/A | ARB_transform_feedback_overflow_query | `GL_ARB_transform_feedback_overflow_query` |
| N/A | ARB_sparse_texture | `GL_ARB_sparse_texture` |
| N/A | ARB_sparse_texture2 | `GL_ARB_sparse_texture2` |
| N/A | ARB_sparse_texture_clamp | `GL_ARB_sparse_texture_clamp` |
| 3.0 | ARB_depth_buffer_float | `GL_ARB_depth_buffer_float` |
| 3.0 | ARB_half_float_vertex | `GL_ARB_half_float_vertex` |
| 3.0 | ARB_texture_compression_rgtc | `GL_ARB_texture_compression_rgtc` |
| 3.0 | ARB_texture_rg | `GL_ARB_texture_rg` |
| 3.0 | ARB_framebuffer_object | `GL_ARB_framebuffer_object` |
| 3.0 | ARB_map_buffer_range | `GL_ARB_map_buffer_range` |
| 3.0 | ARB_vertex_array_object | `GL_ARB_vertex_array_object` |
| 3.1 | ARB_copy_buffer | `GL_ARB_copy_buffer` |
| 3.1 | ARB_uniform_buffer_object | `GL_ARB_uniform_buffer_object` |
| 3.2 | ARB_depth_clamp | `GL_ARB_depth_clamp` |
| 3.2 | ARB_provoking_vertex | `GL_ARB_provoking_vertex` |
| 3.2 | ARB_seamless_cube_map | `GL_ARB_seamless_cube_map` |
| 3.2 | ARB_draw_elements_base_vertex | `GL_ARB_draw_elements_base_vertex` |
| 3.2 | ARB_sync | `GL_ARB_sync` |
| 3.2 | ARB_texture_multisample | `GL_ARB_texture_multisample` |
| 3.3 | ARB_occlusion_query2 | `GL_ARB_occlusion_query2` |
| 3.3 | ARB_texture_rgb10_a2ui | `GL_ARB_texture_rgb10_a2ui` |
| 3.3 | ARB_texture_swizzle | `GL_ARB_texture_swizzle` |
| 3.3 | ARB_blend_func_extended | `GL_ARB_blend_func_extended` |
| 3.3 | ARB_sampler_objects | `GL_ARB_sampler_objects` |
| 3.3 | ARB_timer_query | `GL_ARB_timer_query` |
| 3.3 | ARB_vertex_type_2_10_10_10_rev | `GL_ARB_vertex_type_2_10_10_10_rev` |
| 4.0 | ARB_gpu_shader5 | `GL_ARB_gpu_shader5` |
| 4.0 | ARB_draw_indirect | `GL_ARB_draw_indirect` |
| 4.0 | ARB_gpu_shader_fp64 | `GL_ARB_gpu_shader_fp64` |
| 4.0 | ARB_shader_subroutine | `GL_ARB_shader_subroutine` |
| 4.0 | ARB_tessellation_shader | `GL_ARB_tessellation_shader` |
| 4.0 | ARB_transform_feedback2 | `GL_ARB_transform_feedback2` |
| 4.0 | ARB_transform_feedback3 | `GL_ARB_transform_feedback3` |
| 4.1 | ARB_ES2_compatibility | `GL_ARB_ES2_compatibility` |
| 4.1 | ARB_get_program_binary | `GL_ARB_get_program_binary` |
| 4.1 | ARB_separate_shader_objects | `GL_ARB_separate_shader_objects` |
| 4.1 | ARB_vertex_attrib_64bit | `GL_ARB_vertex_attrib_64bit` |
| 4.1 | ARB_viewport_array | `GL_ARB_viewport_array` |
| 4.2 | ARB_base_instance | `GL_ARB_base_instance` |
| 4.2 | ARB_compressed_texture_pixel_storage | `GL_ARB_compressed_texture_pixel_storage` |
| 4.2 | ARB_internalformat_query | `GL_ARB_internalformat_query` |
| 4.2 | ARB_map_buffer_alignment | `GL_ARB_map_buffer_alignment` |
| 4.2 | ARB_shader_image_load_store | `GL_ARB_shader_image_load_store` |
| 4.2 | ARB_texture_storage | `GL_ARB_texture_storage` |
| 4.2 | ARB_transform_feedback_instanced | `GL_ARB_transform_feedback_instanced` |
| 4.3 | ARB_clear_buffer_object | `GL_ARB_clear_buffer_object` |
| 4.3 | ARB_compute_shader | `GL_ARB_compute_shader` |
| 4.3 | ARB_copy_image | `GL_ARB_copy_image` |
| 4.3 | ARB_ES3_compatibility | `GL_ARB_ES3_compatibility` |
| 4.3 | ARB_explicit_uniform_location | `GL_ARB_explicit_uniform_location` |
| 4.3 | ARB_framebuffer_no_attachments | `GL_ARB_framebuffer_no_attachments` |
| 4.3 | ARB_internalformat_query2 | `GL_ARB_internalformat_query2` |
| 4.3 | ARB_invalidate_subdata | `GL_ARB_invalidate_subdata` |
| 4.3 | ARB_multi_draw_indirect | `GL_ARB_multi_draw_indirect` |
| 4.3 | ARB_program_interface_query | `GL_ARB_program_interface_query` |
| 4.3 | ARB_shader_storage_buffer_object | `GL_ARB_shader_storage_buffer_object` |
| 4.3 | ARB_stencil_texturing | `GL_ARB_stencil_texturing` |
| 4.3 | ARB_texture_buffer_range | `GL_ARB_texture_buffer_range` |
| 4.3 | ARB_texture_storage_multisample | `GL_ARB_texture_storage_multisample` |
| 4.3 | ARB_texture_view | `GL_ARB_texture_view` |
| 4.3 | ARB_vertex_attrib_binding | `GL_ARB_vertex_attrib_binding` |
| 4.3 | KHR_debug | `GL_KHR_debug` |
| 4.4 | ARB_buffer_storage | `GL_ARB_buffer_storage` |
| 4.4 | ARB_clear_texture | `GL_ARB_clear_texture` |
| 4.4 | ARB_enhanced_layouts | `GL_ARB_enhanced_layouts` |
| 4.4 | ARB_multi_bind | `GL_ARB_multi_bind` |
| 4.4 | ARB_query_buffer_object | `GL_ARB_query_buffer_object` |
| 4.4 | ARB_texture_mirror_clamp_to_edge | `GL_ARB_texture_mirror_clamp_to_edge` |
| 4.5 | ARB_clip_control | `GL_ARB_clip_control` |
| 4.5 | ARB_conditional_render_inverted | `GL_ARB_conditional_render_inverted` |
| 4.5 | ARB_cull_distance | `GL_ARB_cull_distance` |
| 4.5 | ARB_direct_state_access | `GL_ARB_direct_state_access` |
| 4.5 | ARB_ES3_1_compatibility | `GL_ARB_ES3_1_compatibility` |
| 4.5 | ARB_get_texture_sub_image | `GL_ARB_get_texture_sub_image` |
| 4.5 | ARB_texture_barrier | `GL_ARB_texture_barrier` |
| 4.5 | KHR_context_flush_control | `GL_KHR_context_flush_control` |
| 4.5 | KHR_robustness | `GL_KHR_robustness` |
| 4.6 | ARB_polygon_offset_clamp | `GL_ARB_polygon_offset_clamp` |
| 4.6 | ARB_texture_filter_anisotropic | `GL_ARB_texture_filter_anisotropic` |

For example, the following configurations enable support for OpenGL 4.1 and the extensions `ARB_base_instance` and `ARB_compressed_texture_pixel_storage`, both of which were promoted to core in OpenGL 4.2:

__dub.json__
```
"dependencies": {
	"bindbc-opengl": "~>1.1.0"
}
"versions": [
	"GL_41",
	"GL_ARB_base_instance",
	"GL_ARB_compressed_texture_pixel_storage"
],
```

__dub.sdl__
```
dependency "bindbc-opengl" version="~>1.1.0"
versions "GL_41" "GL_ARB_base_instance" "GL_ARB_compressed_texture_pixel_storage"
```

The `loadOpenGL` function (described in the next section) will attempt to load all extensions configured in this manner. No errors will be reported on failure. To determine if an extension was loaded, use the `has*` property for each extension, like so:

```d
import bindbc.opengl;

// Create the OpenGL context and load OpenGl
...
// Check for required extensions
if(hasARBBaseInstance){
	// configure renderer for GL_ARB_base_instance support
}
if(hasARBCompressedTexturePixelStorage){
	// configure renderer for GL_ARB_compressed_texture_pixel_storage support
}
```

If you have a need for an extension that is not currently supported then please submit a pull request.

## Loading OpenGL
The `loadOpenGL` function is used to load all supported OpenGL functions and extensions. __In order for this function to succeed, an OpenGL context must be created before it is called__. The return value of `loadOpenGL` can be used to determine which version of OpenGL actually loaded.

For example, assume you've configured BindBC-OpenGL to support up to OpenGL 4.1, but you've designed your renderer to work with both 4.1 and 3.3. You can create a 4.1 or 3.3 context in one part of your code, then load OpenGL in another part, and configure your renderer based upon the return value.

```d
import bindbc.opengl;

// Create OpenGL context
...
// Load supported OpenGL version + supported extensions
GLSupport retVal = loadOpenGL();
if(retVal == GLSupport.gl41){
	// configure renderer for OpenGL 4.1
}else if(retVal == GLSupport.gl33){
	// configure renderer for OpenGL 3.3
}else{
	// Error
}
```

> [!NOTE]\
> `loadOpenGL` returns the *highest* version that was loaded. On some systems, deprecated OpenGL functions (e.g. from OpenGL 1.2) may be missing, so if you rely on these you should check that they were loaded using `versionLoadedStatus`:
>```d
>if((versionLoadedStatus(GLSupport.gl12) & GLLoadStatus.loaded) == 0){
>	//OpenGL 1.2 functions were not loaded!
>}
>```

On error, `loadOpenGL` will return one of the following:
* `GLSupport.noLibrary` - the OpenGL shared library failed to load
* `GLSupport.badLibrary` - one of the context-independent symbols (OpenGL 1.0 & 1.1) in the OpenGL shared library failed to load.
* `GLSupport.noContext` - an OpenGL context was not created before calling the function. When asserts are enabled, calling `loadOpenGL` before a context is created will trigger an assertion failure instead.

The following functions are provided for convenience:
* `isOpenGLLoaded` - returns `true` if any version of OpenGL has been successfully loaded and `false` otherwise.
* `openGLContextVersion` - returns a `GLSupport` member corresponding to the version supported by the OpenGL context against which the library was loaded.
* `loadedOpenGLVersion` - returns a `GLSupport` member corresponding to the version of OpenGL currently loaded (identical to the return value of `loadOpenGL`).

Note that when working with multiple contexts, it may be necessary to call `loadOpenGL` on every context switch. On Windows in particular, a context switch may cause context-dependent functions, i.e., core functions above 1.1 and all extensions, to become invalid in some circumstances.

The [error reporting API in bindbc.loader](https://github.com/BindBC/bindbc-loader/blob/master/README.md) can be used to facilitate logging error messages.

```d
// Import the dependent package
import bindbc.opengl;

/*
 Import the sharedlib module for error handling. Assigning an alias ensures the function names do not conflict with
 other public APIs. This isn't strictly necessary, but the API names are common enough that they could appear in other
 packages.
*/
import loader = bindbc.loader.sharedlib;

// Create the OpenGL context before calling this function.
bool loadLib(){
	/*
	Compare the return value of loadGL with the global `glSupport` constant to determine if the version of GLFW
	configured at compile time is the version that was loaded.
	*/
	auto ret = loadOpenGL();
	if(ret != glSupport){
		// Log the error info
		foreach(info; loader.errors){
			/*
			A hypothetical logging function. Note that `info.error` and `info.message` are `const(char)*`, not
			`string`.
			*/
			logError(info.error, info.message);
		}
		
		// Optionally construct a user-friendly error message for the user
		string msg;
		if(ret == GLSupport.noLibrary){
			msg = "This application requires OpenGL.";
		}else if(ret == GLSupport.badLibrary){
			msg = "The version of OpenGL on your system is too low. Please upgrade."
		}else{
			// GLSupport.noContext
			msg = "This program has encountered a graphics configuration error. Please report it to the developers."
		}
		// A hypothetical message box function
		showMessageBox(msg);
		return false;
	}
	return true;
}
```
