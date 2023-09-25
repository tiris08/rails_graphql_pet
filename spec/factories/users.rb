FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    trait :with_password_reset_token do
      password_reset_token { SecureRandom.uuid }
      password_reset_sent_at { Time.zone.now }
    end
  end
end
