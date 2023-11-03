FactoryBot.define do
  factory :song do
    name { Faker::Music.album }
    band_name { Faker::Music.band }
    duration { Faker::Number.between(from: 1, to: 100) }
    released_at { Faker::Date.between(from: '1900-01-01', to: '2021-09-26') }

    trait :with_album do
      album
    end

    trait :with_composition_item do
      association :composition_item, factory: :composition_item, strategy: :build
    end
  end
end
