@description('Solution/Workload Name')
param workloadName string = 'myWorkloadName'

@description('Environment Type')
@allowed([
  'nonprod'
  'prod'
  'dev'
])
param environmentType string = 'dev'

@description('Virtual Network Address Prefixes')
var addressPrefixes = [
  '10.0.0.0/16'
]

@description('Subnets')
var subnets = [
  {
    name: 'default'
    properties: {
      addressPrefix: '10.0.0.0/24'
    }
  }
  {
    name: 'myAppSubnet'
    properties: {
      addressPrefix: '10.0.1.0/24'
    }
  }
]

@description('Tags')
var tags = {
  workloadName: workloadName
  environment: 'dev'
  project: 'Platform-Engineering'
  costCenter: '12345'
  createdBy: 'John Doe'
  purpose: 'Virtual Network for my solution'
  department: 'IT'
  businessUnit: 'Platform Engineering'
  application: 'Platform'
  owner: 'John Doe'
  team: 'Platform Engineering'
  stack: 'Azure'
  location: resourceGroup().location
}

@description('Deploy Virtual Network Resource')
module deployVirtualNetwork '../../../../Compute/Network/VirtualNetwork/virtualNetwork.bicep' = {
  name: 'VirtualNetwork'
  scope: resourceGroup()
  params: {
    name: workloadName
    location: resourceGroup().location
    tags: tags
    enableDdosProtection: (environmentType == 'prod')
    addressPrefixes: addressPrefixes
    subnets: subnets
  }
}

@description('Virtual Network Resource ID')
output virtualNetworkId string = deployVirtualNetwork.outputs.virtualNetworkId

@description('Virtual Network Resource Name')
output virtualNetworkName string = deployVirtualNetwork.outputs.virtualNetworkName

@description('Virtual Network Resource Location')
output virtualNetworkLocation string = deployVirtualNetwork.outputs.virtualNetworkLocation

@description('Virtual Network Resource Address Prefixes')
output virtualNetworkAddressPrefixes array = deployVirtualNetwork.outputs.virtualNetworkAddressPrefixes

@description('Virtual Network Resource Subnets')
output virtualNetworkSubnets array = deployVirtualNetwork.outputs.virtualNetworkSubnets

@description('Tags')
output virtualNetworkTags object = deployVirtualNetwork.outputs.virtualNetworkTags
