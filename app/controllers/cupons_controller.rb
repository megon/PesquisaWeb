class CuponsController < ApplicationController
  skip_before_filter :verifica_sessao_participante
  respond_to :js, :except => :index
  
  def index
  end
  
  def buscar_cupons    
    #TODO: refatorar para nao terq utilizar '.scan' toda vez q for comparar o campo CPF
    @participante = Participante.find_by_cpf(params[:cpf].scan(/\d+/).join)
    respond_with(@participante)
  end

end
