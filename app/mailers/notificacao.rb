class Notificacao < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notificacao.confirmacao_cadastro_evento.subject
  #
  def indicar indicado
    @greeting = "Hi"

    mail :to => indicado.email
  end
end
