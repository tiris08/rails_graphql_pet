# frozen_string_literal: true

module Types
  module Music
    class SongType < Types::BaseObject
      implements Types::Music::MusicInterface

      field :duration, Integer, null: false
      field :album, Types::Music::AlbumType
      field :released_at, GraphQL::Types::ISO8601Date

      def album
        Loaders::RecordLoader.for(Album).load(object.album_id)
      end
    end
  end
end
