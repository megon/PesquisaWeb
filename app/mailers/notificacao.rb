class Notificacao < ActionMailer::Base
  default :from => "PesquisaWeb pesquisaweb@pesquisaweb.heroku.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notificacao.confirmacao_cadastro_evento.subject
  #
  def indicar indicado
    @indicado = indicado
    mail :to => indicado.email
  end
end
