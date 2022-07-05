<cf_page title="Login" headerless=true>
    <cfif structKeyExists(Form, 'logInBtn' )>
        <cfset loginController=createObject('component', 'components.login' ) />
        <cfset isLoggedIn=loginController.login(form.loginInput, form.passwordInput)>
        <cflocation url="index.cfm" addToken='no'>
    </cfif>
    <section class="vh-100" style="background-color: #c8e5fb;">
        <cf_formshell>
            <h3 class="mb-5">Вход</h3>
            <form id='loginForm' name='loginForm' method='POST'>
            <div class="form-outline mb-4">
                <label class="form-label" for="loginInput">Логин</label>
                <input type="text" id="loginInput" class="form-control form-control-lg" placeholder="Login" name="loginInput" required/>
            </div>

            <div class="form-outline mb-4">
                <label class="form-label" for="passwordInput">Пароль</label>
                <input type="password" id="passwordInput" class="form-control form-control-lg" placeholder="Password" name="passwordInput" required/>
            </div>

            <div class="mb-4">
                <button name='logInBtn' class="btn btn-primary btn-lg btn-block" type="submit">Войти</button>
            </div>  
            </form> 
            <div class="mb-4">
                <form method='POST' action="./new-user.cfm">
                    <button name='backBtn' class="btn btn-outline-primary" type="submit">Новый пользователь</button>
                </form>
            </div>       
        </cf_formshell>
      </section>
</cf_page>
    