require 'rails_helper'

describe Resolvers::Compositions, type: :request do
  describe '#resolve' do
    let!(:album) { create :album }
    let!(:book) { create :book }
    let!(:movie) { create :movie }
    let!(:song) { create :song, album: }
    let(:user) { create :user }
    let(:context) { { current_user: user } }

    subject { described_class.new(object: nil, field: nil, context:).resolve }

    context 'when user is authenticated' do
      it 'returns all compositions' do
        expect(subject).to match_array [album, book, movie, song]
      end
    end

    context 'when user is not authenticated' do
      let(:user) { nil }

      it 'raises an error' do
        expect { subject }.to raise_error(GraphQL::ExecutionError, 'User not signed in')
      end
    end
  end
end
