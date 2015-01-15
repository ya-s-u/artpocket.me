source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.1.6'
gem 'rails_12factor', group: :production

# Database
gem 'mysql2', group: [:production, :development]
gem 'mysql'

# For JavaScript
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'

# Turbolinks !!!NOT USING!!!
#gem 'turbolinks'
#gem 'jquery-turbolinks'

# For API
gem 'jbuilder', '~> 2.0'
gem 'grape'
gem 'grape-jbuilder'
gem 'sdoc', '~> 0.4.0', group: :doc

# For Development
gem 'spring',        group: :development

# For Security
gem 'bcrypt', '~> 3.1.7'

# For File Server
gem 'paperclip'
gem 'aws-sdk'

# For Admin
gem 'devise'
gem 'activeadmin', github: 'activeadmin'

# For Responsive
gem 'jpmobile'

# For meta tag
gem 'meta-tags'

group :development do
  gem 'letter_opener'
  gem 'letter_opener_web'
end

group :development, :test do
  gem 'rspec-rails'
end

group :production do
  gem 'newrelic_rpm'
  gem 'asset_sync'
  gem 'google-analytics-rails'
end
