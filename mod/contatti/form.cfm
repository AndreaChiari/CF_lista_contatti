﻿
<cfdump  var="#form#">


<!--- setto una variabile per raccogliere gli errori in una lista --->

<cfset errorlist = "">

<!--- controllo se l'input hidden è definito --->

<!--- imposto i params --->
<cfparam  name="url.update" default="">
<cfparam  name="url.id" default="">
<cfparam  name="nome" default="">
<cfparam  name="cognome" default="">
<cfparam  name="data" default="">
<cfparam  name="email" default="">
<cfparam  name="telefono" default="">
<cfparam  name="sesso" default="">
<cfparam  name="currentimg" default="">
<cfparam  name="checkimg" default="">
<cfparam  name="province" default="">

<cfif isDefined("hidden")>

<!--- inizio le validazioni--->

    <!--- validazione provincia--->

    <cfif isempty(form.province)>
      <cfset errorlist = listAppend(errorlist, "provincia")>
    </cfif>
  <!--- validazione telefono--->
      <cfif not isNumeric(telefono)>
        <cfset errorlist = listAppend(errorlist, "telefono")>
      </cfif>

  <!--- validazione email--->
      <cfif not isValid("email",form.email)>
        <cfset errorlist = listAppend(errorlist, "email")>
      </cfif>
      
      
      
  <!--- validazione data--->
        <cftry>
          <cfset year = ListGetAt(form.data, 1 , "-")>
          <cfset month = ListGetAt(form.data, 2 , "-")>
          <cfset day = ListGetAt(form.data, 3 , "-")>
          <cfset datadb = createDate(year,month,day)>
          
          <cfcatch type="any">
              <cfset errorlist = listAppend(errorlist, "data")>
          </cfcatch>
        </cftry>
        
        <cfdump  var="#expandPath("mod/contatti/img")#">
  <!--- validazione img e upload in locale--->
        <cfif isEmpty(errorlist)>
            <cfif len(trim(form.img)) >
                <cftry> 
                    <cffile action="upload"
                      nameconflict="MakeUnique"
                      accept="image/jpeg, image/gif, image/jpg, image/png"
                      fileField="#form.img#"
                      destination="#expandPath("mod/contatti/img")#">
                      <cfset imgDb = "#cffile.serverfile#">
                <cfcatch type="any">
                        <cfset errorlist = listAppend(errorlist, "fileformat")>            
                </cfcatch>
                </cftry> 
            <cfelse>
                <cfset imgDb = "">
            </cfif>
        </cfif>
      
  <!--- imposto due condizioni affinchè venga eseguita la query
         per poi inserire una nuova row nel db: 
         1) controllo se non ci sono errori 
         2) se l'id non è presente nella query string --->

      <cfif isEmpty(errorlist)>
        <cfif url.id EQ 0>
          <cfquery name="aggiungiContatto" datasource="andrea">
              INSERT INTO contatti (nome, provincia_id, cognome, data_di_nascita, Email, Telefono, Sesso, Img)
              VALUES (  
                <cfqueryparam value = "#form.Nome#">,
                <cfqueryparam value = "#form.Province#">, 
                <cfqueryparam value = "#form.Cognome#">,  
                <!--- data modificata --->
                <cfqueryparam value = "#datadb#" cfsqltype="cf_sql_date">,   
                <cfqueryparam value = "#form.email#">,
                <cfqueryparam value = "#form.telefono#">,
                <cfqueryparam value = "#form.sesso#">,
                <!--- controllo se l'immagine non è vuota --->           
                <cfqueryparam value = "#imgDb#">            
                )         
          </cfquery>
        <cfelseif "url.id" GT 0>
          <cfinclude template="update.cfm">
        </cfif>
        <cflocation url = "default.cfm?p=contatti">
      </cfif>

<cfelse>

  <!--- avvio una query per precompilare i campi se è presente l'id --->
      <cfif "url.update" GT 0>         
        <cfquery name="getContatto" datasource="andrea">
          SELECT * 
          FROM contatti WHERE ID= <cfqueryparam value = "#url.id#">
        </cfquery>
        <cfoutput query="getContatto">
            <cfset nome= nome>
            <cfset province = provincia_id>
            <cfset cognome= cognome>
            <cfset data= dateFormat(data_di_nascita, 'yyyy-mm-dd' )>
            <cfset email= email>
            <cfset telefono= telefono>
            <cfset sesso= sesso>
            <cfset currentimg= img>
        </cfoutput>
      </cfif>

</cfif>

      <cfquery name="getProvince" datasource="andrea">
          SELECT *, ID as idprovincia 
          FROM province
      </cfquery>


