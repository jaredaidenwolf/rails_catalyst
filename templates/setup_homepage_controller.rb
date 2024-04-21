def setup_homepage_controller_and_route
  # Generate a Homepage controller with an index action and view
  generate(:controller, "Homepage index")

  # Set the root route to 'homepage#index'
  route "root to: 'homepage#index'"
end
