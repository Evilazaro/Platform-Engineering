@description('Workload Name')
param workloadName string

@description('Resource Group Name')
param resourceGroupName string = resourceGroup().name

@description('Storage Account Location')
@allowed([
  'East US'
  'East US 2'
  'West US'
  'West US 2'
  'West US 3'
  'North Central US'
  'South Central US'
  'Central US'
  'West Central US'
  'Canada Central'
  'Canada East'
  'Brazil South'
  'North Europe'
  'West Europe'
  'UK South'
  'UK West'
  'France Central'
  'France South'
  'Switzerland North'
  'Switzerland West'
  'Germany North'
  'Germany West Central'
  'Norway East'
  'Norway West'
  'Poland Central'
  'UAE North'
  'UAE Central'
  'South Africa North'
  'South Africa West'
])
param location string = 'West US 3'

@description('Dev Center Name')
var name = '${workloadName}-devCenter'

@description('Catalog Item Sync Enable Status')
var catalogItemSyncEnableStatus = 'Enabled'

@description('Microsoft Hosted Network Enable Status')
var microsoftHostedNetworkEnableStatus = 'Enabled'

@description('Install Azure Monitor Agent Enable Status')
var installAzureMonitorAgentEnableStatus = 'Enabled'

@description('Tags')
var tags = {
  workloadName: workloadName
  environment: 'dev'
  workloadType: 'devCenter'
  costCenter: 'devCenter'
  owner: 'devCenter'
  createdBy: 'devCenter'
  createdOn: 'devCenter'
  updatedBy: 'devCenter'
  updatedOn: 'devCenter'
  deleteBy: 'devCenter'
  deleteOn: 'devCenter'
  retention: 'devCenter'
}

@description('Deploy Dev Center resource to Azure')
module deployDevCenter '../../../DevEx/DevCenter/devCenter.bicep' = {
  name: name
  scope: resourceGroup(resourceGroupName)
  params: {
    name: name
    tags: tags
    location: location
    catalogItemSyncEnableStatus: catalogItemSyncEnableStatus
    microsoftHostedNetworkEnableStatus: microsoftHostedNetworkEnableStatus
    installAzureMonitorAgentEnableStatus: installAzureMonitorAgentEnableStatus
  }
}

@description('Output Dev Center resource id')
output devCenterId string = deployDevCenter.outputs.devCenterId

@description('Output Dev Center name')
output devCenterName string = deployDevCenter.outputs.devCenterName

@description('Output Dev Center Catalog Item Sync Enable Status')
output catalogItemSyncEnableStatus string = deployDevCenter.outputs.devCenterCatalogItemSyncEnableStatus

@description('Output Dev Center Microsoft Hosted Network Enable Status')
output microsoftHostedNetworkEnableStatus string = deployDevCenter.outputs.devCenterMicrosoftHostedNetworkEnableStatus

@description('Output Dev Center Install Azure Monitor Agent Enable Status')
output installAzureMonitorAgentEnableStatus string = deployDevCenter.outputs.devCenterInstallAzureMonitorAgentEnableStatus

@description('Output Dev Center location')
output devCenterLocation string = deployDevCenter.outputs.devCenterLocation
