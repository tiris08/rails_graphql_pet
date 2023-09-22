require 'rails_helper'

RSpec.describe Mutations::SignInUser do
  describe '#resolve' do
    let!(:user) { create :user }

    it 'signs in a user' do
      result = described_class.new(object: nil, field: nil, context: { session: {} }).resolve(
        credentials: {
          email: user.email,
          password: user.password
        }
      )

      expect(result[:token]).to be_present
      expect(result[:user]).to eq user
      expect(result[:errors]).to be_blank
    end

    it 'does not sign in a user with invalid credentials' do
      result = described_class.new(object: nil, field: nil, context: { session: {} }).resolve(
        credentials: {
          email: user.email,
          password: 'invalid'
        }
      )

      expect(result[:token]).to be_nil
      expect(result[:user]).to be_nil
      expect(result[:errors]).to eq ['Invalid email or password']
    end
  end
end
