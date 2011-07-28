require 'spec_helper'

describe CuponsController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    # it "deve retornar a quantide de cupons de um participante" do
    #   @participante = mock_model(Participante, :total_cupons => 1, :respostas => [])
    #   Participante.should_receive(:find_by_cpf).and_return(@participante)
    # 
    #   xhr :get, :buscar_cupons, :cpf => "123456789"
    #   response.should redirect_to indicacoes_path
    # end
    
  end
end