<div class="container mt-5 main-form-container">
    <cfoutput>
      <form class="needs-validation" action="" method="post" enctype="multipart/form-data">
        <input type="hidden" name="hidden">
        <div class="form-row">
          <div class="col-md-4 mb-3">
            <label for="validationTooltip01">Nome</label>
            <input type="text" class="form-control" id="validationTooltip01" placeholder="Nome" name="nome" value= "#nome#" required maxlength="50">  
             
            <cfif listFind(errorlist, "nome")>    
              <div class="text-danger">
                il nome non può contenere spazi!
              </div> 
            </cfif>          
          </div>
          <div class="col-md-4 mb-3">
            <label for="validationTooltip02">Cognome</label>
            <input type="text" class="form-control" id="validationTooltip02" placeholder="Cognome" name="cognome" value="#cognome#" required maxlength="50">
            <cfif listFind(errorlist, "cognome")>  
              <div class="text-danger">
                il cognome non può contenere spazi!
              </div>
            </cfif>
          </div>
          <div class="col-md-4 mb-3">
            <div class="form-group">
                <label class="active" for="dateStandard">Data di nascita</label>
                <input type="date" id="dateStandard" name="data" value="#data#">
                <cfif listFind(errorlist, "data")>  
                  <div class="text-danger">
                    la data non è valida!
                  </div>
                </cfif>
            </div>
          </div>
        </div>
        <div class="form-row">
          <div class="col-md-6 mb-3">
            <label for="validationTooltip03">E-mail</label>
            <input type="text" class="form-control" id="validationTooltip03" placeholder="E-mail" name="email" value="#email#" maxlength="50">
            <cfif listFind(errorlist, "email")>
              <div class="text-danger">
                la e-mail non può contenere spazi!
              </div>
            </cfif>
          </div>
          <div class="col-md-3 mb-3">
            <label for="validationTooltip04">Telefono</label>
            <input type="text" class="form-control" id="validationTooltip04" placeholder="N.di telefono" name="telefono" value="#telefono#" maxlength="20">
            <cfif listFind(errorlist, "telefono")>           
              <div class="text-danger">
                Inserire un numero corretto!
              </div>
            </cfif>
            <div class="mt-3">
              <select name="province" id="province" class="me-3 ms-1 mb-3"> 
                  <option name="provincia" value="" id="option" <cfif province eq ""> selected </cfif>> --- </option>
                <cfloop query="getProvince">
                  <option name="provincia" value="#idprovincia#" id="option" <cfif province eq idprovincia> selected </cfif>> #nome# </option>
                </cfloop>             
              </select>
              <cfif listFind(errorlist, "provincia")>           
                <div class="text-danger">
                  Inserire una provincia!
                </div>
              </cfif>   
            </div>        
          </div>
          <div class="col-md-3 mb-3">
            <p>Sesso</p>
            <div class="mt-3">
                <input class="me-2" type="radio" id="radio" name="sesso" value="M" <cfif sesso is "M"> checked </cfif>>
                <label for="">M</label><br>
                <input class="me-2" type="radio" id="radio" name="sesso" value="F"  <cfif sesso is "F"> checked </cfif>>
                <label for="">F</label><br>
            </div>
          </div>
          <div class="mb-3">
              <cfif currentimg is not "">
                <div class="mb-3 d-flex align-items-center">
                  <img src="mod/contatti/img/#currentimg#" alt=""/>

                  <!--- checkbox delete img --->
                  <div class="ms-3">
                    <input class="form-check-input" type="checkbox" name="checkimg" value= "1" id="flexCheckDefault">
                    <label class="form-check-label" for="flexCheckDefault">Elimina l'immagine</label>
                  </div>
                </div>
              </cfif>
              <label for="formFile" class="form-label">
                <cfif currentimg is not "">
                  Modifica la tua immagine profilo  
                <cfelse>    
                  Aggiungi la tua immagine profilo
                </cfif>
                  </label>               
                  <input class="form-control" type="file" id="formFile" name="img" value="#currentimg#">
                  <cfif listFind(errorlist, "fileformat")>           
                    <div class="text-danger">
                      Inserire un formato per l'immagine corretto!
                    </div>
                  </cfif>
          </div>
    </cfoutput>
        <div class="d-flex align-items-center mb-5">
          <button class="btn btn-primary me-5 mt-3" type="submit" value="submit">SALVA</button>
          <a href="listing.cfm" type="button" class="btn btn-secondary mt-3">HOME</a>
        </div>
   </form>
</div>
</div>
