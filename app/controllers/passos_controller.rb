class PassosController < ApplicationController

  ULTIMO_PASSO = 2

  def index
  end

  def create
    @participante = Participante.find_by_cpf(session[:cpf])
    @resposta = Resposta.new(params[:passo])
    @participante.add_resposta @resposta
    @participante.passo_atual = @resposta.passo_id + 1
    @participante.save

    proximo_passo = @resposta.passo_id + 1
    if proximo_passo <= ULTIMO_PASSO
      redirect_to :action => "show", :id => proximo_passo
    else
      redirect_to indicacoes_path
    end
  end

  def show
    @participante = Participante.find_by_cpf(session[:cpf])

    if params[:id].to_i.eql?(@participante.passo_atual)
      render(:template => "passos/#{params[:id]}")
    else
      redirect_to :action =>"show", :id => @participante.passo_atual
    end
  end

  def edit
    @participante = Participante.find_by_cpf(session[:cpf])

    @passo = @participante.respostas.find_by_passo_id(params[:id_passo].to_i)
    render(:template => "passos/#{params[:id_passo]}")
  end
end
