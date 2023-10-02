FactoryBot.define do
  factory :album do
    name { Faker::Music.album }
    band_name { Faker::Music.band }
    year { Faker::Number.between(from: 1900, to: 2021) }
  end
end
