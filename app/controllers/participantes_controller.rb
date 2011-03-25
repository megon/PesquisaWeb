class ParticipantesController < ApplicationController

  def index
  end

  def create
    participante = Participante.new(params[:participante])
    participante.save
    redirect_to :controller => "pesquisas", :action =>"index"
  end

end
