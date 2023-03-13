param (
  [Parameter()]
  [String]$Location = "$($env:LOCATION)",

  [Parameter()]
  [String]$TemplateFile = "$($GITHUB_WORKSPACE)\upstream-releases\$($env:UPSTREAM_RELEASEVERSION)\infra-as-code\bicep\modules\managementGroups\managementGroups.bicep",

  [Parameter()]
  [String]$TemplateParameterFile = "$($GITHUB_WORKSPACE)\upstream-releases\$($env:UPSTREAM_RELEASEVERSION)\infra-as-code\bicep\modules\managementGroups\parameters\managementGroups.parameters.all.json"
  
)

$inputObject = @{
  DeploymentName        = 'alz-MGDeployment-{0}' -f ( -join (Get-Date -Format 'yyyyMMddTHHMMssffffZ')[0..63])
  Location              = $Location
  TemplateFile          = $TemplateFile
  TemplateParameterFile = $TemplateParameterFile
  Verbose               = $true
}

New-AzTenantDeployment @inputObject