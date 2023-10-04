module Resolvers
  class Books < Resolvers::Base
    type [Types::BookType], null: false

    def resolve
      Book.all
    end
  end
end
