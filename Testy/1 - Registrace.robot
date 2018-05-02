*** Settings ***
Library    Selenium2Library

*** Variables ***
${url}    https://www.megaknihy.cz/
${browser}    chrome
${email}    petrblabla@seznam.cz
${spravne_heslo}    admin123
${jmeno}    Robot
${prijmeni}    Framework
${adresa}    Testovaci 123
${psc}    12300
${mesto}    Praha
${mobil}    605457897

*** Test Cases ***
TC 1.1 Uspesna registrace
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Click Link    xpath=//a[@href='https://www.megaknihy.cz/ucet'] 
    Click Button    name=SubmitCreate
    Input Text    id=email    ${email}
    #email se musi v promennych zmenit pred kazdym spustenim testu
    #puvodni email bude jiz urcite jednou zaregistrovany (protoze test byl v minulosti spusteny)
    #pokud se email nezmeni, case "uspesna registrace" neprojde
    Input Password    id=passwd    ${spravne_heslo}
    Input Password    id=passwd_repeat    ${spravne_heslo}
    Input Text    id=customer_firstname    ${jmeno} 
    Input Text    id=customer_lastname    ${prijmeni}
    Input Text    id=address1    ${adresa}
    Input Text    id=postcode    ${psc}
    Input Text    id=city    ${mesto}
    Input Text    id=phone_mobile    ${mobil}
    Click Button    submitAccount
    Sleep    5
    Page Should Contain Textfield    username 
    Page Should Contain Button    submitIdentity     
    Capture Page Screenshot 
    
TC 1.2 Neuspesna registrace
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Click Link    xpath=//a[@href='https://www.megaknihy.cz/ucet'] 
    Click Button    name=SubmitCreate
    Input Text    id=email    ${email} 
    Input Password    id=passwd    ${spravne_heslo}
    Input Password    id=passwd_repeat    ${spravne_heslo}
    Input Text    id=customer_firstname    ${jmeno}
    Input Text    id=customer_lastname    ${prijmeni}
    Input Text    id=address1    ${adresa}
    Input Text    id=postcode    ${psc}
    Input Text    id=city    ${mesto}
    Input Text    id=phone_mobile    ${mobil}
    Click Button    submitAccount
    Sleep    5
    Page Should Contain    Nastala 1 chyba   
    Page Should Contain    Tento e-mail je
    Capture Page Screenshot            
        
    