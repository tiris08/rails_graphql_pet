module Resolvers
  class Movies < Resolvers::Base
    type [Types::MovieType], null: false

    def resolve
      Movie.all
    end
  end
end
