require 'rails_helper'

RSpec.describe Mutations::SignInUser do
  describe '#resolve' do
    let!(:user) { FactoryBot.create :user }

    it 'signs in a user' do
      result = described_class.new(object: nil, field: nil, context: { session: {} }).resolve(
        credentials: {
          email: user.email,
          password: user.password
        }
      )

      expect(result[:token]).to be_present
      expect(result[:user]).to eq user
    end

    it 'does not sign in a user with invalid credentials' do
      result = described_class.new(object: nil, field: nil, context: { session: {} }).resolve(
        credentials: {
          email: user.email,
          password: 'invalid'
        }
      )

      expect(result).to be_nil
    end
  end
end
