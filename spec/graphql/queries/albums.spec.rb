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
end
