module Types
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField

    private

    def authorize_user
      return true if current_user.present?

      raise GraphQL::ExecutionError, 'User not signed in'
    end

    def current_user
      context[:current_user]
    end
  end
end
