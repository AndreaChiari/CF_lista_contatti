
<cfsetting enablecfoutputonly="Yes">

<cfheader name="Content-Disposition" value="attachment; filename=tablefile.xls">
<cfcontent type="application/msexcel" file="tablefile.cfm">

<cfquery name="excelcontatti" datasource="andrea" >
    SELECT contatti.*, province.nome AS Nomeprovincia
    FROM contatti
    LEFT JOIN province ON contatti.provincia_id = province.ID             
</cfquery>

<cfoutput>
<table class="table" cellspacing="0">
    <thead>
        <tr class="title-row">
            <th data-title="Cognome">Cognome</th>
            <th data-title="Nome">Nome</th>
            <th data-title="Data-di-nascita">Data di Nascita</th>
            <th data-title="Email">Email</th>
            <th data-title="Telefono">Telefono</th> 
            <th data-title="Provincia">Provincia</th> 
            <th data-title="Sesso">Sesso</th>       
        </tr>
    </thead>
    <tbody>     
        <cfloop query="excelcontatti">                              
            <tr>        
                <td data-title="Cognome">#Cognome#</td>
                <td data-title="Nome">#Nome#</td>
                <td data-title="Data-di-nascita">#dateFormat(data_di_nascita, 'dd/mm/yyyy' )#</td>
                <td data-title="Email">#Email#</td>
                <td data-title="Telefono">#Telefono#</td>
                <td data-title="Province">#Nomeprovincia#</td>
                <td data-title="Sesso">#Sesso#</td> 
            </tr>         
        </cfloop>              
    </tbody>
</table>
</cfoutput>