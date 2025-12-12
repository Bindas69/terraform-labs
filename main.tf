terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Nginx container - MOVED TO PORT 8081
resource "docker_container" "nginx" {
  image = "nginx:latest"
  name  = "nginx_server"
  ports {
    internal = 80
    external = 8081  # Nginx on 8081
  }
}

# Jenkins container - ON PORT 8080
resource "docker_container" "jenkins" {
  image = "jenkins/jenkins:lts"
  name  = "jenkins_server"
  ports {
    internal = 8080
    external = 8080  # Jenkins on 8080
  }
  volumes {
    host_path      = "C:\\jenkins_data"
    container_path = "/var/jenkins_home"
  }
}
