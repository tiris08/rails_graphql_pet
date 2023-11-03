require 'rails_helper'

describe 'compositions', type: :request do
  let!(:books) { create_list(:book, 3, :with_composition_item) }
  let!(:movies) { create_list(:movie, 3, :with_composition_item) }
  let!(:songs) { create_list(:song, 3, :with_composition_item) }
  let!(:albums) { create_list(:album, 3, :with_composition_item) }
  let(:type) { 'null' }
  let(:page) { 'null' }
  let(:limit) { 'null' }
  let(:metadata) { '' }
  let(:query) do
    <<~GQL
      query {
        compositions(type: #{type}, page: #{page}, limit: #{limit}) {
          collection {
            __typename
            ... on Book {
              title
            }
            ... on Movie {
              title
            }
            ... on Album {
              name
            }
            ... on Song {
              name
            }
          }
          #{metadata}
        }
      }
    GQL
  end

  subject { post '/graphql', params: { query: } }

  context 'when user is not logged in' do
    it 'returns an error' do
      subject

      json_response = JSON.parse(response.body)
      errors = json_response['errors']

      expect(errors.first['message']).to eq('User not signed in')
    end
  end

  context 'when user is logged in' do
    let(:user) { create(:user) }

    before { allow_any_instance_of(GraphqlController).to receive(:current_user).and_return(user) }

    it 'returns all compositions' do
      subject

      json_response = JSON.parse(response.body)
      response_compositions = json_response['data']['compositions']['collection']
      expect(response_compositions.count).to eq(12)

      expect(response_compositions.first['title']).to eq(books.first.title)
      expect(response_compositions.last['name']).to eq(albums.last.name)
    end

    context 'with type argument' do
      context 'when type is BOOK' do
        let(:type) { 'BOOK' }

        it 'returns only books' do
          subject

          json_response = JSON.parse(response.body)
          response_compositions = json_response['data']['compositions']['collection']
          response_compositions.map! { |composition| composition['__typename'] }

          expect(response_compositions).to include('Book')
          expect(response_compositions).not_to include('Album')
          expect(response_compositions).not_to include('Song')
          expect(response_compositions).not_to include('Movie')
        end
      end

      context 'when type is Music' do
        let(:type) { 'MUSIC' }

        it 'returns only songs and albums' do
          subject

          json_response = JSON.parse(response.body)
          response_compositions = json_response['data']['compositions']['collection']
          response_compositions.map! { |composition| composition['__typename'] }

          expect(response_compositions).to include('Album')
          expect(response_compositions).to include('Song')
          expect(response_compositions).not_to include('Book')
          expect(response_compositions).not_to include('Movie')
        end
      end

      context 'with pagination' do
        let(:page) { 3 }
        let(:limit) { 5 }

        it 'returns paginated results' do
          subject

          json_response = JSON.parse(response.body)
          response_compositions = json_response['data']['compositions']['collection']
          expect(response_compositions.count).to eq(2)
        end

        context 'with pagination metadata' do
          let(:metadata) do
            <<~GQL
              metadata {
                totalPages
                totalCount
                currentPage
                limitValue
              }
            GQL
          end

          it 'returns pagination metadata' do
            subject

            json_response = JSON.parse(response.body)
            response_metadata = json_response['data']['compositions']['metadata']

            expect(response_metadata['totalPages']).to eq(3)
            expect(response_metadata['totalCount']).to eq(12)
            expect(response_metadata['currentPage']).to eq(3)
            expect(response_metadata['limitValue']).to eq(5)
          end
        end
      end
    end
  end
end
