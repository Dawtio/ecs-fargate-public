# Output the URL of our Application Load Balancer so that we can connect to
# our application running inside ECS once it is up and running.
output "url" {
  value = "http://${module.alb.lb_dns_name}"
}
