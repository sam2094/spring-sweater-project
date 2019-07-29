<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<#--проверка на валидность с помощью сессии от Spring Security-->
    <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
    <div class="alert alert-danger" role="alert">
    <#--вывод сообещения exception-a исправленного в UserService-->
        ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
    </div>
    </#if>
    <#if message??>
    <div class="alert alert-${messageType}" role="alert">
        ${message}
    </div>
    </#if>
<div class="mb-2">${message?ifExists}</div>
    <@l.login "/login" false/>
</@c.page>
