class Resposta
  include MongoMapper::Document
  
  before_validation :clear_empty_attributes

  key :passo_id, Integer

  belongs_to :participante
  
  protected
   def clear_empty_attributes
     attributes.each do |key,value|
       attributes.delete(key) if value.blank?
     end
   end  
  

end
