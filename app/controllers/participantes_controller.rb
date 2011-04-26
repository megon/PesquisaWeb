class ParticipantesController < ApplicationController

  def index
  end

  def create
    @participante = Participante.new(params[:participante])
    if @participante.save
      session[:cpf] = @participante.cpf
      redirect_to :controller => "pesquisas", :action =>"show"
    else
      flash[:notice] = @participante.errors.full_messages
      render :index
    end
  end
end
