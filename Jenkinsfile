// Main variables (Do not modify, they are here just to be documented)
println "BUILD_TAG: " + BUILD_TAG
println "JOB_NAME: " + JOB_NAME
println "JOB_BASE_NAME " + JOB_BASE_NAME
println "BUILD_NUMBER: " + BUILD_NUMBER

// Common Defs
APP_NAME = 'luisos-zabbix'
VERSION = "${BUILD_NUMBER}"

// Pipeline settings
properties([disableConcurrentBuilds(), pipelineTriggers([upstream('luisos')])])

// Steps
node("gw.brandao") {
  // Load Global common Functions
  echo "Carregando arquivo groovy com as funções common. (Managed files -> Common)"
  configFileProvider([configFile(fileId: '79f2f213-9098-48f6-be67-f0f4823841a8', variable: 'commonGroovy')]) { common = load( "${commonGroovy}" ) }
  // Now, do all the things!

  common.prepareSCM()

  // Use global common Makefile
  configFileProvider([configFile(fileId: 'docker-makefile', targetLocation: 'Makefile')]) {
    common.buildMakefile()

    common.pushMakefile()
  }
}
