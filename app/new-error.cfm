<cf_page title="New error">
    <cfset newErrorController=createObject('component', 'components.new-error' ) />
    <cfset priorityList=newErrorController.getPriorities()>
    <cfset criticalityList=newErrorController.getCriticality()>  
    <cfif structKeyExists(Form, 'addErrBtn' )>
        <cfset isAdded=newErrorController.addError(form.nameInput, form.description, form.priority, form.criticality, form.comment)>
        <cfif isAdded>
            <div class="alert alert-success" role="alert">
                Ошибка добавлена
            </div>
        <cfelse>
            <div class="alert alert-danger" role="alert">
                Что-то пошло не так!
              </div>
        </cfif>
    </cfif>
    <cf_formshell>
        <h3 class="mb-5">Новая ошибка</h3>
        <form method='POST'>
            <div class="mb-4">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-lg" placeholder="Название" name="nameInput" required/>
                    <label for="nameInput">Название</label>
                </div>
            </div>

            <div class="mb-4">
                <div class="form-floating">
                    <textarea class="form-control" placeholder="Описание" name="description" style="height: 150px" required></textarea>
                    <label for="description">Описание</label>
                </div>
            </div>

            <div class="mb-4">
                <div class="form-floating">
                    <select class="form-select" name="priority">
                        <cfloop item="priority" array="#priorityList#"> 
                            <cfoutput>
                                <option value="#priority.id#">#priority.priorityname#</option>
                            </cfoutput>
                        </cfloop>
                    </select>
                    <label for="priority">Срочность</label>
                </div>
            </div>

            <div class="mb-4">
                <div class="form-floating">
                    <select class="form-select" name="criticality">
                        <cfloop item="criticality" array="#criticalityList#"> 
                            <cfoutput>
                                <option value="#criticality.id#">#criticality.criticalityname#</option>
                            </cfoutput>
                        </cfloop>
                    </select>
                    <label for="criticality">Критичность</label>
                </div>
            </div>

            <div class="mb-4">
                <div class="form-floating">
                    <textarea class="form-control" placeholder="Комментарий" name="comment" style="height: 100px" required></textarea>
                    <label for="comment">Комментарий</label>
                </div>
            </div>


            <div class="mb-4">
                <button name='addErrBtn' class="btn btn-primary btn-lg btn-block" type="submit">Добавить</button>
            </div>   
            
        </form>
    </cf_formshell>      
</cf_page>