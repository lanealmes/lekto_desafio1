*** Settings ***
Library          SeleniumLibrary
Library          FakerLibrary





*** Variables ***
${Url}                           https://www.lekto.com.br/                  
${LektoValidacao}                //h1[@class='preSlide slideIn'][contains(.,'Agende uma apresentação e conheça todos os benefícios da Lekto.')] 
${BtnAgendeUmaApresentacao1}     (//a[contains(.,'Agende uma Apresentação')])[1]                
${BtnAgendeUmaApresentacao2}      //a[@href='#contato'][contains(.,'Agende uma apresentação')]
${NomeApresentacao}             //input[contains(@id,'167399-field')] 
${CampoEmail}                   //input[contains(@id,'26430-field')]
${CampoTelefone}                //input[@id='text-yui_3_17_2_1_1593039425574_26431-field']
${CampoMensagem}                //textarea[contains(@id,'26432-field')]
${BtnSubmit}                    //span[@class='form-submit-button-label'][contains(.,'Quero a Lekto na minha escola!')]
${ValidarAgendamento}                        //p[contains(.,'Muito obrigado! Em breve retornaremos seu contato.')]         
${DiretorCoordenadorEscolar}                 //select[contains(@id,'168358-field')][@aria-label='Sou']/descendant::option[@value='Diretor(a)/Coordenador(a) Escolar']
${familia}                                   //select[contains(@id,'168358-field')][@aria-label='Sou']/descendant::option[@value='Família']                   
${DonoAcademiaOuProgramaContraturno}         //select[contains(@id,'168358-field')][@aria-label='Sou']/descendant::option[@value='Dono de Academia ou Programa de Contraturno'] 
${EDUCADOR}                                 //select[contains(@id,'168358-field')][@aria-label='Sou']/descendant::option[@value='Educador(a)']                   

*** Keywords ***

Acessar o home page do site https://www.lekto.com.br/ 
    Maximize Browser Window
    Go to    url=https://www.lekto.com.br/  

Clicar no botão "Agende uma Apresentação" 
    Click Element                      ${BtnAgendeUmaApresentacao1}

Clicar no botão 2 "Agende uma apresentação"
     Click Element                      ${BtnAgendeUmaApresentacao2}

Descer a barra de rolagem até o fim da pagina
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    
Preencher o campo Nome
     Sleep    2
    ${NomeAleatorio}        FakerLibrary.Name
    Input Text    ${NomeApresentacao}    ${NomeAleatorio}

# Selecionar uma opção
#     Execute JavaScript    document.getElementById('select-yui_3_17_2_1_1593033605278_168358-field').scrollIntoView(true)
#     Wait Until Element Is Visible    xpath=//select[@id='select-yui_3_17_2_1_1593033605278_168358-field']
#     Click Element                     xpath=//select[@id='select-yui_3_17_2_1_1593033605278_168358-field']
#     Wait Until Element Is Visible     xpath=//select[contains(@id,'168358-field')][@aria-label='Sou']/descendant::option[@value='Diretor(a)/Coordenador(a) Escolar']
#     Click Element                     xpath=//select[contains(@id,'168358-field')][@aria-label='Sou']/descendant::option[@value='Diretor(a)/Coordenador(a) Escolar']

Selecionar a opção 
    [Arguments]    ${Sou}      
   
    IF   "${Sou}"=="EDUCADOR"
        Log To Console    ${Sou}
        Execute JavaScript    document.getElementById('select-yui_3_17_2_1_1593033605278_168358-field').scrollIntoView(true)
        Wait Until Element Is Visible    xpath=//select[@id='select-yui_3_17_2_1_1593033605278_168358-field']
        Click Element                     xpath=//select[@id='select-yui_3_17_2_1_1593033605278_168358-field']
        Wait Until Element Is Visible     ${EDUCADOR}
        Click Element                     ${EDUCADOR}
    ELSE IF    "${Sou}" =="Diretor(a)/Coordenador(a) Escolar"
        Execute JavaScript    document.getElementById('select-yui_3_17_2_1_1593033605278_168358-field').scrollIntoView(true)
        Wait Until Element Is Visible    xpath=//select[@id='select-yui_3_17_2_1_1593033605278_168358-field']
        Click Element                     xpath=//select[@id='select-yui_3_17_2_1_1593033605278_168358-field']
        Wait Until Element Is Visible     ${DiretorCoordenadorEscolar}
        Click Element                    ${DiretorCoordenadorEscolar}
     ELSE IF    "${Sou}" =="Família"
        Execute JavaScript    document.getElementById('select-yui_3_17_2_1_1593033605278_168358-field').scrollIntoView(true)
        Wait Until Element Is Visible    xpath=//select[@id='select-yui_3_17_2_1_1593033605278_168358-field']
        Click Element                     xpath=//select[@id='select-yui_3_17_2_1_1593033605278_168358-field']
        Wait Until Element Is Visible    ${familia}     
        Click Element                    ${familia}    
     ELSE IF    "${Sou}" =="Dono de Academia ou Programa de Contraturno"
        Execute JavaScript    document.getElementById('select-yui_3_17_2_1_1593033605278_168358-field').scrollIntoView(true)
        Wait Until Element Is Visible    xpath=//select[@id='select-yui_3_17_2_1_1593033605278_168358-field']
        Click Element                     xpath=//select[@id='select-yui_3_17_2_1_1593033605278_168358-field']
        Wait Until Element Is Visible    ${DonoAcademiaOuProgramaContraturno}     
        Click Element                    ${DonoAcademiaOuProgramaContraturno}                
    END  

Preencher o campo E-mail
    ${EmailAleatorio}    FakerLibrary.Email
    Execute JavaScript    document.getElementById('email-yui_3_17_2_1_1593039425574_26430-field').scrollIntoView(true)
    Wait Until Element Is Visible    ${CampoEmail}  
    Sleep    1
    Input Text    ${CampoEmail}      ${EmailAleatorio}

Preencher o campo Telefone
    ${TelefoneAleatorio}    FakerLibrary.Phone Number
    Input Text    ${CampoTelefone}     ${TelefoneAleatorio}  

Preencher o campo Mensagem    
    Execute JavaScript    document.getElementById('textarea-yui_3_17_2_1_1593039425574_26432-field').scrollIntoView(true) 
    Sleep    3
    Input Text    ${CampoMensagem}    Olá LekTo! Gostaria de agendar uma apresentação.

Clicar no botão "Quero a Lekto na minha escola"
    Execute JavaScript    document.getElementById('text-yui_3_17_2_1_1593033605278_167399-field').scrollIntoView(true) 
    Sleep    2
    Click Element    ${BtnSubmit} 
    Sleep    1
    Capture Page Screenshot
     

Validar mensagem de agendamento       
    Execute JavaScript    window.scrollTo(0, 0) 
    Wait Until Element Is Visible    ${ValidarAgendamento}
    ${message}=    Get Text    ${ValidarAgendamento}
    Should Contain    ${message}    Muito obrigado! Em breve retornaremos seu contato.
    Sleep    1
    Capture Element Screenshot    ${ValidarAgendamento}
    

    
        


