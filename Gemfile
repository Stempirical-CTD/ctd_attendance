source 'https://rubygems.org'

ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'aws-sdk', '~> 2.0' # for storing images on AWS S3
gem 'bootstrap-sass' # for alerts/modal js
gem 'bourbon' # mixins and stuff
gem 'coffee-rails', '~> 4.2'
gem 'd3_rails'
gem 'devise'
gem 'font-awesome-rails'
gem 'jbuilder', '~> 2.5' # for autocomplete API
gem 'jquery-rails'
gem 'jquery-ui-rails' # for autocomplete
gem 'nilify_blanks' # save empty values as nil in db
gem 'paperclip', '~> 5.0.0' # image processor
gem 'puma', '~> 3.0'
gem 'pundit'
gem 'rails', '~> 5.0.1'
gem 'redcarpet' # markdown parser
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
