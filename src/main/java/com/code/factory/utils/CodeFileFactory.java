package com.code.factory.utils;

import com.code.factory.bean.CodeConfigBean;
import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.*;
import java.util.HashMap;
import java.util.Map;

/**
 * 代码工厂
 */
public class CodeFileFactory {


    /**
     * 创建对应的bean
     * @param o 模板class
     */
    public static void createBeanCodeFile(CodeConfigBean o){
        System.out.println("bean文件生成开始...");
        createJavaFile(o,"bean.ftl","/model","");
        createJavaFile(o,"beanCondition.ftl","/model/condition","Condition");
        System.out.println("bean文件生成结束...");
    }

    /**
     * 创建对应的service and serviceimpl
     * @param o 模板class
     */
    public static void createServiceCodeFile(CodeConfigBean o){
        System.out.println("service文件生成开始...");
        createJavaFile(o,"service.ftl","/service","Service");
        createJavaFile(o,"serviceImpl.ftl","/service/impl","ServiceImpl");
        System.out.println("service文件生成结束...");
    }


    /**
     * 创建对应的dao
     * @param o 模板class
     */
    public static void createDaoCodeFile(CodeConfigBean o){
        System.out.println("dao文件生成开始...");
        createJavaFile(o,"dao.ftl","/dao","Dao");
        System.out.println("dao文件生成完成...");
    }


    /**
     * 创建对应的xml
     * @param o 模板class
     */
    public static void createMysqlXmlCodeFile(CodeConfigBean o){
        System.out.println("xml文件生成开始...");
        createXmlFile(o,"mapper_mysql.ftl","/sql-mappers-mysql");
        System.out.println("xml文件生成完成...");
    }

    /**
     * 创建对应的xml
     * @param o 模板class
     */
    public static void createOracelXmlCodeFile(CodeConfigBean o){
        System.out.println("xml文件生成开始...");
        createXmlFile(o,"mapper_oracle.ftl","/sql-mappers-oracle");
        System.out.println("xml文件生成完成...");
    }

    /**
     * 创建对应的html
     * @param o 模板class
     */
    public static void createHtmlCodeFile(CodeConfigBean o){
        System.out.println("html文件生成开始...");
        createHtmlFile(o,"page_list.ftl","_list");
        createHtmlFile(o,"page_edit.ftl","_edit");
        System.out.println("html文件生成开始...");
    }

    /**
     * 创建对应的controller
     * @param o 模板class
     */
    public static void createControllerCodeFile(CodeConfigBean o){
        System.out.println("controller文件生成开始...");
        createJavaFile(o,"controller.ftl","/controller","Controller");
        System.out.println("controller文件生成完成...");
    }


    /**
     * 创建对应的java文件
     * @param
     */
    private static void createJavaFile(CodeConfigBean bean, String templatName, String filePath,String type){
        try {
            Configuration cfg = FreeMakerUtils.configFreemaker();
            Template temp = cfg.getTemplate(templatName);
            File dir = new File(bean.getConfigBean().getProjectPath()+"/java/"+bean.getConfigBean().getPackagePath()+filePath);
            if(!dir.exists()){
                dir.mkdirs();
            }
            OutputStream fos = new FileOutputStream( new File(dir, bean.getBeanName()+type+".java")); //java文件的生成目录
            Writer out = new OutputStreamWriter(fos);
            Map<String,CodeConfigBean> map = new HashMap<>();
            map.put("bean",bean);
            temp.process(map, out);

            fos.flush();
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 创建对应的xml文件
     * @param
     */
    private static void createXmlFile(CodeConfigBean bean,String templatName,String packagePath){
        try {
            Configuration cfg = FreeMakerUtils.configFreemaker();
            Template temp = cfg.getTemplate(templatName);
            File dir = new File(bean.getConfigBean().getProjectPath()+"/resources/"+packagePath);
            if(!dir.exists()){
                dir.mkdirs();
            }
            OutputStream fos = new  FileOutputStream( new File(dir, bean.getBeanName()+"Dao.xml")); //java文件的生成目录
            Writer out = new OutputStreamWriter(fos);
            Map<String,CodeConfigBean> map = new HashMap<>();
            map.put("bean",bean);
            temp.process(map, out);

            fos.flush();
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 创建对应的xml文件
     */
    private static void createHtmlFile(CodeConfigBean bean,String templatName,String fileName){
        try {
            Configuration cfg = FreeMakerUtils.configFreemaker();
            Template temp = cfg.getTemplate(templatName);
            File dir = new File(bean.getConfigBean().getProjectPath()+"/"+bean.getConfigBean().getPagePath()+"/"+StringUtils.firstNameLower(bean.getBeanName()));
            if(!dir.exists()){
                dir.mkdirs();
            }
            OutputStream fos = new  FileOutputStream( new File(dir,StringUtils.firstNameLower(bean.getBeanName())+fileName+".html")); //java文件的生成目录
            Writer out = new OutputStreamWriter(fos);
            Map<String,CodeConfigBean> map = new HashMap<>();
            map.put("bean",bean);
            temp.process(map, out);

            fos.flush();
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 根据传入的条件创建文件
     * @param bean
     */
    public static void createFile(CodeConfigBean bean){
        System.out.println("文件生成开始........................");
        if(1 == bean.getBean())
            createBeanCodeFile(bean);
        if(1 == bean.getDao())
            createDaoCodeFile(bean);
        if(1 == bean.getService())
            createServiceCodeFile(bean);
        if(1 == bean.getController())
            createControllerCodeFile(bean);
        if(1 == bean.getHtml())
            createHtmlCodeFile(bean);
        if(1 == bean.getXml()){
            if("0".equals(bean.getDbbean().getDbType())){
                createMysqlXmlCodeFile(bean);
            }else{
                createOracelXmlCodeFile(bean);
            }
        }
        System.out.println("文件生成结束........................");

    }










}
