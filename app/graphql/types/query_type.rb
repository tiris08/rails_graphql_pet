# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: true

    def users
      User.all
    end

    field :compositions, Types::CompositionUnion.collection_type, null: false do
      argument :type, Types::CompositionEnum, required: false
      argument :page, Integer, required: false
      argument :limit, Integer, required: false
    end

    def compositions(type: nil, page: nil, limit: nil)
      authorize_user

      composition_items = case type
                          when 'BOOK'
                            CompositionItem.where(composable_type: 'Book')
                          when 'MOVIE'
                            CompositionItem.where(composable_type: 'Movie')
                          when 'MUSIC'
                            CompositionItem.where(composable_type: %w[Album Song])
                          else
                            CompositionItem.where(composable_type: %w[Book Movie Album Song])
                          end

      Kaminari.paginate_array(composition_items.map(&:composable)).page(page).per(limit)
    end

    field :songs, [Types::Music::SongType], null: true

    def songs
      Song.all
    end

    field :albums, [Types::Music::AlbumType], null: true

    def albums
      Album.all
    end
  end
end
