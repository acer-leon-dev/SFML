IncludeDir = {}
IncludeDir["GLAD"] = "extlibs/headers/glad/include"
IncludeDir["MinGW"] = "extlibs/headers/mingw"
IncludeDir["miniaudio"] = "extlibs/headers/miniaudio"
IncludeDir["minimp3"] = "extlibs/headers/minimp3"
IncludeDir["stb_image"] = "extlibs/headers/stb_image"
IncludeDir["vulkan"] = "extlibs/headers/vulkan"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

function get_platform_directory()
    local __PlatformDir = {}
    __PlatformDir["android"] = "Android"
    -- __PlatformDir[""] = "DRM"
    __PlatformDir["bsd"] = "FreeBSD"
    __PlatformDir["ios"] = "iOS"
    __PlatformDir["macosx"] = "macOS"
    -- __PlatformDir[""] = "NetBSD"
    -- __PlatformDir[""] = "OpenBSD"
    __PlatformDir["linux"] = "Unix"
    __PlatformDir["windows"] = "Win32"
    return __PlatformDir["%{cfg.system}"] or ""
end

SFML_PlatformDirName = get_platform_directory()

workspace "SFML"
    configurations { "Debug", "Release" }

project "SFML-System"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    -- pchheader "PCH.hpp"

    files {
        "include/SFML/System/*.hpp",
        "include/SFML/System/*.inl",
        "src/SFML/System/*.cpp",
        "src/SFML/System/*.hpp",
        "src/SFML/System/*.inl",
        "src/SFML/System/" .. SFML_PlatformDirName .. "/*.cpp",
        "src/SFML/System/" .. SFML_PlatformDirName .. "/*.hpp",
        "src/SFML/System/" .. SFML_PlatformDirName .. "/*.inl",
        "src/SFML/System/" .. SFML_PlatformDirName .. "/*.c",
        "src/SFML/System/" .. SFML_PlatformDirName .. "/*.h",
        "src/SFML/System/" .. SFML_PlatformDirName .. "/*.mm",
    }

    includedirs {
        IncludeDir["GLAD"],
        IncludeDir["MinGW"],
        IncludeDir["miniaudio"],
        IncludeDir["minimp3"],
        IncludeDir["stb_image"],
        IncludeDir["vulkan"],
        "include",
        "src",
    }

    links {
        "freetype",
        "opengl",
        "flac",
        "ogg",
        "vorbis",
        "vorbisenc",
        "vorbisfile",

        "opengl32",
        "winmm",
        "gdi32",
        "ws2_32"
    }
    
    filter "system:linux"
        links {
            "udev",
            "x11",
            "xrandr",
            "xcursor",
            "xi",
            "pthread",
        }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

   filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

project "SFML-Graphics"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    -- pchheader "PCH.hpp"

    files {
        "include/SFML/Graphics/*.hpp",
        "include/SFML/Graphics/*.inl",
        "src/SFML/Graphics/*.cpp",
        "src/SFML/Graphics/*.hpp"
    }

    links {
        "freetype",
        "opengl",
        "flac",
        "ogg",
        "vorbis",
        "vorbisenc",
        "vorbisfile",

        "opengl32",
        "winmm",
        "gdi32",
        "ws2_32"
    }

    includedirs {
        IncludeDir["GLAD"],
        IncludeDir["MinGW"],
        IncludeDir["miniaudio"],
        IncludeDir["minimp3"],
        IncludeDir["stb_image"],
        IncludeDir["vulkan"],
        "include",
        "src",
    }
    
    filter "system:linux"
        links {
            "udev",
            "x11",
            "xrandr",
            "xcursor",
            "xi",
            "pthread",
        }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

   filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

