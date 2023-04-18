# Set the source folder containing the rst files and subfolders
$sourceFolder = '.\testplan\doc\en'

# Set the destination folder to save the converted markdown files
$destinationFolder = ".\testplan_markdown_documentation\"

# Create the destination folder if it doesn't exist
if (-not (Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder
}

# Define a function to convert rst files to markdown using pandoc
function ConvertTo-Markdown {
    param(
        [string]$sourcePath,
        [string]$destinationPath
    )
    pandoc -f rst -t markdown -o $destinationPath $sourcePath
}

# Recursively find all rst files in the source folder
$rstFiles = Get-ChildItem -Path $sourceFolder -Recurse -Include *.rst

# Iterate through the rst files and convert them to markdown
foreach ($rstFile in $rstFiles) {
    $relativePath = $rstFile.FullName.Substring($sourceFolder.Length)
    $outputPath = Join-Path -Path $destinationFolder -ChildPath ($relativePath -replace '\.rst$', '.md')
    $outputDir = Split-Path -Path $outputPath

    # Create the output directory if it doesn't exist
    if (-not (Test-Path $outputDir)) {
        New-Item -ItemType Directory -Path $outputDir
    }

    # Convert the rst file to markdown
    ConvertTo-Markdown -sourcePath $rstFile.FullName -destinationPath $outputPath
}
