# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

{
	"authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2OTQ5NTcwODR9.s27abhP-f98E_hEUU2y5QPEHkM7BLQIG8QtA6IooiX0"
}

mutation {
  createUser(
    authProvider: {
    	credentials: {
        email: "test.test@test",
    		password: "123"
      }
    },
    firstName: "test",
    lastName: "test"
  ) {
    user {
      id
    },
    errors
  }
}

mutation{
  signInUser(credentials: {
    email: "test.test@test",
    password: "1234"
  }) {
    token,
    user {
      id
    },
    errors
  }
}

mutation{
  sendPasswordReset(
    email: "test.test@test"
  ) {
    success,
    errors
  }
}

mutation{
  resetPassword(
    email: "test.test@test",
    passwordResetToken: "838c682902fecdbddf47d7475160f393"
    password: "1234"
  ) {
    success,
    errors
  }
}
