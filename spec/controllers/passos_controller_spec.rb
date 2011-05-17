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
      @participante.should_receive(:save).and_return(true)
      post :create, :passo => {:endereco => "endereco", :numero => "111", "passo_id" => 1}, :id => 1
      response.should redirect_to :action =>"show", :id => @resposta.passo_id.to_int + 1
    end

    it "deve poder voltar para o passo anterior" do
      @participante = mock_model(Participante).as_null_object
      Participante.should_receive(:find_by_cpf).with(session[:cpf]).and_return(@participante)
      @participante.respostas.should_receive(:find_by_passo_id).with("1".to_i).and_return(@resposta)
      get :edit, :id_passo_anterior => 1
      response.should render_template "passos/1"
    end
  end  
end
