require 'rails_helper'

describe 'users', type: :request do
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
