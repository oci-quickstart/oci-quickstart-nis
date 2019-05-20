# ---------------------------------------------------------------------------------------------------------------------
# SETUP THE NIS
# ---------------------------------------------------------------------------------------------------------------------
module "setup_nis" {
  source                          = "../../modules/instance-configure"
  nis_login_host_public_ip        = "${var.nis_login_host_public_ip}"
  nis_login_user                  = "${var.nis_login_user}"
  nis_login_host_ssh_private_key  = "${var.nis_login_host_ssh_private_key}"
  nis_server_hostname             = "${var.nis_server_hostname}"
  nis_server_domainname           = "${var.nis_server_domainname}"
  nis_domain_name                 = "${var.nis_domain_name}"
  nis_server_private_ip           = "${var.nis_server_private_ip}"
  nis_server_user                 = "${var.nis_server_user}"
  nis_server_ssh_private_key      = "${var.nis_server_ssh_private_key}"
  nis_server_sercure_net_list     = "${var.nis_server_sercure_net_list}"
  nis_client_private_ip_list      = "${var.nis_client_private_ip_list}"
  nis_client_private_user_list    = "${var.nis_client_private_user_list}"
  nis_client_ssh_private_key_list = "${var.nis_client_ssh_private_key_list}"
  nis_sudo_group_name             = "${var.nis_sudo_group_name}"
}
