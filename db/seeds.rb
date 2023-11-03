# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


FactoryBot.create_list(:user, 5)

5.times do
  i = CompositionItem.new()
  i.composable = FactoryBot.create(:movie)
  i.save!
end

5.times do
  i = CompositionItem.new()
  i.composable = FactoryBot.create(:album)
  i.save!
end

5.times do |times|
  i = CompositionItem.new()
  i.composable = FactoryBot.create(:song, album: Album.find(times+1))
  i.save!
end

5.times do
  i = CompositionItem.new()
  i.composable = FactoryBot.create(:book)
  i.save!
end

Album.all.each do |album|
  FactoryBot.create_list(:song, 5, album: album)
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

# list all songs
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

# list all compositions
# query {
#   compositions {
#    ...on Book {
#      __typename
#      title
#    },
#    ...on Movie {
#      __typename
#      title
#    },
#    ...on Album {
#      __typename
#      name
#    },
#    ...on Song {
#      __typename
#      name
#    },
#  }
# }
