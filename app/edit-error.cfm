<cf_page title="Edit Error">
    <cfset editErrorController=createObject('component', 'components.edit-error')/>
    <cfif structKeyExists(Form, 'updErrBtn')>
        <cfset isEdited=editErrorController.updateErrorStatus(form.status, form.comment, form.errorid)>
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
    <cfif isDefined("URL.id")>
        <cfif editErrorController.isErrorExist(url.id)>
            <cfset error=editErrorController.getErrorById(url.id)>
            <div class="container-fluid py-3 ">
                <div class="row p-2">
                    <div class="container-fluid">
                        <cfoutput>
                        <h1>#error.errorInfo.shortdescription#</h1>
                        <h6>#error.errorInfo.fulldescription#</h6>
                        <div class="d-flex mt-4">
                            <p><b>Дата создания</b> #error.errorInfo.errordate#</p>
                            <p>&emsp;</p>
                            <p>&emsp;</p>
                            <p><b>Создал:</b> #error.errorInfo.login#</p>
                        </div>
                        <div class="d-flex">
                            <p><b>Приоритет:</b> #error.errorInfo.priorityname#</p>
                            <p>&emsp;</p>
                            <p>&emsp;</p>
                            <p><b>Критичность:</b> #error.errorInfo.criticalityname#</p>
                        </div>
                        <div class="d-flex">
                            <p><b>Текущий статус:</b> #error.laststatus.statusname#</p>
                        </div>

                        <cfif ArrayLen(editErrorController.statusMap[error.laststatus.id])>
                            <cfset nextActionNames=editErrorController.getNextActionNames(error.laststatus.id)>
                            <div class="mb-5 col-10 col-md-6 col-lg-5 col-xl-3 mt-2">
                                <form method='POST'>
                                    <h4 class="mb-1">Изменить статус</h4>
                                        <input type="hidden" name="errorid" value="#error.errorinfo.id#">
                                        <div class="form-floating mb-2">
                                            <select class="form-select form-select-md" name="status">
                                                <cfloop item="actions" index="i" array="#nextActionNames#"> 
                                                    <option value="#actions.id#">#actions.actionname#</option>
                                                </cfloop>
                                            </select>
                                            <label for="status">Действие</label>
                                        </div>
                                        <div class="form-floating mb-2">
                                            <textarea class="form-control" placeholder="Комментарий" name="comment" style="height: 130px" maxlength="250" required></textarea>
                                            <label for="comment">Комментарий</label>
                                        </div>
                                        <button name='updErrBtn' class="btn btn-primary btn-md btn-block " type="submit">Изменить</button>
                                </form>
                            </div>
                        </cfif>                        
                        
                        <table class="table table-hover table-borderless">
                            <caption>История изменения статуса</caption>
                            <thead class="table-light">
                                <tr>
                                    <th scope="col">№</th>
                                    <th scope="col">Время изменения</th>
                                    <th scope="col">Статус</th>
                                    <th scope="col">Пользователь</th>
                                    <th scope="col">Комментарий</th>
                                </tr>
                            </thead>
                            <tbody >
                                <cfloop item="error" index="i" array="#error.errorlog#"> 
                                    <tr>
                                        <th>#i#</td>
                                        <td>#error.actiondate#</td>
                                        <td>#error.statusname#</td>
                                        <td>#error.login#</td>
                                        <td>#error.actioncomment#</td>
                                    </tr>
                                </cfloop>
                            </tbody>
                        </table>
                        </cfoutput>
                    </div>  
                </div>
            </div> 
        <cfelse>
            <div class="alert alert-danger" role="alert">
                Ошибка с таким ID отсутствует
            </div> 
        </cfif>
    <cfelse>
        <div class="alert alert-danger" role="alert">
            В запросе отсутствует ID ошибки
        </div> 
    </cfif>
</cf_page>