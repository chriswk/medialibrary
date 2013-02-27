class TmdbCastWorker
  include Sidekiq::Worker

  def map_cast_to_movie(movie, cast)
    cast.each do |role|
      person = Person.find_or_create_by(:tmdb_id => role.id)
      map_role(person, role)

    end
  end

  private
    def map_role(person, role)

    end
end