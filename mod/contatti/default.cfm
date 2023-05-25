<cfoutput>
    <cfif isdefined("url.id")>    
        <cfinclude  template="form.cfm">
    <cfelseif isDefined("url.del")>
        <cfinclude  template="del.cfm">
    <cfelseif isDefined("url.welcome")>
        <cfinclude  template="welcome.cfm">
    <cfelseif isDefined("url.xls")>
        <cfinclude  template="xls.cfm">
    <cfelseif isDefined("url.xlsdoc")>
        <cfinclude  template="xlsdoc.cfm">
    <cfelseif isDefined("url.pdf")>
        <cfinclude  template="pdf.cfm">
    <cfelseif isDefined("url.img")>
        <cfinclude  template="img/logowom.png">
    <cfelse>
        <cfinclude  template="listing.cfm">
    </cfif>
 </cfoutput>