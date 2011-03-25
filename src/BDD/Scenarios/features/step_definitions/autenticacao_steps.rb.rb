# encoding: utf-8
require_relative '../support/sql_server'

Dado /^que sou um usuário anonimo$/ do
  Capybara.current_session.driver.browser.manage.delete_cookie(".ASPXAUTH")
end

Dado /^que sou um usuário logado$/ do
  Dado "que eu estou na página Account Logon"
  E "eu preencho os dados:", table(%{
    |UserName|Giovanni|
    |Password|M!cr0soft|
  })
  E %{eu clico em "Logar"}
end

Então /^fico logado$/ do
	Capybara.current_session.driver.browser.manage.cookie_named(".ASPXAUTH").should_not be_nil
end

Então /^não fico logado$/ do
	Capybara.current_session.driver.browser.manage.cookie_named(".ASPXAUTH").should be_nil
end
Dado /^que não há usuários cadastrados$/ do
  server = SqlServer.obter_aberto
  server.open
  server.execute('Delete from aspnet_UsersInRoles')
  server.execute('Delete from aspnet_Membership')
  server.execute('Delete from aspnet_Users')
  server.close
end
Então /^o usuário "([^"]*)" existe com email "([^"]*)"$/ do |usuario, email|
  server = SqlServer.obter_aberto
  server.open
  consulta_user = server.query("select * from aspnet_Users where LoweredUserName = '#{usuario.downcase}'")
  consulta_user.length.should == 1
  user_id = consulta_user[0][1]
  texto_consulta_membership = "select * from aspnet_Membership where Email = '#{email}' AND UserId = '#{user_id}'"
  consulta_membership = server.query(texto_consulta_membership)
  server.close
  consulta_membership.length.should == 1
end