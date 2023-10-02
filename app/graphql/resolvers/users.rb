module Resolvers
  class Users < Resolvers::Base
    type [Types::UserType], null: false

    def resolve
      User.all
    end
  end
end
