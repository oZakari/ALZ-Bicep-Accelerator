param (
  [Parameter()]
  [String]$Location = "$($env:LOCATION)",
  
  [Parameter()]
  [String]$TopLevelMGPrefix = "$($env:TOP_LEVEL_MG_PREFIX)",

  [Parameter()]
  [String]$TemplateFile = "upstream-releases\$($env:UPSTREAM_RELEASE_VERSION)\infra-as-code\bicep\modules\roleAssignments\roleAssignmentManagementGroup.bicep",

  [Parameter()]
  [String]$TemplateParameterFile = "upstream-releases\$($env:UPSTREAM_RELEASE_VERSION)\infra-as-code\bicep\modules\roleAssignments\parameters\roleAssignmentManagementGroup.securityGroup.parameters.all.jsonn"
)

# Parameters necessary for deployment
$inputObject = @{
  DeploymentName        = 'alz-RoleAssignmentsDeployment-{0}' -f ( -join (Get-Date -Format 'yyyyMMddTHHMMssffffZ')[0..63])
  Location              = $Location
  TemplateFile          = $TemplateFile
  TemplateParameterFile = $TemplateParameterFile
  Verbose               = $true
}

New-AzManagementGroupDeployment @inputObject -