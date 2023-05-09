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
  <cfset errorlist = "">
  <cfif isDefined("hidden")>
    <cfif not isNumeric(telefono)>
      <cfset errorlist = listAppend(errorlist, "telefono")>
    </cfif>
  </cfif>

  <!--- elenco params per validazione --->

  <cfparam  name="telefono" default="">


<div class="container mt-5">
    <cfoutput>
      <form class="needs-validation" action="" method="post">
        <input type="hidden" name="hidden">
        <div class="form-row">
          <div class="col-md-4 mb-3">
            <label for="validationTooltip01">Nome</label>
            <input type="text" class="form-control" id="validationTooltip01" placeholder="Nome" name="nome" value="" required>      
              <div class="valid-tooltip">
                Looks good!
              </div>           
          </div>
          <div class="col-md-4 mb-3">
            <label for="validationTooltip02">Cognome</label>
            <input type="text" class="form-control" id="validationTooltip02" placeholder="Cognome" name="cognome" value=""required>
            <div class="valid-tooltip">
              Looks good!
            </div>
          </div>
          <div class="col-md-4 mb-3">
            <div class="form-group">
                <label class="active" for="dateStandard">Data di nascita</label>
                <input type="date" id="dateStandard" name="dateStandard">
            </div>
          </div>
        </div>
        <div class="form-row">
          <div class="col-md-6 mb-3">
            <label for="validationTooltip03">E-mail</label>
            <input type="text" class="form-control" id="validationTooltip03" placeholder="E-mail" name="email" value="" >
            <div class="invalid-tooltip">
              Please provide a valid city.
            </div>
          </div>
          <div class="col-md-3 mb-3">
            <label for="validationTooltip04">Telefono</label>
            <input type="text" class="form-control" id="validationTooltip04" placeholder="N.di telefono" name="telefono" value="332323233" >
            <cfif listFind(errorlist, "telefono")>           
              <div class="text-danger">
                Inserire un numero corretto.
              </div>
            </cfif>
          </div>
          <div class="col-md-3 mb-3">
            <p>Sesso</p>
            <div class="mt-3">
                <input class="me-2" type="radio" id="radio" name="tipi" value="M">
                <label for="">M</label><br>
                <input class="me-2" type="radio" id="radio" name="tipi" value="F">
                <label for="">F</label><br>
            </div>
          </div>
    </cfoutput>
    <div class="d-flex">
      <a href="default.cfm" type="button" class="btn btn-success me-5">SALVA</a>
      <a href="default.cfm" type="button" class="btn btn-secondary">HOME</a>
    </div>
</div>