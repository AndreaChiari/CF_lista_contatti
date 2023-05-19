<cfoutput>

    <!--- update --->
   
    <cfif isdefined("url.id")>    
        <cfinclude  template="form.cfm">
    <cfelseif isdefined("url.id_listing")>    
        <cfinclude  template="listing.cfm">
    </cfif>
 </cfoutput>