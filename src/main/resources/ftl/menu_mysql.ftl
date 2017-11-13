-- 菜单资源
insert into sy_resource(RESOURCECODE,RESOURCETEXT,WEBURL,RESOURCETYPEECODE,LOCKFLAG,CREATEUSER,CREATEDATETIME,MODIFYUSER,MODIFYDATETIME)
values ('${bean.beanName?upper_case}','${bean.menuName}','/manage/${bean.beanName?uncap_first}/list','FORM','0','SA',SYSDATE(),'SA',SYSDATE());
insert into sy_resource(RESOURCECODE,RESOURCETEXT,RESOURCETYPEECODE,LOCKFLAG,CREATEUSER,CREATEDATETIME,MODIFYUSER,MODIFYDATETIME)
values ('${bean.beanName?upper_case}_ADD','${bean.menuName}新增','BUTN','0','SA',SYSDATE(),'SA',SYSDATE());
insert into sy_resource(RESOURCECODE,RESOURCETEXT,RESOURCETYPEECODE,LOCKFLAG,CREATEUSER,CREATEDATETIME,MODIFYUSER,MODIFYDATETIME)
values ('${bean.beanName?upper_case}_DEL','${bean.menuName}删除','BUTN','0','SA',SYSDATE(),'SA',SYSDATE());
insert into sy_resource(RESOURCECODE,RESOURCETEXT,RESOURCETYPEECODE,LOCKFLAG,CREATEUSER,CREATEDATETIME,MODIFYUSER,MODIFYDATETIME)
values ('${bean.beanName?upper_case}_EDIT','${bean.menuName}修改','BUTN','0','SA',SYSDATE(),'SA',SYSDATE());

insert into sy_menu(MENUCODE,MENUTEXT,PARENTMENUCODE,RESOURCECODE,DISPLAYORDINAL,LOCKFLAG,CREATEUSER,CREATEDATETIME,MODIFYUSER,MODIFYDATETIME,SITECODE)
values('${bean.beanName?upper_case}','${bean.menuName}','?','${bean.beanName?upper_case}','1','0','SA',SYSDATE(),'SA',SYSDATE(),'1001');
insert into sy_menu(MENUCODE,MENUTEXT,PARENTMENUCODE,RESOURCECODE,DISPLAYORDINAL,LOCKFLAG,CREATEUSER,CREATEDATETIME,MODIFYUSER,MODIFYDATETIME,SITECODE)
values('${bean.beanName?upper_case}_ADD','${bean.menuName}新增','${bean.beanName?upper_case}','${bean.beanName?upper_case}_ADD','1','0','SA',SYSDATE(),'SA',SYSDATE(),'1001');
insert into sy_menu(MENUCODE,MENUTEXT,PARENTMENUCODE,RESOURCECODE,DISPLAYORDINAL,LOCKFLAG,CREATEUSER,CREATEDATETIME,MODIFYUSER,MODIFYDATETIME,SITECODE)
values('${bean.beanName?upper_case}_DEL','${bean.menuName}删除','${bean.beanName?upper_case}','${bean.beanName?upper_case}_DEL','1','0','SA',SYSDATE(),'SA',SYSDATE(),'1001');
insert into sy_menu(MENUCODE,MENUTEXT,PARENTMENUCODE,RESOURCECODE,DISPLAYORDINAL,LOCKFLAG,CREATEUSER,CREATEDATETIME,MODIFYUSER,MODIFYDATETIME,SITECODE)
values('${bean.beanName?upper_case}_EDIT','${bean.menuName}修改','${bean.beanName?upper_case}','${bean.beanName?upper_case}_EDIT','1','0','SA',SYSDATE(),'SA',SYSDATE(),'1001');


-- 角色赋权限
INSERT INTO sy_rolemenu VALUES ('1001', 'ADMIN', '${bean.beanName?upper_case}', 'ADMIN', SYSDATE());
INSERT INTO sy_rolemenu VALUES ('1001', 'ADMIN', '${bean.beanName?upper_case}_ADD', 'ADMIN', SYSDATE());
INSERT INTO sy_rolemenu VALUES ('1001', 'ADMIN', '${bean.beanName?upper_case}_EDIT', 'ADMIN', SYSDATE());
INSERT INTO sy_rolemenu VALUES ('1001', 'ADMIN', '${bean.beanName?upper_case}_DEL', 'ADMIN', SYSDATE());