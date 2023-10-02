FactoryBot.define do
  factory :song do
    name { Faker::Music.album }
    band_name { Faker::Music.band }
    duration { Faker::Number.between(from: 1, to: 100) }
    released_at { Faker::Date.between(from: '1900-01-01', to: '2021-09-26') }
    album
  end
end
