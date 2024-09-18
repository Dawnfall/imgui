project "imgui"
    kind "StaticLib"
    language "C++"

    targetdir ("%{wks.location}/bin/" .. outputDir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputDir .. "/%{prj.name}")

    includedirs
    {
       "%{wks.location}/Dependencies/imgui",
       "%{wks.location}/Dependencies/SDL/include"
    }

    files
    {
        "*.h",
        "*.cpp",
        "backends/imgui_impl_sdl2.h",
        "backends/imgui_impl_sdl2.cpp",
        "backends/imgui_impl_sdlrenderer2.h",
        "backends/imgui_impl_sdlrenderer2.cpp",

        "misc/debuggers/imgui.natvis",
        "misc/debuggers/imgui.natstepfilter",
        "misc/cpp/imgui_stdlib.*"    
    }

    filter "system:windows"
        systemversion "latest"
        cppdialect "C++20"
        staticruntime "On"

    filter "configurations:Debug"
        runtime "debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
