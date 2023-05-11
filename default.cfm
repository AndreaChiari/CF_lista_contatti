<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="lista_contatti.css?v1.1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script defer src="lista_contatti.js"></script>
    <title>Lista Contatti</title>
</head>
<body>
    <cfquery name="getContatti" datasource="andrea" result="result">
            SELECT *
            FROM contatti
    </cfquery>

    <!--- fix data di nascita nel giusto formato --->

    
    <cfinsert datasource="andrea" tablename="contact">
    <cfdump  var="#getContatti#">

    <div class="container-fluid">
        <h1 class="text-center text-primary mt-4 mb-5 mx-auto">LISTA CONTATTI</h1>
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
                <cfoutput query="getContatti">
                    <tr>
                        <td data-title="Img">#img#</td>
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
</body>