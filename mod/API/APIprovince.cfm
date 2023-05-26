<!--- query province --->


<cfquery name="getProvince" datasource="andrea">
    SELECT *
    FROM province
</cfquery>


<cfoutput query="getProvince">
    <cfset province = Arraynew(1)>
    <cfloop query="getProvince">
        <cfset province[currentRow] = structNew()>
        <cfset province[currentRow].id = getProvince.id>
        <cfset province[currentRow].text = getProvince.nome>
        <cfset province[currentRow].sigla = getProvince.sigla>
    </cfloop>
</cfoutput>

<cfscript>
    serializeJSON("getProvince");
</cfscript>

<cfcontent type="application/JSON">
<cfoutput>#serializeJSON(province)#</cfoutput>