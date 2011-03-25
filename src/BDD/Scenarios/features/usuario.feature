# language: pt
Funcionalidade: Comprando
	Enquanto visitante
	Para ler o blog
	Eu gostaria de acessar a home page
	
  Contexto:

  Cenário: Exibindo menu para usuário não logado
    Dado que sou um usuário anonimo
    Quando eu estou na página raiz
    Então eu devo ver o link "Registre-se" dentro de ".user_menu"


  @and
  Cenário: Exibindo menu para usuário logado
    Dado que sou um usuário logado
    Quando eu estou na página raiz
    Então eu devo ver o link "Ofertas"
    Então eu devo ver o link "Empresas"
    Então eu devo ver o link "Configurações"
