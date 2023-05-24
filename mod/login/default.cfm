
<cfset errorlist = "">


<!--- validazione --->


<cfif isDefined("hidden")> 
        <cfquery name="login" datasource="andrea">
            SELECT * 
            FROM utenti   
            WHERE email = <cfqueryparam value = "#form.emailutente#"> 
            AND psw = <cfqueryparam value = "#form.password#"> 
        </cfquery>

<cfdump  var="#login#">

    <cfif login.recordCount GTE 1 >
            <cfset session.name = login.nome />
            <cfset session.id = login.id/>
            <cfdump  var="#session#">
            <cflocation url="default.cfm">
        <cfelseif form.nomeutente neq email>
            <cfset errorlist = listAppend(errorlist, "emailutente")>
            <cflocation url="?p=login">
    </cfif>
</cfif>

<cfoutput>
    <div class="form-login-container d-flex justify-content-center align-items-center mt-5 flex-column">
        <h3 class="mb-2">Accedi al sito</h3>
        <form method="post" class="form d-flex flex-column">
            <input type="hidden" name="hidden">
            <div class="form-outline">
                <input type="text" id="emailutente" class="input-filter mb-2" placeholder="E-mail" name="emailutente" value=""/>
            </div>
            <cfif listFind(errorlist, "emailutente")>    
                <div class="text-danger">
                  inserire una email corretta!
                </div> 
              </cfif>     
            <div class="form-outline mb-2">
                <input type="text" id="password" class="input-filter " placeholder="password" name="password" value=""/>
            </div>
            <cfif listFind(errorlist, "password")>    
                <div class="text-danger">
                  inserire una pasword corretta!
                </div> 
            </cfif>     
                <button class="btn btn-secondary" type="submit" value="submit">Login</button>
        </form>
    </div>
</cfoutput>
