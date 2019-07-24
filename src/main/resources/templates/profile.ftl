<#import "parts/common.ftl" as c>

<@c.page>
<div class="mb-2">${username}</div>
<div class="mb-2">${message?ifExists}</div>
   <form method="post" xmlns="http://www.w3.org/1999/html">
       <div class="from-group row mt-1">
           <label class="col-sm-2 col-form-label">Password:</label>
           <div class="col-sm-6">
               <input class="form-control" type="password" placeholder="Password" name="password"/>
           </div>
       </div>
    <div class="from-group row mt-1">
        <label class="col-sm-2 col-form-label">Email:</label>
        <div class="col-sm-6">
            <#--запись снизу "${email!''}" - если не назначен email устанавливает значение почты ''-->
            <input class="form-control" type="email" placeholder="Email" name="email" value="${email!''}"/>
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