require 'rails_helper'

describe Resolvers::Songs, type: :request do
  describe '#resolve' do
    let!(:song) { create :song }
    let!(:song2) { create :song }

    subject { described_class.new(object: nil, field: nil, context: {}).resolve }

    it 'returns all songs' do
      expect(subject).to eq [song, song2]
    end
  end
end
