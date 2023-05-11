<cfquery name="ModificaContatto" datasource="andrea"> 
    UPDATE contatti 
    SET 
    Nome = <cfqueryparam value = "#form.Nome#">, 
    Cognome = <cfqueryparam value = "#form.Cognome#">, 
    Data_di_nascita = <cfqueryparam value = "#datadb#" cfsqltype="cf_sql_date">, 
    Email = <cfqueryparam value = "#form.email#">, 
    Telefono = <cfqueryparam value = "#form.telefono#">,
    Sesso = <cfqueryparam value = "#form.sesso#">
    Img = <cfqueryparam value = "#form.img#" cfsqltype="CF_SQL_BLOB">,
    WHERE ID = <cfqueryparam value = "#url.id#"> 
</cfquery> 

