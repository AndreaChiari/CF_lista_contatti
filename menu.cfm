<cfif isDefined("form.logout")>
  <cfset endsession= structdelete(session, 'name', true)/>
</cfif>

<nav class="navbar navbar-expand-lg bg-primary header">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse d-flex justify-content-between align-items-center" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active text-white" aria-current="page" href="default.cfm">Home</a>
          </li>
          <cfif isdefined("session.name")>
            <li class="nav-item">
              <a class="nav-link text-white" href="?p=contatti">Lista Contatti</a>
            </li>
          </cfif>
        </ul>
        <div class="d-flex">
          <cfif not isdefined("session.name")>
            <div>
              <a href="?p=signin"><h5 class="text-white me-3">Registrati</h5></a>
            </div>
            <div>
              <a href="?p=login"><h5 class="text-white me-2">Login</h5></a>
            </div>
            <cfelse>
              <div class="d-flex justify-content-center align-items-center">
                <form method="post"><button class="btn me-2 text-white" type="submit" value="logout" name="logout">Logout</button></form>
                <img class="me-5 imglogo" src="mod/contatti/img/Logo-azienda.jpg">
              </div>
          </cfif>
            <div>
                <cfoutput>
                    <h5 class="text-white"></h5>
                </cfoutput>
            </div>
        </div>
      </div>
    </div>
</nav>