Dado /^que eu tenha preenchido meus dados de cadastro$/ do
  @participante = Participante.create(:nome => "nome do participante", 
                                        :email => "a@a.com", 
                                        :email2 => "a@a.com",
                                        :data_nascimento => "21/08/1973",
                                        :cpf => "16187834836")

end

Dado /^que eu esteja na primeira pagina da pesquisa$/ do
  visit "/pesquisas"
end

Quando /^eu preencher o endereco com "([^"]*)"$/ do |endereco|
  fill_in "pesquisa[endereco]", :with => endereco
end

Quando /^o numero com "([^"]*)"$/ do |numero|
  fill_in "pesquisa[numero]", :with => numero
end

Quando /^o bairro com "([^"]*)"$/ do |bairro|
  fill_in "pesquisa[bairro]", :with => bairro
end

Quando /^a cidade com "([^"]*)"$/ do |cidade|
  fill_in "pesquisa[cidade]", :with => cidade
end

Quando /^o estado com "([^"]*)"$/ do |estado|
  select estado, :from => "pesquisa[estado]"
end

Quando /^o DDD residencial com "([^"]*)"$/ do |ddd_residencial|
  fill_in "pesquisa[ddd_residencial]", :with => ddd_residencial
end

Quando /^o telefone residencial com "([^"]*)"$/ do |telefone_residencial|
  fill_in "pesquisa[telefone_residencial]", :with => telefone_residencial
end

Quando /^responder "([^"]*)" a questao atualmente voce esta$/ do |resposta_atualmente_esta|
  choose "pesquisa_atualmente_esta_" + resposta_atualmente_esta
end

Quando /^"([^"]*)" a questao voce tem filhos$/ do |resposta_tem_filhos|
  choose "pesquisa_tem_filhos_" + resposta_tem_filhos
end

Quando /^"([^"]*)" a questao quantos filhos$/ do |resposta_quantos_filhos|
  select resposta_quantos_filhos, :from => "pesquisa[quantos_filhos]"
end

Quando /^"([^"]*)" a questao sexo do seu filho$/ do |resposta_sexo_filho|
  choose "pesquisa_sexo_1_filho_" + resposta_sexo_filho
end

Quando /^"([^"]*)" a questao data de nascimento do seu filho$/ do |resposta_data_nascimento_filho|
  fill_in "pesquisa[data_nascimento_1_filho]", :with => resposta_data_nascimento_filho
end

Quando /^"([^"]*)" a questao seu filho mora com voce$/ do |resposta_mora_com_voce|
  choose "pesquisa_mora_com_voce_1_filho_" + resposta_mora_com_voce
end

Quando /^"([^"]*)" a questao qual seu grau de instrucao$/ do |resposta_grau_instrucao|
  select resposta_grau_instrucao, :from => "pesquisa[grau_instrucao]"
end

Quando /^"([^"]*)" a questao esta estudando no momento$/ do |resposta_estuda_momento|
  choose "pesquisa_estuda_momento_" + resposta_estuda_momento
end

Entao /^devo ser redirecionado para a proxima pagina da pesquisa$/ do
  pending # express the regexp above with the code you wish you had
end

