include "Dependencies.lua"
include "Functions.lua"

workspace "SFML"
    architecture "x86_64"
    
    configurations 
    {
        "Debug",
        "Release" 
    }

SFML_PlatformDirName = SFML_getPlatformSpecficSourceDirectory()
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

group "Dependencies"
    include "src/SFML/System"
    include "src/SFML/Window"
    include "src/SFML/Graphics"
    include "src/SFML/Audio"
    include "src/SFML/Network"
    include "src/SFML/Main"
group ""





