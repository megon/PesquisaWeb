if ENV['MONGOHQ_URL']
  MongoMapper.config = {RAILS_ENV => {'uri' => ENV['MONGOHQ_URL']}}
else
  MongoMapper.config = {RAILS_ENV => {'uri' => "mongodb://localhost/pesquisaWebDB-#{Rails.env}"}}
end

MongoMapper.connect(RAILS_ENV)
