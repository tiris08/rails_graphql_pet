require 'rails_helper'

describe 'songs', type: :request do
  let!(:songs) { create_list(:song, 3) }

  let(:query) do
    <<~GQL
      query {
        songs {
          name
        }
      }
    GQL
  end

  it 'returns all songs' do
    post '/graphql', params: { query: }

    json_response = JSON.parse(response.body)
    response_songs = json_response['data']['songs']

    expect(songs.count).to eq(3)

    expect(response_songs.first['name']).to eq(songs.first.name)
    expect(response_songs.last['name']).to eq(songs.last.name)
  end

  context 'album' do
    before do
      songs.each do |song|
        create(:album).songs << song
      end
    end

    let(:query) do
      <<~GQL
        query {
          songs {
            name
            album {
              name
            }
          }
        }
      GQL
    end

    it 'returns all songs with all albums' do
      post '/graphql', params: { query: }

      json_response = JSON.parse(response.body)
      response_songs = json_response['data']['songs']

      expect(songs.count).to eq(3)

      expect(response_songs.first['name']).to eq(songs.first.name)
      expect(response_songs.last['name']).to eq(songs.last.name)

      expect(response_songs.first['album']['name']).to eq(songs.first.album.name)
      expect(response_songs.last['album']['name']).to eq(songs.last.album.name)
    end
  end
end
