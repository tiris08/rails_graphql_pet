require 'rails_helper'

describe Types::QueryType, type: :request do
  describe 'users' do
    let!(:users) { create_list(:user, 3) }
    let(:query) do
      <<~GQL
        query {
          users {
            firstName
          }
        }
      GQL
    end

    it 'returns all users' do
      post '/graphql', params: { query: }

      json_response = JSON.parse(response.body)
      response_users = json_response['data']['users']

      expect(users.count).to eq(3)

      expect(response_users.first['firstName']).to eq(users.first.first_name)
      expect(response_users.last['firstName']).to eq(users.last.first_name)
    end
  end

  describe 'compositions' do
    let!(:books) { create_list(:book, 3) }
    let!(:movies) { create_list(:movie, 3) }
    let!(:songs) { create_list(:song, 3) }
    let(:type) { 'null' }
    let(:query) do
      <<~GQL
        query {
          compositions(type: #{type}) {
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
        response_compositions = json_response['data']['compositions']

        expect(response_compositions.count).to eq(12)
        expect(response_compositions.first['title']).to eq(books.first.title)
        expect(response_compositions.last['name']).to eq(songs.last.name)
      end

      context 'with type argument' do
        context 'when type is BOOK' do
          let(:type) { 'BOOK' }

          it 'returns only books' do
            subject

            json_response = JSON.parse(response.body)
            response_compositions = json_response['data']['compositions']
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
            response_compositions = json_response['data']['compositions']
            response_compositions.map! { |composition| composition['__typename'] }

            expect(response_compositions).to include('Album')
            expect(response_compositions).to include('Song')
            expect(response_compositions).not_to include('Book')
            expect(response_compositions).not_to include('Movie')
          end
        end
      end
    end
  end
end
