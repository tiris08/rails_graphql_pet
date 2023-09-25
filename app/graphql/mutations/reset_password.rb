module Mutations
  class ResetPassword < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_reset_token, String, required: true

    field :success, Boolean, null: true
    field :errors, [String], null: true

    def resolve(password:, email:, password_reset_token:)
      user = User.find_by(email:)

      return { success: false, errors: ['User not found'] } unless user

      return { success: false, errors: ['Password reset token expired'] } if token_expired?(user)

      unless user.password_reset_token == password_reset_token
        return { success: false, errors: ['Password reset token is invalid'] }
      end

      reset_password(user, password)

      if user.save
        { success: true }
      else
        { success: false, errors: user.errors.full_messages }
      end
    end

    private

    def token_expired?(user)
      user.password_reset_sent_at && (user.password_reset_sent_at < 2.hours.ago)
    end

    def reset_password(user, password)
      user.password_reset_token = nil
      user.password_reset_sent_at = nil
      user.password = password
    end
  end
end
