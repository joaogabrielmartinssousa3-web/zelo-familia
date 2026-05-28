*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                 http://localhost:3000/cadastro
${BROWSER}             chrome
${INPUT_NOME}          id=nome
${INPUT_EMAIL}         id=email
${INPUT_SENHA}         id=senha
${INPUT_CONFIRMAR}     id=confirmarSenha
${BOTAO_CADASTRAR}     id=btnCadastrar
${MENSAGEM}            id=mensagem

*** Test Cases ***
CT02 - Deve validar email inválido
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text      ${INPUT_NOME}       João Silva
    Input Text      ${INPUT_EMAIL}      joaoemail.com
    Input Password  ${INPUT_SENHA}      12345678
    Input Password  ${INPUT_CONFIRMAR}  12345678
    Click Button    ${BOTAO_CADASTRAR}
    Element Text Should Be    ${MENSAGEM}    Email inválido
    Close Browser