<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<#import "parts/bloki.ftlh" as b>


<@c.page>
    <div>
        <h1>All cars in base:</h1>
        <a> this is a ne line for GitHub</a>
        <a> and again</a>
    </div>
    <@b.perebor/>
    <form method="post" action="/deleted" class="form-inline">
        <div class="col-l-5 my-5">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="text" name="deleteId" class="form-control" value="${deleteId?ifExists}"style="width: 250px" placeholder="Введите id авто">
            <button class="btn btn-success btn-s btn-block mt-2" style="width: 250px" type="submit">Удалить</button>
        </div>
    </form>
</@c.page>