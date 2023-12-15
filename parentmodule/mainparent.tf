#--------main-parent.tf------#

module "tier2_architecture" {
  source = "./childmodule"
}