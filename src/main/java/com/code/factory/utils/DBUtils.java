package com.code.factory.utils;

import com.code.factory.bean.ConfigBean;
import com.code.factory.bean.DbConfigBean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 数据库工具类
 */
public class DBUtils {

    /**
     * 获取数据库链接
     * @return
     */
    public static Connection getConn(String url,String userName,String password){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(url,userName,password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }


    /**
     * 保存数据库配置
     * @param bean
     */
    public static void saveDbConfig(DbConfigBean bean,Connection con){

        String sql = "insert into db_config(dbType,ip,port,dbName,userName,password,linkName)" +
                "values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,bean.getDbType());
            ps.setString(2,bean.getIp());
            ps.setInt(3,bean.getPort());
            ps.setString(4,bean.getDbName());
            ps.setString(5,bean.getUserName());
            ps.setString(6,bean.getPassword());
            ps.setString(7,bean.getLinkName());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    /**
     * 保存存储配置
     * @param bean
     * @param con
     */
    public static void saveConfig(ConfigBean bean, Connection con){
        String sql = "insert into t_config(configName,projectPath,packageName,pagePath,relativePath)" +
                "values(?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,bean.getConfigName());
            ps.setString(2,bean.getProjectPath());
            ps.setString(3,bean.getPackageName());
            ps.setString(4,bean.getPagePath());
            ps.setString(5,bean.getRelativePath());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 查询
     * @param con
     * @return
     */
    public static List<ConfigBean> configSearch(Connection con,Long id){
        String sql = "select id,configName,packageName,pagePath,projectPath,relativePath from t_config";
        if(null != id){
            sql +=" where id = "+id;
        }
        List<ConfigBean> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ConfigBean bean = null;
            while(rs.next()){
                bean = new ConfigBean();
                bean.setConfigName(rs.getString("configName"));
                bean.setId(rs.getLong("id"));
                bean.setPackageName(rs.getString("packageName"));
                bean.setPagePath(rs.getString("pagePath"));
                bean.setProjectPath(rs.getString("projectPath"));
                bean.setRelativePath(rs.getString("relativePath"));
                list.add(bean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


    /**
     * 查询
     * @param con
     * @return
     */
    public static List<DbConfigBean> dbConfigSearch(Connection con,Long id){
        String sql = "select id,dbType,dbName,ip,userName,password,port,linkName from db_config";
        if(null !=id){
            sql += " where id="+id;
        }
        List<DbConfigBean> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            DbConfigBean bean = null;
            while(rs.next()){
                bean = new DbConfigBean();
                bean.setId(rs.getLong("id"));
                bean.setDbType(rs.getString("dbType"));
                bean.setDbName(rs.getString("dbName"));
                bean.setIp(rs.getString("ip"));
                bean.setUserName(rs.getString("userName"));
                bean.setPassword(rs.getString("password"));
                bean.setPort(rs.getInt("port"));
                bean.setLinkName(rs.getString("linkName"));
                list.add(bean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
