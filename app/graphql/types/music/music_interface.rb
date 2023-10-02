# frozen_string_literal: true

module Types
  module Music
    module MusicInterface
      include Types::BaseInterface

      field :id, ID, null: false
      field :name, String, null: false
      field :band_name, String, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
