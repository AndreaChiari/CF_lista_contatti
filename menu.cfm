<cfinclude  template="mod/contatti/querycontatti.cfm">

<nav class="navbar navbar-expand-lg bg-primary header">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse d-flex justify-content-between align-items-center" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active text-white" aria-current="page" href="/CF_lista_contatti">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-white" href="?p=contatti">Lista Contatti</a>
          </li>
        </ul>
        <div class="d-flex">
            <div>
                <h5 class="text-white">Login</h5>
            </div>
            <div>
                <cfoutput>
                    <h5 class="text-white">#filtrocontatti.email#</h5>
                </cfoutput>
            </div>
        </div>
      </div>
    </div>
</nav>