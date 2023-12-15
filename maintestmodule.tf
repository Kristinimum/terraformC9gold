##-------main-parent-module-----##

module "ec2" {
  source = "./Resources"
  instance = "t3.micro"
}

#could create putputs.tf for root directory also
output "instance_ip" {
    value = module.ec2.mypublicip
}