
<cfset errorlist = "">


<!--- validazione --->
<cfif isDefined("url.confermautente")>
    <cfinclude  template="confermautente.cfm">
<cfelse>
    <cfinclude  template="login.cfm">
</cfif>


