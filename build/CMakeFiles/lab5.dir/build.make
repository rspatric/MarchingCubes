# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.1

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.1.0/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.1.0/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/roslynsierra/GradGraphics/MarchingCubes

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/roslynsierra/GradGraphics/MarchingCubes/build

# Include any dependencies generated for this target.
include CMakeFiles/lab5.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/lab5.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lab5.dir/flags.make

CMakeFiles/lab5.dir/src/GLSL.cpp.o: CMakeFiles/lab5.dir/flags.make
CMakeFiles/lab5.dir/src/GLSL.cpp.o: ../src/GLSL.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/roslynsierra/GradGraphics/MarchingCubes/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/lab5.dir/src/GLSL.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lab5.dir/src/GLSL.cpp.o -c /Users/roslynsierra/GradGraphics/MarchingCubes/src/GLSL.cpp

CMakeFiles/lab5.dir/src/GLSL.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab5.dir/src/GLSL.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/roslynsierra/GradGraphics/MarchingCubes/src/GLSL.cpp > CMakeFiles/lab5.dir/src/GLSL.cpp.i

CMakeFiles/lab5.dir/src/GLSL.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab5.dir/src/GLSL.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/roslynsierra/GradGraphics/MarchingCubes/src/GLSL.cpp -o CMakeFiles/lab5.dir/src/GLSL.cpp.s

CMakeFiles/lab5.dir/src/GLSL.cpp.o.requires:
.PHONY : CMakeFiles/lab5.dir/src/GLSL.cpp.o.requires

CMakeFiles/lab5.dir/src/GLSL.cpp.o.provides: CMakeFiles/lab5.dir/src/GLSL.cpp.o.requires
	$(MAKE) -f CMakeFiles/lab5.dir/build.make CMakeFiles/lab5.dir/src/GLSL.cpp.o.provides.build
.PHONY : CMakeFiles/lab5.dir/src/GLSL.cpp.o.provides

CMakeFiles/lab5.dir/src/GLSL.cpp.o.provides.build: CMakeFiles/lab5.dir/src/GLSL.cpp.o

CMakeFiles/lab5.dir/src/main.cpp.o: CMakeFiles/lab5.dir/flags.make
CMakeFiles/lab5.dir/src/main.cpp.o: ../src/main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/roslynsierra/GradGraphics/MarchingCubes/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/lab5.dir/src/main.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lab5.dir/src/main.cpp.o -c /Users/roslynsierra/GradGraphics/MarchingCubes/src/main.cpp

CMakeFiles/lab5.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab5.dir/src/main.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/roslynsierra/GradGraphics/MarchingCubes/src/main.cpp > CMakeFiles/lab5.dir/src/main.cpp.i

CMakeFiles/lab5.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab5.dir/src/main.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/roslynsierra/GradGraphics/MarchingCubes/src/main.cpp -o CMakeFiles/lab5.dir/src/main.cpp.s

CMakeFiles/lab5.dir/src/main.cpp.o.requires:
.PHONY : CMakeFiles/lab5.dir/src/main.cpp.o.requires

CMakeFiles/lab5.dir/src/main.cpp.o.provides: CMakeFiles/lab5.dir/src/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/lab5.dir/build.make CMakeFiles/lab5.dir/src/main.cpp.o.provides.build
.PHONY : CMakeFiles/lab5.dir/src/main.cpp.o.provides

CMakeFiles/lab5.dir/src/main.cpp.o.provides.build: CMakeFiles/lab5.dir/src/main.cpp.o

CMakeFiles/lab5.dir/src/MatrixStack.cpp.o: CMakeFiles/lab5.dir/flags.make
CMakeFiles/lab5.dir/src/MatrixStack.cpp.o: ../src/MatrixStack.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/roslynsierra/GradGraphics/MarchingCubes/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/lab5.dir/src/MatrixStack.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lab5.dir/src/MatrixStack.cpp.o -c /Users/roslynsierra/GradGraphics/MarchingCubes/src/MatrixStack.cpp

CMakeFiles/lab5.dir/src/MatrixStack.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab5.dir/src/MatrixStack.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/roslynsierra/GradGraphics/MarchingCubes/src/MatrixStack.cpp > CMakeFiles/lab5.dir/src/MatrixStack.cpp.i

CMakeFiles/lab5.dir/src/MatrixStack.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab5.dir/src/MatrixStack.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/roslynsierra/GradGraphics/MarchingCubes/src/MatrixStack.cpp -o CMakeFiles/lab5.dir/src/MatrixStack.cpp.s

CMakeFiles/lab5.dir/src/MatrixStack.cpp.o.requires:
.PHONY : CMakeFiles/lab5.dir/src/MatrixStack.cpp.o.requires

CMakeFiles/lab5.dir/src/MatrixStack.cpp.o.provides: CMakeFiles/lab5.dir/src/MatrixStack.cpp.o.requires
	$(MAKE) -f CMakeFiles/lab5.dir/build.make CMakeFiles/lab5.dir/src/MatrixStack.cpp.o.provides.build
.PHONY : CMakeFiles/lab5.dir/src/MatrixStack.cpp.o.provides

CMakeFiles/lab5.dir/src/MatrixStack.cpp.o.provides.build: CMakeFiles/lab5.dir/src/MatrixStack.cpp.o

CMakeFiles/lab5.dir/src/Program.cpp.o: CMakeFiles/lab5.dir/flags.make
CMakeFiles/lab5.dir/src/Program.cpp.o: ../src/Program.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/roslynsierra/GradGraphics/MarchingCubes/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/lab5.dir/src/Program.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lab5.dir/src/Program.cpp.o -c /Users/roslynsierra/GradGraphics/MarchingCubes/src/Program.cpp

