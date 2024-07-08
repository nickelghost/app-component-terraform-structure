module "green_website" {
  source = "../../apps/green_website"
}

output "green_website_endpoint" {
  value = module.green_website.endpoint
}
