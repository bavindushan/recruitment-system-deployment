resource "docker_container" "prometheus" {
  name  = "prometheus"
  image = "prom/prometheus:latest"

  volumes = [
    "/home/gwu/GWUIM-recruitment/deployment/monitoring/prometheus.yml:/etc/prometheus/prometheus.yml"
  ]

  ports {
    internal = 9090
    external = 9090
  }
}
