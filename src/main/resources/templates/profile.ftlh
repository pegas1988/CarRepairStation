<#import "parts/common.ftlh" as c>
<@c.page>
    <h5>${username}</h5>
    ${message?if_exists}
    <div class="form-row">
        <div class="form-group col-md-5">
            <form method="post">

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label"> Password: </label>
                    <div class="col-sm-5">
                        <input type="password" name="password" class="form-control" placeholder="Enter here password"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label"> Email: </label>
                    <div class="col-sm-5">
                        <input type="email" name="email" class="form-control" placeholder="some@some.com" value="${email!''}"/>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group row">
                    <div class="text" style="width: 200px">
                        <button class="btn btn-success px-1" style="width: 250px" type="submit">Save</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</@c.page>
