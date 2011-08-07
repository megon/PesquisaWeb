require 'spec_helper'

describe CuponsController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
  
  describe "GET buscar_cupons" do
    it "deve retornar a quantidade de cupons de um participante" do
      @participante = mock_model(Participante, :total_cupons => 1)
      Participante.should_receive(:find_by_cpf).with('1234567890').and_return(@participante)
    
      get :buscar_cupons, :cpf => "1234567890", :format => :js
      assert_response :success
      response.should render_template("cupons/buscar_cupons")
    end
    
    it "deve retornar que o participante informado nao possui nenhum cupom" do
      @participante = mock_model(Participante, :total_cupons => 0)
      Participante.should_receive(:find_by_cpf).with('777666').and_return(@participante)
      
      xhr :get, :buscar_cupons, :cpf => "777666", :format => "js"
      assert_response :success
      response.should render_template("cupons/buscar_cupons")
    end
    
    it "Quando nao encontrar participante deve retornar que o participante informado nao possui nenhum cupom" do
      @participante = mock_model(Participante, :total_cupons => 0)
      Participante.should_receive(:find_by_cpf).with('888999').and_return(nil)
      
      xhr :get, :buscar_cupons, :cpf => "888999"
      assert_response :success
      response.should render_template("cupons/buscar_cupons")
    end
  end
  
end
