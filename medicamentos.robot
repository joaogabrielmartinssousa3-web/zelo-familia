*** Settings ***
Documentation     Suíte de testes automatizados para a tela de Cadastro de Medicamentos.
Library           SeleniumLibrary

Suite Setup       Dado que o usuário acessa a tela de cadastro de medicamentos
Suite Teardown    E fecha o navegador

*** Variables ***
${URL}                 http://localhost:8080/cadastro-medicamentos
${BROWSER}             chrome

${SELECT_IDOSO}        id=idUsuário
${INPUT_MEDICAMENTO}   id=nomeMedicamento
${INPUT_DOSAGEM}       id=dosagem
${BOTAO_CADASTRAR}     id=btnCadastrarMedicamento
${MENSAGEM}            id=mensagemAlerta

*** Test Cases ***
CT01 - Deve realizar cadastro com dados válidos
    Dado que o usuário seleciona o idoso    Carlos Silva
    E informa o medicamento    Paracetamol
    E informa a dosagem    15
    Quando solicitar o cadastro do medicamento
    Então o sistema deve apresentar a mensagem de sucesso    Cadastro realizado com sucesso.

CT02 - Deve validar idoso obrigatório
    Dado que o usuário seleciona o idoso    ${EMPTY}
    E informa o medicamento    Paracetamol
    E informa a dosagem    15
    Quando solicitar o cadastro do medicamento
    Então o sistema deve apresentar a mensagem de erro    Idoso obrigatório.

CT03 - Deve validar medicamento obrigatório
    Dado que o usuário seleciona o idoso    Carlos Silva
    E informa o medicamento    ${EMPTY}
    E informa a dosagem    15
    Quando solicitar o cadastro do medicamento
    Então o sistema deve apresentar a mensagem de erro    Nome do medicamento obrigatório.

CT04 - Deve validar dosagem inválida
    Dado que o usuário seleciona o idoso    Carlos Silva
    E informa o medicamento    Paracetamol
    E informa a dosagem    0
    Quando solicitar o cadastro do medicamento
    Então o sistema deve apresentar a mensagem de erro    Dosagem inválida.

*** Keywords ***
Dado que o usuário acessa a tela de cadastro de medicamentos
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Dado que o usuário seleciona o idoso
    [Arguments]    ${idoso}
    Select From List By Label    ${SELECT_IDOSO}    ${idoso}

E informa o medicamento
    [Arguments]    ${medicamento}
    Input Text    ${INPUT_MEDICAMENTO}    ${medicamento}

E informa a dosagem
    [Arguments]    ${dosagem}
    Input Text    ${INPUT_DOSAGEM}    ${dosagem}

Quando solicitar o cadastro do medicamento
    Click Button    ${BOTAO_CADASTRAR}

Então o sistema deve apresentar a mensagem de sucesso
    [Arguments]    ${msg_sucesso}
    Element Text Should Be    ${MENSAGEM}    ${msg_sucesso}

Então o sistema deve apresentar a mensagem de erro
    [Arguments]    ${msg_erro}
    Element Text Should Be    ${MENSAGEM}    ${msg_erro}

E fecha o navegador
    Close Browser
