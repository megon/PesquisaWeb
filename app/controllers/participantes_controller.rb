class ParticipantesController < ApplicationController

  def index
  end

  def create
    @participante = Participante.new(params[:participante])
    if @participante.save
      session[:participante] = @participante
      redirect_to :controller => "pesquisas", :action =>"proximo_passo"
    else
      flash[:notice] = @participante.errors.full_messages
      render :index
    end
  end
end
