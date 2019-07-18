<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<div class="mb-2">Add new User</div>
<div class="mb-2">${message?ifExists}</div>
<#-- отправка аргумента isRegisterForm типа boolean - true покажет контент-->
    <@l.login "/registration" true/>
</@c.page>


