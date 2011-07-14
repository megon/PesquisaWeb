class IndicacoesController < ApplicationController

  def index
    @indicacao = Indicacao.new
  end

  def create
    @participante = Participante.find_by_cpf(session[:cpf])    
    @indicacao = Indicacao.new(params[:indicacao])
    if @indicacao.valid?
      @participante.add_indicacao @indicacao
      flash[:notice] = "Seus amigos foram convidados a participar de nossa pesquisa."
      redirect_to :action => "index"
    else
      flash[:error] = @indicacao.errors.full_messages
      render :index
    end
  end
end
