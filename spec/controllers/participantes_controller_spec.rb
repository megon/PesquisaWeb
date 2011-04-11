require 'spec_helper'

describe ParticipantesController do

  describe "POST create" do
    before (:each) do
      @participante = mock_model(Participante).as_null_object
    end

    it "deve criar participante com sucesso" do
        Participante.should_receive(:new).with("nome" => "nome do participante", "cpf" => "16187834836").and_return(@participante)
        @participante.should_receive(:save).and_return(true)
        post :create, :participante => {:nome => "nome do participante", "cpf" => "16187834836"}
        response.should redirect_to :controller => "pesquisas", :action =>"index"
    end  

    context "deve rejeitar participante ja cadastrado" do
      before do
        post :create, :participante => {:nome => "nome do participante", 
                                        :email => "a@a.com", 
                                        :email2 => "a@a.com",
                                        :data_nascimento => "21/08/1973",
                                        :cpf => "16187834836"}

      end
          
      it "deve renderizar pagina inicial informando que participante ja esta cadastrado" do
        post :create, :participante => {:nome => "nome do participante", 
                                        :email => "a@a.com", 
                                        :email2 => "a@a.com",
                                        :data_nascimento => "21/08/1973",
                                        :cpf => "16187834836"}
        flash[:notice][0].should eq("Cpf has already been taken")
        response.should render_template :index
      end
    end

    it "participante com email != email2"
  end
end
