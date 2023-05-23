

<cfparam  name="nomeutente" default="">
<cfparam  name="emailutente" default="">
<cfparam  name="password" default="">

<cfif isDefined("hidden")>
   
          <cfquery name="registrazioneutente" datasource="andrea">
              INSERT INTO utenti (nome,email,psw)
              VALUES (  
                <cfqueryparam value = "#form.nomeutente#">,
                <cfqueryparam value = "#form.emailutente#">, 
                <cfqueryparam value = "#form.password#">             
                )         
          </cfquery>
    
</cfif>

<cfoutput>
    <div class="form-login-container d-flex justify-content-center align-items-center mt-5 flex-column">
        <h3 class="mb-2">Registrazione</h3>
        <form action="" method="post" class="form d-flex flex-column">
            <input type="hidden">
            <div class="form-outline">
                <input type="search" id="nomeutente" class="input-filter mb-2" placeholder="nome utente" name="nomeutente" value="#nomeutente#"/>
            </div>
            <div class="form-outline">
                <input type="search" id="emailutente" class="input-filter mb-2" placeholder="E-mail" name="emailutente" value="#emailutente#"/>
            </div>
            <div class="form-outline mb-2">
                <input type="search" id="password" class="input-filter " placeholder="password" name="password" value="#password#"/>
            </div>
                <button class="btn btn-secondary" type="submit" value="submit">Registrati</button>
        </form>
    </div>
</cfoutput>

