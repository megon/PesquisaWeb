Dado /^que eu estou na pagina inicial da pesquisa$/ do
  visit "/"
end

Quando /^eu preencher meu nome com "([^"]*)"$/ do |nome|
  fill_in "participante[nome]", :with => nome
end

Quando /^meu email com "([^"]*)"$/ do |email|
  fill_in "participante[email]", :with => email
end

Quando /^repetir meu email com "([^"]*)"$/ do |repetir_email|
  fill_in "participante[email2]", :with => repetir_email
end

Quando /^meu cpf com "([^"]*)"$/ do |cpf|
  fill_in "participante[cpf]", :with => cpf
end

Quando /^minha data de nascimento com "([^"]*)"$/ do |data_nascimento|
  fill_in "participante[data_nascimento]", :with => data_nascimento
end

Quando /^clicar no botao "([^"]*)"$/ do |botao|
  click_button botao
end

Entao /^deve ser exibida a mensagem "([^"]*)"$/ do |mensagem|
  response.should contain(mensagem)
end



