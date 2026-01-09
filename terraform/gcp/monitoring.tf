resource "google_monitoring_notification_channel" "email" {
  display_name = "DevOps Alert Email"
  type         = "email"
  labels = {
    email_address = "fake-email@example.com" # Placeholder
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
      threshold_value = 2000 # 2 seconds (in ms or s? usually distribution, let's assume 2000ms if Unit is ms, but Cloud Run metric might be ms. Check docs: run.googleapis.com/request_latencies is in ms.)
    }
  }

  notification_channels = [google_monitoring_notification_channel.email.name]
}
