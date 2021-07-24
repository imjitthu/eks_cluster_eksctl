data "http" "workstation-external-ip" {
  url = "http://ipv4.icanhazip.com"
}

locals {
  workstation-external-cidr = "${chomp(data.http.workstation-external-ip.body)}/32"
}


#chomp removes newline characters at the end of a string. This can be useful if, for example, the string was read from a file that has a newline character at the end.
