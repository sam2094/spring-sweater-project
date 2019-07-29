<#--аргумент isRegisterForm для определения показа типа boolean-->
<#macro login path isRegisterForm>
<form action="${path}" method="post" xmlns="http://www.w3.org/1999/html">

    <div class="from-group row">
        <label class="col-sm-2 col-form-label"> User Name:</label>
        <div class="col-sm-6 ">
            <input class="form-control ${(usernameError??)?string('is-invalid','')}"
                   value="<#if user??>${user.username}</#if>" placeholder="User name" type="text" name="username"/>
            <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
            </#if>
        </div>
    </div>
    <div class="from-group row mt-1">
        <label class="col-sm-2 col-form-label">Password:</label>
        <div class="col-sm-6">
            <input class="form-control ${(passwordError??)?string('is-invalid','')}" type="password"
                   placeholder="Password" name="password"/>
              <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
              </#if>
        </div>
    </div>

      <#if isRegisterForm>
          <div class="from-group row mt-1">
              <label class="col-sm-2 col-form-label">Retype password:</label>
              <div class="col-sm-6">
                  <input class="form-control ${(password2Error??)?string('is-invalid','')}" type="password"
                         placeholder="Retype password" name="password2"/>
              <#if password2Error??>
                    <div class="invalid-feedback">
                        ${password2Error}
                    </div>
              </#if>
              </div>
          </div>
    <div class="from-group row mt-1">
        <label class="col-sm-2 col-form-label">Email:</label>
        <div class="col-sm-6">
            <input class="form-control ${(emailError??)?string('is-invalid','')}" type="email" placeholder="Email"
                   value="<#if user??>${user.email}</#if>" name="email"/>
             <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
             </#if>
        </div>
    </div>
      <div class="from-group row mt-1">
          <label class="col-sm-2 col-form-label"></label>
          <div class="g-recaptcha col-sm-6" data-sitekey="6Le0CLAUAAAAAFjPKLz-0JY8rTYlVbvkjECcuqtX"></div>
           <#if captchaError??>
          <div class="alert alert-danger" role="alert">
              ${captchaError}
          </div>
           </#if>
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
