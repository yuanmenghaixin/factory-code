package ${bean.configBean.packageName}.controller;

import cn.evun.ime.platform.core.constants.SystemConstant;
import cn.evun.ime.platform.core.model.DWZResult;
import cn.evun.ime.platform.core.utils.StringUtils;
import cn.evun.ime.platform.security.controller.SecurityController;

import ${bean.configBean.packageName}.model.${bean.beanName};
import ${bean.configBean.packageName}.model.condition.${bean.beanName}Condition;
import ${bean.configBean.packageName}.service.${bean.beanName}Service;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;


/**
* Created by codeFactory on ${bean.createDate?string("yyyy-MM-dd HH:mm:ss")}.
*/
@Controller
@RequestMapping("/${bean.beanName?uncap_first}")
public class ${bean.beanName}Controller extends SecurityController {

    @Resource
    private ${bean.beanName}Service ${bean.beanName?uncap_first}Service;

    private static final String path="${bean.beanName?uncap_first}/";

    @RequestMapping("list")
    public String list(@ModelAttribute("condition") ${bean.beanName}Condition condition,
    String navTabId, Model model){
        condition.setSiteCode(this.getSiteCode());
        List<${bean.beanName}> list = ${bean.beanName?uncap_first}Service.select${bean.beanName}ByCondition(condition);
        int count = ${bean.beanName?uncap_first}Service.selectCountByCondition(condition);
        condition.setData(list);
        condition.setTotalCount(count);
        model.addAttribute("page", condition);
        model.addAttribute(NAVTABID, navTabId);

        return path+"${bean.beanName?uncap_first}_list";
    }

    /**
      *@param flag 0-添加，1-修改,2-查看
      */
    @RequestMapping(value="edit",method = RequestMethod.GET)
    public String add(ModelMap map, ${bean.beanName} condition,Integer flag,String navTabId){
        if(null!=flag && 0 != flag){
            ${bean.beanName} ${bean.beanName?uncap_first} = ${bean.beanName?uncap_first}Service.select${bean.beanName}(condition);
            map.addAttribute("${bean.beanName?uncap_first}", ${bean.beanName?uncap_first});
        }
        map.addAttribute(NAVTABID, navTabId);
        map.addAttribute("flag", flag);
        return path+"${bean.beanName?uncap_first}_edit";
    }


    @ResponseBody
    @RequestMapping("saveOrUpdate")
    public DWZResult saveOrUpdate(${bean.beanName} ${bean.beanName?uncap_first},Integer flag,String navTabId){
        if (${bean.beanName?uncap_first} == null) {
            return ajaxError(getImeViewMessageI18n(null,SystemConstant.PARAMETERNULL));
        }
        setCreateInfo(${bean.beanName?uncap_first});
        if(1 == flag){//更新
            ${bean.beanName?uncap_first}Service.update${bean.beanName}(${bean.beanName?uncap_first});
        }else{//添加
            ${bean.beanName?uncap_first}Service.insert${bean.beanName}(${bean.beanName?uncap_first});
        }
        return dialogAjaxDone(navTabId, null, null, null);
    }


    /**
    * 删除信息
    * @param navTabId
    * @param ids
    * @return
    */
    @ResponseBody
    @RequestMapping("delete")
    public DWZResult ${bean.beanName?uncap_first}Delete(String navTabId, String ids){
        if(StringUtils.isEmpty(ids)){
            return ajaxError("请选择需要删除的记录");
        }
        ${bean.beanName?uncap_first}Service.delete${bean.beanName}(getSiteCode(),ids);
        return navTabAjaxDone(navTabId, null, null, null,getImeViewMessageI18n(null, "successfulOperation.M"),null);
    }

}
