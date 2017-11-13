package com.code.factory.controller;


import com.alibaba.fastjson.JSONObject;
import com.code.factory.bean.CodeConfigBean;
import com.code.factory.bean.ConfigBean;
import com.code.factory.bean.DbConfigBean;
import com.code.factory.bean.PropertyBean;
import com.code.factory.service.ConfigServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Connection;
import java.util.List;

@RequestMapping("/")
@Controller
public class IndexController {

    @Autowired
    private ConfigServiceImpl configService;

    @RequestMapping("index")
    public String index(Model model){
        model.addAttribute("dbList",configService.dbConfigBeanList());
        model.addAttribute("configList",configService.configBeanList());
        return "index";
    }

    @ResponseBody
    @RequestMapping(value = "dbTest",method = RequestMethod.POST)
    public int dbTest(DbConfigBean bean){
        if("0".equals(bean.getDbType())){
            Connection con = configService.getCon(bean);
            if(null == con){
                return 1;
            }
        }else{//oracle

        }
        return 0;
    }

    @ResponseBody
    @RequestMapping(value="dbSave",method = RequestMethod.POST)
    public int dbConfigSave(DbConfigBean bean){
        configService.saveDbConfig(bean);
        return 0;
    }

    @ResponseBody
    @RequestMapping(value="configSave",method = RequestMethod.POST)
    public int configSave(ConfigBean bean){
        configService.saveConfig(bean);
        return 0;
    }

    @ResponseBody
    @RequestMapping(value="fileCreate",method = RequestMethod.POST)
    public int fileCreate(CodeConfigBean bean,String jsonStr){
        List<PropertyBean> list = JSONObject.parseArray(jsonStr,PropertyBean.class);
        bean.setProList(list);
        configService.fileCreateFactory(bean);
        return 0;
    }

    @ResponseBody
    @RequestMapping(value="tableSql",method = RequestMethod.POST)
    public String tableSql(CodeConfigBean bean,String jsonStr){
        List<PropertyBean> list = JSONObject.parseArray(jsonStr,PropertyBean.class);
        bean.setProList(list);
        return configService.createTableSql(bean);
    }

    @ResponseBody
    @RequestMapping(value="menuSql",method = RequestMethod.POST)
    public String menuSql(CodeConfigBean bean,String jsonStr){
        List<PropertyBean> list = JSONObject.parseArray(jsonStr,PropertyBean.class);
        bean.setProList(list);
        return configService.createMenuSql(bean);
    }

    /**
     * 获取配置
     * @return
     */
    @ResponseBody
    @RequestMapping("getConfigBean")
    public String getConfigBean(Long id){
        ConfigBean bean = configService.getConfigBean(id);
        return JSONObject.toJSONString(bean);
    }

    /**
     * 获取配置
     * @return
     */
    @ResponseBody
    @RequestMapping("getDbConfigBean")
    public String getDbConfigBean(Long id){
        DbConfigBean bean = configService.getDbConfigBean(id);
        return JSONObject.toJSONString(bean);
    }

    @ResponseBody
    @RequestMapping("getDbType")
    public String getDbTyoe(String dbType){
        String mysqlDbType = "[{\"dbType\":\"varchar\"},{\"dbType\":\"int\"},{\"dbType\":\"bigInt\"},"+
                              "{\"dbType\":\"double\"},{\"dbType\":\"float\"},{\"dbType\":\"decimal\"},"+
                              "{\"dbType\":\"char\"},{\"dbType\":\"date\"},{\"dbType\":\"datetime\"},"+
                              "{\"dbType\":\"text\"},{\"dbType\":\"numeric\"},{\"dbType\":\"timestamp\"}]";

        String  oracleDbType = "[{\"dbType\":\"varchar\"},{\"dbType\":\"varchar2\"},{\"dbType\":\"char\"},"+
                                "{\"dbType\":\"nvarchar2\"},{\"dbType\":\"float\"},{\"dbType\":\"decimal\"},"+
                                "{\"dbType\":\"char\"},{\"dbType\":\"date\"},{\"dbType\":\"number\"},"+
                                "{\"dbType\":\"numeric\"},{\"dbType\":\"timestamp\"}]";

        if("1".equals(dbType.trim()))return oracleDbType;
        return mysqlDbType;
    }

}
