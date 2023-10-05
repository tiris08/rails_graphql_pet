require 'rails_helper'

describe Resolvers::Albums, type: :request do
  describe '#resolve' do
    let!(:album) { create :album }
    let!(:album2) { create :album }

    subject { described_class.new(object: nil, field: nil, context: {}).resolve }

    it 'returns all albums' do
      expect(subject).to eq [album, album2]
    end
  end
end
