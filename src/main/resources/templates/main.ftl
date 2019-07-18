<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input class="form-control" type="text" name="filter" value="${filter?ifExists}"
                   placeholder="Search by tag">
            <button class="btn btn-primary ml-2" type="submit">Search</button>
        </form>
    </div>
</div>
  <a class="btn btn-primary mb-3" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
     aria-controls="collapseExample">
      Add new message
  </a>
<div class="collapse" id="collapseExample">
    <div class="form-group">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input class="form-control" type="text" name="text" placeholder="Input message">

            </div>
            <div class="form-group">
                <input class="form-control" type="text" name="tag" placeholder="Input tag">

            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" class="custom-file-input" id="customFile"
                           aria-describedby="inputGroupFileAddon01">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
            <input class="form-control" type="hidden" name="_csrf" value="${_csrf.token}">

            <div class="form-group">
                <button class="btn btn-primary" type="submit">Add</button>
            </div>
        </form>
    </div>
</div>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Text</th>
        <th>Tag</th>
        <th>Author</th>
        <th>Image</th>
    </tr>
    </thead>
    <tbody>
    <#list messages as message>
    <tr>
        <td>${message.id}</td>
        <td>${message.text}</td>
        <td>${message.tag}</td>
        <td>${message.authorName}</td>
        <td>
            <#if message.filename??>
                <img class="img-fluid img-thumbnail" src="/img/${message.filename}">
            </#if>
        </td>
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