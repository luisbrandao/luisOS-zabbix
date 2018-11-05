// Main variables (Do not modify, they are here just to be documented)
println "BUILD_TAG: " + BUILD_TAG
println "JOB_NAME: " + JOB_NAME
println "JOB_BASE_NAME " + JOB_BASE_NAME
println "BUILD_NUMBER: " + BUILD_NUMBER

// Common Defs
APP_NAME = 'luisos-zabbix'

// Steps
properties([disableConcurrentBuilds(), pipelineTriggers([])])
node("gw.brandao") {
  prepareSCM()
  build()
}

def prepareSCM() {
  stage("Prepare scm") {
    deleteDir()
    checkout scm
  }
}

def build() {
  stage('Build') {
    sh"""#!/bin/bash
    docker build --add-host techmago.sytes.net:172.17.0.1 --no-cache=true -t ${APP_NAME}:latest -t ${APP_NAME}:${BUILD_NUMBER} .
    """
  }
}
