# language: pt
Funcionalidade: Exibição da home
	Enquanto visitante
	Para ler o blog
	Eu gostaria de acessar a home page
	
  Contexto:
	Dado que sou um usuário anonimo

  Cenário: Exibindo titulo
    Quando eu estou na página raiz
    Então eu devo ver o título "Lambda3 > Home"
