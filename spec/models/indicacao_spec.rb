require 'spec_helper'

describe Indicacao do
  before(:each) do
    @indicacao = Indicacao.create(:nome=>"marco", 
                                    :email =>"email@email.com")

  end

  context "validacao de atributos" do
    it "deve ser valido com todos os atributos validos" do
      @indicacao.should be_valid  
    end
      
    it "nao deve ser valido com nome em branco" do
      @indicacao.nome = nil
      @indicacao.should_not be_valid
    end

    it "nao deve ser valido com email em branco" do
      @indicacao.email = nil
      @indicacao.should_not be_valid
    end

    it "nao deve ser valido com email invalido" do
      @indicacao.email = "aaa"
      @indicacao.should_not be_valid
    end
  end

end
