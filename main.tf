terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.13.0"
    }
  }
}

# กำหนด provider Docker
provider "docker" {
  host = "npipe:////./pipe/docker_engine"  # สำหรับ Windows, ถ้าใช้ Linux/Mac ให้เปลี่ยนเป็น "unix:///var/run/docker.sock"
}

# สร้าง Docker Image
resource "docker_image" "nginx_image" {
  name         = "my-nginx-image"
  build {
    path = "."  # เปลี่ยนจาก 'context' เป็น 'path'
  }
  keep_locally = true
}

# สร้าง Docker Container
resource "docker_container" "nginx_container" {
  name  = "nginx-container"
  image = docker_image.nginx_image.name
  ports {
    internal = 80
    external = 80
  }
  must_run = true
}
