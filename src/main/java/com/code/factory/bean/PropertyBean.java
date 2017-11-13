package com.code.factory.bean;

import com.code.factory.utils.StringUtils;

/**
 * 实体属性
 */
public class PropertyBean {
    /**
     * 字段名
     */
    private String fieldName;
    /**
     * 字段编码
     */
    private String fieldCode;
    /**
     * java类型
     */
    private String javaType;
    /**
     * 数据库类型
     */
    private String dbType;
    /**
     * 长度
     */
    private Integer length;
    /**
     * 精度
     */
    private Integer precision;
    /**
     * 是否是主键
     */
    private Integer keyFlag=0;
    /**
     * 是否必填
     */
    private Integer requiredFlag=0;
    /**
     * 是否是查询条件
     */
    private Integer searchFlag=0;
    /**
     * 是否列表展示
     */
    private Integer listFlag=0;
    /**
     * mybatis类型
     */
    private String mybatisType;


    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getFieldCode() {
        return fieldCode;
    }

    public void setFieldCode(String fieldCode) {
        this.fieldCode = fieldCode;
    }

    public String getJavaType() {
        return javaType;
    }

    public void setJavaType(String javaType) {
        this.javaType = javaType;
    }

    public String getDbType() {
        return dbType;
    }

    public void setDbType(String dbType) {
        this.dbType = dbType;
    }

    public Integer getLength() {
        return length;
    }

    public void setLength(Integer length) {
        this.length = length;
    }

    public Integer getPrecision() {
        return precision;
    }

    public void setPrecision(Integer precision) {
        this.precision = precision;
    }

    public Integer getKeyFlag() {
        return keyFlag;
    }

    public void setKeyFlag(Integer keyFlag) {
        this.keyFlag = keyFlag;
    }

    public Integer getRequiredFlag() {
        return requiredFlag;
    }

    public void setRequiredFlag(Integer requiredFlag) {
        this.requiredFlag = requiredFlag;
    }

    public Integer getSearchFlag() {
        return searchFlag;
    }

    public void setSearchFlag(Integer searchFlag) {
        this.searchFlag = searchFlag;
    }

    public Integer getListFlag() {
        return listFlag;
    }

    public void setListFlag(Integer listFlag) {
        this.listFlag = listFlag;
    }

    public String getMybatisType() {
        if(null!=this.javaType)
        return StringUtils.getMyBatisTypeByJava(this.javaType);
        return null;
    }

    public void setMybatisType(String mybatisType) {
        this.mybatisType = mybatisType;
    }
}
