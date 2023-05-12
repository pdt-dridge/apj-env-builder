/* 
  PagerDuty Services, Integrations, Dependencies, and Maintenance Windows
  - https://www.terraform.io/docs/providers/pagerduty/r/business_service.html
  - https://www.terraform.io/docs/providers/pagerduty/r/service.html
  - https://www.terraform.io/docs/providers/pagerduty/r/service_dependency.html
  - https://www.terraform.io/docs/providers/pagerduty/r/service_integration.html
  - https://www.terraform.io/docs/providers/pagerduty/r/maintenance_window.html
*/

/* 
  Team for the Reps' Services
*/
resource "pagerduty_team" "repName_team" {
  name        = "repName Engineering"
  description = "repName Engineering Team"
}

/* 
  Escalation Policy for the Reps' Services
*/
resource "pagerduty_escalation_policy" "repName_ep" {
  name      = "repName Engineering On-call"
  num_loops = 2
  teams     = [pagerduty_team.repName_team.id]

  rule {
    escalation_delay_in_minutes = 2
    target {
      type = "schedule_reference"
      id   = pagerduty_schedule.repName_primary.id 
    }
    target {
      type = "schedule_reference"
      id   = pagerduty_schedule.repName_secondary.id 
    }
    target {
      type = "user_reference"
      id   = pagerduty_user.repName.id
    }
  }
}

/* 
  Business Services (e.g. higher-level business application)
*/
resource "pagerduty_business_service" "online-payments-repName" {
  name             = "Online Payments repName"
  description      = "Payments through website and apps"
}

/* 
  Technical Services (e.g. lower-level microservices)
*/
resource "pagerduty_service" "repName_payment_api" {
  name                    = "Payments API"
  auto_resolve_timeout    = 14400
  escalation_policy       = pagerduty_escalation_policy.repName_ep.id
  alert_creation          = "create_alerts_and_incidents"
  alert_grouping_parameters {
    type    = "intelligent"
  }
  incident_urgency_rule {
    type    = "constant"
    urgency = "severity_based"
  }
}

resource "pagerduty_service" "repName_cart_api" {
  name                    = "Shopping Cart API"
  auto_resolve_timeout    = 14400
  escalation_policy       = pagerduty_escalation_policy.repName_ep.id
  alert_creation          = "create_alerts_and_incidents"
  alert_grouping_parameters {
    type    = "content_based"
    config {
      aggregate   = "all"
      fields      = ["summary"]
    }
  }
  incident_urgency_rule {
    type    = "constant"
    urgency = "severity_based"
  }
}

resource "pagerduty_service" "repName_login_api" {
  name                    = "Login API"
  auto_resolve_timeout    = 14400
  escalation_policy       = pagerduty_escalation_policy.repName_ep.id
  alert_creation          = "create_alerts_and_incidents"
  alert_grouping_parameters {
    type    = "content_based"
    config {
      aggregate   = "all"
      fields      = ["summary"]
    }
  }
  incident_urgency_rule {
    type    = "constant"
    urgency = "severity_based"
  }
}


/* 
  Service-Level Integration Keys (Events v2)
*/
resource "pagerduty_service_integration" "tech_service_1a" {
  name    = "Events API v2"
  type    = "events_api_v2_inbound_integration"
  service = pagerduty_service.tech_service_1a.id
}

resource "pagerduty_service_integration" "tech_service_1b" {
  name    = "Events API v2"
  type    = "events_api_v2_inbound_integration"
  service = pagerduty_service.tech_service_1b.id
}

resource "pagerduty_service_integration" "tech_service_1c" {
  name    = "Events API v2"
  type    = "events_api_v2_inbound_integration"
  service = pagerduty_service.tech_service_1c.id
}


/* 
  Service Dependencies
*/
resource "pagerduty_service_dependency" "tech_service_1a" {
  dependency {
    dependent_service {
      id    = pagerduty_business_service.business_service_1.id
      type  = "business_service"
    }
    supporting_service {
      id    = pagerduty_service.tech_service_1a.id
      type  = "service"
    }
  }
}

resource "pagerduty_service_dependency" "tech_service_1b" {
  dependency {
    dependent_service {
      id    = pagerduty_business_service.business_service_1.id
      type  = "business_service"
    }
    supporting_service {
      id    = pagerduty_service.tech_service_1b.id
      type  = "service"
    }
  }
}

resource "pagerduty_service_dependency" "tech_service_1c" {
  dependency {
    dependent_service {
      id    = pagerduty_business_service.business_service_1.id
      type  = "business_service"
    }
    supporting_service {
      id    = pagerduty_service.tech_service_1c.id
      type  = "service"
    }
  }
}
