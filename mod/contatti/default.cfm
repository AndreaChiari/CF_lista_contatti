<cfoutput>

    <cfparam  name="url.p" default="">

    <!--- lista utenti e query  --->

    <cfif url.listing eq "/listing">    
        <cfinclude  template="mod/contatti#url.listing#">
    </cfif>

    <cfif url.query eq "/querycontatti">    
        <cfinclude  template="mod/contatti#url.query#">
    </cfif>

    <!--- form --->

    <cfif url.form eq "/form">    
        <cfinclude  template="mod/contatti#url.form#">
    </cfif>

    <!--- delete--->

    <cfif url.del eq "/del">    
        <cfinclude  template="mod/contatti#url.del#">
    </cfif>

    <cfif url.delimg eq "/deleteimgtest">    
        <cfinclude  template="mod/contatti#url.delimg#">
    </cfif>

    <!--- update --->
   
    <cfif url.id eq "/id">    
        <cfinclude  template="mod/contatti/#url.id#">
    </cfif>

    <!--- export in vari formati --->

    <cfif url.pdf eq "/pdf">    
        <cfinclude  template="mod/contatti#url.pdf#">
    </cfif>

    <cfif url.xls eq "/xls">    
        <cfinclude  template="mod/contatti#url.xls#">
    </cfif>

    <cfif url.xlsdocs eq "/xlsdocs">    
        <cfinclude  template="mod/contatti#url.xlsdocs#">
    </cfif>

 </cfoutput>