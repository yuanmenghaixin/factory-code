<div class="pageContent">
    <form method="post" action="<#noparse>${rc.getContextPath()}</#noparse>/manage/${bean.beanName?uncap_first}/saveOrUpdate"
          class="pageForm required-validate"
          onsubmit="return validateCallback(this, dialogAjaxDone);">
        <div class="pageFormContent">
            <input type="hidden" name="navTabId" value="<#noparse>${</#noparse>navTabId!''}">
            <input type="hidden" name="flag" value="<#noparse>${</#noparse>flag!''}">
            <fieldset class="dataset">
                <#list bean.proList as pro>
                <dl>
                    <dt>${pro.fieldName}:</dt>
                    <#if pro.javaType == "Date">
                    <dd>
                        <input type="text" class="date  <#if pro.requiredFlag==1>required </#if>" readonly="readonly" datefmt="yyyy-MM-dd HH:mm:ss" size="17"
                               name="${pro.fieldCode}" <#noparse>value="<#if </#noparse> (${bean.beanName?uncap_first}.${pro.fieldCode})??><#noparse>${</#noparse>${bean.beanName?uncap_first}.${pro.fieldCode}!''}<#noparse></#if></#noparse>" />
                        <#noparse><#if flag !=2 > </#noparse><a class="inputDateButton" href="javascript:;"><#noparse><@label</#noparse> key='select.B'>选择<#noparse></@label></#noparse></a> <#noparse></#if></#noparse>

                    </dd>
                    <#else>
                    <dd>
                        <input name="${pro.fieldCode}" value="<#noparse><#if </#noparse>(${bean.beanName?uncap_first}.${pro.fieldCode})??><#noparse>${</#noparse>${bean.beanName?uncap_first}.${pro.fieldCode}!''}<#noparse></#if></#noparse>"
                               size="32" type="text" maxlength="20" class="<#if pro.requiredFlag==1>required </#if> " <#noparse> <#if flag ==2 > readonly="readonly" </#if></#noparse>/>

                    </dd>
                    </#if>
                </dl>
                </#list>
            </fieldset>
        </div>
        <div class="formBar">
            <ul style="margin-right: 90px;">
                <li>
                    <div class="buttonActive">
                        <div class="buttonContent">
                            <button type="submit"><#noparse><@label</#noparse> key='save.B'>保存<#noparse></@label></#noparse></button>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="buttonActiveGrey">
                        <div class="buttonContent">
                            <button type="button" class="close"><#noparse><@label</#noparse> key='cancel.B'>取消<#noparse></@label></#noparse></button>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </form>
</div>