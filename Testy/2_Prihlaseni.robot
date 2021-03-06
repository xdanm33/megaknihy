*** Settings ***
Library    Selenium2Library

*** Variables ***
${url}    https://www.megaknihy.cz/
${browser}    chrome
${email}    testmegaknihy@seznam.cz
${spravne_heslo}    admin123
${spatne_heslo}    heslo123

*** Test Cases ***
TC 2.1 Uspesny login
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Click Link    xpath=//a[@href='https://www.megaknihy.cz/ucet']
    Input Text    id=email    ${email}
    Input Password    id=passwd    ${spravne_heslo}
    Click Button    SubmitLogin
    Sleep    5
    Page Should Contain Textfield    username 
    Page Should Contain Button    submitIdentity
    Capture Page Screenshot
TC 2.2 Neuspesny login
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Click Link    xpath=//a[@href='https://www.megaknihy.cz/ucet']
    Input Text    id=email    ${email}
    Input Password    id=passwd    ${spatne_heslo}
    Click Button    SubmitLogin
    Sleep    5
    Page Should Contain    Nastala 1 chyba   
    Page Should Contain    selhalo
    Capture Page Screenshot
TC 2.4 Opakovany spatny login
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Click Link    xpath=//a[@href='https://www.megaknihy.cz/ucet']
    Input Text    id=email    ${email}
    Input Password    id=passwd    ${spatne_heslo}
    Click Button    SubmitLogin
    Sleep    2
    Input Text    id=email    ${email}
    Input Password    id=passwd    ${spatne_heslo}
    Click Button    SubmitLogin
    Sleep    2
    Input Text    id=email    ${email}
    Input Password    id=passwd    ${spatne_heslo}
    Click Button    SubmitLogin
    Sleep    2
    Input Text    id=email    ${email}
    Input Password    id=passwd    ${spatne_heslo}
    Click Button    SubmitLogin
    Sleep    2
    Input Text    id=email    ${email}
    Input Password    id=passwd    ${spatne_heslo}
    Click Button    SubmitLogin
    Sleep    2
    Input Text    id=email    ${email}
    Input Password    id=passwd    ${spatne_heslo}
    Click Button    SubmitLogin
    Sleep    2
    Input Text    id=email    ${email}
    Input Password    id=passwd    ${spatne_heslo}
    Click Button    SubmitLogin
    Sleep    2
    Input Text    id=email    ${email}
    Input Password    id=passwd    ${spatne_heslo}
    Click Button    SubmitLogin
    Sleep    2
    Input Text    id=email    ${email}
    Input Password    id=passwd    ${spatne_heslo}
    Click Button    SubmitLogin
    Sleep    2
    Input Text    id=email    ${email}
    Input Password    id=passwd    ${spatne_heslo}
    Click Button    SubmitLogin
    Sleep    2
    Page Should Contain    Nastala 1 chyba   
    Page Should Contain    selhalo
    Capture Page Screenshot
    
    