
<cfset errorlist = "">


<!--- validazione --->
<cfif isDefined("url.confermautente")>
    <cfinclude  template="confermautente.cfm">
<cfelseif isDefined("url.resetpsw")>
    <cfinclude  template="resetpsw.cfm">
<cfelse>
    <cfinclude  template="login.cfm">
</cfif>


