@description('Solution/Workload Name')
param workloadName string = 'mySolution'

@description('Resource Group Name')
param resourceGroupName string = resourceGroup().name

@description('Virtual Network Name')
var name = '${workloadName}-Vnet'

@description('Virtual Network Location')
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
  location: location
}

@description('Deploy Virtual Network Resource')
module deployVirtualNetwork '../../../../Compute/Network/VirtualNetwork/virtualNetwork.bicep' = {
  name: name
  scope: resourceGroup(resourceGroupName)
  params: {
    name: name
    location: location
    tags: tags
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
