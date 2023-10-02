module Resolvers
  class Songs < Resolvers::Base
    type [Types::Music::SongType], null: false

    def resolve
      Song.all
    end
  end
end
