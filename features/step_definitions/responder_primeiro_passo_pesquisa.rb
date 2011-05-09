Dado /^que eu tenha preenchido meus dados de cadastro$/ do
  visit "/"
  fill_in "participante[nome]", :with => "participante"
  fill_in "participante[email]", :with => "a@a.com"
  fill_in "participante[email2]", :with => "a@a.com"
  fill_in "participante[cpf]", :with => "16187834836"
  fill_in "participante[data_nascimento]", :with => "21/08/1973"
  click_button "Participar"
end

Dado /^que eu esteja na primeira pagina da pesquisa$/ do
  visit "/passos/1"
end

Quando /^eu preencher o endereco com "([^"]*)"$/ do |endereco|
  fill_in "passo[endereco]", :with => endereco
end

Quando /^o numero com "([^"]*)"$/ do |numero|
  fill_in "passo[numero]", :with => numero
end

Quando /^o bairro com "([^"]*)"$/ do |bairro|
  fill_in "passo[bairro]", :with => bairro
end

Quando /^a cidade com "([^"]*)"$/ do |cidade|
  fill_in "passo[cidade]", :with => cidade
end

Quando /^o estado com "([^"]*)"$/ do |estado|
  select estado, :from => "passo[estado]"
end

Quando /^o telefone residencial com "([^"]*)"$/ do |telefone_residencial|
  fill_in "passo[telefone_residencial]", :with => telefone_residencial
end

Quando /^responder "([^"]*)" a questao atualmente voce esta$/ do |resposta_atualmente_esta|
  choose "passo_atualmente_esta_" + resposta_atualmente_esta
end

Quando /^"([^"]*)" a questao voce tem filhos$/ do |resposta_tem_filhos|
  choose "passo_tem_filhos_" + resposta_tem_filhos
end

Quando /^"([^"]*)" a questao quantos filhos$/ do |resposta_quantos_filhos|
  select resposta_quantos_filhos, :from => "passo[quantos_filhos]"
end

Quando /^"([^"]*)" a questao sexo do seu filho$/ do |resposta_sexo_filho|
  choose "passo_sexo_1_filho_" + resposta_sexo_filho
end

Quando /^"([^"]*)" a questao data de nascimento do seu filho$/ do |resposta_data_nascimento_filho|
  fill_in "passo[data_nascimento_1_filho]", :with => resposta_data_nascimento_filho
end

Quando /^"([^"]*)" a questao seu filho mora com voce$/ do |resposta_mora_com_voce|
  choose "passo_mora_com_voce_1_filho_" + resposta_mora_com_voce
end

Quando /^"([^"]*)" a questao qual seu grau de instrucao$/ do |resposta_grau_instrucao|
  select resposta_grau_instrucao, :from => "passo[grau_instrucao]"
end

Quando /^"([^"]*)" a questao esta estudando no momento$/ do |resposta_estuda_momento|
  choose "passo_estuda_momento_" + resposta_estuda_momento
end

Quando /^clicar em "([^"]*)"$/ do |botao|
  click_button botao
end


Entao /^devo ir para a proxima pagina da pesquisa$/ do
  response.should contain "em 2/2"
end