CMakeFiles/lab5.dir/src/Program.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab5.dir/src/Program.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/roslynsierra/GradGraphics/MarchingCubes/src/Program.cpp > CMakeFiles/lab5.dir/src/Program.cpp.i

CMakeFiles/lab5.dir/src/Program.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab5.dir/src/Program.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/roslynsierra/GradGraphics/MarchingCubes/src/Program.cpp -o CMakeFiles/lab5.dir/src/Program.cpp.s

CMakeFiles/lab5.dir/src/Program.cpp.o.requires:
.PHONY : CMakeFiles/lab5.dir/src/Program.cpp.o.requires

CMakeFiles/lab5.dir/src/Program.cpp.o.provides: CMakeFiles/lab5.dir/src/Program.cpp.o.requires
	$(MAKE) -f CMakeFiles/lab5.dir/build.make CMakeFiles/lab5.dir/src/Program.cpp.o.provides.build
.PHONY : CMakeFiles/lab5.dir/src/Program.cpp.o.provides

CMakeFiles/lab5.dir/src/Program.cpp.o.provides.build: CMakeFiles/lab5.dir/src/Program.cpp.o

CMakeFiles/lab5.dir/src/Shape.cpp.o: CMakeFiles/lab5.dir/flags.make
CMakeFiles/lab5.dir/src/Shape.cpp.o: ../src/Shape.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/roslynsierra/GradGraphics/MarchingCubes/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/lab5.dir/src/Shape.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lab5.dir/src/Shape.cpp.o -c /Users/roslynsierra/GradGraphics/MarchingCubes/src/Shape.cpp

CMakeFiles/lab5.dir/src/Shape.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab5.dir/src/Shape.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/roslynsierra/GradGraphics/MarchingCubes/src/Shape.cpp > CMakeFiles/lab5.dir/src/Shape.cpp.i

CMakeFiles/lab5.dir/src/Shape.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab5.dir/src/Shape.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/roslynsierra/GradGraphics/MarchingCubes/src/Shape.cpp -o CMakeFiles/lab5.dir/src/Shape.cpp.s

CMakeFiles/lab5.dir/src/Shape.cpp.o.requires:
.PHONY : CMakeFiles/lab5.dir/src/Shape.cpp.o.requires

CMakeFiles/lab5.dir/src/Shape.cpp.o.provides: CMakeFiles/lab5.dir/src/Shape.cpp.o.requires
	$(MAKE) -f CMakeFiles/lab5.dir/build.make CMakeFiles/lab5.dir/src/Shape.cpp.o.provides.build
.PHONY : CMakeFiles/lab5.dir/src/Shape.cpp.o.provides

CMakeFiles/lab5.dir/src/Shape.cpp.o.provides.build: CMakeFiles/lab5.dir/src/Shape.cpp.o

# Object files for target lab5
lab5_OBJECTS = \
"CMakeFiles/lab5.dir/src/GLSL.cpp.o" \
"CMakeFiles/lab5.dir/src/main.cpp.o" \
"CMakeFiles/lab5.dir/src/MatrixStack.cpp.o" \
"CMakeFiles/lab5.dir/src/Program.cpp.o" \
"CMakeFiles/lab5.dir/src/Shape.cpp.o"

# External object files for target lab5
lab5_EXTERNAL_OBJECTS =

lab5: CMakeFiles/lab5.dir/src/GLSL.cpp.o
lab5: CMakeFiles/lab5.dir/src/main.cpp.o
lab5: CMakeFiles/lab5.dir/src/MatrixStack.cpp.o
lab5: CMakeFiles/lab5.dir/src/Program.cpp.o
lab5: CMakeFiles/lab5.dir/src/Shape.cpp.o
lab5: CMakeFiles/lab5.dir/build.make
lab5: /Users/roslynsierra/Graphics/glfw/debug/src/libglfw3.a
lab5: /usr/local/Cellar/glew/1.11.0/lib/libGLEW.a
lab5: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/System/Library/Frameworks/Cocoa.framework
lab5: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/System/Library/Frameworks/IOKit.framework
lab5: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/System/Library/Frameworks/CoreFoundation.framework
lab5: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/System/Library/Frameworks/CoreVideo.framework
lab5: CMakeFiles/lab5.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable lab5"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lab5.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lab5.dir/build: lab5
.PHONY : CMakeFiles/lab5.dir/build

CMakeFiles/lab5.dir/requires: CMakeFiles/lab5.dir/src/GLSL.cpp.o.requires
CMakeFiles/lab5.dir/requires: CMakeFiles/lab5.dir/src/main.cpp.o.requires
CMakeFiles/lab5.dir/requires: CMakeFiles/lab5.dir/src/MatrixStack.cpp.o.requires
CMakeFiles/lab5.dir/requires: CMakeFiles/lab5.dir/src/Program.cpp.o.requires
CMakeFiles/lab5.dir/requires: CMakeFiles/lab5.dir/src/Shape.cpp.o.requires
.PHONY : CMakeFiles/lab5.dir/requires

CMakeFiles/lab5.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/lab5.dir/cmake_clean.cmake
.PHONY : CMakeFiles/lab5.dir/clean

CMakeFiles/lab5.dir/depend:
	cd /Users/roslynsierra/GradGraphics/MarchingCubes/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/roslynsierra/GradGraphics/MarchingCubes /Users/roslynsierra/GradGraphics/MarchingCubes /Users/roslynsierra/GradGraphics/MarchingCubes/build /Users/roslynsierra/GradGraphics/MarchingCubes/build /Users/roslynsierra/GradGraphics/MarchingCubes/build/CMakeFiles/lab5.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/lab5.dir/depend

