# frozen_string_literal: true

module Types
  module Musics
    class SongType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :band_name, String, null: false
      field :duration, Integer, null: false
      field :album_id, Integer, null: true
      field :released_at, GraphQL::Types::ISO8601Date
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
