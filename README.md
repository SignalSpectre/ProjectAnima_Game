# Project Anima (game source code)

Source code for Project Anima (final name tbd), a third person action/adventure game about defeating our own failures.

This is a hobby project and will probably never be released (I have a very bad track records on completing the projects I start.)

## Licensing

All source code is release under the GNU Public License as required by the original Quake 2 source code.

## Technical details

The code is a modified version of CrowBar's Quake2 port for PSP with added WIN32 support and all the needed modifications to make the game I want to make.

I "updated" the build system from makefiles to cmake to make it easier to develop on Windows and then deploy for the PSP.

### Building for Windows

For Windows the expeirence should be pretty straightforward (unless I messed something up): the project doesn't depend on third party libraries other then the Windows ones and opengl (the software renderer is not enabled and will be removed soon) and everything comes preconfigured to run with VSCode out of the box.

So basically you just need to clone the repo, open the folder with VSCode and everything should work fine is you have the CMake Tools extension added.

### Building for PSP

Building for PSP is slightly more involved in which you need to first setup the PSPDev SDK in a Linux environment (either a Virtual Machine or WSL).<br>
After that is done you can used VSCode as with Windows.

If you have a Windows PC I suggest using WSL instead of a Virtual Machine since you can put the project somewhere  on your filesystem and access it from WSL ending up using the same repo both for Windows builds and PSP builds (much better than keeping one copy of the repo on Windows and one on the virtual machine while trying to keep them always up to date).