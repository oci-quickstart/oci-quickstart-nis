# ------------------------------------------------------------------------------
# Setup Bastion Host
# ------------------------------------------------------------------------------
resource "oci_core_instance" "NisBastion" {
  availability_domain = "${data.template_file.ad_names.*.rendered[var.availability_domains_idx]}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "nis-bastion"
  shape               = "${var.bastion_shape}"

  create_vnic_details {
    subnet_id        = "${oci_core_subnet.BastionSubnet.id}"
    assign_public_ip = true
  }

  metadata {
    ssh_authorized_keys = "${file("${var.bastion_ssh_public_key}")}"
  }

  source_details {
    source_id   = "${var.ClientInstanceImageOCID[var.region]}"
    source_type = "image"
  }
}



resource "oci_core_instance" "NISServerInstance" {
  availability_domain = "${data.template_file.ad_names.*.rendered[var.availability_domains_idx]}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "${var.nis_server_hostname_prefix}"
  shape               = "${var.ServerInstanceShape}"

  create_vnic_details {
    subnet_id = "${oci_core_subnet.NISServerSubnetAD.id}"
    display_name     = "${var.nis_server_hostname_prefix}"
    hostname_label   = "${var.nis_server_hostname_prefix}"
    assign_public_ip = false
  }

  metadata {
    ssh_authorized_keys = "${file("${var.ssh_public_key}")}"
  }

  source_details {
    source_id   = "${var.ServerInstanceImageOCID[var.region]}"
    source_type = "image"
  }

  timeouts {
    create = "15m"
  }
}

resource "oci_core_instance" "NISClientInstances" {
  count               = "${var.client_count}"
  availability_domain = "${data.template_file.ad_names.*.rendered[var.availability_domains_idx]}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "${var.nis_client_hostname_prefix}${count.index+1}"
  shape               = "${var.ClientInstanceShape}"

  create_vnic_details {

    subnet_id = "${oci_core_subnet.NISClientSubnetAD.id}"
    display_name     = "${var.nis_client_hostname_prefix}${count.index+1}"
    hostname_label   = "${var.nis_client_hostname_prefix}${count.index+1}"
    assign_public_ip = false
  }

  metadata {
    ssh_authorized_keys = "${file("${var.ssh_public_key}")}"
  }

  source_details {
    source_id   = "${var.ClientInstanceImageOCID[var.region]}"
    source_type = "image"
  }

  timeouts {
    create = "15m"
  }
}