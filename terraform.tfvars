rg_names = {

  rg-1 = {
    name     = "sapakda-44"
    location = "centralus"
  }

}

vnet_names = {
  vnet-1 = {

    name                = "vnet-44"
    location            = "centralus"
    resource_group_name = "sapakda-44"
    address_space       = ["10.0.0.0/16"]
  }
}

sub_names = {
  subnet-1 = {
    name                 = "subnet-44"
    virtual_network_name = "vnet-44"
    resource_group_name  = "sapakda-44"
    address_prefixes     = ["10.0.1.0/24"]

  }
}
