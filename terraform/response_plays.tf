resource "pagerduty_response_play" "majorIncident" {
    name = "Major Incident"
    from = "danny_thompson@example.com"

    responder {
        type = "escalation_policy_reference"
        id   = [for ep in pagerduty_escalation_policy.team_escalation_policies: ep.id if ep.name == "Application Support (EP)"][0]
    }
    
    responder {
        type = "escalation_policy_reference"
        id   = [for ep in pagerduty_escalation_policy.team_escalation_policies: ep.id if ep.name == "Database (EP)"][0]
    } 
    
    responder {
        type = "escalation_policy_reference"
        id   = [for ep in pagerduty_escalation_policy.team_escalation_policies: ep.id if ep.name == "Infrastructure (EP)"][0]
    }

    runnability = "services"
}