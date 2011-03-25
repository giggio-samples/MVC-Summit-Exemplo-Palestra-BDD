# encoding: utf-8
require_relative '../support/sql_server'

Dado /^que há as seguintes ofertas:$/ do |dados|
  # table is a |1|Sorveteria do Jorge|Sorvete de limão|produtos/sorvete.jpg|5|12|
  server = SqlServer.obter_aberto
  server.clean_table "Ofertas"
  statements = []
  dados.hashes.each do |hash|
		o = Oferta.new hash
    statements << "INSERT INTO [Ofertas] ([Id], [NomeEmpresa], [ProdutoEmOferta], [UrlImagem], [ValorComDesconto], [ValorOriginal]) VALUES (#{o.id}, '#{o.nome_empresa}', '#{o.produto_em_oferta}', '#{o.url_imagem}', #{o.valor_com_desconto}, #{o.valor_original})"
  end
  server.execute_all statements
  server.close
end