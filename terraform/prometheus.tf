resource "docker_container" "prometheus" {
  name  = "prometheus"
  image = "prom/prometheus:latest"

  ports {
    internal = 9090
    external = 9090
  }

  volume {
    host_path      = "/home/gwu/GWUIM-recruitment/deployment/monitoring/prometheus.yml"
    container_path = "/etc/prometheus/prometheus.yml"
  }
}
