package com.spureb.willow.config;

import org.beetl.core.ConsoleErrorHandler;
import org.beetl.core.exception.BeetlException;
import org.beetl.core.exception.ErrorInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.Writer;

public class MyConsoleErrorHandler extends ConsoleErrorHandler {

    private Logger logger = LoggerFactory.getLogger(MyConsoleErrorHandler.class);

    @Override
    public void processExcption(BeetlException ex, Writer writer) {
        super.processExcption(ex, writer);
        ErrorInfo error = new ErrorInfo(ex);
        StringBuilder sb = new StringBuilder(">>").append(this.getDateTime()).append(":");
        sb.append(error.getType());
        sb.append(":");
        sb.append(error.getErrorTokenText());
        sb.append("位于");
        sb.append(error.getErrorTokenLine());
        sb.append("行资源:");
        sb.append(getResourceName(ex.resource.getId()));
        sb.append("\n");

        logger.info(sb.toString());
    }
}
