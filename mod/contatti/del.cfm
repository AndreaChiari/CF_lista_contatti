
    <cfquery name="EliminaContatto"
        datasource="andrea">
        DELETE FROM Contatti
        WHERE ID = <cfqueryparam value = "#url.del#">
    </cfquery>
<cflocation url = "default.cfm?p=contatti"> 