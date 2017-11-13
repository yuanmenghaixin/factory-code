package com.code.factory.service;

import com.code.factory.bean.CodeConfigBean;
import com.code.factory.bean.ConfigBean;
import com.code.factory.bean.DbConfigBean;
import com.code.factory.utils.CodeFileFactory;
import com.code.factory.utils.DBUtils;
import com.code.factory.utils.MySqlDbUtils;
import com.code.factory.utils.SqlFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.util.List;

/**
 * dbconfig
 */
@Service
public class ConfigServiceImpl {

    @Value("${spring.datasource.url}")
    private String url ;
    @Value("${spring.datasource.username}")
    private String userName;
    @Value("${spring.datasource.password}")
    private String password;
    /**
     * 保存数据库配置
     * @param bean
     */
    public void saveDbConfig(DbConfigBean bean){
        Connection con = DBUtils.getConn(url,userName,password);
        DBUtils.saveDbConfig(bean,con);
    }


    public void saveConfig(ConfigBean configBean){
        Connection con = DBUtils.getConn(url,userName,password);
        DBUtils.saveConfig(configBean,con);
    }

    /**
     * 返回连接
     * @return
     */
    public Connection getCon(DbConfigBean bean){
       return  MySqlDbUtils.getConn(bean);
    }


    public List<DbConfigBean> dbConfigBeanList(){
        Connection con = DBUtils.getConn(url,userName,password);
        return DBUtils.dbConfigSearch(con,null);
    }

    public List<ConfigBean> configBeanList(){
        Connection con = DBUtils.getConn(url,userName,password);
        return DBUtils.configSearch(con,null);
    }

    /**
     * 代码生成主方法
     * @param bean
     */
    public void fileCreateFactory(CodeConfigBean bean){
        Connection con = DBUtils.getConn(url,userName,password);
        List<ConfigBean> cList = DBUtils.configSearch(con,bean.getConfigId());
        List<DbConfigBean> dList = DBUtils.dbConfigSearch(con,bean.getDbId());
        bean.setConfigBean(cList.get(0));
        bean.setDbbean(dList.get(0));
        CodeFileFactory.createFile(bean);
    }

    /**
     * 获取bean
     * @param id
     * @return
     */
    public ConfigBean getConfigBean(Long id){
        Connection con = DBUtils.getConn(url,userName,password);
        return DBUtils.configSearch(con,id).get(0);
    }


    /**
     * 获取bean
     * @param id
     * @return
     */
    public DbConfigBean getDbConfigBean(Long id){
        Connection con = DBUtils.getConn(url,userName,password);
        return DBUtils.dbConfigSearch(con,id).get(0);
    }

    /**
     * 创建建表语句
     * @param bean
     * @return
     */
    public String createTableSql(CodeConfigBean bean){
        Connection con = DBUtils.getConn(url,userName,password);
        List<ConfigBean> cList = DBUtils.configSearch(con,bean.getConfigId());
        List<DbConfigBean> dList = DBUtils.dbConfigSearch(con,bean.getDbId());
        bean.setConfigBean(cList.get(0));
        bean.setDbbean(dList.get(0));

        String tableSql = "";
        if("1".equals(bean.getDbbean().getDbType().trim())){
            tableSql = SqlFactory.createOracleTable(bean);
        }else{
            tableSql = SqlFactory.createMysqlTable(bean);
        }
        return tableSql;
    }

    /**
     * 创建菜单/资源/权限sql
     * @param bean
     * @return
     */
    public String createMenuSql(CodeConfigBean bean){
        Connection con = DBUtils.getConn(url,userName,password);
        List<ConfigBean> cList = DBUtils.configSearch(con,bean.getConfigId());
        List<DbConfigBean> dList = DBUtils.dbConfigSearch(con,bean.getDbId());
        bean.setConfigBean(cList.get(0));
        bean.setDbbean(dList.get(0));

        String menuSql = "";
        if("1".equals(bean.getDbbean().getDbType().trim())){
            menuSql = SqlFactory.createOracleMenu(bean);
        }else{
            menuSql = SqlFactory.createMysqlMenu(bean);
        }
        return menuSql;
    }


}
