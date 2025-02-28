local __PlatformDir = {}
-- __PlatformDir["android"] = "Android"
-- __PlatformDir[""] = "DRM"
-- __PlatformDir["bsd"] = "FreeBSD"
-- __PlatformDir["ios"] = "iOS"
-- __PlatformDir["macosx"] = "macOS"
-- __PlatformDir[""] = "NetBSD"
-- __PlatformDir[""] = "OpenBSD"
__PlatformDir["linux"] = "Unix"
__PlatformDir["windows"] = "Win32"

function SFML_getPlatformSpecficSourceDirectory()
    return __PlatformDir["%{cfg.system}"] or "/"
end