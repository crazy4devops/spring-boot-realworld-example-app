pipeline{
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
                       ls -lrt
                       /home/cloud_user/sonar/bin/sonar-scanner
                     """
                    
                }
            }
        }
        stage("build image"){
            steps{
                script{
                    sh "ls -lrt"
                    sh "cat Dockerfile"
                    sh " sudo docker build  -t bharathi15/springbootimage:${BUILD_NUMBER}  ."
                }
            }
        }
        stage("push image to docker registry"){
            steps{
                script{
                    
                    sh """ sudo docker login --username bharathi15
                           sudo docker push bharathi15/spring-boot-image:${BUILD_NUMBER} ."""
                }
                           
                          
            }
        }
    }
}
// pipeline{
//     agent any
//     stages{
//         stage("sc checkout"){
//             steps{
//                 script{
//                     git branch: "qa", url: "https://github.com/bharu459/spring-boot-realworld-example-app.git"

//                 }
//             }
//         }
//         stage("build analysis"){
//             steps{
//                 script{
//                    sh " ./gradlew build "
//                 }
//             }
//         }
//         stage("source code analysis"){
//             steps{
//                 script{
//                      sh "ls -lrt"
//                      sh" sonar-scanner --version"
//                      sh "ls -lrt"
//                      sh " cd spring-boot-realworld-example-app"
//                      sh "sudo /sonar/bin/sonar/bin/sonar-scanner"
                    
//                 }
//             }
//         }
//         stage("build image"){
//             steps{
//                 script{
//                     sh "ls -lrt"
//                     sh "cat Dockerfile"
//                     sh " sudo docker build  -t bharathi15/springbootimage:${BUILD_NUMBER}  ."
//                 }
//             }
//         }
//         stage("push image to docker registry"){
//             steps{
//                 script{
                    
//                     sh """ sudo docker login --username bharathi15
//                            sudo docker push bharathi15/spring-boot-image:${BUILD_NUMBER} ."""
//                 }
                           
                          
//             }
//         }
//     }
// }
