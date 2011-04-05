class ParticipantesController < ApplicationController

  def index
  end

  def create
    @participante = Participante.new(params[:participante])
    if @participante.save
      redirect_to :controller => "pesquisas", :action =>"index"
    else
      flash[:notice]= I18n.t("erro_cadastrar_participante")
      render :index
    end
  end
end
