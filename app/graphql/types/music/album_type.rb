# frozen_string_literal: true

module Types
  module Music
    class AlbumType < Types::BaseObject
      implements Types::Music::MusicInterface

      field :year, Integer, null: false
      field :songs, [Types::Music::SongType], null: true

      def songs
        Loaders::AssociationLoader.for(Album, :songs).load(object)
      end
    end
  end
end
