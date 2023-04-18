# Set the Git repository URL
$gitRepoUrl = "https://github.com/morganstanley/testplan.git"

# Set the local path where you want to clone the repository

# Check if Git is installed
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Git is not installed or not in the PATH. Please install Git and try again."
    exit 1
}

# Clone the Git repository
try {
    git clone $gitRepoUrl
    Write-Host "The repository has been cloned."
} catch {
    Write-Host "An error occurred while cloning the repository. Please check the repository URL and local path, then try again."
}
