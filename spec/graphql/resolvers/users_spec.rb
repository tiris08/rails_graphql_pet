require 'rails_helper'

describe Resolvers::Users do
  describe '#resolve' do
    let!(:user) { create :user }
    let!(:user2) { create :user }

    subject { described_class.new(object: nil, field: nil, context: {}).resolve }

    it 'returns all users' do
      expect(subject).to eq [user, user2]
    end
  end
end
