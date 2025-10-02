resource "docker_image" "grafana" {
  name = "grafana/grafana:latest"
}

resource "docker_container" "grafana" {
  name  = "grafana"
  image = docker_image.grafana.name
  restart = "always"

  ports {
    internal = 3000
    external = 3001
  }

  env = [
    "GF_SECURITY_ADMIN_USER=${var.grafana_admin_user}",
    "GF_SECURITY_ADMIN_PASSWORD=${var.grafana_admin_password}",
  ]

  volumes {
    host_path      = "${path.module}/../monitoring/dashboards"
    container_path = "/var/lib/grafana/dashboards"
  }
}
