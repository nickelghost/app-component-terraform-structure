module "blue_website" {
  source = "../../apps/blue_website"
}

output "blue_website_endpoint" {
  value = module.blue_website.endpoint
}
