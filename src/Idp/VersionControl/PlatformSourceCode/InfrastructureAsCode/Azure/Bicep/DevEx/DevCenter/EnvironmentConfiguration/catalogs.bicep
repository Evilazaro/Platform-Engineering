@description('Dev Center Name')
param devCenterName string

@description('Catalog Name')
param name string

@description('Catalog Sync Type')
@allowed([
  'Manual'
  'Scheduled'
])
param syncType string

@description('Tags')
param tags object

@description('GitHub')
param gitHub object

@description('ADO Git')
param adoGit object

@description('Dev Center Resource')
resource devCenter 'Microsoft.DevCenter/devcenters@2024-10-01-preview' existing = {
  name: devCenterName
  scope: resourceGroup()
}

@description('Catalog Resource')
resource catalog 'Microsoft.DevCenter/devcenters/catalogs@2024-10-01-preview' = {
  name: name
  parent: devCenter
  properties: {
    tags: tags
    syncType: syncType
    gitHub: (gitHub ?? { uri: '', branch: '', path: '', secretIdentifier: '' }) 
    adoGit: (adoGit ?? { uri: '', branch: '', path: '', secretIdentifier: '' })
  }
}

@description('Catalog Resource ID')
output id string = catalog.id

@description('Catalog Resource Name')
output catalogName string = catalog.name

@description('Catalog Resource Tags')
output catalogTags object = catalog.properties.tags

@description('Catalog Resource Sync Type')
output catalogSyncType string = catalog.properties.syncType

@description('Catalog Resource GitHub URI')
output catalogGitHubUri string = catalog.properties.gitHub.uri

@description('Catalog Resource GitHub Branch')
output catalogGitHubBranch string = catalog.properties.gitHub.branch

@description('Catalog Resource GitHub Path')
output catalogGitHubPath string = catalog.properties.gitHub.path

@description('Catalog Resource GitHub Secret Identifier')
output catalogGitHubSecretIdentifier string = catalog.properties.gitHub.secretIdentifier

@description('Catalog Resource ADO Git URI')
output catalogAdoGitUri string = catalog.properties.adoGit.uri

@description('Catalog Resource ADO Git Branch')
output catalogAdoGitBranch string = catalog.properties.adoGit.branch

@description('Catalog Resource ADO Git Path')
output catalogAdoGitPath string = catalog.properties.adoGit.path
