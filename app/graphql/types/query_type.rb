module Types
  class QueryType < Types::BaseObject
    field :users, resolver: Resolvers::Users
    field :albums, resolver: Resolvers::Albums
    field :songs, resolver: Resolvers::Songs
  end
end
