require 'rails_helper'

describe Mutations::SendPasswordReset, type: :request do
  describe '#resolve' do
    let!(:user) { create :user }

    it 'creates a password reset token' do
      expect do
        result = described_class.new(object: nil, field: nil, context: {}).resolve(
          email: user.email
        )

        expect(result[:success]).to be true
        expect(result[:errors]).to be_blank
      end.to(change { user.reload.password_reset_token })
    end

    it 'does not create a password reset token for invalid email' do
      expect do
        result = described_class.new(object: nil, field: nil, context: {}).resolve(
          email: 'invalid'
        )

        expect(result[:success]).to be false
        expect(result[:errors]).to eq ['User not found']
      end.not_to(change { user.reload.password_reset_token })
    end
  end
end
