<cfinclude  template="querycontatti.cfm">
<cfheader name="Content-Disposition" value="attachment; filename=table.xls">

<cfset path = expandPath("./table.xls")>
<cfspreadsheet action="write" fileName="#path#" query="filtroContatti" overwrite="true" >
<a onload href="table.xls"> <a>