FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    description { Faker::Movie.quote }
    genre { Faker::Book.genre }
    production_company { Faker::Company.name }
    filmed_at { Faker::Date.between(from: 10.years.ago, to: Time.zone.today) }
  end
end
