<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="lista_contatti.css?v1.3">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script defer src="lista_contatti.js"></script>
    <title>Lista Contatti</title>
</head>
<body>
    <cfoutput>
        
        <cfif not isDefined("cookie.genere") and not isDefined("cookie.filtro") and not isDefined("cookie.pagenumber")>   
             
            <!--- imposto i cookies vuoti --->

                    <cfcookie name="Genere" value=""> 
                    <cfcookie name="Filtro" value="">   
                    <cfcookie name="pagenumber" value="1">        
        </cfif>
        
        <cfif isDefined("hidden")>
            
            <!--- salvo i cookies con il valore del form  e se i valori non corrispondono con gi input del form rimando a pg1--->
            <cfif form.filtro NEQ cookie.filtro or form.genere NEQ cookie.genere>

                <cfcookie  name="pagenumber"value="1">
            <cfelse>    
                <cfcookie  name="pagenumber"value="#form.paginazione#">
            </cfif>

            <cfcookie  name="Genere" value="#form.genere#">
            <cfcookie  name="Filtro" value="#form.filtro#">
        </cfif>
        <cfdump var="#cookie#">

                             
        <cfquery name="filtroContatti" datasource="andrea" result="result">
            SELECT contatti.*, province.nome AS Nomeprovincia
            FROM contatti
            LEFT JOIN province ON contatti.provincia_id = province.ID
                WHERE 0 = 0
            <cfif not isEmpty(cookie.filtro)>
                AND CONCAT_WS(' ',Cognome,Nome)
                LIKE "%#cookie.filtro#%"        
            </cfif>     
            <cfif not isEmpty(cookie.genere)>                  
                AND Sesso = "#cookie.genere#",
            </cfif>   
        </cfquery>
       <cfdump  var="#filtrocontatti#">

      <!--- variabili paginazione --->
                
        <cfset records = 4>
        <cfset startrow = (cookie.pagenumber-1) * records + 1>
        <cfset totalpages = ceiling((queryRecordCount(filtrocontatti) / records))>
        <cfdump  var=#startrow#>
 

      <!--- filtro ricerca contatti --->
            
        <div class="container">
            <h1 class="text-center text-primary mt-4 mb-5 mx-auto">LISTA CONTATTI</h1>             
                 <form action="" method="post" id="filterform">
                    <input type="hidden" name="hidden">
                    <div class="input-group justify-content-end mb-4">
                        <label for="genere" id="genere">Sesso:</label>
                        <select name="genere" id="genere" class="me-3 ms-1">
                            <option name="genere" value="" id="option"<cfif cookie.genere EQ ""> selected </cfif>> Tutti</option>
                            <option name="genere" value="M" id="option"<cfif cookie.genere EQ "M"> selected </cfif> >M</option>                      
                            <option name="genere" value="F" id="option"<cfif cookie.genere EQ "F"> selected </cfif> >F</option>           
                        </select>
                        <div class="form-outline">
                            <input type="search" id="form1" class="input-filter" placeholder="cerca" name="filtro" value="#cookie.filtro#"/>
                        </div>
                        <button name="submitFilter" type="submit" value="submit" class="btnfilter d-flex justify-content-center align-items-center">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>  

                    <!--- paginazione --->

                    <select name="paginazione" id="paginazione" class="me-3 ms-1 mb-3" onchange="postForm()">
                        <cfloop index="p" from="1" to="#totalpages#">
                            <option name="numeropagina" value=#p# id="option" <cfif cookie.pagenumber eq p> selected </cfif> >#p#</option>
                        </cfloop>         
                    </select>                      
                                 
                    <!--- tabella lista contatti --->  

            <table class="table" cellspacing="0">
                <thead>
                    <tr class="title-row">
                        <th data-title="Img">Immagine</th>
                        <th data-title="Cognome">Cognome</th>
                        <th data-title="Nome">Nome</th>
                        <th data-title="Data-di-nascita">Data di Nascita</th>
                        <th data-title="Email">Email</th>
                        <th data-title="Telefono">Telefono</th> 
                        <th data-title="Provincia">Provincia</th> 
                        <th data-title="Sesso">Sesso</th> 
                        <th data-title="Edit">Modifica</th>  
                        <th data-title="Delete">Elimina</th>        
                    </tr>
                </thead>
                <tbody>     
                        <cfoutput query="filtroContatti" startrow="#startrow#" maxRows="#records#">
                            <tr>
                                <td data-title="Img">
                                    <cfif not isEmpty(img)>   
                                        <img src="img/#img#"/>
                                    </cfif>
                                </td>
                                <td data-title="Cognome">#Cognome#</td>
                                <td data-title="Nome">#Nome#</td>
                                <td data-title="Data-di-nascita">#dateFormat(data_di_nascita, 'dd/mm/yyyy' )#</td>
                                <td data-title="Email">#Email#</td>
                                <td data-title="Telefono">#Telefono#</td>
                                <td data-title="Province">#Nomeprovincia#</td>
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