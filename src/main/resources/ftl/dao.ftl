package ${bean.configBean.packageName}.dao;

import ${bean.configBean.packageName}.model.${bean.beanName};
import ${bean.configBean.packageName}.model.condition.${bean.beanName}Condition;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
* Created by codeFactory on ${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}.
*/
public interface ${bean.beanName}Dao {

    /**
      * @param condition
      * @return
      */
    List<${bean.beanName}> select${bean.beanName}ByCondition(${bean.beanName}Condition condition);

    /**
    * 查询记录数
    * @param condition
    * @return
    */
    int selectCountByCondition(${bean.beanName}Condition condition);

    /**
    * 查询单条记录信息
    * @param condition
    * @return
    */
    ${bean.beanName} select${bean.beanName}(${bean.beanName} condition);

    /**
    * 保存信息
    * @param ${bean.beanName?uncap_first}
    */
    void insert${bean.beanName}(${bean.beanName} ${bean.beanName?uncap_first});

    /**
    * 更新信息
    * @param ${bean.beanName?uncap_first}
    */
    void update${bean.beanName}(${bean.beanName} ${bean.beanName?uncap_first});

    /**
    * 删除信息
    */
    void delete${bean.beanName}(@Param("siteCode")String siteCode,@Param("id")String id);


}
