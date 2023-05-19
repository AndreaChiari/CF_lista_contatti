<cfoutput>


    <!--- lista utenti e query  --->

    <cfif url.listing eq "/listing.cfm">    
        <cfinclude  template="mod/contatti#url.listing#">
    </cfif>

    <cfif url.query eq "/querycontatti.cfm">    
        <cfinclude  template="mod/contatti#url.query#">
    </cfif>

    <!--- form --->

    <cfif url.form eq "/form.cfm">    
        <cfinclude  template="mod/contatti#url.form#">
    </cfif>

    <!--- delete--->

    <cfif url.del eq "/del.cfm">    
        <cfinclude  template="mod/contatti#url.del#">
    </cfif>

    <cfif url.delimg eq "/deleteimgtest.cfm">    
        <cfinclude  template="mod/contatti#url.delimg#">
    </cfif>

    <!--- update --->
   
    <cfif url.id eq "/id">    
        <cfinclude  template="mod/contatti/update.cfm">
    </cfif>

    <!--- export in vari formati --->

    <cfif url.pdf eq "/pdf.cfm">    
        <cfinclude  template="mod/contatti#url.pdf#">
    </cfif>

    <cfif url.xls eq "/xls.cfm">    
        <cfinclude  template="mod/contatti#url.xls#">
    </cfif>

    <cfif url.xlsdocs eq "/xlsdocs.cfm">    
        <cfinclude  template="mod/contatti#url.xlsdocs#">
    </cfif>

 </cfoutput>