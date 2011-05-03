class Resposta
  include MongoMapper::Document

  key :passo_id, String

  belongs_to :participante

end
