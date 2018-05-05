*** Settings ***
Library        Selenium2Library

*** Variables ***
${url}            https://www.megaknihy.cz/
${browser}        gc
${link}           /identita
${objednavky}     /historie-objednavek
${adresa}         /adresy
${email}          ondrej.spala@seznam.cz
${pass}           heslo1
${username}       Nová Přezdívka

*** Test Cases ***

13.1 - Profil, heslo, změna přezdívky
    Open Browser    ${url}       ${browser}
    Maximize Browser Window 
    Page Should Contain Link    ${link}
    Click Link    ${link}
    Input Text    id: email   ${email} 
    Input Text    id: passwd   ${pass} 
    Click Element    id: SubmitLogin
    Page Should Contain    Můj profil
    Page Should Contain    Nastavení profilu
    Click Element    class: zmenit_heslo
    Page Should Contain Element    id: old_passwd
    Input Text    id: username   ${username} 
    Click Element    id: profile-submit
    Sleep    2s
    Page Should Contain Element    class: toast-success
    
    
13.2 - Profil, objednavky a adresa
    Open Browser    ${url}       ${browser}
    Maximize Browser Window 
    Page Should Contain Link    ${link}
    Click Link    ${link}
    Input Text    id: email   ${email} 
    Input Text    id: passwd   ${pass} 
    Click Element    id: SubmitLogin
    Page Should Contain    Můj profil
    Page Should Contain Link    ${objednavky}
    Click Link    ${objednavky}
    Page Should Contain    Přehled objednávek 
    Page Should Contain Link    ${adresa}
    Click Link    ${adresa}
    Page Should Contain Element    class: address_update
    Click Element    class: address_update
    Click Element    id: submitAddress
    Sleep    2s
    Page Should Contain Element    class: toast-success
    
    
    