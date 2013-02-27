class Movie < Neo4j::Rails::Model
  property :title, :year, :index => :exact
  property :tmdb_id, :index => :exact, :unique => true
  property :tmdb_url, :index => :exact, :unique => true
  property :imdb_url, :index => :exact, :unique => true
  property :imdb_id, :index => :exact, :unique => true
  property :overview
  property :released, :type => Date
  property :updated_at, :type => Date
  property :created_at, :type => Date
  has_n(:countries).to(Country)
  has_n(:people).from(Person, :acted_in)
  has_one(:sequel)
  has_n(:posters).to(Poster)
  validates :title, :presence => :true
  validates :tmdb_id, :uniqueness => true
  validates :imdb_id, :uniqueness => true

end
