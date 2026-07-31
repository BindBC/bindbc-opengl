module bindbc.opengl.loader;

version(EGL)
{
	struct SharedLib
	{
		bool loaded = false;
		@nogc nothrow:
		void unload(){}
	}
	@nogc nothrow:
	int errorCount(){return 0;}
	__gshared const(SharedLib) invalidHandle = SharedLib(false);
	SharedLib load(const(char)* name)
	{
		return SharedLib(true);
	}
	public import bindbc.opengl.context: bindSymbol = bindGLSymbol;
}
else
	public import bindbc.loader;