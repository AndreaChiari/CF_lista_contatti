
<cfset errorlist = "">

<cfif isDefined("uservalidate")>
    <cfset uniqueID = createUUID()>
    <cfquery name="uservalidation" datasource="andrea">
        SELECT * 
        FROM utenti   
        WHERE nome = <cfqueryparam value = "#form.uservalidate#">  
    </cfquery>

<cfif uservalidation.recordCount GTE 1>
    <cfquery name="addUUID" datasource="andrea">
        UPDATE utenti 
        SET UUID = <cfqueryparam value = "#uniqueID#"> 
    </cfquery>


    <cfmail
            from="andrea.chiari@womweb.it"
            subject="password reset"
            to="#uservalidation.email#"
            type="html">
            <p>Ecco il link di registrazione per resettare la tua password: <a href="http://andrea.womtest.it/CF_lista_contatti/default.cfm?p=login&resetpsw&UUID=#uniqueID#">Password reset</a></p>

    </cfmail>


   <cfinclude  template="emailsuccess.cfm">
<cfelse>
    <cfset errorlist = listAppend(errorlist, "wrongname")>
</cfif>
</cfif>

<div id="container-validazione" class="container-validazione d-flex justify-content-center align-items-center flex-column mt-5">
    <div class="border border-primary p-3 mb-3">
        <p class="text-validation">Inserisci il nome utente, collegato al tuo account</p>
        <form method="post" id="uservalidationform">
            <label for="validationTooltip01">Nome Utente</label>
            <input type="text" class="form-control" id="uservalidate" name="uservalidate" value="" required>
            <cfif listFind(errorlist, "wrongname")>    
                <div class="text-danger">
                  inserisci un nome utente valido!
                </div> 
            </cfif>       
            <button id="successname" class="btn btn-primary mt-3">Invia</button>
        </form> 
    </div>  
</div>

