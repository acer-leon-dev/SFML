project "SFML-Network"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    -- pchheader "PCH.hpp"

    files {
        "%{wks.location}/include/SFML/Network/*.hpp",
        "%{wks.location}/include/SFML/Network/*.inl",
        "*.cpp",
        "*.hpp",
        "*.c",
        "*.h",
        SFML_PlatformDirName .. "/SocketImpl.cpp",
    }

    includedirs {
        "%{wks.location}/include",
        "%{wks.location}/src",
        
        IncludeDir["GLAD"],
        IncludeDir["MinGW"],
        IncludeDir["miniaudio"],
        IncludeDir["minimp3"],
        IncludeDir["stb_image"],
        IncludeDir["vulkan"],
    }

    links {
        "freetype",
        "opengl",

        "opengl32",
        "winmm",
        "gdi32",
        "ws2_32"
    }
    
    filter "system:linux"
        links {
            "udev",
            "pthread",
        }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

   filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"