class PesquisasController < ApplicationController
  def index
  end

  def create
    @participante = Participante.find_by_cpf(session[:cpf])
    @resposta = Resposta.new (params[:pesquisa])
    show
  end

  def show
    render(:template => "pesquisas/passo_1")
  end

end
