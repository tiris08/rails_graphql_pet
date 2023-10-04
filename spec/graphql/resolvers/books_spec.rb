require 'rails_helper'

describe Resolvers::Books, type: :request do
  describe '#resolve' do
    let!(:book) { create :book }
    let!(:book2) { create :book }

    subject { described_class.new(object: nil, field: nil, context: {}).resolve }

    it 'returns all book' do
      expect(subject).to eq [book, book2]
    end
  end
end
