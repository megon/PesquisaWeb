module IndicacoesHelper
  
  def add_indicacao_link
    link_to_function "Convidar mais amigos" do |page|
      page.insert_html :bottom, :convidado, :partial => 'indicacao', :object => Indicacao.new
    end
  end
end
