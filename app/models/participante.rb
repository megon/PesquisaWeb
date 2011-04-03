class Participante < ActiveRecord::Base
  validates_presence_of :nome, :email, :cpf, :data_nascimento
  validates :cpf, :cpf => true
  validate :confirmacao_email
  validates_format_of     :email,
                          :with       => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                          :message    => 'email_deve_ser_valido'
  validates_uniqueness_of :cpf


  attr_accessor :email2

private
  def confirmacao_email
    errors.add("email", "confirmacao_nao_confere") unless email == email2
  end

end
