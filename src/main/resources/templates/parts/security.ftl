<#--переменная от freemarker,приведенная в булево значение (с помощью ??) хранящая состояние сессии Spring-->
<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>
<#--будет содержать пользователя если проверка пройдена-->
<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    isAdmin = user.isAdmin()
    >
<#else>
    <#assign
    name = "unknown"
    isAdmin = false
    >
</#if>