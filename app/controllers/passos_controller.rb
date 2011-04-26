class PassosController < ApplicationController
  def index
  end

  def create
    @participante = Participante.find_by_cpf(session[:cpf])
    @resposta = Resposta.new (params[:passo])
    show
  end

  def show
    puts params[:id]
    if params[:id] == "1"
      render(:template => "passos/1")
    else
      render(:template => "passos/2")
    end
  end

end
