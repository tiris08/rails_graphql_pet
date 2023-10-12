# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: true

    def users
      User.all
    end

    field :compositions, [Types::CompositionUnion], null: false

    def compositions
      authorize_user

      [Book.all, Movie.all, Album.all, Song.all].flatten
    end
  end
end
