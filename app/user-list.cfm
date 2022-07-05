<cf_page title="User list">
    <cfset userListController=createObject('component', 'components.user-list' ) />
    <cfset userList=userListController.getUserList()>
    <table class="table table-hover table-borderless">
        <caption>Список пользователей</caption>
        <thead class="table-light">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Логин</th>
                <th scope="col">Имя</th>
                <th scope="col">Фамилия</th>
            </tr>
        </thead>
        <tbody >
            <cfloop item="user" array="#userList#"> 
                <cfoutput>
                    <tr>
                        <th>#user.id#</td>
                        <td>#user.login#</td>
                        <td>#user.firstname#</td>
                        <td>#user.surname#</td>
                    </tr>
                </cfoutput>
            </cfloop>
        </tbody>
    </table>
</cf_page>