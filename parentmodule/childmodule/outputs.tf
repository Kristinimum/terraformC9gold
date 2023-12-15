output "publicip1" {
  value = aws_instance.web_tier_1.public_ip
}

output "publicip2" {
  value = aws_instance.web_tier_2.public_ip
}

