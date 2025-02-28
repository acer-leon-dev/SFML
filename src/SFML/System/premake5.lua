project "SFML-System"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    -- pchheader "PCH.hpp"

    files {
        "%{wks.location}/include/SFML/System/*.hpp",
        "%{wks.location}/include/SFML/System/*.inl",
        "*.cpp",
        "*.hpp",
        "*.inl",
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
        "SFML-System"
    }
    
    filter "system:windows"
        links {
            "winmm",
        }

    filter "system:linux"
        links {
            "rt",

            "udev",
            "pthread",
        }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

   filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"