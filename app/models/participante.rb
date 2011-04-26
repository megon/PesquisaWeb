class Participante
  include MongoMapper::Document

  before_save :set_passo_atual

  key :nome, String
  key :email, String
  key :cpf, String
  key :data_nascimento, Date
  key :passo_atual, Integer, :default => 0

  attr_accessor :email2

  validates :nome, :presence => true
  validates :email, :presence => true
  validates :cpf, :presence => true, :cpf => true, :uniqueness => true
  validates :data_nascimento, :presence => true
  validate :confirmacao_email
  validates_format_of     :email,
                          :with       => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                          :message    => I18n.t('email_deve_ser_valido')

  private
    def set_passo_atual
      self.passo_atual += 1
    end

    def confirmacao_email
      errors.add("email2", I18n.t('confirmacao_email')) unless email == email2
    end
end
