class ApplicationController < ActionController::Base
  before_filter :verifica_sessao_participante, :set_locale

  protect_from_forgery

  protected
    def verifica_sessao_participante
      if session[:cpf] == nil
        redirect_to :controller => "participantes", :action => "index"
      end
    end

    def set_locale
      I18n.locale = "pt" || I18n.default_locale 
    end
end
