
    <cfquery name="EliminaContatto"
        datasource="andrea">
        DELETE FROM Contatti
        WHERE ID = <cfqueryparam value = "#url.id#">
    </cfquery>
<cflocation url = "listing.cfm"> 