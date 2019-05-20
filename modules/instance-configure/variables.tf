variable "nis_login_host_public_ip" {}

variable "nis_login_user" {
  default = "opc"
}

variable "nis_login_host_ssh_private_key" {}
variable "nis_server_hostname" {}
variable "nis_server_domainname" {}
variable "nis_domain_name" {}
variable "nis_server_private_ip" {}

variable "nis_server_user" {
  default = "opc"
}

variable "nis_server_ssh_private_key" {}

variable "nis_server_sercure_net_list" {
  type    = "list"
  default = []
}

variable "nis_client_private_ip_list" {
  type = "list"
}

variable "nis_client_private_user_list" {
  type = "list"
}

variable "nis_client_ssh_private_key_list" {
  type = "list"
}

variable "nis_sudo_group_name" {}
