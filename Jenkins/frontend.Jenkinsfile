def dockerRuntime(command) {
    def dockerImage = docker.image('node:10.13.0-alpine')
    dockerArgs = '-u root ' + '--net=host ' +
        '-v /data/jenkins/.cache/yarn:/root/.cache/yarn ' +
        '-v /data/jenkins/workspace/${JOB_NAME}:/code -w /code'
    dockerImage.inside("${dockerArgs}") {
        sh "${command}"
    }
}

node {
    stage('Checkout') {
        // 代码提取
        git credentialsId: 'your-credentialsId', url: 'http://your-git-repo.git', branch: 'dev'
    }

    stage('Package Install') {
        sh "whoami"
        dockerRuntime('npm install --registry=https://registry.npm.taobao.org')
    }

    stage('Unit Test') {
        // 通过docker插件运行项目测试
        try{
            dockerRuntime('npm run lint')
        }catch(e){

        }
    }

    stage('Code Build') {
        // 通过docker插件运行项目构建
        dockerRuntime('PUBLIC_PATH=/your-context-path/ BASE_URL=/your-context-path/ yarn build')
    }

    stage('Docker Build') {
        sh "docker login you-registry -u docker -p your-pass"
        sh "docker build -t you-registry/$your-project:$BUILD_NUMBER ."
        sh "docker push you-registry/$your-project:$BUILD_NUMBER"
        sh "docker rmi you-registry/$your-project:$BUILD_NUMBER"
    }
    
    stage('Deploy') {
        sh "helm upgrade -i $your-project local/helm-repo --kubeconfig ~/.kube/config --namespace $namespace --set image.repository=you-registry/$your-project --set image.tag=$BUILD_NUMBER --set ingress.hosts[0].paths[0].pathType=Prefix --set imagePullSecrets[0].name=docker-registry-secret"
    }
    
}