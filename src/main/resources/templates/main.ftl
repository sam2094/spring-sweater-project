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
<div class="collapse <#if message??>show</#if>" id="collapseExample">
    <div class="form-group">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
            <#--проверяется есть textError (название получает из класса ControllerUtils) переводится в String и в методе назначается класс либо пустота -->
                <input class="form-control ${(textError??)?string('is-invalid','')}"
                       value="<#if message ??>${message.text}</#if>" type="text" name="text"
                       placeholder="Input message">
                <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input class="form-control ${(tagError??)?string('is-invalid','')}" type="text"
                       value="<#if message ??>${message.tag}</#if>" name="tag" placeholder="Input tag">
                <#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                </#if>
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
   </tr>
    </#list>
    </tbody>
</table>
</@c.page>