@description('Storage account name')
@maxLength(24)
@minLength(3)
param name string

@description('Storage account location')
@allowed([
  'eastus'
  'eastus2'
  'southcentralus'
  'westus2'
  'westus3'
  'australiaeast'
  'southeastasia'
  'northeurope'
  'swedencentral'
  'uksouth'
  'westeurope'
  'centralus'
  'southafricanorth'
  'centralindia'
  'eastasia'
  'japaneast'
  'jioindiawest'
  'koreacentral'
  'canadacentral'
  'francecentral'
  'germanywestcentral'
  'norwayeast'
  'switzerlandnorth'
  'uaenorth'
  'brazilsouth'
])
param location string

@description('Storage account Sku')
@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_RAGRS'
  'Standard_ZRS'
  'Premium_LRS'
])
param sku string

@description('Storage account kind')
@allowed([
  'StorageV2'
  'BlobStorage'
])
param kind string

@description('Storage Account access tier')
@allowed([
  'Hot'
  'Cool'
])
param accessTier string = 'Hot'

@description('Storage account tags')
param tags object 

@description('Deploy Storage account resource to Azure')
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: name
  location: location
  sku: {
    name: sku
  }
  kind: kind
  properties: {
    accessTier: accessTier
  }
  tags: tags
}

@description('Output the storage account name')
output storageAccountName string = storageAccount.name

@description('Output the storage account id')
output storageAccountId string = storageAccount.id

@description('Output the storage account url')
output storageAccountUrl string = storageAccount.properties.primaryEndpoints.blob

@description('Output the storage account tags')
output storageAccountTags object = storageAccount.tags
