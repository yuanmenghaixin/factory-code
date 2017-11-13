<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<!-- namespace名字必须与Mapper接口名一致 -->
<mapper namespace="${bean.configBean.packageName}.dao.${bean.beanName}Dao">

    <!-- 查询列表 -->
    <select id="select${bean.beanName}ByCondition" parameterType="${bean.configBean.packageName}.model.condition.${bean.beanName}Condition"
            resultType="${bean.configBean.packageName}.model.${bean.beanName}">
        select * from
        <trim prefix="(" suffix=") v">
            select rownum rn,a.* from
            <trim prefix="(" suffix=") a">
                select t.* from ${bean.tableName} t
                <where> <#noparse>t.siteCode=#{siteCode} </#noparse>
                <#list bean.proList as pro >
                <#if pro.searchFlag==1>
                <if test="${pro.fieldCode} !=null and ${pro.fieldCode}!=''">
                    and t.${pro.fieldCode} =<#noparse> #{</#noparse>${pro.fieldCode}}
                </if>
                </#if>
                </#list>
                </where>
                <#noparse>
                <if test="orderField != null and orderField != ''">
                    order by  t.${orderField} ${orderDirection}
                </if>
            </trim>
            where rownum &lt;= #{endRow}
        </trim>
        where v.rn &gt;= #{startRow} </#noparse>
    </select>

    <select id="selectCountByCondition" resultType="int">
        select count(1) from ${bean.tableName}
        <where> <#noparse>siteCode=#{siteCode} </#noparse>
        <#list bean.proList as pro >
        <#if pro.searchFlag==1>
        <if test="${pro.fieldCode} !=null and ${pro.fieldCode}!=''">
            and ${pro.fieldCode} =<#noparse> #{</#noparse>${pro.fieldCode}}
        </if>
        </#if>
        </#list>
        </where>
    </select>

    <!-- 查询单条记录 -->
    <select id="select${bean.beanName}" parameterType="${bean.configBean.packageName}.model.${bean.beanName}"
            resultType="${bean.configBean.packageName}.model.${bean.beanName}">
        select * from ${bean.tableName}
        <where> <#noparse>siteCode=#{siteCode} </#noparse>
        <if test=""> </if>
        <if test=""> </if>
        </where>

    </select>
    <!-- 插入数据 -->
    <insert id="insert${bean.beanName}" parameterType="${bean.configBean.packageName}.model.${bean.beanName}">
        <selectKey keyProperty="id" resultType="int" order="BEFORE">
            select ${bean.tableName}_SEQ.nextVal from dual
        </selectKey>
        insert into ${bean.tableName}
        (
        <#list bean.proList as pro >
        ${pro.fieldCode},
        </#list>
        createUser,
        createDatetime,
        modifyUser,
        modifyDatetime
        )
        values
        (
        <#list bean.proList as pro >
        <#noparse>#{</#noparse>${pro.fieldCode},jdbcType=${pro.mybatisType}<#noparse>}</#noparse>,
        </#list>
        <#noparse>
        #{createUser, jdbcType=VARCHAR},
        #{createDateTime,jdbcType=TIMESTAMP},
        #{modifyUser, jdbcType=VARCHAR},
        #{modifyDateTime,jdbcType=TIMESTAMP}
        </#noparse>
        )
    </insert>

    <!-- 修改 -->
    <update id="update${bean.beanName}" parameterType="${bean.configBean.packageName}.model.${bean.beanName}">
        update ${bean.tableName} set
        <#list bean.proList as pro >
        ${pro.fieldCode} = <#noparse>#{</#noparse>${pro.fieldCode},jdbcType=${pro.mybatisType}},
        </#list>
        <#noparse>
        modifyUser=#{modifyUser},
        modifyDatetime=#{modifyDateTime,jdbcType=TIMESTAMP}
        </#noparse>
        where  <#noparse>siteCode=#{siteCode}</#noparse>
        <#list bean.proList as pro >
        <#if pro.keyFlag==1>
        and ${pro.fieldCode} = <#noparse>#{</#noparse>${pro.fieldCode}}
        </#if>
        </#list>
    </update>

    <!-- 删除 -->
    <delete id="delete${bean.beanName}" >
        delete from ${bean.tableName} where <#noparse>siteCode=#{siteCode}</#noparse>
        <#list bean.proList as pro >
        <#if pro.keyFlag==1>
        and ${pro.fieldCode} = <#noparse>#{</#noparse>${pro.fieldCode}}
        </#if>
        </#list>
    </delete>

    <cache eviction="FIFO" flushInterval="30000" readOnly="true" size="1024" />
</mapper>