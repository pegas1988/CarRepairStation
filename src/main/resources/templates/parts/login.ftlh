<#macro login path isRegisteredForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> User Name : </label>
            <div class="col-sm-5">
                <input type="text" name="username" value ="<#if user??>${user.username}</#if>" class="form-control ${(usernameError??)?string('is-invalid', '')}" placeholder="Enter here username"/>
                <#if usernameError??>
                    <div class = "invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Password: </label>
            <div class="col-sm-5">
                <input type="password" name="password" class="form-control ${(passwordError??)?string('is-invalid', '')}" placeholder="Enter here password"/>
                <#if passwordError??>
                    <div class = "invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <#if isRegisteredForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> Password2: </label>
                <div class="col-sm-5">
                    <input type="password" name="password2" class="form-control ${(password2Error??)?string('is-invalid', '')}" placeholder="Retype password"/>
                    <#if password2Error??>
                        <div class = "invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> Email: </label>
                <div class="col-sm-5">
                    <input type="email" name="email" value ="<#if user??>${user.email}</#if>" class="form-control ${(emailError??)?string('is-invalid', '')}" placeholder="some@some.com"/>
                    <#if emailError??>
                        <div class = "invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="g-recaptcha" data-sitekey="6Lc1lKcZAAAAAOi7_bAJxIPXXRWcLDyshL0drFUT"></div>
                <#if captchaError??>
                    <div class="alert alert-danger" role="alert">
                        ${captchaError}
                    </div>
                </#if>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="form-group row">
            <div class="text pl-3" style="width: 205px">
                <#if !isRegisteredForm><a href="/registration">Add new user</a></#if>
            </div>
            <div class="text" style="width: 200px">
                <button class="btn btn-success px-1" style="width: 250px" type="submit"><#if isRegisteredForm>Create<#else>Sign In</#if></button>
            </div>
        </div>
    </form>
</#macro>


<#macro logout>
    <form action="/logout" method="post">
        <button class="btn btn-primary mb-2" type="submit">Sign Out</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>
</#macro>