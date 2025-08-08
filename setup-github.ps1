# PowerShell script to initialize Git repository and push to GitHub

# Check if Git is installed
try {
    git --version
} catch {
    Write-Host "Git is not installed. Please install Git from https://git-scm.com/downloads"
    exit
}

# Get GitHub username and repository name
$githubUsername = Read-Host -Prompt "Enter your GitHub username"
$repoName = Read-Host -Prompt "Enter the name for your GitHub repository"

# Initialize Git repository
Write-Host "Initializing Git repository..."
git init

# Add all files to Git
Write-Host "Adding files to Git..."
git add .

# Commit changes
Write-Host "Committing changes..."
git commit -m "Initial commit"

# Create GitHub repository using GitHub CLI if available, otherwise provide instructions
try {
    gh --version
    Write-Host "Creating GitHub repository using GitHub CLI..."
    gh repo create $repoName --public --source=. --remote=origin
} catch {
    Write-Host "GitHub CLI not found. Please create a new repository on GitHub manually."
    Write-Host "Then run the following commands:"
    Write-Host "git remote add origin https://github.com/$githubUsername/$repoName.git"
    Write-Host "git branch -M main"
    Write-Host "git push -u origin main"
    exit
}

# Push to GitHub
Write-Host "Pushing to GitHub..."
git branch -M main
git push -u origin main

Write-Host "Done! Your portfolio is now on GitHub."
Write-Host "Visit https://github.com/$githubUsername/$repoName to see your repository."
Write-Host "Your portfolio will be available at https://$githubUsername.github.io/$repoName/ once GitHub Pages is enabled."