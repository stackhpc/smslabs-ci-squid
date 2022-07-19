terraform {
  required_version = ">= 0.14"
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

provider "openstack" {  # Mostly set from environment variables when sourcing rc file
    cloud = "openstack"
}

resource "openstack_compute_instance_v2" "squid" {
  
  name = "squid"
  image_name = "Rocky-8-GenericCloud-8.5-20211114.2.x86_64"
  flavor_name = "general.v1.small"
  key_pair = "slurm-app-ci"
  security_groups = [
    "default",
    "SSH",  # due to deploy host not being in same project
    ]

  network {
    name = "stackhpc-ci-geneve"
  }

  metadata = {
    deployment = path.root
  }

}

resource "local_file" "foo" {
    content  = <<-EOT
        [all]
        squid ansible_host=${openstack_compute_instance_v2.squid.access_ip_v4} ansible_user=rocky
        EOT

    filename = "${path.module}/inventory/hosts"
}
