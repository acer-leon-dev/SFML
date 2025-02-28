project "SFML-Graphics"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    -- pchheader "PCH.hpp"

    files {
        "%{wks.location}/include/SFML/Graphics/*.hpp",
        "%{wks.location}/include/SFML/Graphics/*.inl",
        "*.cpp",
        "*.hpp"
    }
    
    includedirs {
        "%{wks.location}/include",
        "%{wks.location}/src",
        
        IncludeDir["GLAD"],
        IncludeDir["stb_image"],
        IncludeDir["vulkan"],
    }

    links {
        -- Link window Library
        "SFML-Window",

        "freetype",
        "opengl",

        "opengl32",
        "ws2_32",
    }

    defines {
        "STBI_FAILURE_USERMSG",
    }
    filter "system:windows"
        links {
            "winmm",
            "gdi32",
        }
    
    filter "system:linux"
        links {
            "udev",
            "pthread",

            "x11",
            "xrandr",
            "xcursor",
            "xi",
        }

    filter "toolset:gcc and file:Image.cpp"
        flags {
            "-fno-strict-aliasing",
        }
    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

   filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"