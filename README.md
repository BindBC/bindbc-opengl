# bindbc-opengl
This project provides dynamic bindings to [the OpenGL library](https://www.opengl.org/). It supports OpenGL versions up to and including 4.6, along with numerous extensions (if an extension you need is not yet supported, please submit a PR or open an issue). `bindbc-opengl` is compatible with `@nogc` and `nothrow`, and can be compiled with `-betterC` compatibility. This package is intended as a replacement of [DerelictGL3](https://github.com/DerelictOrg/DerelictGL3), which does not provide the same level of compatibility.

__Note that `bindbc-gl` currently does not support deprecated OpenGL features.__

## Add `bindbc-opengl` to your project
By default, `bindbc-opengl` is configured to compile with `-betterC` compatibility disabled, and with support only for up to OpenGL 2.1 core. To use `-bindbc-opengl` in this default mode, simply add the package as a dependency in your `dub.json` or `dub.sdl` package description:

__dub.json__
```
"dependencies": {
    "bindbc-opengl": "~>0.1.0"
}
```

__dub.sdl__
```
dependency "bindbc-opengl" version="~>0.1.0"
```

## Enable `-betterC` support
To enable support for `-betterC` mode, add the `dynamicBC` subconfiguration to your package description file:

__dub.json__
```
"dependencies": {
    "bindbc-opengl": "~>0.1.0"
}
"subConfigurations": {
    "bindbc-opengl": "dynamicBC"
},
```

__dub.sdl__
```
dependency "bindbc-opengl" version="~>0.1.0"
subConfiguration "bindbc-opengl" "dynamicBC"
```

## Enable support for OpenGL versions 3.0 and higher
Support for OpenGL versions can be configured at compile time by adding the appropriate version to a `versions` directive in your package configuration file (or on the command line if you are building with a tool other than dub).

`bindbc-opengl` defines a D version identifier for each OpenGL version. The following table lists each identifier and the OpenGL versions they enable.

| OpenGL Version  | Version ID     |
|-----------------|----------------|
|1.0 - 2.1        | Default        |
|1.0 - 3.0        | GL_30          |
|1.0 - 3.1        | GL_31          |
|1.0 - 3.2        | GL_32          |
|1.0 - 3.3        | GL_33          |
|1.0 - 4.0        | GL_40          |
|1.0 - 4.1        | GL_41          |
|1.0 - 4.2        | GL_42          |
|1.0 - 4.3        | GL_43          |
|1.0 - 4.4        | GL_44          |
|1.0 - 4.5        | GL_45          |
|1.0 - 4.6        | GL_46          |

Adding one of these version identifiers to your package description will do two things:

* symbols for the core OpenGL types and functions for the supported OpenGL versions will be declared and available in user code
* the `loadOpenGL` function will attempt to load all OpenGL versions for which support is enabled and which is supported by the OpenGL context at runtime.

The following examples are configured to load all OpenGL support all OpenGL versions up to OpenGL 4.1:


__dub.json__
```
"dependencies": {
    "bindbc-opengl": "~>0.1.0"
}
"versions": [
    "GL_41"
],
```

__dub.sdl__
```
dependency "bindbc-opengl" version="~>0.1.0"
versions "GL_41"
```

With this configuration, client code can make use of all core OpenGL types and functions up to OpenGL 4.1. At runtime, if the context supports OpenGL 4.1 or higher, the loader will attempt to load up to OpenGL 4.1. If the highest OpenGL version the context supports is lower than 4.1, the loader will attempt to load up to that version.

## Enable support for extensions
Extension support is added primarily on an as needed basis. Currently, only ARB/KHR extensions are supported. All supported ARB/KHR extensions can be enabled by adding the `GL_ARB` version identifier to your `dub.json` or `dub.sdl`.

For example, the following enables support for OpenGL functions up to and including GL 4.1, as well as all ARB extensions.

__dub.json__
```
"dependencies": {
    "bindbc-opengl": "~>0.1.0"
}
"versions": [
    "GL_41",
    "GL_ARB"
],
```

__dub.sdl__
```
dependency "bindbc-opengl" version="~>0.1.0"
versions "GL_41" "GL_ARB"
```

Extensions which were promoted to the core OpenGL API are loaded automatically as part of the OpenGL versions to which they belong.

Specific extensions can be enabled using the name of the extension as a version identifier. The syntax matches that of the extension name as listed in [the OpenGL Registry](https://www.khronos.org/registry/OpenGL/index_gl.php).

For example, the following configurations enable support for OpenGL 4.1 and the extensions "GL_ARB_base_instance" and "GL_ARB_compressed_texture_pixel_storage" (both of which were promoted to core in OpenGL 4.2).

__dub.json__
```
"dependencies": {
    "bindbc-opengl": "~>0.1.0"
}
"versions": [
    "GL_41",
    "GL_ARB"
],
```

__dub.sdl__
```
dependency "bindbc-opengl" version="~>0.1.0"
versions "GL_41" "GL_ARB_base_instance" "GL_ARB_compressed_texture_pixel_storage"
```

The `loadOpenGL` function (described in the next section) will attempt to load all extensions configured in this manner. No errors will be reported on failure. To determine if an extension was loaded, use the `hasARBFoo` properties, like so:

```d
import bindbc.opengl;

// Create the OpenGL context and load OpenGl
...
// Check for required extensions
if(hasARBBaseInstance) {
    // configure renderer for GL_ARB_base_instance support
}
if(hasARBCompressedTexturePixelStorage) {
    // configure renderer for
    // GL_ARB_compressed_texture_pixel_storage support
}
```

Currently, `bindbc-opengl` supports most extensions that have been promoted to the core API. Support for more extensions and a list of all supported extensions are forthcoming.

## Loading OpenGL
The `loadOpenGL` function is used to load all supported OpenGL functions and extensions. In order for this function to succeed, an OpenGL must context be created before it is called. The return value of `loadOpenGL` can be used to determine which version of OpenGL actually loaded.

For example, assume you've configured `bindbc-opengl` to support up to OpenGL 4.1, but you've designed your renderer to work with both 4.1 and 3.3. You can create a 4.1 or 3.3 context in one part of your code, then load OpenGL in another part, and configure your renderer based upon the return value.

```d
import bindbc.opengl;

// Create OpenGL context
...
// Load supported OpenGL version + supported extensions
GLSupport retVal = loadOpenGL();
if(retVal == GLSupport.gl41) {
    // configure renderer for OpenGL 4.1
}
else if(retVal == GLSupport.gl33) {
    // configure renderer for OpenGL 3.3
}
else {
    // Error
}
```

On error, `loadOpenGL` will return one of the following:
* `GLSupport.noLibrary` - the OpenGL shared library failed to load
* `GLSupport.badLibrary` - one of the context-independent symbols (OpenGL 1.0 & 1.1) in the OpenGL shared library failed to load.
* `GLSupport.noContext` - an OpenGL context was not created before calling the function.

See [the README for `bindbc.loader`](https://github.com/BindBC/bindbc-loader/blob/master/README.md) for the error handling API.



