class ParticipantesController < ApplicationController
  skip_before_filter :verifica_sessao_participante

  def index
  end

  def create
    @participante = Participante.new(params[:participante])
    puts @participante.data_nascimento
    if @participante.save
      session[:cpf] = @participante.cpf
      redirect_to :controller => "passos", :action =>"show", :id => @participante.passo_atual
    else
      flash[:notice] = @participante.errors.full_messages
      render :index
    end
  end
end
