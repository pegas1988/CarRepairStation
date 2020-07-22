<#import "parts/common.ftlh" as c>


<@c.page>
    <div class="form-group col-md-6">
        <h3>
            <p class="text-center ">
                List of Users
            </p>
        </h3>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">Password</th>
                <th scope="col">Role</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <#list users as user>
                <tr>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td><#list user.roles as role>${role}<#sep>, </#list></td>
                    <td><a href="/user/${user.id}">edit</a> </td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>

</@c.page>