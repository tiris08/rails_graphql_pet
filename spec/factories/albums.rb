FactoryBot.define do
  factory :album do
    name { Faker::Music.album }
    band_name { Faker::Music.band }
    year { Faker::Number.between(from: 1900, to: 2021) }

    trait :with_composition_item do
      association :composition_item, factory: :composition_item, strategy: :build
    end
  end
end
