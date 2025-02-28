project "SFML-Audio"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    -- pchheader "PCH.hpp"

    files {
        "%{wks.location}/include/SFML/Audio/*.hpp",
        "%{wks.location}/include/SFML/Audio/*.inl",
        "*.cpp",
        "*.hpp",
    }

    includedirs {
        "%{wks.location}/include",
        "%{wks.location}/src",
        
        IncludeDir["miniaudio"],
        IncludeDir["minimp3"],
    }

    defines {
        "OV_EXCLUDE_STATIC_CALLBACKS", 
        "FLAC__NO_DLL",

        "MA_NO_MP3", 
        "MA_NO_FLAC", 
        "MA_NO_ENCODING", 
        "MA_NO_RESOURCE_MANAGER", 
        "MA_NO_GENERATION",
        
        "MA_USE_STDINT",    

        -- "SFML_IS_BIG_ENDIAN"
    }

    links {
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
            "dl"
        }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

   filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"