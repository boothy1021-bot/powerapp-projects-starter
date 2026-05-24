param(
    [Parameter(Mandatory=$true)]
    [string]$Name
)

$root = $PSScriptRoot
$templateDir = Join-Path $root "_template"
$targetDir = Join-Path $root $Name

if ([string]::IsNullOrWhiteSpace($Name)) {
    Write-Error "Project name cannot be empty."
    exit 1
}

if (Test-Path $targetDir) {
    Write-Error "A project named '$Name' already exists at $targetDir"
    exit 1
}

# Copy template (excludes node_modules — not present in _template)
Copy-Item -Path $templateDir -Destination $targetDir -Recurse

# Update power.config.json
$powerConfigPath = Join-Path $targetDir "power.config.json"
$powerConfig = Get-Content $powerConfigPath -Raw | ConvertFrom-Json
$powerConfig.appDisplayName = $Name
$powerConfig | ConvertTo-Json -Depth 10 | Set-Content $powerConfigPath -Encoding UTF8

# Update package.json name (kebab-case)
$kebabName = $Name -creplace '([a-z])([A-Z])', '$1-$2' -replace '\s+', '-' -replace '[^a-zA-Z0-9-]', ''
$kebabName = $kebabName.ToLower()
$packageJsonPath = Join-Path $targetDir "package.json"
$packageJson = Get-Content $packageJsonPath -Raw | ConvertFrom-Json
$packageJson.name = $kebabName
$packageJson | ConvertTo-Json -Depth 10 | Set-Content $packageJsonPath -Encoding UTF8

Write-Host ""
Write-Host "Project '$Name' created successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:"
Write-Host "  cd $Name"
Write-Host "  npm install"
Write-Host "  npm run dev"
Write-Host ""
