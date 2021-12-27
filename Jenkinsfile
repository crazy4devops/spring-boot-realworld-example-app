pipeline{
  agent any


  stages{

    stage("Checkout Source Code"){
         steps{
              git url: "https://github.com/crazy4devops/spring-boot-realworld-example-app.git", branch: "dev"
         } 
    }
    stage("Build SpringBoot App"){
        steps{
            script {
                 sh "./gradelw build"
            }  
        } 
    }

    stage("Run Code Analysis"){
        steps{
            script {
                echo "Running Code Analysis"
            }  
        } 
    }

    stage("Push Artifacts to Artifactory"){
        steps{
            script {
                echo "Pushing Artifacts"
            }  
        } 
    }

    stage("Build Image"){
        steps{
            script {
                sh "docker build -t vsiraparapu/myspringapp:latest ."
            }  
        } 
    }

    stage("Push Image to Hub"){
        steps{
            script {
                echo " Push the Image to Hub"
            }  
        } 
    }

    stage('Deploy App into K8S cluster') {
      steps {
        script {
          kubernetesDeploy(configs: "deploy/k8s/deploy-db.yml", kubeconfigId: "mykubeconfig")
          kubernetesDeploy(configs: "deploy/k8s/deploy-app.yml", kubeconfigId: "mykubeconfig")
          kubernetesDeploy(configs: "deploy/k8s/app-service.yml", kubeconfigId: "mykubeconfig")
          kubernetesDeploy(configs: "deploy/k8s/db-service.yml", kubeconfigId: "mykubeconfig")
        }
      }
    }
    
  }

}

