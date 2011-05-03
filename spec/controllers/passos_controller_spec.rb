require 'spec_helper'

describe PassosController do

  describe "POST create" do
    it "deve salvar as respostas e redirecionar o participante para o proximo passo" do
      @participante = mock_model(Participante, :passo_atual => 1, :respostas => [])
      @resposta = mock_model(Resposta).as_null_object

      Participante.should_receive(:find_by_cpf).with(session[:cpf]).and_return(@participante)
      Resposta.should_receive(:new).with("endereco" => "endereco", "numero" => "111", "passo_id" => 1).and_return(@resposta)
      @participante.should_receive(:add_resposta).with(@resposta)
      @participante.should_receive(:passo_atual=).with(@resposta.passo_id)
      post :create, :passo => {:endereco => "endereco", :numero => "111", "passo_id" => 1}, :id => 1
      response.should redirect_to :action =>"show", :id => @resposta.passo_id.to_int + 1
    end
  end  
end
