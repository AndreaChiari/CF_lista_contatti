<cfif isDefined("uservalidate")>
    <cfset uniqueId = createUUID()>
    <cfquery name="uservalidation" datasource="andrea">
        SELECT * 
        FROM utenti   
        WHERE nome = <cfqueryparam value = "#form.uservalidate#">  
    </cfquery>

<cfif uservalidation.recordCount GTE 1>
    <cfmail  from="andrea.chiari@womweb.it"  subject="subject"  to="chiariandrea94@gmail.com">
        Ecco il link di registrazione per resettare la tua password: 
    </cfmail>
</cfif>
</cfif>

<div class="container-validazione d-flex justify-content-center align-items-center flex-column mt-5">
    <div class="border border-primary p-3">
        <p class="text-validation">Inserisci il nome utente, collegato al tuo account</p>
        <form method="post" id="uservalidationform">
            <label for="validationTooltip01">Nome Utente</label>
            <input type="text" class="form-control" id="uservalidate" placeholder="" name="uservalidate" value= "" required> 
            <button class="btn btn-primary mt-3">Invia</button>
        </form> 
    </div>
</div>
