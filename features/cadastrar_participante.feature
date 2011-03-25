# -*- coding: utf-8 -*-
#language: pt
@https://www.pivotaltracker.com/story/show/11353937
Funcionalidade: Cadastrar participante de pesquisa
  Como um visitante da pesquisaweb
  Eu quero participar da pesquisa
  Então concorrer com os premios distribuidos pela pesquisa.

  @wip  
  Esquema do Cenario: Preencher dados cadastrais com todos os dados corretos pela primeira vezs.
    Dado que eu estou na pagina inicial da pesquisa
    Quando eu preencher meu nome com "<nome>"
    E meu email com "<email>"
    E repetir meu email com "<repetir_email>"
    E meu cpf com "<cpf>"
    E minha data de nascimento com "<data_nascimento>"
    E clicar no botao "Concordo com o regulamento e quero participar"
    Entao devo ser direcionado para a primeira pagina da pesquisa
  
    Exemplos:
    |nome                      |email                                  |repetir_email          |cpf        |data_nascimento|
    |Marco Rojo                |marco@megon.com.br                     |marco@megon.com.br     |16187834836|21/08/1973     |
    |Bruno Roda                |bruno.roda@megon.com.br                |bruno.roda@megon.com.br|16187834836|18/08/1986     |


