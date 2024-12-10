@description('Dev Center Name')
param devCenterName string

var catalogs = [
  {
    name: 'catalog1'
    adoGit: {}
    gitHub: {
      uri: 'https://github.com/Evilazaro/DevExp-MicrosoftDevBox.git'
      branch: 'main'
      path: '/customizations/tasks'
    }
    syncType: 'Scheduled'
  }
  {
    name: 'catalog2'
    adoGit: {}
    gitHub: {}
    syncType: 'Scheduled'
  }
]

@description('Tags')
var tags = {
  idp: 'DevEx'
  source: 'InfrastructureAsCode'
  platform: 'Azure'
  versionControl: 'PlatformSourceCode'
  environmentConfiguration: 'EnvironmentConfiguration'
  environmentTypeVersion: '2024-10-01-preview'
  environmentTypeSource: 'DevCenter'
}

@description('Deploy Catalogs')
module deployCatalog '../../../../DevEx/DevCenter/EnvironmentConfiguration/catalogs.bicep' = [
  for catalog in catalogs: {
    name: catalog.name
    params: {
      name: catalog.name
      tags: tags
      adoGit: catalog.adoGit
      devCenterName: devCenterName
      gitHub: catalog.gitHub
      syncType: catalog.syncType
    }
  }
]
