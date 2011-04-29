class PassosController < ApplicationController
  def index
  end

  def create
    @participante = Participante.find_by_cpf(session[:cpf])
    @participante.increment(:passo_atual => 1)
    @resposta = Resposta.create (params[:passo])
    @resposta.id_passo= @participante.passo_atual
    @participante.respostas.push @resposta
    redirect_to :action => "show", :id => @participante.passo_atual + 1
  end

  def show
    render(:template => "passos/#{params[:id]}")
  end

end
