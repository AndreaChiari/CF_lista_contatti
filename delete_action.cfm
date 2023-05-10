<head>
    <title>Cancella contatto</title>
</head>
<body>
    <cfquery name="EliminaContatto"
        datasource="andrea">
        DELETE FROM Contatti
        WHERE ID = 6
    </cfquery>
    <h1>Contatto eliminato</h1>
</body>
    </html>