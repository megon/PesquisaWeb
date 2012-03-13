class Participante
  include MongoMapper::Document

  key :nome, String
  key :email, String
  key :cpf, String
  key :data_nascimento, Date
  key :passo_atual, Integer, :default => 1
  key :total_cupons, Integer, :default => 0
  attr_accessor :email_confirmation

  validates :nome, :presence => true
  validates :email, :presence => true, :confirmation => true
  validates :cpf, :presence => true, :uniqueness => true
#  validates :cpf, :cpf => true
  validates_date :data_nascimento
  validates_format_of     :email,
                          :with       => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                          :message    => I18n.t('email_deve_ser_valido')

  before_validation :extract_cpf_numbers

  has_many :respostas
  has_many :indicacoes

  def add_resposta(nova_resposta)
    resposta = self.respostas.find_by_passo_id(nova_resposta.passo_id)
    if resposta.present?
      self.respostas.delete(resposta.id)
    end
    self.respostas.push nova_resposta
  end

  def add_indicacoes(indicacoes)
    indicacoes.each do |indicacao|
      self.indicacoes.build(indicacao)
    end
  end
  
  def add_cupom
    self.total_cupons = self.total_cupons + 1
  end

  private
  def extract_cpf_numbers
    if self.cpf
      self.cpf = cpf.scan(/\d+/).join
    end
  end
end
