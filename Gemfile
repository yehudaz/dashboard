source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'heroku'
gem 'slim'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :production do
  gem 'pg'  # sudo apt-get install postgresql postgresql-contrib libpq-dev
  gem 'thin'
end

group :development, :test do
  gem "nifty-generators"
  gem 'sqlite3'
  gem "rspec-rails"
  gem 'pry-rails'
  gem 'pry-debugger'
end