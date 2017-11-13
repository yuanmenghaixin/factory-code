package ${bean.configBean.packageName}.service;

import ${bean.configBean.packageName}.model.${bean.beanName};
import ${bean.configBean.packageName}.model.condition.${bean.beanName}Condition;

import java.util.List;

/**
* Created by codeFactory on ${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}.
*/
public interface ${bean.beanName}Service {

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
    * 查询信息
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
    void delete${bean.beanName}(String siteCode,String ids);


}
