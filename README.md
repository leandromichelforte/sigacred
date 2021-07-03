# DESAFIO SIGA CRED

# DOCUMENTAÇÃO:
DESAFIO Desenvolvedor Flutter - Siga Cred
Mini - Sistema para controle de manutenção de equipamentos
Estudo de Caso do Sistema
Uma empresa de manutenção de equipamentos, precisa controlar todos os estágios da execução de um serviço, conforme abaixo.
# Um cliente se utilia-se de um APP para  registrar uma ordem de serviço, com os dados do equipamento danificado. App solicita algumas informações sobre o cliente, tais como nome, endereço, telefone e email e também do equipamento, como um descritivo do equipamento (tipo, marca) e também sobre o problema.
# Após Cliente registrar sua  ordem de serviço no app, os responsáveis pela execução devem registrar o início do atendimento e posteriormente a finalização do serviço com os devidosdetalhes do que foi executado.

Deve se Criar um app Flutter utilizando o endpoint e a documentação a ser enviada no e-mail para criar os seguintes itens, pode ser disponibilizado tudo em um app unico.
Criar um app com as seguintes Funcionalidades:
# Itens obrigatórios	
1.	Possibilitar consulta das ordens pendentes;
2.	Possibilitar o registro de início e término do serviço(ordem) pelo responsável.
# Itens desejáveis
1.	Possibilitar ao Cliente registro e acompanhamentos sobre as ordens de serviço. Exemplo: o serviço precisou ser interrompido por conta de uma peça que levará uma semana para ser entregue. Esse fato ou outros mais devem estar registrados na ordem de serviço.
2.	Possibilitar ao Cliente criação de ordem de serviço

# Instruções para entrega
1.	Documentar todos passos para rodar a aplicação.
2.	Entregas parciais também serão aceitas e avaliadas.
3.	Preferencialmente podes publicar o projeto no GitHub, Bitbucket ou outro, e compartilhar no privado via e-mail.

# APIs
https://desafio.sigacred.com.br/swagger-ui.html


### Conclusão dos requisitos

O projeto ainda está em desenvolvimento e as próximas atualizações serão voltadas nas seguintes tarefas:

# Obrigatórios:
1.	[Ok]
2.	[Ok]
# Desejáveis:
1.	[Impedido] - A API de consultar o histórico de alterações da ordem não dá resposta positiva (Erro 404)
2.  [Ok]

Apesar de não obter resposta positiva de algumas API's, todos as funções e telas foram criadas e prontas para receber os dados. 
Foi criado um histórico fixo e fictício para a o complemento da tela de detalhe da ordem.

## 💻 Ambiente Flutter (flutter doctor):

[√] Flutter (Channel stable, 2.2.2, on Microsoft Windows [versÃ£o 10.0.19041.1052], locale pt-BR)
[√] Android toolchain - develop for Android devices (Android SDK version 29.0.3)

## 🚀 Instalação

- Direto de um dispositivo mobile basta executar o arquivo .APK localizado em: "/build/app/outputs/flutter-apk/app-release.apk"
- De um desktop, é necessário ter o Flutter(superior à versão 2.0) instalado e configurado na máquina para que seja possível emular a aplicação.

## ☕ Utilização

A utilização é bem direta e de acordo com o que foi requisitado na documentação do projeto.
Logo no início é apresentado uma splash screen com o logo da empresa e o nome da mesma. A landing page é a tela de listagem de todas as ordens existentes. É possível filtrar a pesquisa pressionando o ícone de filtro na lateral direita na barra superior da tela de acordo com os status da ordem (Aberta, Fechadas, Iniciada, Parada).
A listagem acontece de forma simples e objetiva. Cada cartão representa uma ordem, de cara já é possível visualizar id, problema do item, observação da ordem, data da criação da ordem, nome do cliente, telefone e email.
Para visualizar os detalhes da ordem, basta pressionar o cartão representante da ordem que o usuário é direcionado à página de detalhes. Na página de detalhe é passada todas as informações disponibilizadas pela API, agrupadas por Cliente, Ordem, Item e Histórico (não visualizado pela resposta negativa da API). Ainda na tela de detalhes, caso a ordem não já esteja fechada é possível executar as funções de iniciar, parar (pausar) e fechar a ordem após o preenchimento do campo de descrição da ação que será executada.
Após a conclusão da ação, usuário é redirecionado para a tela de listagem para atualização dos dados.
O acesso à criação de uma nova ordem ocorre através do botão flutuante que fica na landing page do aplicativo. O usuário é direcionado para uma formulário onde é necessário preencher todos os campos para a criação da ordem. Para concluir o salvamento da ordem, basta pressionar o botão na parte inferior direita do dispositivo (não implementado por completo pois a API não retorna uma resposta positiva).

## Observações finais

- Não foi implementado uma forma de diferenciar os níveis de acesso do usuário conectado pois não consta endpoint para buscar tais informações
- Os requisitos que foram solicitados e não foram entregues por completo, as funções constam no diretório e foi desenvolvida o máximo possível para chegar no resultado final, impedido pela resposta negativa das APIs.
- Apesar de constar no projeto, não foi utilizado o gestor de estados MOBX nem o Provider pois não haviam informações a serem tratadas em todas as telas da aplicação, portanto, nessa situação, o uso do set state é o mais certo.
- Design Pattern utilizado foi o MVVM, contudo a parte do VM (viewmodels) não foi bem implementada pelo mesmo motivo da não utilização do MOBX e Provider, pois não haviam muitas telas que se encaixaram nesse padrão.