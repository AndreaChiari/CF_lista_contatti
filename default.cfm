﻿<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="mod/contatti/lista_contatti.css?v1.3">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script defer src="mod/contatti/lista_contatti.js"></script>
    <title>Home Page</title>
</head>
<body>

 <cfoutput>
    <cfparam  name="url.p" default="">

    <cfinclude  template="menu.cfm">
    <main>
        <cfif isdefined("session.name") OR url.p is "login" OR url.p is "signin">
            <cfif not isEmpty(url.p)>
                <cfinclude  template="mod/#url.p#/default.cfm">
            </cfif>
        <cfelseif url.p eq "?p=contatti&xls"> 
            <cfabort>
        <cfelseif url.p eq "?p=contatti&xlsdoc"> 
            <cfabort>
        <cfelseif url.p eq "?p=contatti&pdf"> 
            <cfabort>
        <cfelse>
            <cfinclude template="mod/welcome/default.cfm">
        </cfif>
    </main>
    <cfinclude template="footer.cfm">
</cfoutput>
</body>
    