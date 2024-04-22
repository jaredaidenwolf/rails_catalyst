# RailsCatalyst Template
#
# This Rails application template automates the setup process for new Rails projects.
# It includes a series of customizations and configurations that are commonly required
# for modern web applications. This includes setting up essential gems, configuring
# PostgreSQL for database management, initializing version control settings, creating
# environment variables, and establishing a basic homepage with header partials.
# The goal is to accelerate the development process by pre-configuring repetitive
# setup tasks, allowing developers to focus on the unique aspects of their applications.

require_relative "templates/append_gemfile"
require_relative "templates/append_gitignore"
require_relative "templates/create_env_file"
require_relative "templates/setup_header_partials"
require_relative "templates/setup_homepage"
require_relative "templates/setup_postgresql"
require_relative "templates/setup_ruby_versioning"
require_relative "templates/setup_version_control"

# Append gems to Gemfile
append_gemfile

# Setup Ruby versioning
setup_ruby_versioning

# Append content to .gitignore
append_custom_gitignore_content

# Create sample .env file
create_env_file

# Set up PostgreSQL
setup_postgresql

# Setup header partials
create_navbar_partial
create_alerts_partial
inject_partials_into_layout

# Setup homepage controller and route
setup_homepage

# Setup version control
setup_version_control
