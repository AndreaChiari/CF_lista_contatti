<cfinclude  template="querycontatti.cfm">

<cfheader name="Content-Disposition" value="attachment; filename=table.pdf">
<cfcontent type="application/pdf">
    <cfdocument name="lista_contatti" format="PDF" marginbottom="0" margintop="1" marginleft="0.5" marginright="0.5" pagetype="a4" localurl="true"> 
        <cfoutput>
            <cfdocumentitem  type="header">
                <h1 style="text-align:center; color:blue; font-size:35px">LISTA CONTATTI</h1>
            </cfdocumentitem >
            <cfdocumentitem type="footer">
                <p style="text-align:center;">Pagina #cfdocument.currentPageNumber# di #cfdocument.totalPageCount#</p>
            </cfdocumentitem>
            <cfdocumentsection>
            <table border="1" class="table" cellspacing="0" style="width:100%; font-size:12px" >    
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
                            <td style="width: 50%" data-title="Email">#Email#</td>
                            <td data-title="Telefono">#Telefono#</td>
                            <td data-title="Province">#Nomeprovincia#</td>
                            <td data-title="Sesso">#Sesso#</td>              
                        </tr>
                    </cfoutput>              
                </tbody>
            </table>
            </cfdocumentsection>  
        </cfoutput>
    </cfdocument>

    <cfmail  from="andrea.chiari@womweb.it"
         subject="pdf"  
         to="chiariandrea94@gmail.com"
         type="html">
         <img src="https://www.womweb.it/images/logo.png">
         <p>Ecco il pdf della lista contatti, potrai trovarlo in allegato.</p>
         <cfmailparam 
         type="application/pdf"
         file= "http://andrea.womtest.it/CF_lista_contatti/mod/contatti/table.pdf"
         content="#lista_contatti#"/>   
</cfmail>
