<cfquery name="filtroContatti">
    SELECT contatti.*, province.nome AS Nomeprovincia
    FROM contatti
    LEFT JOIN province ON contatti.provincia_id = province.ID
        WHERE 0 = 0
    <cfif not isEmpty(cookie.filtro)>
        AND CONCAT_WS(' ',Cognome,contatti.nome)
        LIKE "%#cookie.filtro#%"        
    </cfif>     
    <cfif not isEmpty(cookie.genere)>                  
        AND Sesso = "#cookie.genere#"
    </cfif>   
</cfquery>

