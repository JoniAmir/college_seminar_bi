
source 'https://rubygems.org'
source 'http://gems.github.com'

gem 'rails', '3.2.11'
gem 'jquery-rails'
gem 'roo'
gem 'googlecharts', :require => 'gchart'
gem 'paperclip'
gem 'activeadmin'
#gem 'delayed_job'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
	gem 'mysql2'
	gem 'meta_request'
	gem 'sextant'
	gem 'annotate' #shows table description in class comments. type 'annotate' in console to refresh
	gem 'better_errors'
	gem 'binding_of_caller'
	gem 'thin'
end


group :test do
	gem 'mysql2'
end

group :production do
  # gems specifically for Heroku go here
  gem 'pg'
end