class Country < Neo4j::Rails::Model
  property :name, :type => String
  property :code, :type => String, :index => :exact, :unique => true

  validates :code, :presence => true, :uniqueness => true
end
