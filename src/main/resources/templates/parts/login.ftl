<#--аргумент isRegisterForm для определения показа типа boolean-->
<#macro login path isRegisterForm>
<form action="${path}" method="post" xmlns="http://www.w3.org/1999/html">

    <div class="from-group row">
        <label class="col-sm-2 col-form-label"> User Name:</label>
        <div class="col-sm-6 ">
            <input class="form-control" placeholder="User name" type="text" name="username"/>
        </div>
    </div>
    <div class="from-group row mt-1">
        <label class="col-sm-2 col-form-label">Password:</label>
        <div class="col-sm-6">
            <input class="form-control" type="password" placeholder="Password" name="password"/>
        </div>
    </div>
      <#if isRegisterForm>
    <div class="from-group row mt-1">
    <label class="col-sm-2 col-form-label">Email:</label>
        <div class="col-sm-6">
            <input class="form-control" type="email" placeholder="Email" name="email"/>
        </div>
    </div>
      </#if>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <div class="from-group row mt-1">
        <label class="col-sm-2 col-form-label"></label>
        <div class="col-sm-6">
            <button class="btn btn-primary mt-1" type="submit"> <#if isRegisterForm>Create new user<#else>Sign
                in</#if></button>
        </div>
    </div>
   <#if !isRegisterForm><a href="/registration">Add new user</a></#if>
</form>
</#macro>
<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button class="btn btn-primary type=" submit
    ">Sign Out</button>
</form>
</#macro>
