class ApplicationController < ActionController::Base
  before_filter :verifica_sessao_participante, :exibe_locale

  protect_from_forgery

  protected
    def verifica_sessao_participante
      if session[:cpf] == nil
        redirect_to :controller => "participantes", :action => "index"
      end
    end

    def exibe_locale
      puts I18n.locale
    end
end
