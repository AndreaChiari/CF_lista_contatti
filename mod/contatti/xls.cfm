<!--- <script defer src="lista_contatti.js"></script> --->
<cfinclude  template="querycontatti.cfm">

<cfheader name="Content-Disposition" value="inline; filename=table.xls">
<cfcontent type="application/msexcel" file="table.xls">

<cfset path = expandPath("./table.xls")>
<cfspreadsheet action="write" fileName="#path#" query="filtroContatti" overwrite="true" >

<body onload="downloadExcel()">
    <a id="linktoxls" href="table.xls"><a> 
    <a id="redirect" href="default.cfm"><a>
</body>
    
