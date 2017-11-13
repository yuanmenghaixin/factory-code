CREATE TABLE "${bean.tableName}" (
<#list bean.proList as pro >
"${pro.fieldCode}" ${pro.dbType}(${pro.length}) <#if pro.requiredFlag == 1>NOT NULL <#else> NULL</#if> <#if pro.keyFlag == 1> constraint ${pro.fieldCode}_pk primary key </#if>,
</#list>
"SITECODE" NVARCHAR2(20) NOT NULL ,
"CREATEUSER" NVARCHAR2(40) NULL ,
"CREATEDATETIME" DATE NOT NULL ,
"MODIFYUSER" NVARCHAR2(40) NULL ,
"MODIFYDATETIME" DATE NOT NULL
)
LOGGING NOCOMPRESS NOCACHE;

<#list bean.proList as pro >
COMMENT ON COLUMN "${bean.tableName}"."${pro.fieldCode}" IS '${pro.fieldName}';
</#list>
COMMENT ON COLUMN "${bean.tableName}"."SITECODE" IS '工厂编号';
COMMENT ON COLUMN "${bean.tableName}"."CREATEUSER" IS '创建者';
COMMENT ON COLUMN "${bean.tableName}"."CREATEDATETIME" IS '创建时间';
COMMENT ON COLUMN "${bean.tableName}"."MODIFYUSER" IS '修改者';
COMMENT ON COLUMN "${bean.tableName}"."MODIFYDATETIME" IS '修改时间';


CREATE SEQUENCE "${bean.tableName}_SEQ"
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
CACHE 20;

