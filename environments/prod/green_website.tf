module "green_website" {
  source = "../../apps/green_website"
}

output "green_website_endpoint" {
  description = "The website endpoint URL of the green website"
  value       = module.green_website.endpoint
}
