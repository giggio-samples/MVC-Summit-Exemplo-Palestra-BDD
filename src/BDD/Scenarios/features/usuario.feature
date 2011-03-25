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
    Então eu devo ver o link "Logar" dentro de ".user_menu"
    Então eu devo ver o link "Home" dentro de ".user_menu"

  Cenário: Regitrando-se
    Dado que não há usuários cadastrados
    E que sou um usuário anonimo
    E eu estou na página account register
    Quando eu preencho os dados:
      |UserName|Giovanni|
      |Email|giggio@giggio.net|
      |Password|M!cr0soft|
      |ConfirmPassword|M!cr0soft|
    E clico em "Registre-se"
    Então fico logado
    E o usuário "Giovanni" existe com email "giggio@giggio.net"
    E eu devo ver o link "Ofertas"
    E eu devo ver o link "Empresas"
    E eu devo ver o link "Configurações"

  @wip
  Cenário: Exibindo menu para usuário logado
    Dado que sou um usuário logado
    Quando eu estou na página raiz
    Então eu devo ver o link "Ofertas"
    Então eu devo ver o link "Empresas"
    Então eu devo ver o link "Configurações"
