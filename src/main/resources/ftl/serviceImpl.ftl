package ${bean.configBean.packageName}.service.impl;


import ${bean.configBean.packageName}.dao.${bean.beanName}Dao;
import ${bean.configBean.packageName}.model.${bean.beanName};
import ${bean.configBean.packageName}.model.condition.${bean.beanName}Condition;
import ${bean.configBean.packageName}.service.${bean.beanName}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* Created by codeFactory on ${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}.
*/
@Service
public class ${bean.beanName}ServiceImpl implements ${bean.beanName}Service{

    @Autowired
    private ${bean.beanName}Dao ${bean.beanName?uncap_first}Dao;


    @Override
    public List<${bean.beanName}> select${bean.beanName}ByCondition(${bean.beanName}Condition condition) {
        return ${bean.beanName?uncap_first}Dao.select${bean.beanName}ByCondition(condition);
    }

    @Override
    public int selectCountByCondition(${bean.beanName}Condition condition) {
        return ${bean.beanName?uncap_first}Dao.selectCountByCondition(condition);
    }

    @Override
    public ${bean.beanName} select${bean.beanName}(${bean.beanName} condition) {
        return ${bean.beanName?uncap_first}Dao.select${bean.beanName}(condition);
    }

    @Override
    public void insert${bean.beanName}(${bean.beanName} ${bean.beanName?uncap_first}) {
        ${bean.beanName?uncap_first}Dao.insert${bean.beanName}(${bean.beanName?uncap_first});
    }

    @Override
    public void update${bean.beanName}(${bean.beanName} ${bean.beanName?uncap_first}) {
        ${bean.beanName?uncap_first}Dao.update${bean.beanName}(${bean.beanName?uncap_first});
    }


    @Override
    public void delete${bean.beanName}(String siteCode,String ids) {
        String []arr = ids.split(",");
        for(String id:arr){
            ${bean.beanName?uncap_first}Dao.delete${bean.beanName}(siteCode,id);
        }
    }


}
