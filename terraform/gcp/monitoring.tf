resource "google_monitoring_notification_channel" "email" {
  display_name = "DevOps Alert Email"
  type         = "email"
  labels = {
    email_address = var.alert_email
  }
}

resource "google_monitoring_alert_policy" "high_latency" {
  display_name = "High Latency Alert"
  combiner     = "OR"
  conditions {
    display_name = "Cloud Run Latency > 2s"
    condition_threshold {
      filter     = "resource.type = \"cloud_run_revision\" AND metric.type = \"run.googleapis.com/request_latencies\""
      duration   = "60s"
      comparison = "COMPARISON_GT"
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_PERCENTILE_99"
      }
      threshold_value = 2000
    }
  }

  notification_channels = [google_monitoring_notification_channel.email.name]
}
