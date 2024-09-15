project "imgui"
    kind "StaticLib"
    language "C++"

    targetdir ("%{wks.location}/bin/" .. outputDir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputDir .. "/%{prj.name}")

    includedirs
    {
       "%{IncludeDirs.imgui}",
       "%{IncludeDirs.GLFW}"
    }

    files
    {
        "*.h",
        "*.cpp",
        "backends/imgui_impl_glfw.cpp",
        "backends/imgui_impl_glfw.h",
        "backends/imgui_impl_opengl3.cpp",
        "backends/imgui_impl_opengl3.h",
        "backends/imgui_impl_opengl3_loader.h",

        --"backends/opengl2.h",
        --"backends/opengl2.cpp",

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
