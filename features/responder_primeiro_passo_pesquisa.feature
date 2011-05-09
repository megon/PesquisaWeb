# -*- coding: utf-8 -*-
#language: pt
@https://www.pivotaltracker.com/story/show/11354439
Funcionalidade: Responder primeiro passo da pesquisa
  Como um participante da pesquisa
  Eu quero responder as questoes do primeiro passo da pesquisa
  Então ganhar os cupons relativos ao preenchimento desse passo

  Esquema do Cenario: Preencher todas as questoes obrigatorias do primeiro passo da pesquisa.
    Dado que eu tenha preenchido meus dados de cadastro
    E que eu esteja na primeira pagina da pesquisa
    Quando eu preencher o endereco com "<endereco>"
    E o numero com "<numero>"
    E o bairro com "<bairro>"
    E a cidade com "<cidade>"
    E o estado com "<estado>"
    E o telefone residencial com "<telefone_residencial>"
    E responder "<resposta_atualmente_esta>" a questao atualmente voce esta
    E "<resposta_tem_filhos>" a questao voce tem filhos
    E "<resposta_quantos_filhos>" a questao quantos filhos
    E "<resposta_sexo_filho>" a questao sexo do seu filho
    E "<resposta_data_nascimento_filho>" a questao data de nascimento do seu filho
    E "<resposta_mora_com_voce>" a questao seu filho mora com voce
    E "<resposta_grau_instrucao>" a questao qual seu grau de instrucao
    E "<resposta_estuda_momento>" a questao esta estudando no momento
    E clicar em "Ir para o próximo passo"
    Entao devo ir para a proxima pagina da pesquisa
  
    Exemplos:
    |endereco    |numero|bairro         |cidade   |estado|telefone_residencial|resposta_atualmente_esta|resposta_tem_filhos|resposta_quantos_filhos|resposta_sexo_filho|resposta_data_nascimento_filho|resposta_mora_com_voce|resposta_grau_instrucao|resposta_estuda_momento|
    |carlos weber|7900  |Vila Leopoldina|São Paulo|SP    |(11)1234-1234       |solteiro                |sim                |1                      |masculino          |30/09/2009                    |sim                   |Pós-graduação          |nao                    |


