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
CT01 - Deve realizar cadastro com sucesso
    Open Browser    ${URL}    ${BROWSER}
    Input Text      ${INPUT_NOME}       João Silva
    Input Text      ${INPUT_EMAIL}      joao@email.com
    Input Password  ${INPUT_SENHA}      12345678
    Input Password  ${INPUT_CONFIRMAR}  12345678
    Click Button    ${BOTAO_CADASTRAR}
    Element Text Should Be    ${MENSAGEM}    Cadastro realizado com sucesso
    Close Browser

CT02 - Deve validar nome obrigatório
    Open Browser    ${URL}    ${BROWSER}
    Input Text      ${INPUT_EMAIL}      joao@email.com
    Input Password  ${INPUT_SENHA}      12345678
    Input Password  ${INPUT_CONFIRMAR}  12345678
    Click Button    ${BOTAO_CADASTRAR}
    Element Text Should Be    ${MENSAGEM}    Nome obrigatório
    Close Browser