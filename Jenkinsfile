def tag = "v1"

node {
    stage('pull source code') { // for display purposes
        echo "===================== 拉取 source code ====================="
        checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: '55f743d0-b48f-4352-8be5-b7b90a9361bd', url: 'git@github.com:CH0817/hello-world.git']]]
        echo "===================== source code 拉取成功 ====================="
    }
    stage('maven build') { // for display purposes
        // 使用指定的 maven
        withMaven(jdk: 'openjdk1.8', maven: 'maven_v3.8.1') {
            def imageName = "${project_name}:${tag}"
            echo "===================== 編譯並產生 docker image，docker image 結果由 dockerfile-maven-plugin 決定 ====================="
            sh "mvn clean package dockerfile:build"
            echo "===================== 編譯並產生 docker image 成功 ====================="
            withCredentials([usernamePassword(credentialsId: 'c9328d3d-eb2c-45b7-801e-45e228d3a3ed', passwordVariable: 'password', usernameVariable: 'username')]) {
                // some block
            }
            echo "===================== 刪除 image: ${imageName} ====================="
            sh "docker rmi -f ${imageName}"
            echo "===================== 刪除 image: ${imageName} 成功 ====================="
        }
    }
}
