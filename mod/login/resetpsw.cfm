<cfset errorlist = "">

<cfparam  name="psw1" default="">
<cfparam  name="psw2" default="">



<cfif isDefined("hidden")>
    
    <cfif isempty(form.psw1)>
        <cfset errorlist = listAppend(errorlist, "errorpsw1")>
    </cfif>
    
    <cfif isempty(form.psw2)>
        <cfset errorlist = listAppend(errorlist, "errorpsw2")>
    </cfif>
    
    <cfif isEmpty(errorlist)>
        <cfif form.psw1 eq form.psw2>
            <cfquery name="newpsw" datasource="andrea" result="updateResult">
                UPDATE utenti 
                SET Psw = <cfqueryparam value = "#psw1#"> 
            </cfquery>
            <cflocation  url="?p=login" addToken="no">
        <cfelse>
            <cfset errorlist = listAppend(errorlist, "nomatch")>
        </cfif>
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
                <cfif listFind(errorlist, "errorpsw1")>    
                    <div class="text-danger">
                      inserire una password corretta!
                    </div> 
                </cfif>      
                <label for="validationTooltip01">conferma la nuova password</label>
                <input type="text" class="form-control" id="uservalidate" placeholder="" name="psw2" value= "#psw2#" required> 
                <cfif listFind(errorlist, "errorpsw2")>    
                    <div class="text-danger">
                      inserire una password corretta!
                    </div> 
                </cfif>     
                <button type="submit" class="btn btn-primary mt-3">Invia</button>
            </form> 
            <cfif listFind(errorlist, "nomatch")>    
                <div class="text-danger">
                  le password non corrispondono!
                </div> 
            </cfif>      
        </div>
    </div>
</cfoutput>

