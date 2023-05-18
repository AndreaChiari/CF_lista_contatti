
 <cfoutput>

<cfif isDefined(url.p)> 
    <cfif url.p eq "contatti" || url.p eq "profilo">
        <cfinclude  template="mod/#url.p#">
    </cfif>
    
    <cfif url.p eq "contatti" || url.p eq "profilo">
        <cfinclude  template="menu/#url.p#">
    </cfif>
</cfif>
    
 </cfoutput>