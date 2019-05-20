### Setup NIS Server & Clients with Existing infra
This example shows the way to setup NIS Server & Clients in Oracle Cloud Infrastructure with existing bastion host, networks and virtural machines.
You need to prepare the OCI Authentication parameters, bastion host, servers and clients login info.

### Using this example
Prepare one variable file named "terraform.tfvars" with the required information. The content of "terraform.tfvars" should look something like the following:
```bash
$ cat terraform.tfvars

nis_login_host_public_ip= "129.213.40.10"
nis_login_user= "opc"
nis_login_host_ssh_private_key="/Users/jialia/.ssh/id_rsa"
#Info: nis_server_fullhostname=$nis_server_hostname.$nis_server_domainname
nis_server_hostname="nis-server"
nis_server_domainname="nisser.nis.oraclevcn.com"
nis_domain_name="nisser.nis.oraclevcn.com"
nis_server_private_ip="10.0.1.2"
nis_server_user="opc"
nis_server_ssh_private_key="/Users/jialia/.ssh/id_rsa"
nis_server_sercure_net_list=["255.255.0.0   10.0.0.0"]
nis_client_private_ip_list=["10.0.0.19", "10.0.0.18"]
nis_client_private_user_list=["opc", "opc"]
nis_client_ssh_private_key_list=["/Users/jialia/.ssh/id_rsa", "/Users/jialia/.ssh/id_rsa"]
```
However, for testing this mode, you also can prepare existing infra by following steps:
```bash
$ cd setup
$ cat terraform.tfvars
tenancy_ocid="ocid1.tenancy.oc1..aaaaaaaacwowr5avywohby2jcf4ujiiws3lblyrbazdfyyqdqzoe7qdcwfgq"
user_ocid="ocid1.user.oc1..aaaaaaaa73abrwq32gucivnme3u2yu6344phd6hzaeetgshi4gsx3nod4lfq"
fingerprint="cd:64:79:4e:dd:c5:bc:0d:6d:e9:97:35:2f:00:99:a0"
private_key_path="/Users/jialia/.oci/oci_api_key.pem"
region="us-ashburn-1"
compartment_ocid="ocid1.tenancy.oc1..aaaaaaaacwowr5avywohby2jcf4ujiiws3lblyrbazdfyyqdqzoe7qdcwfgq"
ssh_public_key="/Users/jialia/.ssh/id_rsa.pub"
ssh_private_key="/Users/jialia/.ssh/id_rsa"
client_count = 2
bastion_ssh_public_key="/Users/jialia/.ssh/id_rsa.pub"
bastion_ssh_private_key="/Users/jialia/.ssh/id_rsa"
$ terraform init
$ terraform plan
$ terraform apply
```
Then apply the example using the following commands:
```bash
$ terraform init
$ terraform plan
$ terraform apply
```
