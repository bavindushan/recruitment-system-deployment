resource "docker_container" "grafana" {
  name  = "grafana"
  image = "grafana/grafana:latest"

  env = [
    "GF_SECURITY_ADMIN_PASSWORD=${var.grafana_admin_password}"
  ]

  ports {
    internal = 3000
    external = 3000
  }

  volume {
    host_path      = "/home/gwu/GWUIM-recruitment/deployment/monitoring/dashboards"
    container_path = "/var/lib/grafana/dashboards"
  }
}
