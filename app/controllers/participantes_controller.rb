class ParticipantesController < ApplicationController

  def index
  end

  def create
    @participante = Participante.create(params[:participante])
    if @participante.save
      redirect_to :controller => "pesquisas", :action =>"index"
    else
      flash[:notice] = @participante.errors.full_messages
      render :index
    end
  end
end
