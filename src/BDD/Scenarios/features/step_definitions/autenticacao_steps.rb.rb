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
  server.execute('Delete from aspnet_UsersInRoles')
  server.execute('Delete from aspnet_Membership')
  server.execute('Delete from aspnet_Users')
  server.close
end
Então /^o usuário "([^"]*)" existe com email "([^"]*)"$/ do |usuario, email|
  server = SqlServer.obter_aberto
  consulta_user = server.query("select * from aspnet_Users where LoweredUserName = '#{usuario.downcase}'")
  consulta_user.length.should == 1
  user_id = consulta_user[0][1]
  texto_consulta_membership = "select * from aspnet_Membership where Email = '#{email}' AND UserId = '#{user_id}'"
  consulta_membership = server.query(texto_consulta_membership)
  server.close
  consulta_membership.length.should == 1
end

Dado /^que há um usuário$/ do
  server = SqlServer.obter_aberto
  inserir = [
      "DELETE FROM [aspnet_Membership]",
      "DELETE FROM [aspnet_Users]",
      "INSERT INTO [aspnet_Users] ([ApplicationId],[UserId],[UserName],[LoweredUserName],[MobileAlias],[IsAnonymous],[LastActivityDate]) VALUES ('c2179066-efa5-4c9f-a53a-5390a7c30927','628a5545-d88d-4407-bb33-b38ae90c56e9',N'Giovanni',N'giovanni',null,0,{ts '2011-03-25 16:42:40.780'});",
      "INSERT INTO [aspnet_Membership] ([ApplicationId],[UserId],[Password],[PasswordFormat],[PasswordSalt],[MobilePIN],[Email],[LoweredEmail],[PasswordQuestion],[PasswordAnswer],[IsApproved],[IsLockedOut],[CreateDate],[LastLoginDate],[LastPasswordChangedDate],[LastLockoutDate],[FailedPasswordAttemptCount],[FailedPasswordAttemptWindowStart],[FailedPasswordAnswerAttemptCount],[FailedPasswordAnswerAttemptWindowStart],[Comment]) VALUES ('c2179066-efa5-4c9f-a53a-5390a7c30927','628a5545-d88d-4407-bb33-b38ae90c56e9',N'S6Af6XfoW578jwXgcMIBkyBpuI8=',1,N'AE09F72BA97CBBB5EEAAFF',null,N'giggio@giggio.net',N'giggio@giggio.net',N'Pergunta para password answer',N'kZBpH8Cujnzft4npr7kGOdL9Oj4=',1,0,{ts '2011-03-25 16:42:40.780'},{ts '2011-03-25 16:42:40.780'},{ts '2011-03-25 16:42:40.780'},{ts '1753-01-01 00:00:00.000'},0,{ts '1753-01-01 00:00:00.000'},0,{ts '1753-01-01 00:00:00.000'},N'');"
    ]
  server.execute_all(inserir)
end