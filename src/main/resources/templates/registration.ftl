<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<h1>Add User</h1>
<#if message??>
${message}
</#if>
    <@l.login "/registration"/>
</@c.page>


