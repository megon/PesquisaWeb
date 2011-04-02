require 'spec_helper'

describe ParticipantesController do

  describe "POST create" do
    it "novo participante com sucesso" do
        participante = mock_model(Participante).as_null_object
        Participante.should_receive(:new).with("nome" => "nome do participante").and_return(participante)
        participante.should_receive(:save)
        post :create, :participante => {"nome" => "nome do participante"}
        response.should redirect_to :controller => "pesquisas", :action =>"index"
    end  

    it "participante ja cadastrado"
  end
end