project "SFML-Window"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    -- pchheader "PCH.hpp"

    files {
        "include/SFML/Window/*.hpp",
        "include/SFML/Window/*.inl",
        "src/SFML/Window/*.cpp",
        "src/SFML/Window/*.hpp",
        "src/SFML/Window/*.inl",
        "src/SFML/Window/*.c",
        "src/SFML/Window/*.h",
        "src/SFML/Window/" .. SFML_PlatformDirName .. "/*.cpp",
        "src/SFML/Window/" .. SFML_PlatformDirName .. "/*.hpp",
        "src/SFML/Window/" .. SFML_PlatformDirName .. "/*.inl",
        "src/SFML/Window/" .. SFML_PlatformDirName .. "/*.c",
        "src/SFML/Window/" .. SFML_PlatformDirName .. "/*.h",
        "src/SFML/Window/" .. SFML_PlatformDirName .. "/*.mm",
    }

    includedirs {
        IncludeDir["GLAD"],
        IncludeDir["MinGW"],
        IncludeDir["miniaudio"],
        IncludeDir["minimp3"],
        IncludeDir["stb_image"],
        IncludeDir["vulkan"],
        "include",
        "src",
    }

    links {
        "freetype",
        "opengl",
        "flac",
        "ogg",
        "vorbis",
        "vorbisenc",
        "vorbisfile",

        "opengl32",
        "winmm",
        "gdi32",
        "ws2_32"
    }
    
    filter "system:linux"
        links {
            "udev",
            "x11",
            "xrandr",
            "xcursor",
            "xi",
            "pthread",
        }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

   filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

project "SFML-Audio"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    -- pchheader "PCH.hpp"

    files {
        "include/SFML/Audio/*.hpp",
        "include/SFML/Audio/*.inl",
        "src/SFML/Audio/*.cpp",
        "src/SFML/Audio/*.hpp",
    }

    includedirs {
        IncludeDir["GLAD"],
        IncludeDir["MinGW"],
        IncludeDir["miniaudio"],
        IncludeDir["minimp3"],
        IncludeDir["stb_image"],
        IncludeDir["vulkan"],
        "include",
        "src",
    }

    links {
        "freetype",
        "opengl",
        "flac",
        "ogg",
        "vorbis",
        "vorbisenc",
        "vorbisfile",

        "opengl32",
        "winmm",
        "gdi32",
        "ws2_32"
    }
    
    filter "system:linux"
        links {
            "udev",
            "x11",
            "xrandr",
            "xcursor",
            "xi",
            "pthread",
        }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

   filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

project "SFML-Network"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    -- pchheader "PCH.hpp"

    files {
        "include/SFML/Network/*.hpp",
        "include/SFML/Network/*.inl",
        "src/SFML/Network/*.cpp",
        "src/SFML/Network/*.hpp",
        "src/SFML/Network/*.c",
        "src/SFML/Network/*.h",
        "src/SFML/Network/" .. SFML_PlatformDirName .. "/SocketImpl.cpp",
    }

    includedirs {
        IncludeDir["GLAD"],
        IncludeDir["MinGW"],
        IncludeDir["miniaudio"],
        IncludeDir["minimp3"],
        IncludeDir["stb_image"],
        IncludeDir["vulkan"],
        "include",
        "src",
    }

    links {
        "freetype",
        "opengl",
        "flac",
        "ogg",
        "vorbis",
        "vorbisenc",
        "vorbisfile",

        "opengl32",
        "winmm",
        "gdi32",
        "ws2_32"
    }
    
    filter "system:linux"
        links {
            "udev",
            "x11",
            "xrandr",
            "xcursor",
            "xi",
            "pthread",
        }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

   filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

project "SFML-Main"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    -- pchheader "PCH.hpp"

    files {
        "include/SFML/Main.hpp",
        "src/SFML/Main/*.cpp",
        "src/SFML/Main/MainiOS.mm"
    }

    includedirs {
        IncludeDir["GLAD"],
        IncludeDir["MinGW"],
        IncludeDir["miniaudio"],
        IncludeDir["minimp3"],
        IncludeDir["stb_image"],
        IncludeDir["vulkan"],
        "include",
        "src",
    }

    links {
        "freetype",
        "opengl",
        "flac",
        "ogg",
        "vorbis",
        "vorbisenc",
        "vorbisfile",

        "opengl32",
        "winmm",
        "gdi32",
        "ws2_32"
    }
    
    filter "system:linux"
        links {
            "udev",
            "x11",
            "xrandr",
            "xcursor",
            "xi",
            "pthread",
        }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"


