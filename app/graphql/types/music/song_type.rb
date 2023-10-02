# frozen_string_literal: true

module Types
  module Music
    class SongType < Types::BaseObject
      implements Types::Music::MusicInterface

      field :duration, Integer, null: false
      field :album, Types::Music::AlbumType, null: false
      field :released_at, GraphQL::Types::ISO8601Date
    end
  end
end
