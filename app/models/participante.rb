class Participante < ActiveRecord::Base
  validates :nome, :presence => true
  validates :email, :presence => true
  validates :cpf, :presence => true, :cpf => true, :uniqueness => true
  validates :data_nascimento, :presence => true
  validate :confirmacao_email
  validates_format_of     :email,
                          :with       => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                          :message    => 'email_deve_ser_valido'


  attr_accessor :email2

private
  def confirmacao_email
    errors.add("email", "confirmacao_email") unless email == email2
  end

end
