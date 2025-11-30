package("awakelion-logger")
    set_kind("library", {headeronly = true})
    set_homepage("https://github.com/AwakeLion-Robot-Lab/awakelion-logger")
    set_description("A low-latency, high-throughput and few-dependencies logger for `AwakeLion Robot Lab` project.")
    set_license("Apache-2.0")

    add_deps("ixwebsocket v11.4.6")

    add_urls("https://github.com/AwakeLion-Robot-Lab/awakelion-logger.git")

    add_versions("1.2.5", "6adc04c43715569b65786b5f4eb13de9f37fbe20")
    add_versions("1.2.4", "4cdc771350c2ca7ac635d985b40a4d5a61cc0306")

    on_load(function (package)
        package:add("includedirs", package:installdir("include"))
        package:add("resdirs", package:installdir("share/aw_logger"))
    end)

    on_install(function (package)
        local configs = {}
        if package:config("shared") then
            configs.kind = "shared"
        end
        configs.target = "fosu-awakelion.awakelion-logger"
        import("package.tools.xmake").install(package, configs)
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
            #include "aw_logger/aw_logger.hpp"
            void test() {
                auto logger = aw_logger::getLogger("test");
                if(logger != nullptr)
                    AW_LOG_NOTICE(logger, "hello, awakelion-logger!");
            }
        ]]}, {configs = {languages = "c++20"}}))
    end)
