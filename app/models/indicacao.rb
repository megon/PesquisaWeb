class Indicacao
  include MongoMapper::Document

  key :nome, String
  key :email, String

  validates :nome, :presence => true
  validates :email, :presence => true, :confirmation => true
  validates_format_of     :email,
                          :with       => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                          :message    => I18n.t('email_deve_ser_valido')


  belongs_to :participante

  after_save :enviar_email_indicacao

  def enviar_email_indicacao
    Notificacao.indicar(self).deliver
  end
end
