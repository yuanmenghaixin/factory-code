insert into sy_resource(RESOURCECODE,RESOURCETEXT,WEBURL,RESOURCETYPEECODE,LOCKFLAG,CREATEUSER,CREATEDATETIME,MODIFYUSER,MODIFYDATETIME)
values ('${bean.className?upper_case}','${bean.comment}','/manage/${bean.className?uncap_first}/list','FORM','0','SA',TO_DATE('${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}','YYYY-MM-DD HH24:MI:SS'),'SA',TO_DATE('${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}','YYYY-MM-DD HH24:MI:SS'));
insert into sy_resource(RESOURCECODE,RESOURCETEXT,RESOURCETYPEECODE,LOCKFLAG,CREATEUSER,CREATEDATETIME,MODIFYUSER,MODIFYDATETIME)
values ('${bean.className?upper_case}_ADD','${bean.comment}新增','BUTN','0','SA',TO_DATE('${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}','YYYY-MM-DD HH24:MI:SS'),'SA',TO_DATE('${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}','YYYY-MM-DD HH24:MI:SS'));
insert into sy_resource(RESOURCECODE,RESOURCETEXT,RESOURCETYPEECODE,LOCKFLAG,CREATEUSER,CREATEDATETIME,MODIFYUSER,MODIFYDATETIME)
values ('${bean.className?upper_case}_DEL','${bean.comment}删除','BUTN','0','SA',TO_DATE('${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}','YYYY-MM-DD HH24:MI:SS'),'SA',TO_DATE('${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}','YYYY-MM-DD HH24:MI:SS'));
insert into sy_resource(RESOURCECODE,RESOURCETEXT,RESOURCETYPEECODE,LOCKFLAG,CREATEUSER,CREATEDATETIME,MODIFYUSER,MODIFYDATETIME)
values ('${bean.className?upper_case}_EDIT','${bean.comment}修改','BUTN','0','SA',TO_DATE('${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}','YYYY-MM-DD HH24:MI:SS'),'SA',TO_DATE('${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}','YYYY-MM-DD HH24:MI:SS'));

insert into sy_menu(MENUCODE,MENUTEXT,PARENTMENUCODE,RESOURCECODE,DISPLAYORDINAL,LOCKFLAG,CREATEUSER,CREATEDATETIME,MODIFYUSER,MODIFYDATETIME,SITECODE)
values('${bean.className?upper_case}','${bean.comment}','?','${bean.className?upper_case}','1','0','SA',TO_DATE('${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}','YYYY-MM-DD HH24:MI:SS'),'SA',TO_DATE('${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}','YYYY-MM-DD HH24:MI:SS'),'1310');
insert into sy_menu(MENUCODE,MENUTEXT,PARENTMENUCODE,RESOURCECODE,DISPLAYORDINAL,LOCKFLAG,CREATEUSER,CREATEDATETIME,MODIFYUSER,MODIFYDATETIME,SITECODE)
values('${bean.className?upper_case}_ADD','${bean.comment}新增','${bean.className?upper_case}','${bean.className?upper_case}_ADD','1','0','SA',TO_DATE('${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}','YYYY-MM-DD HH24:MI:SS'),'SA',TO_DATE('${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}','YYYY-MM-DD HH24:MI:SS'),'1310');
insert into sy_menu(MENUCODE,MENUTEXT,PARENTMENUCODE,RESOURCECODE,DISPLAYORDINAL,LOCKFLAG,CREATEUSER,CREATEDATETIME,MODIFYUSER,MODIFYDATETIME,SITECODE)
values('${bean.className?upper_case}_DEL','${bean.comment}删除','${bean.className?upper_case}','${bean.className?upper_case}_DEL','1','0','SA',TO_DATE('${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}','YYYY-MM-DD HH24:MI:SS'),'SA',TO_DATE('${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}','YYYY-MM-DD HH24:MI:SS'),'1310');
insert into sy_menu(MENUCODE,MENUTEXT,PARENTMENUCODE,RESOURCECODE,DISPLAYORDINAL,LOCKFLAG,CREATEUSER,CREATEDATETIME,MODIFYUSER,MODIFYDATETIME,SITECODE)
values('${bean.className?upper_case}_EDIT','${bean.comment}修改','${bean.className?upper_case}','${bean.className?upper_case}_EDIT','1','0','SA',TO_DATE('${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}','YYYY-MM-DD HH24:MI:SS'),'SA',TO_DATE('${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}','YYYY-MM-DD HH24:MI:SS'),'1310');

<#list bean.proList as pro>
<#if pro.label??>
<#else>
INSERT INTO sy_localeresource (RESOURCESET, RESOURCEKEY, RESOURCEVALUE, SITECODE) VALUES ('CommonResources', '${pro.name}.C', '${pro.comment}', '1310');
</#if>
</#list>