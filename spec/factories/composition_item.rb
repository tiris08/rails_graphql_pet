FactoryBot.define do
  factory :composition_item do
    trait :with_book do
      association :composable, factory: :book
    end

    trait :with_movie do
      association :composable, factory: :movie
    end

    trait :with_song do
      association :composable, factory: :song
    end

    trait :with_album do
      association :composable, factory: :album
    end
  end
end
