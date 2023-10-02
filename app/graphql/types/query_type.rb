module Types
  class QueryType < Types::BaseObject
    field :users, resolver: Resolvers::Users
  end
end
