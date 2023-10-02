# frozen_string_literal: true

module Types
  class MovieType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :genre, String, null: false
    field :production_company, String, null: false
    field :filmed_at, GraphQL::Types::ISO8601Date, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
