*** Settings ***
Documentation     Suíte de testes automatizados para a tela de Cadastro de Idosos.
Library           SeleniumLibrary

Suite Setup       Dado que o usuário acessa a tela de cadastro de idosos
Suite Teardown    E fecha o navegador

*** Variables ***
${URL}                 http://localhost:8080/cadastro-idosos
${BROWSER}             chrome

${INPUT_NOME}          id=nomeUsuário
${INPUT_IDADE}         id=idadeUsuário
${BOTAO_CADASTRAR}     id=btnCadastrarUsuário
${MENSAGEM}            id=mensagemAlerta

*** Test Cases ***
CT01 - Deve realizar cadastro com dados válidos
    Dado que o usuário informa o nome    Carlos Silva
    E informa a idade    65
    Quando solicitar o cadastro do idoso
    Então o sistema deve apresentar a mensagem    Cadastro realizado com sucesso.

CT02 - Deve validar nome obrigatório
    Dado que o usuário informa o nome    ${EMPTY}
    E informa a idade    65
    Quando solicitar o cadastro do idoso
    Então o sistema deve apresentar a mensagem    Nome obrigatório.

CT03 - Deve validar idade mínima insuficiente
    Dado que o usuário informa o nome    Carlos Silva
    E informa a idade    11
    Quando solicitar o cadastro do idoso
    Então o sistema deve apresentar a mensagem    Idade mínima insuficiente.

*** Keywords ***
Dado que o usuário acessa a tela de cadastro de idosos
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Dado que o usuário informa o nome
    [Arguments]    ${nome}
    Input Text    ${INPUT_NOME}    ${nome}

E informa a idade
    [Arguments]    ${idade}
    Input Text    ${INPUT_IDADE}    ${idade}

Quando solicitar o cadastro do Usuário
    Click Button    ${BOTAO_CADASTRAR}

Então o sistema deve apresentar a mensagem
    [Arguments]    ${msg_esperada}
    Element Text Should Be    ${MENSAGEM}    ${msg_esperada}

E fecha o navegador
    Close Browser
