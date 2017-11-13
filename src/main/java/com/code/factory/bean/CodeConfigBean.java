package com.code.factory.bean;

import java.util.Date;
import java.util.List;

/**
 * 代码属性
 */
public class CodeConfigBean {

    /**
     * 数据库配置
     */
    private Long dbId;
    /**
     * 文件存储配置
     */
    private Long configId;
    /**
     * 实体名称
     */
    private String beanName;
    /**
     * 菜单名称
     */
    private String menuName;

    /**
     * 表名
     */
    private String tableName;
    /**
     * 以下的数据为0表示不生成
     */
    private Integer bean = 0;
    private Integer xml = 0;
    private Integer dao = 0;
    private Integer service = 0;
    private Integer controller = 0;
    private Integer html = 0;
    private Integer isCreate =1;

    //属性值
    private List<PropertyBean> proList ;
    /**
     * 数据库连接信息
     */
    private DbConfigBean dbbean;

    /**
     * 配置信息
     */
    private ConfigBean configBean;

    /**
     * 创建日期
     */
    private Date createDate;

    public Long getDbId() {
        return dbId;
    }

    public void setDbId(Long dbId) {
        this.dbId = dbId;
    }

    public Long getConfigId() {
        return configId;
    }

    public void setConfigId(Long configId) {
        this.configId = configId;
    }

    public String getBeanName() {
        return beanName;
    }

    public void setBeanName(String beanName) {
        this.beanName = beanName;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public Integer getBean() {
        return bean;
    }

    public void setBean(Integer bean) {
        this.bean = bean;
    }

    public Integer getXml() {
        return xml;
    }

    public void setXml(Integer xml) {
        this.xml = xml;
    }

    public Integer getDao() {
        return dao;
    }

    public void setDao(Integer dao) {
        this.dao = dao;
    }

    public Integer getService() {
        return service;
    }

    public void setService(Integer service) {
        this.service = service;
    }

    public Integer getController() {
        return controller;
    }

    public void setController(Integer controller) {
        this.controller = controller;
    }

    public Integer getHtml() {
        return html;
    }

    public void setHtml(Integer html) {
        this.html = html;
    }

    public List<PropertyBean> getProList() {
        return proList;
    }

    public void setProList(List<PropertyBean> proList) {
        this.proList = proList;
    }

    public DbConfigBean getDbbean() {
        return dbbean;
    }

    public void setDbbean(DbConfigBean dbbean) {
        this.dbbean = dbbean;
    }

    public ConfigBean getConfigBean() {
        return configBean;
    }

    public void setConfigBean(ConfigBean configBean) {
        this.configBean = configBean;
    }

    public Date getCreateDate() {
        return new Date();
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getIsCreate() {
        return isCreate;
    }

    public void setIsCreate(Integer isCreate) {
        this.isCreate = isCreate;
    }
}
