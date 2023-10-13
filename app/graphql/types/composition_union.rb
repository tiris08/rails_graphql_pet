# frozen_string_literal: true

module Types
  class CompositionUnion < Types::BaseUnion
    possible_types Types::BookType, Types::MovieType, Types::Music::AlbumType, Types::Music::SongType

    def self.resolve_type(obj, _ctx)
      case obj
      when Book
        Types::BookType
      when Movie
        Types::MovieType
      when Album
        Types::Music::AlbumType
      when Song
        Types::Music::SongType
      else
        raise "Unexpected object: #{obj}"
      end
    end
  end
end
