package com.code.factory.utils;

import freemarker.template.Configuration;
import freemarker.template.TemplateExceptionHandler;

import java.io.File;
import java.io.IOException;
import java.net.URL;

/**
 * freemaker 配置信息
 */
public class FreeMakerUtils {



    /**
     * 获取freemaker配置信息
     * @return
     */
    public static Configuration configFreemaker() {
        try {
            Configuration cfg = new Configuration();
            cfg.setDirectoryForTemplateLoading(new File(templateDir()));
            cfg.setDefaultEncoding("UTF-8");
            cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
            return cfg;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static String templateDir(){
        URL u = Thread.currentThread().getContextClassLoader().getResource("ftl");
        return u.getPath();
    }


}
