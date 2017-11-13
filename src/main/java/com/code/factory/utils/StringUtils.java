package com.code.factory.utils;

/**
 * Created by Gao.WenLong on 2017/3/29.
 */
public class StringUtils {


    /**
     * 根据传入的字段构建驼峰式命名规则
     * @param name
     * @return
     */
    public static String buildFieldName(String name){
        if(isEmpty(name))return name;
        if(!name.contains("-"))return name;
        String []names = name.toLowerCase().split("-");
        StringBuilder sb = new StringBuilder(names[0]);
        for(int i=1;i<names.length;i++){
            sb.append(names[i].substring(0,1).toUpperCase()+names[i].substring(1)) ;
        }
        return sb.toString();
    }

    /**
     * 首字母小写
     * @param name
     * @return
     */
    public static String firstNameLower(String name){
        if(isEmpty(name))return name;
        return  name.substring(0,1).toLowerCase()+name.substring(1);
    }

    /**
     * 获取当前方法的参数
     * @param method
     * @return
     */
    public static String  getMethod(String method){
        String methodName = method.substring(0,method.indexOf("("));
        String []arr = method.split(",");
        StringBuilder sb = new StringBuilder(methodName).append("(");
        for(String str : arr){
            sb.append(str.split(" ")[1]).append(",");
        }
        //System.out.println(sb.substring(0,sb.length()-1)+")");
        return sb.substring(0,sb.length()-1);
    }


    /**
     * 返回数据库类型对应的java类型
     * @param type
     * @return
     */
    public static String getJavaType(String type){
        if(isEmpty(type))return null;
        if(type.startsWith("varchar"))
            return "String";
        if(type.startsWith("date"))
            return "Date";
        if(type.startsWith("char"))
            return "String";
        if(type.startsWith("int"))
            return "Integer";
        if(type.startsWith("bigint"))
            return "Integer";
        if(type.startsWith("integer"))
            return "Integer";
        if(type.startsWith("double"))
            return "Double";
        if(type.startsWith("float"))
            return "Double";
        if(type.startsWith("text"))
            return "String";
        if(type.startsWith("nvarchar"))
            return "String";
        if(type.startsWith("decimal"))
            return "Double";
        return "";
    }

    /**
     * 返回数据库类型对应mybatis的数据类型
     * @param type
     * @return
     */
    public static String getMyBatisType(String type){
        if(isEmpty(type))return null;
        if(type.startsWith("varchar"))
            return "VARCHAR";
        if(type.startsWith("date"))
            return "TIMESTAMP";
        if(type.startsWith("char"))
            return "VARCHAR";
        if(type.startsWith("int"))
            return "NUMERIC";
        if(type.startsWith("bigint"))
            return "NUMERIC";
        if(type.startsWith("integer"))
            return "NUMERIC";
        if(type.startsWith("double"))
            return "NUMERIC";
        if(type.startsWith("float"))
            return "NUMERIC";
        if(type.startsWith("text"))
            return "VARCHAR";
        if(type.startsWith("decimal"))
            return "NUMERIC";
        if(type.startsWith("number"))
            return "NUMERIC";
        if(type.startsWith("nvarchar"))
            return "VARCHAR";
        return "";
    }


    /**
     * 返回数据库类型对应mybatis的数据类型
     * @param type
     * @return
     */
    public static String getMyBatisTypeByJava(String type){
        if(isEmpty(type))return null;
        if(type.equals("Long"))
            return "NUMERIC";
        if(type.equals("Date"))
            return "TIMESTAMP";
        if(type.equals("String"))
            return "VARCHAR";
        if(type.equals("Integer"))
            return "NUMERIC";
        if(type.equals("Float"))
            return "NUMERIC";
        if(type.equals("Double"))
            return "NUMERIC";
        return "";
    }

    /**
     * 判断字符串是否是空
     * @param str
     * @return
     */
    public static boolean isEmpty(String str){
        if(null == str || str.length()==0)return true;
        return false;
    }


    public static void main(String[] args) {
        System.out.println(getMethod("search(String aa,String bb,int i)"));
    }

}
