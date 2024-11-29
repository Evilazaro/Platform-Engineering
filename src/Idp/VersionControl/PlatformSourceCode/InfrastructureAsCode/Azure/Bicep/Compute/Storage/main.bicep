@description('Storage account name')
var name = 'eycanvasstorage'

@description('Storage account location')
var location = 'westus3'

@description('Storage account Sku')
var sku = 'Standard_LRS'

@description('Storage account kind')
var kind = 'StorageV2'

@description('Storage Account access tier')
var accessTier = 'Hot'

@description('Storage account public network access')
var publicNetworkAccess = 'Disabled'

@description('Allow blob public access')
var allowBlobPublicAccess = false

@description('Storage account tags')
var tags = {
  environment: 'dev'
  project: 'Platform-Engineering'
  costCenter: '12345'
  createdBy: 'John Doe'
  purpose: 'Storage account for storing images'
  department: 'IT'
  businessUnit: 'Platform Engineering'
  application: 'Platform'
  owner: 'John Doe'
  team: 'Platform Engineering'
  stack: 'Azure'
  location: 'West US 3'
  resourceType: 'Storage Account'
}

module storageAccount 'storageAccount.bicep' = {
  name: name
  params: {
    name: name
    location: location
    sku: sku
    kind: kind
    accessTier: accessTier
    publicNetworkAccess: publicNetworkAccess
    allowBlobPublicAccess: allowBlobPublicAccess
    tags: tags
  }
}

@description('Output the storage account name')
output storageAccountName string = storageAccount.name

@description('Output the storage account id')
output storageAccountId string = storageAccount.outputs.storageAccountId

@description('Output the storage account url')
output storageAccountUrl string = storageAccount.outputs.storageAccountUrl

@description('Output the storage account tags')
output storageAccountTags object = storageAccount.outputs.storageAccountTags

@description('Container name')
var containerName = 'eycanvascontainer'

module container 'Container/container.bicep' = {
  name: containerName
  params: {
    name: containerName
    storageAccountName: name
  }
  dependsOn: [
    storageAccount
  ]
}

@description('Output the blob service name')
output blobServiceName string = container.outputs.blobServiceName

@description('Output the blob service id')
output blobServiceId string = container.outputs.blobServiceId

@description('Output the container name')
output containerName string = container.outputs.containerName

@description('Output the container id')
output containerId string = container.outputs.containerId
