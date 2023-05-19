
 <cfoutput>
    <cfparam  name="url.p" default="">

    <cfinclude  template="/menu.cfm">
    <cfinclude  template="/footer.cfm">

    <cfif not isEmpty(url.p)>
        <cfinclude  template="mod/#url.p#/default.cfm">
    </cfif>
    
 </cfoutput>