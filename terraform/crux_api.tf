
/* 
  Add PagerDuty Subdomain to CRUX
*/
resource "null_resource" "crux-api" {
	
	# depends_on = [
	# 	pagerduty_service_integration.tech_service_1a,
	# 	pagerduty_service_integration.tech_service_1b,
	# 	pagerduty_service_integration.tech_service_1c,
	# 	pagerduty_service_integration.tech_service_2a,
	# 	pagerduty_service_integration.tech_service_2b,
	# 	pagerduty_service_integration.tech_service_3,
	# 	pagerduty_service_integration.tech_service_4,
	# 	pagerduty_service_integration.tech_service_5,
  #   pagerduty_response_play.majorIncident
	# ]
  
  # provisioner "local-exec" {
  #   command = "/bin/bash ../crux-api/refreshDomain.sh ${var.CRUX_TOKEN} ${var.PAGERDUTY_DOMAIN}"
  # }

  # provisioner "local-exec" {
  #   command = "/bin/bash ../crux-api/scheduleEventGroup.sh ${var.CRUX_TOKEN} ${var.PAGERDUTY_DOMAIN} ${pagerduty_service_integration.tech_service_1a.integration_key} ${pagerduty_service_integration.tech_service_1b.integration_key} ${pagerduty_service_integration.tech_service_1c.integration_key} ${pagerduty_service_integration.tech_service_2a.integration_key} ${pagerduty_service_integration.tech_service_2b.integration_key} ${pagerduty_service_integration.tech_service_3.integration_key} ${pagerduty_service_integration.tech_service_4.integration_key} ${pagerduty_service_integration.tech_service_5.integration_key}"
  # }
  
  # provisioner "local-exec" {
  #   command = "/bin/bash ../crux-api/addAutoResponderSettings.sh ${var.CRUX_TOKEN} ${var.PAGERDUTY_DOMAIN} ${pagerduty_service.tech_service_1a.id} ${pagerduty_service.tech_service_1b.id} ${pagerduty_service.tech_service_1c.id} ${pagerduty_service.tech_service_2a.id} ${pagerduty_service.tech_service_2b.id} ${pagerduty_service.tech_service_3.id} ${pagerduty_service.tech_service_4.id} ${pagerduty_service.tech_service_5.id}"
  # }
  
}