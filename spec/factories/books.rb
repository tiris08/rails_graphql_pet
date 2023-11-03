FactoryBot.define do
  factory :book do
    title { Faker::Movie.title }
    description { Faker::Movie.quote }
    publisher { Faker::Company.name }
    published_at { Faker::Date.between(from: 10.years.ago, to: Time.zone.today) }
    pages_count { Faker::Number.between(from: 100, to: 500) }

    trait :with_composition_item do
      association :composition_item, factory: :composition_item, strategy: :build
    end
  end
end
