pipeline {
    agent any

    stages {
        stage('Clonar Repositorio') {
            steps {
                // Clonar el repositorio de Git
                checkout([$class: 'GitSCM', branches: [[name: 'main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'tu_credencial_de_git', url: 'https://github.com/dramax8569/prueba.git']]])
            }
        }

        stage('Compilación') {
            steps {
                // Ejecutar aquí tus comandos de compilación
                sh 'echo "Hello World"'
                // Agrega aquí cualquier otro comando necesario para tu compilación
            }
        }
    }

    post {
        success {
            // Puedes agregar acciones posteriores a una compilación exitosa
        }
        failure {
            // Puedes agregar acciones posteriores a una compilación fallida
        }
    }
}
