# Define environment variables
$env:MY_ENVIRONMENT = "codespaces"   # Change to "codespaces" when running in GitHub Codespaces

# Load the YAML module
Install-Module -Name PowerShell-Yaml -Force -Scope CurrentUser
Import-Module -Name PowerShell-Yaml

# Read the YAML file
$yamlFilePath = "dummy_dashboards.yaml"
$yamlContent = Get-Content -Raw -Path $yamlFilePath | ConvertFrom-Yaml

# Calculate the timestamps for yesterday 9 AM and today 9 AM
$yesterday9am = (Get-Date).AddDays(-1).Date.AddHours(9)
$today9am = (Get-Date).Date.AddHours(9)

$timeRangeFrom = [math]::Round(($yesterday9am - (Get-Date "1970-01-01T00:00:00Z")).TotalMilliseconds)
$timeRangeTo = [math]::Round(($today9am - (Get-Date "1970-01-01T00:00:00Z")).TotalMilliseconds)

# Extract the root URL and dashboards
$rootUrl = $yamlContent.root_url
$dashboards = $yamlContent.dashboards

# Define the Open-URL function without verbose debugging
function Open-URL {
    param (
        [string]$url
    )

    if ($url -match '^(http|https)://') {
        if ($env:MY_ENVIRONMENT -eq "local") {
            Start-Process "chrome.exe" $url
        } elseif ($env:MY_ENVIRONMENT -eq "codespaces") {
            Write-Host "Opening URL in Codespaces: $url"
        } else {
            Write-Host "Unknown environment. Please set MY_ENVIRONMENT to either 'local' or 'codespaces'."
        }
    } else {
        Write-Host "Invalid URL. Please enter a valid URL starting with http or https."
    }
}

# Open each dashboard URL without verbose debugging
foreach ($dashboard in $dashboards.GetEnumerator()) {
    $url = $dashboard.Value -replace '\$\{root_url\}', $rootUrl -replace '\$\{time_range.from\}', $timeRangeFrom -replace '\$\{time_range.to\}', $timeRangeTo
    Open-URL -url $url
}
