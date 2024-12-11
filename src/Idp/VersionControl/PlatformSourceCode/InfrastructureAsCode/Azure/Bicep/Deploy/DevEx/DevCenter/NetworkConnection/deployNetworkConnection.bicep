
@description('Workload name')
param workloadName string

@description('Resource Group Name')
param resourceGroupName string = resourceGroup().name

@description('Virtual Network Name')
var virtualNetworkName = '${workloadName}-virtualNetwork'

@description('Subnet Name')
var subnetName = '${workloadName}-subnet'

@description('Deploy Network Connection')
module deployNetworkConnection '../../../../DevEx/DevCenter/NetworkConnection/networkConnection.bicep' = {
  name: 'deployNetworkConnection'
  scope: resourceGroup(resourceGroupName)
  params: {
    virtualNetworkName: virtualNetworkName
    subnetName: subnetName
    virtualNetworkResourceGroupName: resourceGroupName
    domainJoinType: 'AzureADJoin'
  }
}
