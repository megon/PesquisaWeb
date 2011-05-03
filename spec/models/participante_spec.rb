require 'spec_helper'

describe Participante do
  before(:each) do
    @participante = Participante.create(:nome=>"marco", 
                                    :email =>"email@email.com", 
                                    :email2 => "email@email.com",
                                    :cpf => "16187834836", 
                                    :data_nascimento => "21/08/1973")

  end

  context "validacao de atributos" do
    it "deve ser valido com todos os atributos validos" do
      @participante.should be_valid  
    end
      
    it "nao deve ser valido com nome em branco" do
      @participante.nome = nil
      @participante.should_not be_valid
    end

    it "nao deve ser valido com email em branco" do
      @participante.email = nil
      @participante.should_not be_valid
    end

    it "nao deve ser valido com cpf em branco" do
      @participante.cpf = nil
      @participante.should_not be_valid
    end

    it "nao deve ser valido com data de nascimento em branco" do
      @participante.data_nascimento = nil
      @participante.should_not be_valid
    end
    
    it "nao deve ser valido com cpf invalido" do
      @participante.cpf = "1234567811"
      @participante.should_not be_valid
    end

    it "nao deve ser valido com email invalido" do
      @participante.email = "aaa"
      @participante.email2 = "aaa"
      @participante.should_not be_valid
    end

    it "nao deve ser valido com email diferente de email de confirmacao" do
      @participante.email2 = "outro@email.com"
      @participante.should_not be_valid
    end

    it "nao deve ser valido para cpf duplicado" do
      @participante.save
      Participante.create(:nome=>"marco", 
                      :email =>"email@email.com", 
                      :email2 => "email@email.com",
                      :cpf => "16187834836", 
                      :data_nascimento => "21/08/1973").should_not be_valid
      
    end
  end

  context "inclusao de respostas" do
    it "deve incluir respostas para o participante" do
      resposta = Resposta.new(:endereco =>'rua 1',
                             :quantos_filhos => 3, :passo_id => "1")
      @participante.add_resposta(resposta)
      assert_equal @participante.respostas.count, 1
    end

    it "deve atualizar as respostas de um passo ja respondido anteriormente" do
      resposta = Resposta.new(:endereco =>'rua 11112',
                             :quantos_filhos => 322222,
                             :passo_id => "1")
      @participante.add_resposta resposta
      assert_equal @participante.respostas.count, 1
    end
  end

end
