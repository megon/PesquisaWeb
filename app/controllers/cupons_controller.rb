class CuponsController < ApplicationController
  skip_before_filter :verifica_sessao_participante
  
  def index
  end

end
