<cf_page title="Edit user">
    <cfset editUserController=createObject('component', 'components.edit-user') />
    <cfif structKeyExists(Form, 'editBtn')>
        <cfset isEdited=editUserController.editUserInfo(form.loginInput, form.passwordInput, form.firstnameInput, form.surnameInput)>
        <cfif isEdited>
            <div class="alert alert-success" role="alert">
                Данные изменены
            </div>
        <cfelse>
            <div class="alert alert-danger" role="alert">
                Что-то пошло не так!
            </div>
        </cfif>  
    </cfif>
    <cfset userInfo=editUserController.getUserInfo()>
    <cf_formshell>
        <h3 class="mb-5">Редактировать информацию пользователя</h3>
        <form id="editUserForm" method='POST'>
            <div class="mb-4">
                <input 
                    type="text" 
                    id="loginInput" 
                    class="form-control form-control-lg" 
                    placeholder="Логин" 
                    name="loginInput" 
                    autocomplete="off" 
                    value=<cfoutput>#userInfo.login#</cfoutput>
                    required/>
            </div>

            <div class="mb-4">
                <input 
                    type="password" 
                    id="passwordInput" 
                    class="form-control form-control-lg" 
                    placeholder="Пароль" 
                    name="passwordInput" 
                    autocomplete="off" 
                    value=<cfoutput>#userInfo.password#</cfoutput>
                    value="" 
                    required/>
            </div>

            <div class="mb-4">
                <input 
                    type="text" 
                    id="firstnameInput" 
                    class="form-control form-control-lg" 
                    placeholder="Имя" 
                    name="firstnameInput" 
                    value=<cfoutput>#userInfo.firstname#</cfoutput>
                    required/>
            </div>

            <div class="mb-4">
                <input 
                    type="text" 
                    id="surnameInput" 
                    class="form-control form-control-lg" 
                    placeholder="Фамилия" 
                    name="surnameInput" 
                    value=<cfoutput>#userInfo.surname#</cfoutput>
                    required/>
            </div>

            <div class="mb-4">
                <button name='editBtn' class="btn btn-primary btn-lg btn-block" type="submit">Изменить</button>
            </div>   
            
        </form>
    </cf_formshell>
</cf_page>