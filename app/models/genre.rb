class Genre < Neo4j::Rails::Model
  property :name, :type => String, :index => :exact, :unique => true

  validates :name, :presence => true, :uniqueness => :true
end
