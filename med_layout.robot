*** Settings ***
Documentation     Teste de Interface 2 - Validação visual da aba de Medicamentos
Library           SeleniumLibrary

*** Variables ***
${URL}                  http://localhost:8080/index.html
${BROWSER}              chrome

*** Test Cases ***
CT01 - Validar elementos visuais da tela de Medicamentos
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Element Should Be Visible    id=input-dosagem
    ${placeholder}=    Get Element Attribute    id=input-dosagem    placeholder
    Should Be Equal    ${placeholder}    Digite a dosagem (ml)
    Element Should Be Visible    id=btn-salvar-med
    Close Browser