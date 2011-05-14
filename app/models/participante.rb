class Participante
  include MongoMapper::Document

  key :nome, String
  key :email, String
  key :cpf, String
  key :data_nascimento, Date
  key :passo_atual, Integer, :default => 1
  attr_accessor :email_confirmation

  has_many :respostas
  has_many :indicacoes

  def add_resposta(nova_resposta)
    resposta = self.respostas.find_by_passo_id(nova_resposta.passo_id)
    if resposta.present?
      self.respostas.delete(resposta.id)
    end
    self.respostas.push nova_resposta
  end

  def add_indicacao(indicacao)
    self.indicacoes.push indicacao
  end
end
