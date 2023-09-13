source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'rails', '~> 7.0.4', '>= 7.0.4.2'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootsnap', require: false
gem 'graphql'
gem 'bcrypt'
gem 'jwt'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'faker', '~> 3.2'
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'pry-rails'
end

group :development do
  gem 'brakeman', '~> 6.0', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rails'
  gem 'overcommit', '~> 0.60.0'
  gem 'graphiql-rails'
end

group :test do
  gem 'rspec-rails', '~> 6.0.3'
end
