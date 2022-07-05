<cfparam name="attributes.title" default="">
<cfparam name="attributes.headerless" default=false>
<cfif thistag.executionMode === 'start'>
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><cfoutput>#attributes.title#</cfoutput></title>
        <link href="./static/bootstrap.css" rel="stylesheet">
    </head>
    <body>
        <cfif !attributes.headerless>
            <nav class="navbar navbar-expand-lg navbar-light sticky-top" style="background-color: #c8e5fb;">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="./error-list.cfm">Список ошибок</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./new-error.cfm">Новая ошибка</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Пользователи
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="./new-user.cfm">Новый пользователь</a></li>
                                <li><a class="dropdown-item" href="./user-list.cfm">Список пользователей</a></li>
                                <li><a class="dropdown-item" href="./edit-user.cfm">Редактировать информацию</a></li>
                                </ul>
                            </li>
                        </ul>
                        <cfif structKeyExists(Form, 'logoutBtn')>
                            <cflogout>
                            <cflocation url="index.cfm" addToken='no'>
                        </cfif>
                        <form class="d-flex" method='POST'>
                            <button name='logoutBtn' class="btn" type="submit">Выход</button>
                        </form>
                    </div>
                </div>
            </nav>
        </cfif>

<cfelse>   
        <script src="./static/bootstrap.js"></script> 
    </body>
    </html>
</cfif>