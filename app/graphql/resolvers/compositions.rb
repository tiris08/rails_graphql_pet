module Resolvers
  class Compositions < Resolvers::Base
    type [Types::CompositionUnion], null: false

    def resolve
      authorize_user

      [Book.all, Movie.all, Album.all, Song.all].flatten
    end
  end
end
