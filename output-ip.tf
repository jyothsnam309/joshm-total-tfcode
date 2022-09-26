output "apacheip" {
  value = aws_instance.cicd-apache.public_ip

}

output "apachedns" {
  value = aws_instance.cicd-apache.public_dns

}

output "jenkinsip" {
  value = aws_instance.cicd-jen.public_ip

}

output "jenkinsdns" {
  value = aws_instance.cicd-jen.public_dns

}
