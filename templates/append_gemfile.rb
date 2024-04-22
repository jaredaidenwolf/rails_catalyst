def append_gemfile
  gem "honeybadger"
  gem "rack-canonical-host"
  gem "rspec"
  gem "skylight"
  gem "tailwindcss-rails"
  gem "title"

  # Development environment
  gem_group :development do
    gem "bullet"
    gem "better_errors"
    gem "binding_of_caller"
    gem "rails-mermaid_erd"
    gem "web-console"
  end

  # Development and test environments
  gem_group :development, :test do
    gem "awesome_print"
    gem "brakeman"
    gem "bundler-audit"
    gem "dotenv-rails"
    gem "faker"
    gem "factory_bot_rails"
    gem "pry-byebug"
    gem "pry-rails"
    gem "rspec-rails"
    gem "standard"
    gem "standard-rails"
    gem "standard-performance"
  end

  # Test environment
  gem_group :test do
    gem "capybara"
    gem "capabara_accessibility_audit"
    gem "capabara_accessibile_selectors"
    gem "formulaic"
    gem "selenium-webdriver"
    gem "shoulda-matchers"
    gem "webmock"
  end

  # Optional gems
  use_devise = ask("Would you like to use Devise for authentication? [yes/no]")
  use_pundit = ask("Would you like to use Pundit for authorization? [yes/no]")
  use_administrate = ask("Would you like to use Administrate for admin dashboards? [yes/no]")

  gem_list = "\n# Custom gems\n"
  gem_list += "gem 'devise'\n" if use_devise.downcase == "yes"
  gem_list += "gem 'pundit'\n" if use_pundit.downcase == "yes"
  gem_list += "gem 'administrate'\n" if use_administrate.downcase == "yes"

  unless gem_list.empty?
    append_to_file "Gemfile", gem_list
    run "bundle install"
  end

  # Install Tailwind CSS
  run "rails tailwindcss:install"

  # Install Bullet
  run "rails g bullet:install"

  # Install RSpec
  run "rails generate rspec:install"

  # Conditionally install administrate
  if use_administrate.downcase == 'yes'
    generate("administrate:install")
  end
end
