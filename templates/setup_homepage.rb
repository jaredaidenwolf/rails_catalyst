def setup_homepage
  # Generate a Homepage controller with an index action and view
  generate(:controller, "Homepage index")

  # Set the root route to 'homepage#index'
  route "root to: 'homepage#index'"

  # Add custom content to the homepage view
  content = <<-HTML
  <h1>Welcome to My App</h1>
  <p>This is the homepage of your new Rails application.</p>
  HTML

  # Write the content to the homepage view file
  File.write("app/views/homepage/index.html.erb", content)
end
