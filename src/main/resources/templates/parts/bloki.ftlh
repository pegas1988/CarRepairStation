<#macro perebor>
    <div  class="card-columns">
        <#list messages as message>
            <div class="card my-3">
                <div>
                    <#if message.filename??>
                        <img src="/img/${message.filename}" class="card-img-top">
                    </#if>
                </div>
                <div>
                    <#if message.filename3??>
                        <img src="/img/${message.filename3}" class="card-img-top">
                    </#if>
                </div>
                <div>
                    <#if message.filename2??>
                        <img src="/img/${message.filename2}" class="card-img-top">
                    </#if>
                </div>
                <div class="form ml-3">
                    Марка авто:
                    <b>${message.tag}</b>
                </div>
                <div class="form ml-3">
                    ID авто в базе:
                    <b>${message.id}</b>
                </div>
                <div class="form ml-3">
                    Модель авто:
                    <b>${message.text}</b>
                </div>
                <div class="form ml-3">
                    Год выпуска:
                    <b>${message.year}</b>
                </div>
                <div class="form ml-3">
                    Цвет авто:
                    <b>${message.colour}</b>
                </div>
                <form method="post" action="/deleted" class="form-inline">
                <div class="col-l-5 my-5">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <input type="hidden" name="deleteId" class="form-control" value="${message.id}" style="width: 120px"/>
                    <button class="btn btn-success btn-s btn-block mt-2" style="width: 250px" type="submit">Удалить</button>
                </div>
                </form>
                <div class="card-footer text-muted">
                    Внес в базу:
                    <b>${message.authorName}</b>
                </div>
            </div>
        <#else>
            Таких автомобилей нету!
        </#list>
    </div>
</#macro>

<#macro dlyaFiltra>
    <div  class="card-columns">
        <#list messages as message>
            <div class="card my-3">
                <div>
                    <#if message.filename??>
                        <img src="/img/${message.filename}" class="card-img-top">
                    </#if>
                </div>
                <div>
                    <#if message.filename2??>
                        <img src="/img/${message.filename2}" class="card-img-top">
                    </#if>
                </div>
                <div>
                    <#if message.filename3??>
                        <img src="/img/${message.filename3}" class="card-img-top">
                    </#if>
                </div>
                <div class="form ml-3">
                    <span>${message.text}</span>
                </div>
                <div class="form ml-3">
                    <b>${message.year}</b>
                </div>
                <div class="form ml-3">
                    <span>${message.colour}</span>
                </div>
                <div class="form ml-3">
                    <strong>${message.authorName}</strong>
                </div>

            </div>
        <#else>
            Таких автомобилей нету!
        </#list>
    </div>
</#macro>

<#macro vvod>
    <div class="collapse <#if message??>show</#if>" id="collapseExample">
    <div class="form-group mt-3">
        <div class="form-group">
            <form method="post" action="/" enctype="multipart/form-data">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group">
                    <input type="text" name="tag" class="form-control ${(tagError??)?string('is-invalid', '')}" placeholder="Введите марку"
                           value = "<#if message??>${message.tag}</#if>"/>
                    <#if tagError??>
                        <div class = "invalid-feedback">
                            ${tagError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <input type="text" name="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                           value = "<#if message??>${message.text}</#if>" placeholder="Введите модель">
                    <#if textError??>
                    <div class = "invalid-feedback">
                        ${textError}
                    </div>
                    </#if>
                </div>
                <div class="form-group">
                    <input type="value" name="year" class="form-control" placeholder="Введите год выпуска" />
                </div>
                <div class="form-group">
                    <input type="text" name="colour" class="form-control" placeholder="Введите цвет" />
                </div>
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Выберите фото</label>
                </div>
                <div class="custom-file mt-3">
                    <input type="file" name="file2" id="customFile2">
                    <label class="custom-file-label" for="customFile2">Выберите фото</label>
                </div>
                <div class="custom-file mt-3">
                    <input type="file" name="file3" id="customFile3">
                    <label class="custom-file-label" for="customFile3" >Выберите фото</label>
                </div>

                <button type="submit" style="width: 250px" class="btn btn-primary mt-2" >Добавить</button>
            </form>
        </div>
    </div>
</#macro>