
####################Add tthis resource to output variabes
resource "google_compute_forwarding_rule" "gcp_fr" {
  name       = "forwarding-rule-europe-west1"
  target     = "${google_compute_target_pool.inst_pool.self_link}"
  port_range = "9292"
}

resource "google_compute_target_pool" "inst_pool" {
  name      = "reddit-app-pool"
  instances = "${google_compute_instance.app.*.self_link}"

  health_checks = [
    "${google_compute_http_health_check.gcp_health_check.name}"
  ]
}

resource "google_compute_http_health_check" "gcp_health_check" {
  name               = "health-check"
  request_path       = "/"
  check_interval_sec = 2
  timeout_sec        = 2
}
