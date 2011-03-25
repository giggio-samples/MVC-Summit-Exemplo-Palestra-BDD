# language: pt
Funcionalidade: Exibição da home
	Enquanto visitante
	Para ver o site
	Eu gostaria de acessar a home page
	
  Contexto:
	Dado que sou um usuário anonimo

  Cenário: Exibindo titulo
    Quando eu estou na página raiz
    Então eu devo ver o título "Lambda3 > Home"

  Cenário: Vendo produtos
    Dado que há as seguintes ofertas:
      |id|nome_empresa|produto_em_oferta|url_imagem|valor_com_desconto|valor_original|
      |1|Sorveteria do Jorge|Sorvete de limão|produtos/sorvete.jpg|5|12|
      |2|Sapataria do Alemão|Sapato de couro|produtos/sapato.jpg|92|150|
      |3|Hardware bom|Mouse ArcTouch|produtos/mouse.jpg|65.45|100.10|
      |4|Tailspin|Avião de papel|produtos/aviao.jpg|123.52|167.44|
    Quando eu estou na página raiz
    Então eu devo ver "Sorveteria do Jorge" dentro de "#ofertas"
    E eu devo ver "Sorvete de limão" dentro de "#ofertas"
    E eu devo ver "De 12.00" dentro de "#ofertas"
    E eu devo ver "5.00" dentro de "#ofertas"
    E eu devo ver "59% de desconto" dentro de "#ofertas"
    E eu devo ver "Sapataria do Alemão" dentro de "#ofertas"
    E eu devo ver "Sapato de couro" dentro de "#ofertas"
    E eu devo ver "De 150.00" dentro de "#ofertas"
    E eu devo ver "92.00" dentro de "#ofertas"
    E eu devo ver "39% de desconto" dentro de "#ofertas"
    E eu devo ver "Hardware bom" dentro de "#ofertas"
    E eu devo ver "Mouse ArcTouch" dentro de "#ofertas"
    E eu devo ver "De 100.10" dentro de "#ofertas"
    E eu devo ver "65.45" dentro de "#ofertas"
    E eu devo ver "35% de desconto" dentro de "#ofertas"
    E eu devo ver "Tailspin" dentro de "#ofertas"
    E eu devo ver "Avião de papel" dentro de "#ofertas"
    E eu devo ver "De 167.44" dentro de "#ofertas"
    E eu devo ver "123.52" dentro de "#ofertas"
    E eu devo ver "27% de desconto" dentro de "#ofertas"

  Cenário: Vendo oferta
    Dado que há as seguintes ofertas:
      |id|nome_empresa|produto_em_oferta|url_imagem|valor_com_desconto|valor_original|
      |1|Sorveteria do Jorge|Sorvete de limão|produtos/sorvete.jpg|5|12|
    Quando eu estou na página raiz
    E eu clico na imagem "#sorveteria_do_jorge_sorvete_de_limão"
    Então eu devo estar na página ofertas exibir sorveteria_do_jorge_sorvete_de_lim%c3%a3o
