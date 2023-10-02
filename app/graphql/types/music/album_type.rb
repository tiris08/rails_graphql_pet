# frozen_string_literal: true

module Types
  module Music
    class AlbumType < Types::BaseObject
      implements Types::Music::MusicInterface

      field :year, Integer, null: false
    end
  end
end
