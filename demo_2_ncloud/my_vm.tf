resource "ncloud_vpc" "my_vpc" {
  ipv4_cidr_block = "10.0.0.0/16"
}

resource "ncloud_subnet" "my_subnet" {
  vpc_no         = ncloud_vpc.my_vpc.id
  subnet         = "10.0.1.0/24"
  zone           = "KR-2"
  network_acl_no = ncloud_vpc.my_vpc.default_network_acl_no
  subnet_type    = "PUBLIC" // PUBLIC(Public) | PRIVATE(Private)
  // below fields is optional
  usage_type = "GEN" // GEN(General) | LOADB(For load balancer)
}

resource "ncloud_login_key" "app_vm1" {
  key_name = "app-vm1-key"
}

resource "ncloud_server" "app1" {
  name      = "app-vm1-opentofu"
  subnet_no = ncloud_subnet.my_subnet.id

  server_image_product_code = "SW.VSVR.OS.LNX64.CNTOS.0703.B050"

  login_key_name = ncloud_login_key.app_vm1.key_name

  tag_list {
    tag_key   = "team"
    tag_value = "billing_app"
  }

  tag_list {
    tag_key   = "managed_by"
    tag_value = "opentofu"
  }

  tag_list {
    tag_key   = "cost_center"
    tag_value = "8899"
  }
}
