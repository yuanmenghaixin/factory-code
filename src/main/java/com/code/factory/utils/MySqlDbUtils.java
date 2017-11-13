package com.code.factory.utils;

import com.code.factory.bean.ConfigBean;
import com.code.factory.bean.DbConfigBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * mysql工具类
 */
public class MySqlDbUtils {


    /**
     * 获取数据库链接
     * @return
     */
    public static Connection getConn(DbConfigBean bean){
        try {
            String url = "jdbc:mysql://"+bean.getIp()+":"+bean.getPort()+"/"+bean.getDbName();
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(url,bean.getUserName(),bean.getPassword());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }




}
