# GNU Make project makefile autogenerated by Premake

ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild prelink

ifeq ($(config),debug)
  ifeq ($(origin CC), default)
    CC = gcc
  endif
  ifeq ($(origin CXX), default)
    CXX = g++
  endif
  ifeq ($(origin AR), default)
    AR = ar
  endif
  RESCOMP = windres
  TARGETDIR = bin/Debug-windows-/SFML-Main
  TARGET = $(TARGETDIR)/SFML-Main.lib
  OBJDIR = bin-int/Debug-windows-/SFML-Main
  DEFINES += -DDEBUG
  INCLUDES += -Iextlibs/headers/glad/include -Iextlibs/headers/mingw -Iextlibs/headers/miniaudio -Iextlibs/headers/minimp3 -Iextlibs/headers/stb_image -Iextlibs/headers/vulkan -Iinclude -Isrc
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -g
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -g -std=c++23
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += -lfreetype -lopengl -lflac -logg -lvorbis -lvorbisenc -lvorbisfile -lopengl32 -lwinmm -lgdi32 -lws2_32
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS)
  LINKCMD = $(AR) -rcs "$@" $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),release)
  ifeq ($(origin CC), default)
    CC = gcc
  endif
  ifeq ($(origin CXX), default)
    CXX = g++
  endif
  ifeq ($(origin AR), default)
    AR = ar
  endif
  RESCOMP = windres
  TARGETDIR = bin/Release-windows-/SFML-Main
  TARGET = $(TARGETDIR)/SFML-Main.lib
  OBJDIR = bin-int/Release-windows-/SFML-Main
  DEFINES += -DNDEBUG
  INCLUDES += -Iextlibs/headers/glad/include -Iextlibs/headers/mingw -Iextlibs/headers/miniaudio -Iextlibs/headers/minimp3 -Iextlibs/headers/stb_image -Iextlibs/headers/vulkan -Iinclude -Isrc
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -O2
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -O2 -std=c++23
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += -lfreetype -lopengl -lflac -logg -lvorbis -lvorbisenc -lvorbisfile -lopengl32 -lwinmm -lgdi32 -lws2_32
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -s
  LINKCMD = $(AR) -rcs "$@" $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: prebuild prelink $(TARGET)
	@:

endif

OBJECTS := \
	$(OBJDIR)/MainAndroid.o \
	$(OBJDIR)/MainWin32.o \
	$(OBJDIR)/MainiOS.o \

RESOURCES := \

CUSTOMFILES := \

SHELLTYPE := posix
ifeq (.exe,$(findstring .exe,$(ComSpec)))
	SHELLTYPE := msdos
endif

$(TARGET): $(GCH) ${CUSTOMFILES} $(OBJECTS) $(LDDEPS) $(RESOURCES) | $(TARGETDIR)
	@echo Linking SFML-Main
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(CUSTOMFILES): | $(OBJDIR)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning SFML-Main
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink: $(OBJECTS)
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(OBJECTS): $(GCH) $(PCH) | $(OBJDIR)
$(GCH): $(PCH) | $(OBJDIR)
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
else
$(OBJECTS): | $(OBJDIR)
endif

$(OBJDIR)/MainAndroid.o: src/SFML/Main/MainAndroid.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/MainWin32.o: src/SFML/Main/MainWin32.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/MainiOS.o: src/SFML/Main/MainiOS.mm
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif