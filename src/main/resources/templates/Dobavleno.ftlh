<#import "parts/common.ftlh" as c>
<#import "parts/bloki.ftlh" as b>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-5">
            <form method="post" action="/filter" class="form-inline">
                <div class="col-l-5 my-5">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <input type="text" name="filter" class="form-control" style="width: 250px" value="${filter?ifExists}" placeholder="Search by Brend">
                    <button class="btn btn-success btn-s btn-block mt-2" style="width: 250px" type="submit">Найти</button>
                </div>
            </form>
        </div>

    </div>

    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        <div style="width: 224px">
            Добавить в базу автомобиль
        </div>
    </a>
    <div class= "one">
        <@b.vvod/>
    </div>

    <form method="post" action="db">
        <button class="btn btn-success mt-2" style="width: 250px">Отобразить всю базу</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>

    <h3>
    <p class="text-center ">
        Auto sucesefully dded to the Base!
    </p>
    </h3>


</@c.page>