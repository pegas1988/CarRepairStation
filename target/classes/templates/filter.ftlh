<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<#import "parts/bloki.ftlh" as b>



<@c.page>

    <div class= "one">
        <@b.vvod/>
    </div>
    <h1>
    <div>Поиск авто</div>
    </h1>
    <div class="form-row">
        <div class="form-group col-md-2">
            <form method="post" action="/filter" class="form-inline">
                <div class="col-l-5 my-5">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <input type="text" name="filter" class="form-control" style="width: 250px" value="${filter?ifExists}" placeholder="Search by Brend">
                    <button class="btn btn-success btn-s btn-block mt-2" style="width: 250px" type="submit">Найти</button>
                </div>
            </form>
        </div>

    </div>
    <form method="post" action="db">
        <button class="btn btn-success mt-2" style="width: 250px">Отобразить всю базу</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>
    <form>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div>Вы искали автомобиль марки:  </div>


        <div><b>${filter}</b></div>

    </form>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <div>Найдены следующие модели:   </div>

    <@b.dlyaFiltra/>
</@c.page>