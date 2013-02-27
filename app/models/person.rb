class Person < Neo4j::Rails::Model
  property :name, :type => String
  property :birth_date, :type => String
  property :tmdb_id, :type => String, :index => :exact, :unique => true
  property :biography, :type => String
  has_n(:acted_in).to(Movie).relationship(Role)
  has_n(:appeared_in).to(Episode).relationship(Role)
end
