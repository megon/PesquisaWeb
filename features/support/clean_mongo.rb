Before do |scenario|
  MongoMapper.database.collections.each do |collection|
    unless collection.name =~ /^system\./
      collection.remove
    end
  end
end
