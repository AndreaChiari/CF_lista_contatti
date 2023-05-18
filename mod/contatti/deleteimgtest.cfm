<cfquery name="EliminaImg" datasource="andrea">
    DELETE FROM Contatti
    WHERE ID = <cfqueryparam value = "#url.id#">
    AND Img = <cfqueryparam value = "#img#">
</cfquery>