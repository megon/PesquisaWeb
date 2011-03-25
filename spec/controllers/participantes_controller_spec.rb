require 'spec_helper'

describe ParticipantesController do

  describe "novo participante" do
    describe "POST" do
      let(:participante) { participante = mock_model(Participante).as_null_object }

      before(:each) do
        Participante.stub(:new).and_return(participante)
      end

      it "criar" do
        Participante.should_receive(:new).with("nome" => "nome do participante").and_return(participante)
        post :create, :participante => {"nome" => "nome do participante"}
      end

      it "salvar" do
        participante.should_receive(:save)
        post :create
      end

      it "redirecionar para primeira pagina da pesquisa" do
        post :create
        response.should redirect_to :controller => "pesquisas", :action =>"index"
      end
    end  
  end

  describe "participante ja registrado"

end
