*** Settings ***
Documentation     Teste de Interface 1 - Cadastro de Medicamento
Library           SeleniumLibrary

*** Variables ***

${URL}                  http://localhost:8080/index.html
${BROWSER}              chrome

*** Test Cases ***
CT01 - Validar o salvamento de um medicamento
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text      id=input-dosagem    15
    Click Button    id=btn-salvar-med
    ${alerta}=      Handle Alert    action=ACCEPT
    Should Contain  ${alerta}    Salvo!
    Close Browser