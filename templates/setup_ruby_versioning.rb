def setup_ruby_versioning
  # Create a .tool-versions file
  run "touch .tool-versions"

  # Read Ruby version from .ruby-version file
  ruby_version = File.read('.ruby-version').strip

  # Inject Ruby version into .tool-versions file
  inject_into_file ".tool-versions", "ruby #{ruby_version}\n"

  # Delete the existing Ruby version declaration from the Gemfile
  system("ruby -i -pe 'gsub(/^ruby .*\n/, \"\")' Gemfile")

  # Inject Ruby version into Gemfile
  inject_into_file 'Gemfile', after: "source 'https://rubygems.org'\n" do
    <<-RUBY
  ruby "#{ruby_version}"
    RUBY
  end
end
