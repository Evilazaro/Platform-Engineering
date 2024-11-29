@description('Container name')
param name string

@description('Storage account name')
@maxLength(24)
@minLength(3)
param storageAccountName string

@description('Existing Storage Account')
resource existingStorageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' existing = {
  name: storageAccountName
}

@description('Existing Storage account blob service')
resource blobService 'Microsoft.Storage/storageAccounts/blobServices@2023-05-01' existing = {
  name: 'default'
  parent: existingStorageAccount
}

@description('Deploy Storage account container resource to Azure')
resource storageAccountContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-05-01' = {
  name: name
  parent: blobService
}

@description('Output the blob service name')
output blobServiceName string = blobService.name

@description('Output the blob service id')
output blobServiceId string = blobService.id

@description('Output the container name')
output containerName string = storageAccountContainer.name

@description('Output the container id')
output containerId string = storageAccountContainer.id

@description('Output the container public access')
output containerUrl string = storageAccountContainer.properties.publicAccess
