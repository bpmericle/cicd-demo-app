#!/usr/bin/env groovy
@Library(['cicd-pipeline-lib']) _

pipeline {
    agent 'any'
    options {
        timestamps()
    }
    stages {
        stage('Compile') {
            steps {
                executeCompileStageSteps()
            }
            post {
                success {
                    executeCompileStagePostSuccessSteps()
                }
                failure {
                    executeCompileStagePostFailureSteps()
                }
            }
        }
        stage('Unit Tests and Static Analysis') {
            failFast true
            parallel {
                stage('Unit Tests') {
                    steps {
                        executeUnitTestsStageSteps()
                    }
                    post {
                        success {
                            executeUnitTestsStagePostSuccessSteps()
                        }
                        failure {
                            executeUnitTestsStagePostFailureSteps()
                        }
                    }
                }
                stage('Integration Tests') {
                    steps {
                        executeIntegrationTestsStageSteps()
                    }
                    post {
                        success {
                            executeIntegrationTestsStagePostSuccessSteps()
                        }
                        failure {
                            executeIntegrationTestsStagePostFailureSteps()
                        }
                    }
                }
            }
        }
        stage('Static Analysis') {
            steps {
                executeStaticAnalysisStageSteps()
            }
            post {
                success {
                    executeStaticAnalysisStagePostSuccessSteps()
                }
                failure {
                    executeStaticAnalysisStagePostFailureSteps()
                }
            }
        }
        stage('Publish to Artifact Repository') {
            steps {
                executePublishToArtifactRepositoryStageSteps()
            }
            post {
                success {
                    executePublishToArtifactRepositoryStagePostSuccessSteps()
                }
                failure {
                    executePublishToArtifactRepositoryStagePostFailureSteps()
                }
            }
        }
        stage('Deploy to Pre-Production') {
            steps {
                executeDeployToPreProductionStageSteps()
            }
            post {
                success {
                    executeDeployToPreProductionStagePostSuccessSteps()
                }
                failure {
                    executeDeployToPreProductionStagePostFailureSteps()
                }
            }
        }
        stage('Deploy to Production') {
            steps {
                executeDeployToProductionStageSteps()
            }
            post {
                success {
                    executeDeployToProductionStagePostSuccessSteps()
                }
                failure {
                    executeDeployToProductionStagePostFailureSteps()
                }
            }
        }
    }
    post {
        success {
            executePostPipelineSuccessSteps()
        }
        failure {
            executePostPipelineFailureSteps()
        }
    }
}
