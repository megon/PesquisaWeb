class Resposta
  include MongoMapper::Document

  key :id_passo, String

  belongs_to :participante

end
