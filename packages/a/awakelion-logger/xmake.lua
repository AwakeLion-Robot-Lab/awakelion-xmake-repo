package("awakelion-logger")
    set_kind("library", {headeronly = true})
    set_description("A low-latency, high-throughput and few-dependencies logger for `AwakeLion Robot Lab` project.")
    set_license("Apache-2.0")
    add_deps("ixwebsocket v11.4.6")

    add_urls("https://github.com/AwakeLion-Robot-Lab/awakelion-logger.git")
    add_versions("1.2.4", "179489a39be4f6b69320f6ae7b4756bff24b3388")

    on_install(function (package)
        local configs = {}
        if package:config("shared") then
            configs.kind = "shared"
        end
        import("package.tools.xmake").install(package, configs)
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
            #include "aw_logger/aw_logger.hpp"
            void test() {
                auto logger = aw_logger::getLogger("test");
                if(logger != nullptr) 
                    AW_LOG_NOTICE("hello, awakelion-logger!");
            }
        ]]}, {configs = {languages = "c++20"}}))
    end)
