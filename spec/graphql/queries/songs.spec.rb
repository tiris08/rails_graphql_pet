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
end
