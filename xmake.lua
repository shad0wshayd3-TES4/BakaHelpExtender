-- set minimum xmake version
set_xmakever("2.8.2")

-- includes
includes("lib/commonlibob64")

-- set project
set_project("BakaHelpExtender")
set_version("1.0.0")
set_license("GPL-3.0")

-- set defaults
set_languages("c++23")
set_warnings("allextra")

-- set policies
set_policy("build.optimization.lto", true)
set_policy("package.requires_lock", true)

-- add rules
add_rules("mode.debug", "mode.releasedbg")
add_rules("plugin.vsxmake.autoupdate")

-- targets
target("BakaHelpExtender")
    -- add dependencies to target
    add_deps("commonlibob64")

    -- add commonlibob64 plugin
    add_rules("commonlibob64.plugin", {
        name = "BakaHelpExtender",
        author = "shad0wshayd3"
    })

    -- add src files
    add_files("src/**.cpp")
    add_headerfiles("src/**.h")
    add_includedirs("src")
    set_pcxxheader("src/pch.h")

    -- add extra files
    add_extrafiles(".clang-format")
