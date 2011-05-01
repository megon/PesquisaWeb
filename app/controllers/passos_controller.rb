class PassosController < ApplicationController
  def index
  end

  def create
    @participante = Participante.find_by_cpf(session[:cpf])
    @resposta = Resposta.new(params[:passo])
    @resposta.participante= @participante
    @resposta.id_passo= @participante.passo_atual
    @resposta.save
    @participante.increment :passo_atual => 1
    redirect_to :action => "show", :id => @participante.passo_atual + 1
  end

  def show
    render(:template => "passos/#{params[:id]}")
  end

end