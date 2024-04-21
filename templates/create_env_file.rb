def create_env_file
  file ".env.sample", <<-ENV
  DB_USERNAME=postgres
  DB_PASSWORD=password
  DB_HOST=localhost
  ENV
end
