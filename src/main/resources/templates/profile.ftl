<#import "parts/common.ftl" as c>

<@c.page>
<div class="mb-2">${username}</div>
<div class="mb-2">${message?ifExists}</div>
   <form method="post" xmlns="http://www.w3.org/1999/html">
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
           <#--запись снизу "${email!''}" - если не назначен email устанавливает значение почты ''-->
               <input class="form-control ${(emailError??)?string('is-invalid','')}" type="email" placeholder="Email" name="email" value="${email!''}"/>
                 <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                 </#if>
           </div>
       </div>
       <input type="hidden" name="_csrf" value="${_csrf.token}">
       <div class="from-group row mt-1">
           <label class="col-sm-2 col-form-label"></label>
           <div class="col-sm-6">
               <button class="btn btn-primary mt-1" type="submit">Save</button>
           </div>
       </div>
   </form>
</@c.page>