module Mutations
  class CreateUser < BaseMutation
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end

    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :auth_provider, AuthProviderSignupData, required: false

    field :errors, [String], null: true
    field :user, Types::UserType, null: true

    def resolve(first_name: nil, last_name: nil, auth_provider: nil)
      user = User.new(
        first_name:,
        last_name:,
        email: auth_provider&.[](:credentials)&.[](:email),
        password: auth_provider&.[](:credentials)&.[](:password)
      )

      if user.save
        { user: }
      else
        { errors: user.errors.full_messages }
      end
    end
  end
end
