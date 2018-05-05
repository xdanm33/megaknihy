*** Settings ***
Library        Selenium2Library

*** Variables ***
${url}            https://www.megaknihy.cz/
${browser}        gc
${vraceni}        https://www.megaknihy.cz/content/15-vraceni-zbozi
${reklamace}      https://www.megaknihy.cz/content/14-reklamace
${formular}       http://www.megaknihy.cz/reklamace/reklamace/reklamacni_formular.pdf
${podminky}       http://www.megaknihy.cz/content/10-kompletni-obchodni-podminky

*** Test Cases ***

12 - Reklamace
    Open Browser    ${url}       ${browser}
    Maximize Browser Window 
    Click Link    ${vraceni}
    Page Should Contain    Vrácení zboží
    Click Link    ${reklamace}
    Page Should Contain    Postup reklamace 
    Page Should Contain    odešlete na adresu 
    Page Should Contain Link    ${formular}
    Page Should Contain Link    ${podminky}