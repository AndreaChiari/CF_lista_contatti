<cfoutput>
    <cfif isdefined("url.id")>    
        <cfinclude  template="form.cfm">
    <cfelseif isDefined("url.del")>
        <cfinclude  template="del.cfm">
    <cfelse>
        <cfinclude  template="listing.cfm">
    </cfif>
 </cfoutput>