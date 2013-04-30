source 'https://rubygems.org'

gem 'rails', '3.2.13'

group :development do
  gem 'sqlite3'

  gem 'debugger'
end

group :production do
  # PostgreSQL Add-on
  gem 'pg'

  # New Relic Add-on
  gem 'newrelic_rpm'

  # Memcachier Add-on
  gem 'memcachier'
  gem 'dalli'
end

# Gems used only for assets and not required in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  
  gem 'yui-compressor'

  # Sync assets to CDN
  gem 'asset_sync'
  gem 'turbo-sprockets-rails3'

  # Javascript asset libraries
  gem 'jquery-rails'
  gem 'jquery_mobile_rails'

  # for SCSS mixins
  gem 'bourbon'
end

# Use unicorn as the app server
gem 'unicorn'

# Active Admin
gem 'inherited_resources'
gem 'activeadmin'

# for user authentication and Facebook login
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'

# for all the APIs
gem 'httparty'
gem 'instagram'
gem 'twitter'

# for bulk import
gem 'activerecord-import'

# for Russian Doll Caching
gem 'cache_digests'

# for determining the city
gem 'geocoder'

# for image uploads
gem 'paperclip'
gem 'aws-sdk'

# for syncing
gem 'pusher', :git => "git://github.com/pusher/pusher-gem.git"
gem 'sync', :git => "git://github.com/stevenheidel/sync.git"