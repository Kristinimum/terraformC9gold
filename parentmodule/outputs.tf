#--------outputs-parent.tf------#
output "publicip1" {
  value = module.tier2_architecture.publicip1
}

output "publicip2" {
  value = module.tier2_architecture.publicip2
}