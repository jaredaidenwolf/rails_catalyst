def setup_version_control
  # Check if Git is installed
  unless system("git --version")
    puts "Git is not installed. Please install Git to continue."
    return
  end

  # Check if the current directory is already a Git repository
  if Dir.exist?(".git")
    puts "The current directory is already a Git repository."
    return
  end

  # Initialize a new Git repository
  git :init

  # Add all files to the repository
  git add: "."

  # Commit the changes with an initial commit message
  git commit: %Q{ -m 'Initial commit' }
end
