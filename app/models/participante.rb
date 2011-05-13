class Participante
  include MongoMapper::Document

  key :nome, String
  key :email, String
  key :cpf, String
  key :data_nascimento, Date
  key :passo_atual, Integer, :default => 1
  attr_accessor :email_confirmation

  validates :nome, :presence => true
  validates :email, :presence => true, :confirmation => true
  validates :cpf, :presence => true, :cpf => true, :uniqueness => true
  validates :data_nascimento, :presence => true
  validates_format_of     :email,
                          :with       => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                          :message    => I18n.t('email_deve_ser_valido')

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
