
output "nis_server_private_ip" {
  value = "${oci_core_instance.NISServerInstance.private_ip}"
}

output "nis_server_hostname" {
  value = "${oci_core_instance.NISServerInstance.display_name}"
}

output "nis_server_domainname" {
  value = "${oci_core_subnet.NISServerSubnetAD.subnet_domain_name}"
}

output "nis_client_private_ip_list" {
  value = ["${oci_core_instance.NISClientInstances.*.private_ip}"]
}

output "nis_client_host_names" {
  value = ["${oci_core_instance.NISClientInstances.*.display_name}"]
}

output "bastion_private_ip" {
  value = "${oci_core_instance.NisBastion.private_ip}"
}

output "nis_login_host_public_ip" {
  value = "${oci_core_instance.NisBastion.public_ip}"
}


