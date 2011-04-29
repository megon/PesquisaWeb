require 'spec_helper'

describe PassosController do

  describe "POST create" do
    it "deve salvar as respostas e redirecionar o participante para o proximo passo" do
      @participante = mock_model(Participante, :passo_atual => 1, :respostas => [])
      @resposta = mock_model(Resposta).as_null_object

      Participante.should_receive(:find_by_cpf).with(session[:cpf]).and_return(@participante)
      Resposta.should_receive(:create).with("endereco" => "endereco", "numero" => "111").and_return(@resposta)
      @resposta.should_receive(:id_passo=).with(@participante.passo_atual)
      @participante.respostas.should_receive(:push).with(@resposta)
      @participante.should_receive(:increment).with(:passo_atual => 1)
      post :create, :passo => {:endereco => "endereco", :numero => "111"}, :id => @participante.passo_atual + 1
      response.should redirect_to :action =>"show", :id => @participante.passo_atual + 1
      
    end
  end  
end
