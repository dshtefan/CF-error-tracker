<cf_page title="New user" headerless=#!isUserLoggedIn()#>
    <cfif structKeyExists(Form, 'addBtn' )>
        <cfset newUserController=createObject('component', 'components.new-user' ) />
        <cfset isAdded=newUserController.addUser(form.loginInput, form.passwordInput, form.firstnameInput, form.surnameInput)>
        <cfif isAdded>
            <div class="alert alert-success" role="alert">
                Пользователь добавлен
            </div>
        <cfelse>
            <div class="alert alert-danger" role="alert">
                Что-то пошло не так!
              </div>
        </cfif>  
    </cfif>
    <cf_formshell>
        <h3 class="mb-5">Новый пользователь</h3>
        <form method='POST'>
            <div class="mb-4">
                <input type="text" id="loginInput" class="form-control form-control-lg" placeholder="Логин" name="loginInput" autocomplete="off" required/>
            </div>

            <div class="mb-4">
                <input type="password" id="passwordInput" class="form-control form-control-lg" placeholder="Пароль" name="passwordInput" autocomplete="off" required/>
            </div>

            <div class="mb-4">
                <input type="text" id="firstnameInput" class="form-control form-control-lg" placeholder="Имя" name="firstnameInput" required/>
            </div>

            <div class="mb-4">
                <input type="text" id="surnameInput" class="form-control form-control-lg" placeholder="Фамилия" name="surnameInput" required/>
            </div>

            <div class="mb-4">
                <button name='addBtn' class="btn btn-primary btn-lg btn-block" type="submit">Добавить</button>
            </div>   
            
        </form>  
        <div class="mb-4" <cfoutput>#"style=""display: #!isUserLoggedIn()?:"none"#"""#</cfoutput>>
            <form method='POST' action="./login.cfm">
                <button name='backBtn' class="btn btn-outline-primary" type="submit">Назад</button>
            </form>
        </div>   
    </cf_formshell>>      
</cf_page>