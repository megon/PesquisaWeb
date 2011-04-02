require 'spec_helper'

describe Participante do

  before(:each) do
    @participante = Participante.new(:nome=>"marco", 
                                    :email =>"email@email.com", 
                                    :email2 => "email@email.com",
                                    :cpf => "16187834836", 
                                    :data_nascimento => "21/08/1973")

  end

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

  it "nao deve ser valido se email for diferente de email2" do
    @participante.email2 = "outro@email.com"
    @participante.should_not be_valid
  end

  pending "deve ser valido se cpf for unico"
end
