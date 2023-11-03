# frozen_string_literal: true

module Types
  module Music
    class AlbumType < Types::BaseObject
      implements Types::Music::MusicInterface

      field :year, Integer, null: false
      field :songs, [Types::Music::SongType], null: true
      field :two_first_released_songs, [Types::Music::SongType], null: true

      def two_first_released_songs
        Loaders::TwoFirstReleasedSongsLoader.load(object)
      end

      def songs
        Loaders::AssociationLoader.for(Album, :songs).load(object)
      end
    end
  end
end
