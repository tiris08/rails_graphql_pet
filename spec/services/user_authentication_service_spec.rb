require 'rails_helper'

RSpec.describe UserAuthenticationService do
  describe '#call' do
    let(:user) { FactoryBot.create :user }
    let(:headers) { { 'Authorization' => "Bearer #{token}" } }
    let(:token) { JsonWebToken.encode(user_id: user.id) }
    subject { described_class.new(headers).call }

    it { is_expected.to eq(user) }

    context 'when invalid token' do
      let(:token) { 'invalid token' }

      it 'should raise an InvalidTokenError error' do
        expect { subject }.to raise_error(JWT::DecodeError)
      end
    end
  end
end
