class Resposta
  include MongoMapper::Document

  key :passo_id, Integer

  belongs_to :participante

end
