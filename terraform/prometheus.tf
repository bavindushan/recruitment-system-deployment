resource "docker_image" "prometheus" {
  name = "prom/prometheus:latest"
}

resource "docker_container" "prometheus" {
  name  = "prometheus"
  image = docker_image.prometheus.name
  restart = "always"

  ports {
    internal = 9090
    external = 9090
  }

  volumes {
    host_path      = "${path.module}/../monitoring/prometheus.yml"
    container_path = "/etc/prometheus/prometheus.yml"
  }
}
