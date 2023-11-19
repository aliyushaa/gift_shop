terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "gift-shop-monolithic-master-backend-service" {
  name         = "gift-shop-monolithic-master-backend-service:latest"
  keep_locally = false
}

resource "docker_container" "gift-shop-monolithic-master-backend-service" {
  image = docker_image.gift-shop-monolithic-master-backend-service.image_id
  name  = "gift_backend"
  ports {
    internal = 2000
    external = 2000
  }
}
