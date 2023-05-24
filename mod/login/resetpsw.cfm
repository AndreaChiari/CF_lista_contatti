<cfparam  name="psw1" default="">
<cfparam  name="psw2" default="">


<cfif isDefined("hidden")>
    <cfif form.psw1 eq form.psw2>
        <cfquery name="newpsw" datasource="andrea">
            UPDATE utenti 
            SET Psw = <cfqueryparam value = "#psw1#"> 
        </cfquery>
    </cfif>
</cfif>
<cfoutput>
    <div class="container-validazione d-flex justify-content-center align-items-center flex-column mt-5">
        <div class="border border-primary p-3">
            <p class="text-validation">Inserisci una nuova password</p>
            <form method="post" id="uservalidationform">
                <input name=hidden type="hidden">
                <label for="validationTooltip01">Nuova password</label>
                <input type="text" class="form-control" id="uservalidate" placeholder="" name="psw1" value= "#psw1#" required> 
                <label for="validationTooltip01">conferma la nuova password</label>
                <input type="text" class="form-control" id="uservalidate" placeholder="" name="psw2" value= "#psw2#" required> 
                <button type="submit" class="btn btn-primary mt-3">Invia</button>
            </form> 
        </div>
    </div>
</cfoutput>

