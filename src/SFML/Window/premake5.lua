project "SFML-Window"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    -- pchheader "PCH.hpp"

    files {
        "%{wks.location}/include/SFML/Window/*.hpp",
        "%{wks.location}/include/SFML/Window/*.inl",
        "*.cpp",
        "*.hpp",
        "*.inl",
        "*.c",
        "*.h",
        SFML_PlatformDirName .. "/*.cpp",
        SFML_PlatformDirName .. "/*.hpp",
        SFML_PlatformDirName .. "/*.inl",
        SFML_PlatformDirName .. "/*.c",
        SFML_PlatformDirName .. "/*.h",
        SFML_PlatformDirName .. "/*.mm",
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
        -- Link window Library
        "SFML-System",

        "freetype",
        "opengl",

        "opengl32",
        "ws2_32"
    }
    
    filter "system:windows"
        links {
            "winmm",
            "gdi32"
        }

    filter { "action:gmake*", "toolset:gcc" }
        includedirs {
            IncludeDir["MinGW"],
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