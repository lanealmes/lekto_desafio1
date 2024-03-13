*** Settings ***
Documentation    Essa suíte testa o site https://www.lekto.com.br/ - Agende uma apresentção. 
Resource         desafio1_resources.robot
Test Setup       Open Browser     
Test Teardown    Close Browser
Library          SeleniumLibrary
Library          FakerLibrary
Library          OperatingSystem
         

*** Test Cases ***

Caso de Teste 01 - Agendar uma apresentação - EDUCADOR
    [Documentation]    Esse teste realiza o  agendamento de uma apresentação.
    ...                Obs.:clicando no primeiro botão exibido "Agende uma Apresentação"
        
        Acessar o home page do site https://www.lekto.com.br/ 
        Clicar no botão "Agende uma Apresentação"
        Preencher o campo Nome
        Selecionar a opção    EDUCADOR    
        Preencher o campo E-mail
        Preencher o campo Telefone
        Preencher o campo Mensagem
        Clicar no botão "Quero a Lekto na minha escola"
        Validar mensagem de agendamento 

Caso de Teste 02 - Agendar uma apresentação - Diretor(a)/Coordenador(a) Escolar
    [Documentation]    Esse teste realiza o  agendamento de uma apresentação.
    ...                Obs.:clicando no segundo botão exibido "Agende uma Apresentação"
      

        Acessar o home page do site https://www.lekto.com.br/ 
        Clicar no botão 2 "Agende uma apresentação"
        Preencher o campo Nome
        Selecionar a opção    Diretor(a)/Coordenador(a) Escolar
        Preencher o campo E-mail
        Preencher o campo Telefone
        Preencher o campo Mensagem
        Clicar no botão "Quero a Lekto na minha escola"
        Validar mensagem de agendamento 


Caso de Teste 03 - Agendar uma apresentação
    [Documentation]    Esse teste realiza o  agendamento de uma apresentação.
    ...                Obs.: Rolar até o final da página e preencher os itens da apresentação 
     
        Acessar o home page do site https://www.lekto.com.br/ 
        Descer a barra de rolagem até o fim da pagina
        Preencher o campo Nome
        Selecionar a opção    Família
        Preencher o campo E-mail
        Preencher o campo Telefone
        Preencher o campo Mensagem
        Clicar no botão "Quero a Lekto na minha escola"
        Validar mensagem de agendamento  
      

Caso de Teste 04 - Agendar uma apresentação - Diretor Escolar
    [Documentation]    Esse teste realiza o  agendamento de uma apresentação.
    ...                Obs.:clicando no primeiro botão exibido "Agende uma Apresentação"
        
        Acessar o home page do site https://www.lekto.com.br/ 
        Clicar no botão "Agende uma Apresentação"
        Preencher o campo Nome
        Selecionar a opção   Dono de Academia ou Programa de Contraturno    
        Preencher o campo E-mail
        Preencher o campo Telefone
        Preencher o campo Mensagem
        Clicar no botão "Quero a Lekto na minha escola"
        Validar mensagem de agendamento 
