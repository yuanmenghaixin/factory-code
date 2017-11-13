<#noparse><#include "/common/pagerForm.html">
<script src="${rc.getContextPath()}/js/dwzCustomJs/dwz.custom.advancedquery.js?v=${ver}" type="text/javascript"></script></#noparse>
<form name="${bean.beanName?uncap_first}Condition" rel="pagerForm" method="post" action="" onsubmit="return navTabSearch(this)">
    <div class="pageHeader">
        <div class="searchBar poStatus">
            <ul class="searchContent">
                <#list bean.proList as pro>
                <#if pro.searchFlag ==1>
                <#if pro.javaType == "Date">
                <li><label>${pro.fieldName}：</label>
                    <input type="text" class="date" readonly="readonly" datefmt="yyyy-MM-dd HH:mm:ss" size="17" max_Date="{maxCreateDateTime}" name="minCreateDateTime" value="<#noparse>${</#noparse>condition.minCreateDateTime!''}"/> <a class="inputDateButton" href="javascript:;">选择</a>
                </li>
                <li><label>至：</label>
                    <input type="text" class="date" readonly="readonly" datefmt="yyyy-MM-dd HH:mm:ss" size="17" min_Date="{minCreateDateTime}" name="maxCreateDateTime" value="<#noparse>${</#noparse>condition.maxCreateDateTime!''}" /> <a class="inputDateButton" href="javascript:;">选择</a>
                </li>
                <#else>
                <li>
                    <label>${pro.fieldName}：</label>
                    <input  type="text"  name="${pro.fieldCode}" value="<#noparse>${</#noparse>condition.${pro.fieldCode}!''}" />
                </li>
                </#if>
                </#if>
                </#list>
                <li class="query">
                    <div class="buttonActive">
                        <div class="buttonContent">
                            <button type="submit">
                             查询
                            </button>
                        </div>
                    </div>
                </li>
            </ul>

        </div>
    </div>
</form>

<div class="pageContent">

    <div class="panelBar">
        <ul class="toolBar">
        <#noparse><@buttonRight </#noparse>menuCode="${bean.beanName?upper_case}_ADD" labelKey="add.B" defalutName="新增">
            <li><a class="add" target="dialog" mask="true" width="350" height="240" rel="${bean.beanName}_tab"
                   href="<#noparse>${rc.getContextPath()}</#noparse>/manage/${bean.beanName?uncap_first}/edit?flag=0&navTabId=<#noparse>${</#noparse>navTabId!''}"title="新增记录">
                <span><#noparse><@label key='add.B'>新增</@label></#noparse></span></a></li><#noparse></@buttonRight></#noparse>
        <#noparse><@buttonRight </#noparse>menuCode="${bean.beanName?upper_case}_EDIT"  labelKey="edit.B"defalutName="编辑">
            <li><a class="edit" target="dialog" mask="true" width="400" height="300" rel="${bean.beanName}_tab"
                   href="<#noparse>${rc.getContextPath()}</#noparse>/manage/${bean.beanName?uncap_first}/edit?flag=1&id={id}&navTabId=<#noparse>${</#noparse>navTabId!''}"title="编辑记录">
                <span><#noparse><@label key='edit.B'>编辑</@label></#noparse></span></a></li><#noparse></@buttonRight></#noparse>
        <#noparse><@buttonRight</#noparse> menuCode="${bean.beanName?upper_case}_DEL" labelKey="delete.B" defalutName="删除">
            <li><a class="delete" target="selectedTodo" href="<#noparse>${rc.getContextPath()}</#noparse>/manage/${bean.beanName?uncap_first}/delete?navTabId=<#noparse>${</#noparse>navTabId!''}" postType="string" rel="ids" callback="batchjobAjaxDone"
                   title="<#noparse><@label key='delete_sure.D'>确认要删除选择的信息吗？</@label></#noparse>">
                <span><#noparse><@label key='delete.B'>删除</@label></span></a> </li></@buttonRight></#noparse>
        </ul>
    </div>
    <table class="table" width="100%" layoutH="140">
        <thead>
        <tr>
            <th width="25"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
            <#list bean.proList as pro>
            <#if pro.listFlag==1 >
            <th width="100" >${pro.fieldName}</th>
            </#if>
            </#list>
	    <th width="100" >创建人</th>
            <th width="100" >创建时间</th>
            <th width="100" >修改人</th>
            <th width="100" >修改时间</th>
        </tr>
        </thead>
        <tbody>
        <#noparse> <#if page??><#if (page.data?size>0)> <#list page.data as </#noparse>${bean.beanName?uncap_first}>
        <tr target="id" rel="<#noparse>${</#noparse> ${bean.beanName?uncap_first}.id!''}">
            <td><input name="ids" value="<#noparse> ${ </#noparse>${bean.beanName?uncap_first}.id!''}" type="checkbox"></td>
        <#list bean.proList as pro>
        <#if pro.listFlag ==1>
        <#if pro.javaType=='Date'>
            <td><#noparse>${</#noparse>(${bean.beanName?uncap_first}.${pro.fieldCode}?string("yyyy-MM-dd HH:mm"))?if_exists}</td>
        <#else>
             <td><#noparse>${</#noparse>${bean.beanName?uncap_first}.${pro.fieldCode}!''}</td>
        </#if>
        </#if>
	<td><#noparse>${</#noparse>${bean.beanName?uncap_first}.createUser!''}</td>
        <td><#noparse>${</#noparse>(${bean.beanName?uncap_first}.createDateTime?string("yyyy-MM-dd HH:mm:ss"))?if_exists}</td>
        <td><#noparse>${</#noparse>${bean.beanName?uncap_first}.modifyUser!''}</td>
        <td><#noparse>${</#noparse>(${bean.beanName?uncap_first}.modifyDateTime?string("yyyy-MM-dd HH:mm:ss"))?if_exists}</td>
        </#list>
        </tr>
<#noparse></#list>
        <#else>
        <tr target="id">
            <td colspan="20" class="noData">======<@label key="noListData.C">列表无数据</@label>=====</font></td>
        </tr>
        </#if>
        <#else>
        <tr target="id">
            <td colspan="20" class="noData">======<@label key="noListData.C">列表无数据</@label>=====</font></td>
        </tr>
        </#if></#noparse>
        </tbody>
    </table>
<#noparse><#include "/common/panelBar.html"></#noparse>
</div>

