class IndicacoesController < ApplicationController

  def index
    @indicacao = Indicacao.new
  end

  def create
    @participante = Participante.find_by_cpf(session[:cpf])    
    @participante.add_indicacoes(params[:indicacao])
    if @participante.save
      flash[:notice] = "Seus amigos foram convidados a participar de nossa pesquisa."
      redirect_to indicacoes_path
    else
      flash[:error] = @participante.errors.full_messages
      puts "vai"
      render :index
    end
  end

end
