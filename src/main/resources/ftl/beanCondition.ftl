package ${bean.configBean.packageName}.model.condition;

import cn.evun.ime.platform.core.model.Page;
import java.util.Date;

/**
* Created by codeFactory on ${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}
*/
public class ${bean.beanName}Condition extends Page {

    <#list bean.proList as pro>
    /**
    * ${pro.fieldName}
    */
    private ${pro.javaType} ${pro.fieldCode};

    </#list>


    <#list bean.proList as pro>
    public ${pro.javaType} get${pro.fieldCode?cap_first}(){
        return ${pro.fieldCode};
    }

    public void set${pro.fieldCode?cap_first}(${pro.javaType} ${pro.fieldCode}){
        this.${pro.fieldCode} = ${pro.fieldCode};
    }

    </#list>


}
