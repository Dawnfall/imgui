add_library(imgui STATIC 
    imgui.cpp
    imgui_draw.cpp
    imgui_widgets.cpp
    imgui_tables.cpp
    imgui_demo.cpp
    backends/imgui_impl_opengl3.cpp
    backends/imgui_impl_win32.cpp
)

set_source_files_properties(
    backends/imgui_impl_win32.cpp
    PROPERTIES LANGUAGE CXX
)

target_include_directories(imgui PUBLIC 
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/backends
)

# Core definitions and Windows compile safety
target_compile_definitions(imgui PUBLIC
    IMGUI_IMPL_WIN32_DISABLE_GAMEPAD
    WIN32_LEAN_AND_MEAN
    NOMINMAX
)



# Link system libs
target_link_libraries(imgui PUBLIC
    opengl32
    user32
    gdi32
    shell32
    ole32
)

# Ensure we don't force-engine-wide options into ImGui
set_target_properties(imgui PROPERTIES
    UNITY_BUILD OFF
    UNITY_BUILD_BATCH_SIZE 1
)
