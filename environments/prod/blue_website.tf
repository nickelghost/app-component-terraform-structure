module "blue_website" {
  source = "../../apps/blue_website"
}

output "blue_website_endpoint" {
  description = "The website endpoint URL of the blue website"
  value       = module.blue_website.endpoint
}
