@description('Storage account name')
@maxLength(24)
@minLength(3)
param name string


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

@description('Storage Account Resource Id')
output storageAccountId string = storageAccount.id

@description('Output the storage account name')
output storageAccountName string = storageAccount.name

@description('Output the storage account url')
output storageAccountUrl string = storageAccount.properties.primaryEndpoints.blob

@description('Output the storage account sku')
output storageAccountSku string = storageAccount.sku.name

@description('Output the storage account kind')
output storageAccountKind string = storageAccount.kind

@description('Output the storage account tags')
output storageAccountTags object = storageAccount.tags
