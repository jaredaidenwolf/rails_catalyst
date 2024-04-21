def setup_postgresql
  # Set up PostgreSQL in the Gemfile
  gsub_file "Gemfile", /^gem 'sqlite3'.*/, "gem 'pg'"

  # PostgreSQL database configuration
  gsub_file "config/database.yml", /database: db\/development.sqlite3/, "database: #{app_name}_development"
  gsub_file "config/database.yml", /database: db\/test.sqlite3/, "database: #{app_name}_test"

  # Add default username, password, and host for PostgreSQL using environment variables
  inject_into_file 'config/database.yml', after: "default: &default\n" do
    <<-YAML
    username: <%= ENV['DB_USERNAME'] || 'postgres' %>
    password: <%= ENV['DB_PASSWORD'] || 'password' %>
    host: <%= ENV['DB_HOST'] || 'localhost' %>
    YAML
  end
end
