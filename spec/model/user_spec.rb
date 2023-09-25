require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    subject { build :user }

    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_uniqueness_of :email }
  end

  describe '#send_password_reset' do
    subject { create :user }

    it 'sets password_reset_token' do
      subject.send_password_reset
      expect(subject.password_reset_token).not_to be_nil
    end

    it 'sets set password_reset_sent_at' do
      subject.send_password_reset
      expect(subject.password_reset_sent_at).not_to be_nil
    end
  end
end
