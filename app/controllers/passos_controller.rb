class PassosController < ApplicationController
  def index
  end

  def create
    @participante = Participante.find_by_cpf(session[:cpf])
    @resposta = Resposta.new(params[:passo])
    @participante.add_resposta @resposta
    @participante.passo_atual = @resposta.passo_id

    proximo_passo = @resposta.passo_id.to_i + 1
    redirect_to :action => "show", :id => proximo_passo
  end

  def show
    render(:template => "passos/#{params[:id]}")
  end

end
