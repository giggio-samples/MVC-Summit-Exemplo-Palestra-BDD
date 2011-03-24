# language: pt
Funcionalidade: Testar o cucumber
	Enquanto testador
	Para criar novos cenários
	Eu gostaria de rodar testes com o cucumber

  Cenário: teste
    Dado que eu estou na página http://www.bing.com
    E eu preencho "q" com "Giovanni Bassi"
    Quando eu clico em "sb_form_go"
    Então eu devo ver "Giovanni Bassi"
    E me mostra a página
