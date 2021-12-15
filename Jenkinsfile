pipeline{
        environment { 

        registry = "bharathi15/https://hub.docker.com/repositories" 

        registryCredential = 'Bharathi_Docker_ID' 

        }

    agent any
    stages{
        stage("sc checkout"){
            steps{
                script{
                    git branch: "qa", url: "https://github.com/bharu459/spring-boot-realworld-example-app.git"

                }
            }
        }
        stage("build analysis"){
            steps{
                script{
                   sh " ./gradlew build "
                }
            }
        }
        stage("source code analysis"){
            steps{
               script{
                     sh """
                       
                  /home/cloud_user/sonar/bin/sonar-scanner
                    """
                    
                }
            }
       }
        stage("build image"){
            steps{
                script{
                    
                    
                    sh " sudo docker build  -t bharathi15/spring-boot-image:latest  ."
                }
            }
        }
        stage("push image to docker registry"){
            steps{
                script{
                       
                       withCredentials([string(credentialsId: 'bharathi15', variable: 'Dockerhubpwd')]) {
                           sh """ sudo docker login -u bharathi15 -p ${Dockerhubpwd}
                                  sudo docker tag bharathi15/spring-boot-image:latest bharathi15/spring-boot-image:${BUILD_NUMBER}
                                  sudo docker push bharathi15/spring-boot-image:${BUILD_NUMBER} """
            
                       }
                }
            }
        }
    }
}