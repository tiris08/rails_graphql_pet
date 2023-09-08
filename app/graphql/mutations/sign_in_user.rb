module Mutations
  class SignInUser < BaseMutation
    null true

    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    field :token, String, null: true
    field :user, Types::UserType, null: true
    field :errors, [String], null: true

    def resolve(credentials: nil)
      return unless credentials

      user = User.find_by(email: credentials[:email])

      if user&.authenticate(credentials[:password])
        token = JsonWebToken.encode({ user_id: user.id })
        context[:session][:token] = token
        { user:, token: }
      else
        { token: nil, user: nil, errors: ['Invalid email or password'] }
      end
    end
  end
end
