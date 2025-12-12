terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Nginx container
resource "docker_container" "nginx" {
  image = "nginx:latest"
  name  = "nginx_server"
  ports {
    internal = 80
    external = 8081
  }
}
