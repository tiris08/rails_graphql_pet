require 'rails_helper'

describe 'albums', type: :request do
  let!(:albums) { create_list(:album, 3) }

  let(:query) do
    <<~GQL
      query {
        albums {
          name
        }
      }
    GQL
  end

  it 'returns all albums' do
    post '/graphql', params: { query: }

    json_response = JSON.parse(response.body)
    response_albums = json_response['data']['albums']

    expect(albums.count).to eq(3)

    expect(response_albums.first['name']).to eq(albums.first.name)
    expect(response_albums.last['name']).to eq(albums.last.name)
  end

  context 'with songs' do
    before do
      albums.each do |album|
        create_list(:song, 3, album:)
      end
    end

    let(:query) do
      <<~GQL
        query {
          albums {
            name
            songs {
              name
            }
          }
        }
      GQL
    end

    it 'returns all albums with all songs' do
      post '/graphql', params: { query: }

      json_response = JSON.parse(response.body)
      response_albums = json_response['data']['albums']

      expect(albums.count).to eq(3)

      expect(response_albums.first['name']).to eq(albums.first.name)
      expect(response_albums.last['name']).to eq(albums.last.name)

      expect(response_albums.first['songs'].count).to eq(3)
      expect(response_albums.last['songs'].count).to eq(3)

      expect(response_albums.first['songs'].first['name']).to eq(albums.first.songs.first.name)
      expect(response_albums.last['songs'].last['name']).to eq(albums.last.songs.last.name)
    end
  end
end
