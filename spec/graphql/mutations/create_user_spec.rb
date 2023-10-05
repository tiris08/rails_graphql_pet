require 'rails_helper'

describe Mutations::CreateUser, type: :request do
  describe '#resolve' do
    it 'creates a new user' do
      result = described_class.new(object: nil, field: nil, context: {}).resolve(
        first_name: 'Test',
        last_name: 'User',
        auth_provider: {
          credentials: {
            email: 'email@example.com',
            password: 'password'
          }
        }
      )

      expect(result[:user]).to be_persisted
      expect(result[:user].first_name).to eq 'Test'
      expect(result[:user].last_name).to eq 'User'
      expect(result[:user].email).to eq 'email@example.com'
    end
  end
end
