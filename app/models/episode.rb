class Episode < Neo4j::Rails::Model
  property :title, :type => String
  property :num_in_season, :type => Fixnum
  property :production_id, :type => String
  property :air_date, :type => Date
  property :tvrage_episode_link, :type => String

end
