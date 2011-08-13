if ENV['MONGOHQ_URL']
  MongoMapper.config = {Rails.env => {'uri' => ENV['MONGOLAB_URI']}}
else
  MongoMapper.config = {Rails.env => {'uri' => "mongodb://localhost/pesquisaWebDB-#{Rails.env}"}}
end

MongoMapper.connect(Rails.env)
