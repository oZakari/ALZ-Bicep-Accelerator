# ALZ-Bicep-Accelerator

.\powershell-automation\github-sync-releases\Invoke-GitHubReleaseFetcher.ps1 -githubRepoUrl "https://github.com/Azure/ALZ-Bicep" -syncAllReleases:$false -directoryAndFilesToKeep @("version.json", "infra-as-code") -directoryForReleases $pwd\releases 