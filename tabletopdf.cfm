<cfinclude  template="querycontatti.cfm">
<cfheader name="Content-Disposition" value="attachment; filename=table.pdf">

<cfdocument format="PDF" marginbottom="0" margintop="1" marginleft="0" marginright="0" pagetype="a4">    
        <table border="1" class="table" cellspacing="0" >    
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
                <cfoutput query="filtroContatti">
                    <tr>
                        <td data-title="Cognome">#Cognome#</td>
                        <td data-title="Nome">#Nome#</td>
                        <td data-title="Data-di-nascita">#dateFormat(data_di_nascita, 'dd/mm/yyyy' )#</td>
                        <td style="width: 10px" data-title="Email">#Email#</td>
                        <td data-title="Telefono">#Telefono#</td>
                        <td data-title="Province">#Nomeprovincia#</td>
                        <td data-title="Sesso">#Sesso#</td>              
                    </tr>
                </cfoutput>              
            </tbody>
        </table>    
</cfdocument>