package("rapidyaml")
    set_homepage("https://github.com/biojppm/rapidyaml")
    set_description("Rapid YAML parsing and emitting")
    set_license("MIT")

    set_urls("https://github.com/biojppm/rapidyaml.git")

    add_versions("0.10.0", "653eac9741c7728f2a87435b981737894149e002")

    add_configs("tab_tokens", {description = "Enable parsing of tabs after ':' and '-'. This is costly and disabled by default.", default = false, type = "boolean"})
    add_configs("exceptions", {description = "Throw exceptions instead of calling abort in the default error handler.", default = false, type = "boolean"})
    add_configs("shared", {description = "Build shared library.", default = false, type = "boolean"})

    add_deps("cmake")

    on_install(function (package)
        local configs = {
            "-DRYML_BUILD_TOOLS=OFF",     
            "-DRYML_BUILD_API=OFF",        
            "-DRYML_BUILD_TESTS=OFF",      
            "-DRYML_BUILD_BENCHMARKS=OFF", 
            "-DRYML_INSTALL=ON"            
        }

        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:is_debug() and "Debug" or "Release"))
        table.insert(configs, "-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF"))

        if package:config("tab_tokens") then
            table.insert(configs, "-DRYML_WITH_TAB_TOKENS=ON")
        end

        if package:config("exceptions") then
            table.insert(configs, "-DRYML_DEFAULT_CALLBACK_USES_EXCEPTIONS=ON")
        else
            table.insert(configs, "-DRYML_DEFAULT_CALLBACK_USES_EXCEPTIONS=OFF")
        end

        if package:config("shared") and package:is_plat("windows") then
            table.insert(configs, "-DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=ON")
        end

        import("package.tools.cmake").install(package, configs)
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
            #include <ryml.hpp>
            #include <c4/yml/std/string.hpp>
            void test() {
                const char* yaml = "{foo: 1}";
                ryml::Tree tree = ryml::parse_in_arena(ryml::to_csubstr(yaml));
            }
        ]]}, {configs = {languages = "c++11"}}))
    end)