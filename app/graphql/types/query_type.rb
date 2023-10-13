# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: true

    def users
      User.all
    end

    field :compositions, [Types::CompositionUnion], null: false do
      argument :type, Types::CompositionEnum, required: false
    end

    def compositions(type: nil)
      authorize_user

      case type
      when 'BOOK'
        Book.all
      when 'MOVIE'
        Movie.all
      when 'MUSIC'
        Album.all + Song.all
      else
        Book.all + Movie.all + Album.all + Song.all
      end
    end
  end
end
