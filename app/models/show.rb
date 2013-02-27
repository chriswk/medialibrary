class Show < Neo4j::Rails::Model
  property :name, :type => String
  property :rageid, :type => String, :index => :exact, :unique => true
  property :started, :type => Fixnum
  property :run_time, :type => Fixnum
  property :start_date, :type => Date
  property :status, :type => String
  property :ended, :type => Date
  has_n(:episodes).to(Episode).relationship(Season)
  has_n(:countries)
  has_n(:genres)
  validates :name, :presence => true
  validates :rageid, :presence => true, :uniqueness => true
end
