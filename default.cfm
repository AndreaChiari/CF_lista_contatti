
 <cfoutput>

    <cfparam  name="url.p" default="">

    <cfif url.p eq "contatti" || url.p eq "profilo">
        <cfinclude  template="mod/#url.p#">
    </cfif>

    <cfif url.p eq "contatti" || url.p eq "profilo">
        <cfinclude  template="menu/#url.p#">
    </cfif>

 </cfoutput>