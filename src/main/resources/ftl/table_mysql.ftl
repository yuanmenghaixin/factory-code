
CREATE TABLE `${bean.tableName}` (
<#list bean.proList as pro >
"${pro.fieldCode}" ${pro.dbType}(${pro.length}) <#if pro.requiredFlag==1>NOT NULL <#else> NULL</#if> <#if pro.keyFlag==1> constraint ${pro.fieldCode}_pk primary key </#if> COMMENT '${pro.fieldName}',
</#list>

"SITECODE" NVARCHAR2(20) NOT NULL ,
"CREATEUSER" NVARCHAR2(40) NULL ,
"CREATEDATETIME" DATE NOT NULL ,
"MODIFYUSER" NVARCHAR2(40) NULL ,
"MODIFYDATETIME" DATE NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
