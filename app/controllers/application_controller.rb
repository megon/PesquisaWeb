class ApplicationController < ActionController::Base
  before_filter :verifica_sessao_participante

  protect_from_forgery

  protected
    def verifica_sessao_participante
      if session[:cpf] == nil
        redirect_to :controller => "participantes", :action => "index"
      end
    end

end
