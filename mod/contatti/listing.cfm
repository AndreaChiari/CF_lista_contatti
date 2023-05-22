<body>
    <cfoutput>
    
        <cfif not isDefined("cookie.genere") and not isDefined("cookie.filtro") and not isDefined("cookie.province")>   
             
            <!--- imposto i cookies vuoti --->

                    <cfcookie name="Genere" value=""> 
                    <cfcookie name="Filtro" value="">   
                    <!--- <cfcookie name="Province" value=""> --->     
                    <cfcookie name="pagenumber" value="1">    
        </cfif>
        
        <cfif isDefined("hidden")>
            
            <!--- salvo i cookies con il valore del form  e se i valori non corrispondono con gi input del form rimando a pg1--->
            
            <cfif form.filtro NEQ cookie.filtro or form.genere NEQ cookie.genere <!--- or form.province NEQ cookie.province --->>
                <cfcookie  name="pagenumber"value="1">
            <cfelse>    
                <cfcookie  name="pagenumber"value="#form.paginazione#">
            </cfif>

            <cfcookie  name="Genere" value="#form.genere#">
            <cfcookie  name="Filtro" value="#form.filtro#">
     <!---        <cfcookie  name="Province" value="#form.province#"> --->
        </cfif>
        <cfdump var="#cookie#">
                      
        <!--- query principale importata --->
        <cfinclude  template="querycontatti.cfm">

      <!--- variabili paginazione --->             
        <cfset records = 4>
        <cfset startrow = (cookie.pagenumber-1) * records + 1>
        <cfset totalpages = ceiling((queryRecordCount(filtrocontatti) / records))>
        <cfdump  var=#startrow#>
 

      <!--- filtro ricerca contatti --->
            
        <div class="container listing-container">
            <h1 class="text-center text-primary mt-4 mb-5 mx-auto">LISTA CONTATTI</h1>             
                 <form action="" method="post" id="filterform">
                    <input type="hidden" name="hidden">
                    <div class="input-group justify-content-end mb-4">

                        <!--- filtro sesso --->
                        <label for="genere" id="genere">Sesso:</label>
                        <select name="genere" id="genere" class="me-3 ms-1">
                            <option name="genere" value="" id="option"<cfif cookie.genere EQ ""> selected </cfif>> Tutti</option>
                            <option name="genere" value="M" id="option"<cfif cookie.genere EQ "M"> selected </cfif> >M</option>                      
                            <option name="genere" value="F" id="option"<cfif cookie.genere EQ "F"> selected </cfif> >F</option>           
                        </select>

                        <!--- filtro ricerca per nome/cognome --->
                        <div class="form-outline">
                            <input type="search" id="form1" class="input-filter" placeholder="cerca" name="filtro" value="#cookie.filtro#"/>
                        </div>

                        <!--- filtro province --->
                     <!---    <label for="filtroprovince" id="filtroprovince">Sesso:</label>
                        <div class="mt-3">
                            <select name="province" id="provincefiltroselect" class="me-3 ms-1 mb-3"> 
                                <option name="provincia" value="" id="option" <cfif province eq ""> selected </cfif>> --- </option>
                              <cfloop query="filtroContatti">
                                <option name="provincia" value="#idprovincia#" id="option" <cfif province eq idprovincia> selected </cfif>> #nomeprovincia# </option>
                              </cfloop>             
                            </select> --->
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
                                        <img src="mod/contatti/img/#img#"/>
                                    </cfif>
                                </td>
                                <td data-title="Cognome">#Cognome#</td>
                                <td data-title="Nome">#Nome#</td>
                                <td data-title="Data-di-nascita">#dateFormat(data_di_nascita, 'dd/mm/yyyy' )#</td>
                                <td data-title="Email">#Email#</td>
                                <td data-title="Telefono">#Telefono#</td>
                                <td data-title="Province">#Nomeprovincia#</td>
                                <td data-title="Sesso">#Sesso#</td>
                                <td data-title="Edit" ><a href="?p=contatti&id=#id#"><i class="fa-solid fa-pen-to-square"></i></a></td>   
                                <td data-title="Delete"><a href="?p=contatti&del=#id#"><i class="fa-solid fa-trash"></i></a></td>              
                            </tr>
                        </cfoutput>              
                </tbody>
            </table>   
            <div class="d-flex justify-content-between"> 
                <div> 
                    <a href="?p=contatti&id=0" class="w220 btn btn-primary mb-5 p-2 d-flex justify-items-center align-items-center ms-2 text-white"> <i class="fa-solid fa-user-plus me-3"></i> Aggiungi Contatto</a>  
                </div> 
                <div class="d-flex">
                    <a href="?p=form" class="btn btn-success mb-5 p-2 d-flex justify-items-center align-items-center ms-2 text-white"> <i class="fa-sharp fa-solid fa-file-excel me-1"></i> cfspreadsheet </a>  
                    <a href="tablefile.cfm" class="btn btn-success mb-5 p-2 d-flex justify-items-center align-items-center ms-2 text-white"> <i class="fa-sharp fa-regular fa-file-excel me-1"></i> cfcontent </a>
                    <a href="tabletopdf.cfm" class="btn btn-success mb-5 p-2 d-flex justify-items-center align-items-center ms-2 text-white"> <i class="fa-regular fa-file-pdf me-1"></i> cfdocument </a>
                </div>  
            </div> 
        </div>          
    </cfoutput>     
</body>