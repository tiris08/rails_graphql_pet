require 'rails_helper'

describe Resolvers::Movies, type: :request do
  describe '#resolve' do
    let!(:movie) { create :movie }
    let!(:movie2) { create :movie }

    subject { described_class.new(object: nil, field: nil, context: {}).resolve }

    it 'returns all movies' do
      expect(subject).to eq [movie, movie2]
    end
  end
end
