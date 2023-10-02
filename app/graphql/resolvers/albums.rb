module Resolvers
  class Albums < Resolvers::Base
    type [Types::Music::AlbumType], null: false

    def resolve
      Album.all
    end
  end
end
