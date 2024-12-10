@description('Virtual Network Name')
param name string

@description('Virtual Network Location')
param location string

@description('Virtual Network Address Prefixes')
param addressPrefixes array

@description('Subnets')
param subnets array

@description('Tags')
param tags object 

@description('Virtual Network Resource')
resource virtualNetwork 'Microsoft.Network/virtualNetworks@2024-03-01' = {
  name: name
  location: location
  tags: tags
  properties:{
    addressSpace:{
      addressPrefixes:addressPrefixes
    }
    subnets:subnets
  }
}

@description('Virtual Network Resource ID')
output virtualNetworkId string = virtualNetwork.id

@description('Virtual Network Resource Name')
output virtualNetworkName string = virtualNetwork.name

@description('Virtual Network Resource Location')
output virtualNetworkLocation string = virtualNetwork.location

@description('Virtual Network Resource Address Prefixes')
output virtualNetworkAddressPrefixes array = virtualNetwork.properties.addressSpace.addressPrefixes

@description('Virtual Network Resource Subnets')
output virtualNetworkSubnets array = virtualNetwork.properties.subnets

@description('Tags')
output virtualNetworkTags object = virtualNetwork.tags