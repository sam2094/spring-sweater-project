<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>

<div>
    <@l.logout/>
</div>
<div>
    <a href="/user"> User list</a>
</div>
<div>
    <form method="post" action="/add">
        <input type="text" name="text" placeholder="Input message">
        <input type="text" name="tag" placeholder="Input tag">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit">Add</button>
    </form>
</div>
<div>Messages list</div>
<br>
<form method="get" action="/main">
    <input type="text" name="filter" value="${filter}" placeholder="Input message">
    <button type="submit">Find</button>
</form>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Text</th>
        <th>Tag</th>
        <th>Author</th>
    </tr>
    </thead>
    <tbody>
    <#list messages as message>
    <tr>
        <td>${message.id}</td>
        <td>${message.text}</td>
        <td>${message.tag}</td>
        <td>${message.authorName}</td>
    </tr>
    <#else>
   <tr>
       <td>No messages</td>
       <td>No messages</td>
       <td>No messages</td>
       <td>No messages</td>
   </tr>
    </#list>
    </tbody>
</table>
</@c.page>