class CuponsController < ApplicationController
  skip_before_filter :verifica_sessao_participante
  respond_to :js, :except => :index
  
  def index
  end
  
  def buscar_cupons
    @participante = Participante.find_by_cpf(params[:cpf])
    respond_with(@participante)
  end

end
