<cf_page title="Error list">
    <cfset errorListController=createObject('component', 'components.error-list' ) />
    <cfset errorList=errorListController.getErrorList()>
    <table class="table table-hover table-borderless" id="error-list">
        <caption>Список ошибок</caption>
        <thead class="table-light">
            <tr>
                <th class="sortable">#</th>
                <th class="sortable">Описание</th>
                <th class="sortable">Дата</th>
                <th class="sortable">Пользователь</th>
                <th class="sortable">Срочность</th>
                <th class="sortable">Критичность</th>
                <th class="sortable">Статус</th>
            </tr>
        </thead>
        <tbody >
            <cfloop item="error" index="i" array="#errorList#"> 
                <cfoutput>
                    <tr id="row-#i#" style="cursor: pointer;">
                        <th>#error.id#</td>
                        <td>#error.shortdescription#</td>
                        <td>#error.errordate#</td>
                        <td>#error.login#</td>
                        <td>#error.priorityname#</td>
                        <td>#error.criticalityname#</td>
                        <td>#error.statusname#</td>
                    </tr>
                </cfoutput>
            </cfloop>
            <cfoutput>
                <script>
                    var #toScript(errorList, "jsList")#
                    for (let i = 0; i <= jsList.length; i++) {
                        const row = document.getElementById(`row-${i + 1}`);
                        row.addEventListener("click", () => {
                            window.location.href = `./edit-error.cfm?id=${jsList[i].id}`;
                        });
                    }
                </script>
            </cfoutput>
        </tbody>
    </table>
</cf_page>
<style>
    .sortable {
        background-image: url(./static/bg.gif);
        background-repeat: no-repeat;
        background-position: center right;
        cursor: pointer;
    }
</style>
<script src="./static/tablesort.min.js"></script>
<script>
    new Tablesort(document.getElementById('error-list'));
</script>