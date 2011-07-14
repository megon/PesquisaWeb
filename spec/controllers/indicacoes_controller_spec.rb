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
      Indicacao.should_receive(:new).with("nome" => "nome", "email" => "email@email.com").and_return(@indicacao)
      @indicacao.should_receive(:valid?).and_return(true)
      @participante.should_receive(:add_indicacao).with(@indicacao)

      post :create, :indicacao => {:nome => "nome", :email => "email@email.com"}
      flash[:notice].should eq "Seus amigos foram convidados a participar de nossa pesquisa."
      response.should redirect_to :action => "index"
    end

    it "deve mostrar mensagem de erro caso indicacao tenha seus atributos invalidos" do
      post :create, :indicacao => {:nome => "", :email => "emailemail.com"}
      flash[:error][0].should contain("Nome deve ser preenchido")
    end
  end 
end
