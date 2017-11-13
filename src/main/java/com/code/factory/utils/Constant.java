package com.code.factory.utils;

/**
 * Created by Gao.WenLong on 2017/3/28.
 */
public class Constant {

     static final String CREATETABLESQL = "create table ";

     static final String CREATEUSER = "CREATEUSER varchar(40) DEFAULT NULL COMMENT '创建人'";
     static final String CREATEDATETIME = "CREATEDATETIME datetime NOT NULL COMMENT '创建时间'";
     static final String MODIFYUSER = "MODIFYUSER varchar(40) DEFAULT NULL COMMENT '修改人'";
     static final String MODIFYDATETIME = "MODIFYDATETIME datetime NOT NULL COMMENT '修改时间'";
     static final String SITECODE = "SITECODE varchar(20) NOT NULL COMMENT '工厂编号'";

    static final String OCREATEUSER = "CREATEUSER varchar2(40)";
    static final String OCREATEDATETIME = "CREATEDATETIME date ";
    static final String OMODIFYUSER = "MODIFYUSER varchar(40)";
    static final String OMODIFYDATETIME = "MODIFYDATETIME date";
    static final String OSITECODE = "SITECODE varchar2(20) ";


    static final String BR = "\n";



}
