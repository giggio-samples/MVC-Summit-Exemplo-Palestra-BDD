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

    @wip
  Cenário: Vendo produtos
    Dado que há as seguintes ofertas:
      |id|nome_empresa|produto_em_oferta|url_imagem|valor_com_desconto|valor_original|
      |1|Sorveteria do Jorge|Sorvete de limão|produtos/sorvete.jpg|5|12|
      |2|Sapataria do Alemão|Sapato de couro|produtos/sapato.jpg|92|150|
      |3|Hardware bom|Mouse ArcTouch|produtos/mouse.jpg|100.10|65.45|
      |4|Tailspin|Avião de papel|produtos/aviao.jpg|123.52|167.44|
    Quando eu estou na página raiz
    Então eu devo ver "Sorveteria do Jorge" dentro de "#ofertas"
    E eu devo ver "Sorvete de limão" dentro de "#ofertas"
    E eu devo ver "De 12.00" dentro de "#ofertas"
    E eu devo ver "5.00" dentro de "#ofertas"
    E eu devo ver "59% de desconto" dentro de "#ofertas"