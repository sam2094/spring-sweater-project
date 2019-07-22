<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<div class="mb-2">${message?ifExists}</div>
 <@l.login "/login" false/>
</@c.page>
