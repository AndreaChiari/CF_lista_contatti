<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="lista_contatti.css?v1.2">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script defer src="lista_contatti.js"></script>
    <title>Lista Contatti</title>
</head>
<body>
    <cfoutput>
            <cfparam  name="filtro" default="">

            <cfquery name="filtroContatti" datasource="andrea" result="result">
                SELECT *
                FROM contatti
                <cfif not isEmpty(filtro)>
                    WHERE Nome = "#filtro#"              
                </cfif>
            </cfquery>
            
            
            <!---     <cfparam  name="genere" default=""> --->
            <cfdump  var="filtrocontatti">

        <div class="container">
            <h1 class="text-center text-primary mt-4 mb-5 mx-auto">LISTA CONTATTI</h1>

            <!--- filtro ricerca contatti --->
               <!---  <div class="col-md-3 mb-3">
                    <p>Sesso</p>
                    <div class="mt-3">
                        <input class="me-2" type="radio" id="radio" name="genere" value="M" <cfif genere is "M"> checked </cfif>>
                        <label for="">M</label><br>
                        <input class="me-2" type="radio" id="radio" name="genere" value="F"  <cfif genere is "F"> checked </cfif>>
                        <label for="">F</label><br>
                    </div>
                </div> --->
                <form action="" method="post">
                    <input type="hidden">
                    <div class="input-group justify-content-end mb-4">
                        <div class="form-outline">
                            <input type="search" id="form1" class="form-control" placeholder="cerca" name="filtro" value="#filtro#"/>
                        </div>
                        <button name="submitFilter" type="submit" value="submit" class="btn btn-primary">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>           
                </form> 
           
                    
            <!--- tabella lista contatti --->  
            <table class="table" cellspacing="0">
                <thead>
                    <tr class="title-row">
                        <th data-title="Img">Immagine</th>
                        <th data-title="Nome">Nome</th>
                        <th data-title="Cognome">Cognome</th>
                        <th data-title="Data-di-nascita">Data di Nascita</th>
                        <th data-title="Email">Email</th>
                        <th data-title="Telefono">Telefono</th> 
                        <th data-title="Sesso">Sesso</th> 
                        <th data-title="Edit">Modifica</th>  
                        <th data-title="Delete">Elimina</th>        
                    </tr>
                </thead>
                <tbody>
                <cfoutput query="filtroContatti">
                    <tr>
                        <td data-title="Img">
                        <cfif not isEmpty(img)>   
                            <img src="img/#img#"/>
                        </cfif>
                        </td>
                        <td data-title="Nome">#Nome#</td>
                        <td data-title="Cognome">#Cognome#</td>
                        <td data-title="Data-di-nascita">#dateFormat(data_di_nascita, 'dd/mm/yyyy' )#</td>
                        <td data-title="Email">#Email#</td>
                        <td data-title="Telefono">#Telefono#</td>
                        <td data-title="Sesso">#Sesso#</td>
                        <td data-title="Edit" ><a href="form.cfm?ID=#id#"><i class="fa-solid fa-pen-to-square"></i></a></td>   
                        <td data-title="Delete"><a href="delete_action.cfm?ID=#id#"><i class="fa-solid fa-trash"></i></a></td>              
                    </tr>
                </cfoutput>
                </tbody>
            </table>     
                <a href="form.cfm" class="w220 btn btn-primary mb-5 p-2 d-flex justify-items-center align-items-center ms-2 text-white"> <i class="fa-solid fa-user-plus me-1"></i> AGGIUNGI CONTATTO</a>      
        </div>    
    </cfoutput>
            
            
</body>