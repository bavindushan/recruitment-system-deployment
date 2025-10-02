resource "docker_container" "grafana" {
  name  = "grafana"
  image = "grafana/grafana:latest"

  volumes = [
    "/home/gwu/GWUIM-recruitment/deployment/monitoring/dashboards:/var/lib/grafana/dashboards"
  ]

  env = [
    "GF_SECURITY_ADMIN_PASSWORD=${var.grafana_admin_password}"
  ]

  ports {
    internal = 3000
    external = 3000
  }
}
