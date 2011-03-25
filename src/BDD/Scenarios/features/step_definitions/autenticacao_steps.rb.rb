# encoding: utf-8

Dado /^que sou um usuário anonimo$/ do

end

Dado /^que sou um usuário logado$/ do
  Dado "que eu estou na página Account Logon"
  E "eu preencho os dados:", table(%{
    |UserName|giovanni@lambda3.com.br|
    |Password|microsoft|
  })
  E %{eu clico em "Logar"}
end