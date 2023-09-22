module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :sign_in_user, mutation: Mutations::SignInUser
    field :send_password_reset, mutation: Mutations::SendPasswordReset
    # field :sign_out_user, mutation: Mutations::SignOutUser
  end
end
