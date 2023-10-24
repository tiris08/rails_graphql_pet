FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    description { Faker::Movie.quote }
    genre { Faker::Book.genre }
    production_company { Faker::Company.name }
    filmed_at { Faker::Date.between(from: 10.years.ago, to: Time.zone.today) }

    trait :with_composition_item do
      association :composition_item, factory: :composition_item, strategy: :build
    end
  end
end
