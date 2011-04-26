require 'spec_helper'

describe PesquisasController do

  describe "POST create" do
    context "deve salvar as respostas e redirecionar o participante para o proximo passo" do
      it "deve recuperar o participante da sessao" do
        Participante.should_receive(:find_by_cpf).with(session[:cpf]).and_return(@participante)
        post :create, :pesquisa => {:endereco => "endereco", :numero => "111"}
      end
      
      it "deve criar as respostas do participante" do
        pending "trabalhando na implementacao do item 'deve ir para o passo_2 da pesquisa'"

        Resposta.should_receive(:new).with("endereco" => "endereco", "numero" => "111").and_return(@resposta)

        post :create, :pesquisa => {:endereco => "endereco", :numero => "111"}
        
      end

      it "deve gravar as respostas do participante"

      it "deve recuperar pesquisa[passo_id]"

      it "deve ir para o proximo passo da pesquisa (passo_id + 1)" do
        post :create, :pesquisa => {:endereco => "endereco", :numero => "111"}
        response.should render_template "pesquisas/passo_2"
      end

      it "deve setar pesquisa[passo_id] = 2"
    end
  end  
end
