# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do
  Movie.create!(
    title: Faker::Movie.title,
    description: Faker::Lorem.paragraph,
    genre: Faker::Book.genre,
    production_company: Faker::Company.name,
    filmed_at: Faker::Date.between(from: 10.years.ago, to: Date.today)
  )
end

5.times do
  Album.create!(
    name: Faker::Music.album,
    band_name: Faker::Music.band,
    year: Faker::Number.between(from: 1970, to: 2021)
  )
end

5.times do
  Song.create!(
    name: Faker::Music::RockBand.name,
    band_name: Faker::Music.band,
    duration: Faker::Number.between(from: 120, to: 600),
    album: Album.order(Arel.sql('RANDOM()')).first,
    released_at: Faker::Date.between(from: 10.years.ago, to: Date.today)
  )
end

5.times do
  Book.create!(
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph,
    publisher: Faker::Book.publisher,
    published_at: Faker::Date.between(from: 10.years.ago, to: Date.today),
    pages_count: Faker::Number.between(from: 100, to: 500)
  )
end


# {
# 	"authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2OTQ5NTcwODR9.s27abhP-f98E_hEUU2y5QPEHkM7BLQIG8QtA6IooiX0"
# }

# mutation {
#   createUser(
#     authProvider: {
#     	credentials: {
#         email: "test.test@test",
#     		password: "123"
#       }
#     },
#     firstName: "test",
#     lastName: "test"
#   ) {
#     user {
#       id
#     },
#     errors
#   }
# }

# mutation{
#   signInUser(credentials: {
#     email: "test.test@test",
#     password: "1234"
#   }) {
#     token,
#     user {
#       id
#     },
#     errors
#   }
# }

# mutation{
#   sendPasswordReset(
#     email: "test.test@test"
#   ) {
#     success,
#     errors
#   }
# }

# mutation{
#   resetPassword(
#     email: "test.test@test",
#     passwordResetToken: "838c682902fecdbddf47d7475160f393"
#     password: "1234"
#   ) {
#     success,
#     errors
#   }
# }

# query {
#   songs{
#     name
#     bandName
#     duration
#     releasedAt
#     album{
#       name
#       bandName
#     }
#   }
# }
