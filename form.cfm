<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Lista Contatti</title>
</head>

<cfdump  var="#form#">

<!--- setto una variabile per raccogliere gli errori in una lista--->

<cfset errorlist = "">

<!--- controllo se l'input hidden è definito--->

<!--- imposto i params per la validazione con default vuoto--->
<cfparam  name="nome" default="">
<cfparam  name="cognome" default="">
<cfparam  name="data" default="">
<cfparam  name="email" default="">
<cfparam  name="telefono" default="">
<cfparam  name="sesso" default="">
<cfparam  name="img" default="">


<cfif isDefined("hidden")>

<!--- inizio le validazioni--->

  <!--- validazione telefono--->
      <cfif not isNumeric(telefono)>
        <cfset errorlist = listAppend(errorlist, "telefono")>
      </cfif>

  <!--- validazione email--->
      <cfif not isValid("email",form.email)>
        <cfset errorlist = listAppend(errorlist, "email")>
      </cfif>
      
 <!--- validazione img--->
      <cfif len(trim(form.img))>
        <cffile action="upload"
           nameconflict="MakeUnique"
           fileField="#form.img#"
           destination="#expandPath("img")#">
          <cfset imgDb = cffile.serverfile>
      <cfelse>
        <cfset imgDb = "">
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

  <!--- validazione file--->
      
  <!--- imposto due condizioni affinchè venga eseguita la query
         per poi inserire una nuova row nel db: 
         1) controllo se non ci sono errori 
         2) se l'id non è presente nella query string --->

      <cfif isEmpty(errorlist)>
        <cfif not isDefined("url.id")>
          <cfquery name="aggiungiContatto" datasource="andrea">
              INSERT INTO contatti (nome, cognome, data_di_nascita, Email, Telefono, Sesso, Img)
              VALUES (  
                <cfqueryparam value = "#form.Nome#">,
                <cfqueryparam value = "#form.Cognome#">,  
                <!--- data modificata --->
                <cfqueryparam value = "#datadb#">,   
                <cfqueryparam value = "#form.email#">,
                <cfqueryparam value = "#form.telefono#">,
                <cfqueryparam value = "#form.sesso#">,
                <cfif not imgDb EQ "">
                    <cfqueryparam value = "#imgDb#">,
                </cfif>
                )     
          </cfquery>
        <cfelse>
          <cfinclude template="update.cfm">
        </cfif>
        <cflocation url = "default.cfm">
      </cfif>
<cfelse>

  <!--- avvio una query per precompilare i campi se è presente l'id --->
      <cfif isDefined("url.id")>         
        <cfquery name="getContatto" datasource="andrea">
          SELECT * 
          FROM contatti WHERE ID= <cfqueryparam value = "#url.id#">
        </cfquery>
        <cfoutput query="getContatto">
            <cfset nome= nome>
            <cfset cognome= cognome>
            <cfset data= dateFormat(data_di_nascita, 'yyyy-mm-dd' )>
            <cfset email= email>
            <cfset telefono= telefono>
            <cfset sesso= sesso>
            <cfset img= img>
        </cfoutput>
      </cfif>
</cfif>


<div class="container mt-5">
    <cfoutput>
      <form class="needs-validation" action="" method="post" enctype="multipart/form-data">
        <input type="hidden" name="hidden">
        <div class="form-row">
          <div class="col-md-4 mb-3">
            <label for="validationTooltip01">Nome</label>
            <input type="text" class="form-control" id="validationTooltip01" placeholder="Nome" name="nome"value= "#nome#" required maxlength="50">  
             
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
            <label for="formFile" class="form-label">Aggiungi la tua immagine profilo</label>
            <input class="form-control" type="file" id="formFile" name="img" value="#img#">
          </div>
    </cfoutput>
    <div class="d-flex align-items-center">
      <button class="btn btn-primary me-5 mt-3" type="submit" value="submit">SALVA</button>
      <a href="default.cfm" type="button" class="btn btn-secondary mt-3">HOME</a>
    </div>
</div>