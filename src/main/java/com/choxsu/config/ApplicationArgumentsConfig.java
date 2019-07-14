package com.choxsu.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Accessing(访问) Application Arguments
 *
 * @author choxsu
 * @date 2019/7/1
 */
@Component
public class ApplicationArgumentsConfig {

    private final ApplicationArguments arguments;

    @Autowired
    public ApplicationArgumentsConfig(ApplicationArguments arguments) {
        this.arguments = arguments;
    }

    private boolean containsDebugOption() {
        boolean debug = arguments.containsOption("debug");
        List<String> files = arguments.getNonOptionArgs();
        // if run with "--debug logfile.txt" debug=true, files=["logfile.txt"]
        return debug;
    }
}
