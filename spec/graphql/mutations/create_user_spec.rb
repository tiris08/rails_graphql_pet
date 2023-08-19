require 'rails_helper'

RSpec.describe Mutations::CreateUser do
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

      expect(result).to be_persisted
      expect(result.first_name).to eq 'Test'
      expect(result.last_name).to eq 'User'
      expect(result.email).to eq 'email@example.com'
    end
  end
end
