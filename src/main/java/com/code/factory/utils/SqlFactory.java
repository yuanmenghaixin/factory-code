package com.code.factory.utils;

import com.code.factory.bean.CodeConfigBean;
import com.code.factory.bean.PropertyBean;
import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

/**
 * 根据实体创建对应的表结构\菜单\资源\权限赋值
 */
public class SqlFactory {


    /**
     * 创建oracle建表语句包含sequence
     * @param bean
     * @return
     */
    public static String createOracleTable(CodeConfigBean bean){
        System.out.println("oracle建表语句开始生成...");
        String sql = createSql(bean,"table_oracle.ftl");
        System.out.println("oracle建表语句生成结束...");
        return sql;
    }

    /**
     * 创建mysql建表语句
     * @param bean
     * @return
     */
    public static String createMysqlTable(CodeConfigBean bean){
        System.out.println("mysql建表语句开始生成...");
        String sql = createSql(bean,"table_mysql.ftl");
        System.out.println("mysql建表语句生成结束...");
        return sql;
    }

    /**
     * 创建对应的菜单、资源和权限分配 默认工厂为1001
     * @param bean
     * @return
     */
    public static String createOracleMenu(CodeConfigBean bean){
        System.out.println("oracle菜单语句开始生成...");
        String sql = createSql(bean,"menu_oracle.ftl");
        System.out.println("oracle菜单语句生成结束...");
        return sql;
    }

    /**
     * 创建对应的菜单、资源和权限分配 默认工厂为1001
     * @param bean
     * @return
     */
    public static String createMysqlMenu(CodeConfigBean bean){
        System.out.println("mysql菜单语句开始生成...");
        String sql = createSql(bean,"menu_mysql.ftl");
        System.out.println("mysql菜单语句生成结束...");
        return sql;
    }

    /**
     * 根据模板创建对应的sql
     * @param
     */
    private static String  createSql(CodeConfigBean bean, String templatName){
        try {
            Configuration cfg = FreeMakerUtils.configFreemaker();
            Template temp = cfg.getTemplate(templatName);
            Writer out = new StringWriter();
            Map<String,CodeConfigBean> map = new HashMap<>();
            map.put("bean",bean);
            temp.process(map, out);
            System.out.println(out.toString());
            return out.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }


}
