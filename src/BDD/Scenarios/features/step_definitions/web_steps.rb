# encoding: utf-8

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Dado /^(?:|que )eu estou na página (.*)$/ do |pagina|
	visit Endereco.para(pagina)
end

Dado /^que eu estou na url (.*)$/ do |url|
	visit url
end

Então /^eu devo ver "([^"]*)"$/ do |texto|
  page.should have_content(texto)
end

Então /^eu não devo ver "([^"]*)"$/ do |texto|
  page.has_content?(texto).should be false
end

Então /^eu devo ver o botão "([^"]*)"$/ do |id_botao|
	page.has_button?(id_botao).should be true
end

Então /^eu devo ver o link "([^"]*)"(?: dentro de "([^"]*)")?$/ do |texto, selector|
    with_scope(selector) do
      page.should have_link(texto)
    end
end

Então /^eu não devo ver o link "([^"]*)"$/ do |texto|
  page.should_not have_link(texto)
end

Então /^a aba "([^"]*)" selecionada$/ do |texto_aba|
	click_link(texto_aba)
end

Então /^eu devo ver o campo "([^"]*)"$/ do |id_campo|
	page.has_field?(id_campo).should be true
end

Quando /^eu preencho os dados:$/ do |fields|
    fields.rows_hash.each do |campo, valor|
      Quando %{eu preencho "#{campo}" com "#{valor}"}	  
    end
end
Quando /^eu preencho os dados(?: em "([^"]*)"):$/ do |selector, fields|
  within(selector) do
	Quando %{eu preencho os dados "#{fields}"}
  end
end

Quando /^eu preencho "([^"]*)" com "([^"]*)"$/ do |campo, valor|
	fill_in(campo, :with => valor)
end

Quando /^eu clico no link "([^"]*)"$/ do |botao|
  click_link(botao)
end

Quando /^eu clico em "([^"]*)"$/ do |botao|
	click_button(botao)
end

Então /^eu devo estar na página (.*)$/ do |pagina|
	current_path = URI.parse(current_url).path
  current_path.downcase.should == Endereco.para(pagina)
end

Então /^o campo "([^"]*)" tem o valor "([^"]*)"$/ do |campo, valor|
	find_field(campo).value.should == valor
end

Então /^o campo "([^"]*)" está ticado$/ do |campo|
	find_field(campo).value.should == true.to_s
end

Quando /^o usuário vai confirmar$/ do
  page.evaluate_script("window.alert = function(msg) { return true; }")
  page.evaluate_script("window.confirm = function(msg) { return true; }")
end

When /^eu tico "([^"]*)"$/ do |checkbox|
  check checkbox
end

Quando /^eu destico "([^"]*)"$/ do |checkbox|
  uncheck checkbox
end

Quando /^eu anexo no campo "([^\"]*)" o arquivo "([^\"]*)"$/ do |campo, arquivo|
  attach_file(campo, arquivo)
end

Então /^eu não devo ver o botão "([^\"]*)"$/ do |botao|
  page.has_button?(botao).should be false
end

Então /^(?:|eu )devo ver o título "([^"]*)"$/ do |titulo|
  page.find(:css, 'title').text.should == titulo
end

Então /^(?:|me )mostra a página$/ do
  save_and_open_page
end
