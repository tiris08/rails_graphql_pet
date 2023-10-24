module Types
  GraphQL::Schema::Union.extend GraphqlPagination::CollectionType

  class BaseUnion < GraphQL::Schema::Union
  end
end
