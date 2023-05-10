<cfquery name="ModificaContatto" datasource="andrea"> 
    UPDATE contatti 
    SET Nome = '#Form.nome#', 
    Cognome = '#Form.cognome#', 
    Data_di_nascita = '#Form.data#', 
    Email = '#Form.email#', 
    Telefono = '#Form.telefono#'
    Sesso = '#Form.sesso#' ,
    WHERE ID = #url.id# 
</cfquery> 
