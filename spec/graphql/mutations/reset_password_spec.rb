require 'rails_helper'

describe Mutations::ResetPassword do
  describe '#resolve' do
    let!(:user) { create :user, :with_password_reset_token }
    let(:password) { 'new_password' }

    context 'with valid token and email' do
      it 'resets the password' do
        result = described_class.new(object: nil, field: nil, context: {}).resolve(
          email: user.email,
          password:,
          password_reset_token: user.password_reset_token
        )

        expect(result[:success]).to be true
        expect(result[:errors]).to be_nil
        expect(user.reload.authenticate(password)).to eq user
      end
    end

    context 'with invalid data' do
      context 'when email is invalid' do
        it 'does not reset the password' do
          result = described_class.new(object: nil, field: nil, context: {}).resolve(
            email: 'invalid',
            password:,
            password_reset_token: user.password_reset_token
          )

          expect(result[:success]).to be false
          expect(result[:errors]).to eq ['User not found']
          expect(user.reload.authenticate(password)).to be false
        end
      end

      context 'when token is expired' do
        it 'does not reset the password' do
          user.update(password_reset_sent_at: 3.hours.ago)

          result = described_class.new(object: nil, field: nil, context: {}).resolve(
            email: user.email,
            password:,
            password_reset_token: user.password_reset_token
          )

          expect(result[:success]).to be false
          expect(result[:errors]).to eq ['Password reset token expired']
          expect(user.reload.authenticate(password)).to be false
        end
      end

      context 'when token is invalid' do
        it 'does not reset the password' do
          result = described_class.new(object: nil, field: nil, context: {}).resolve(
            email: user.email,
            password:,
            password_reset_token: 'invalid'
          )

          expect(result[:success]).to be false
          expect(result[:errors]).to eq ['Password reset token is invalid']
          expect(user.reload.authenticate(password)).to be false
        end
      end
    end
  end
end
