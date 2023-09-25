module Mutations
  class SendPasswordReset < BaseMutation
    null true

    argument :email, String, required: true

    field :success, Boolean, null: true
    field :errors, [String], null: true

    def resolve(email:)
      user = User.find_by(email:)

      if user
        user.send_password_reset
        # UserMailer.password_reset(self).deliver_later
        { success: true }
      else
        { success: false, errors: ['User not found'] }
      end
    end
  end
end
