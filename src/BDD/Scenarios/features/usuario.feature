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
    E eu devo ver o link "Logar" dentro de ".user_menu"
    E eu devo ver o link "Home" dentro de ".user_menu"

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
    E eu devo ver o link "Ofertas" dentro de ".user_menu"
    E eu devo ver o link "Empresas" dentro de ".user_menu"
    E eu devo ver o link "Configurações" dentro de ".user_menu"

  Cenário: Exibindo menu para usuário logado
    Dado que há um usuário
    E que sou um usuário logado
    Quando eu estou na página raiz
    Então eu devo ver o link "Ofertas" dentro de ".user_menu"
    E eu devo ver o link "Empresas" dentro de ".user_menu"
    E eu devo ver o link "Configurações" dentro de ".user_menu"
