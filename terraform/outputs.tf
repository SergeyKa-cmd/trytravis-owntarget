output "lb_external_ip" {
  value = "${google_compute_forwarding_rule.gcp_fr.ip_address}"
}