require 'spec_helper'

describe IndicacoesController do

  describe "POST create" do
    
    before(:each) do
      session[:cpf] = "16187834836"
      @participante = mock_model(Participante, :passo_atual => 1, :respostas => [])
      @indicacao = mock_model(Indicacao).as_null_object
      Participante.should_receive(:find_by_cpf).with(session[:cpf]).and_return(@participante)
    end

    it "deve salvar as indicacoes e mostrar mensagem de sucesso" do
      @participante.should_receive(:add_indicacoes).with("nome" => "nome", "email" => "email@email.com")
      @participante.should_receive(:save).and_return(true)

      post :create, :indicacao => {:nome => "nome", :email => "email@email.com"}
      flash[:notice].should eq "Seus amigos foram convidados a participar de nossa pesquisa."
      response.should redirect_to indicacoes_path
    end
  end 
end
