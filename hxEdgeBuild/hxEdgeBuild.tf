
### HYPERFLEX CLUSTER PROVISIONING MODULE ###
/*module "hx" {
  source  = "terraform-cisco-modules/hx/intersight"
  version = "1.0.6"

  ### COMMON SETTINGS ###
  action              = "Deploy" # Validate, Deploy, Continue, Retry, Abort, Unassign, No-op
  wait_for_completion = false
  organization        = "default"
  tags                = []
}*/





#HX Local Credentials Policy
resource "intersight_hyperflex_local_credential_policy" "hx_local_credential_policy" {
  name        = "${var.cluster_name}_security_config"
  description = "HX Local Credentials Policy"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org_data.results[0].moid
  }
  tags {
    key   = var.tag_key1
    value = var.tag_value1
  }
  factory_hypervisor_password = var.hx_factory_hypervisor_password
  hypervisor_admin            = var.hx_hypervisor_admin_user
  hypervisor_admin_pwd        = base64decode(var.hx_hypervisor_admin_pwd)
  hxdp_root_pwd               = base64decode(var.hx_hxdp_root_pwd)
}


# HX auto Support Policy

resource "intersight_hyperflex_auto_support_policy" "hx_auto_support_policy" {
  name        = "${var.cluster_name}-auto-support"
  description = "Auto Support Policy"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org_data.results[0].moid
  }
  tags {
    key   = var.tag_key1
    value = var.tag_value1
  }
  service_ticket_receipient = var.hx_auto_support_service_ticket_receipient
  admin_state               = var.hx_auto_support_admin_state
}

# resource "intersight_hyperflex_cluster_backup_policy" "hx_backup_policy" {}

# HX Cluster Profile
resource "intersight_hyperflex_cluster_profile" "hx_cluster_profile" {
  depends_on = [intersight_hyperflex_auto_support_policy.hx_auto_support_policy,
    intersight_hyperflex_cluster_network_policy.hx_network_config_policy,
    intersight_hyperflex_cluster_storage_policy.hx_storage_config_policy,
    intersight_hyperflex_local_credential_policy.hx_local_credential_policy,
    intersight_hyperflex_node_config_policy.hx_node_config_policy,
    intersight_hyperflex_software_version_policy.hx_software_version_policy,
    intersight_hyperflex_sys_config_policy.hx_sys_config_policy,
    intersight_hyperflex_vcenter_config_policy.hx_vcenter_policy
  ]
  name        = var.cluster_name
  description = "${var.cluster_name} HX Cluster Profile"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org_data.results[0].moid
  }
  tags {
    key   = var.tag_key1
    value = var.tag_value1
  }
  data_ip_address    = var.hx_data_ip_address
  hypervisor_type    = var.hx_hypervisor_type
  mac_address_prefix = var.hx_mac_address_prefix
  mgmt_ip_address    = var.hx_mgmt_ip_address
  mgmt_platform      = var.hx_mgmt_platform
  replication        = var.hx_replication
  host_name_prefix   = var.hx_host_name_prefix
  storage_data_vlan {
    name    = var.hx_storage_data_vlan_name
    vlan_id = var.hx_storage_data_vlan_id
  }
  local_credential {
    moid = intersight_hyperflex_local_credential_policy.hx_local_credential_policy.moid
  }
  sys_config {
    moid = intersight_hyperflex_sys_config_policy.hx_sys_config_policy.moid
  }
  vcenter_config {
    moid = intersight_hyperflex_vcenter_config_policy.hx_vcenter_policy.moid
  }
  cluster_storage {
    moid = intersight_hyperflex_cluster_storage_policy.hx_storage_config_policy.moid
  }
  auto_support {
    moid = intersight_hyperflex_auto_support_policy.hx_auto_support_policy.moid
  }
  node_config {
    moid = intersight_hyperflex_node_config_policy.hx_node_config_policy.moid
  }
  cluster_network {
    moid = intersight_hyperflex_cluster_network_policy.hx_network_config_policy.moid
  }
  proxy_setting {
    moid = intersight_hyperflex_proxy_setting_policy.hx_proxy_setting_policy.moid
  }
  /*
  ext_fc_storage {
    moid = intersight_hyperflex_ext_fc_storage_policy.hx_ext_fc_storage_policy.moid
  }
  ext_iscsi_storage {
    moid = intersight_hyperflex_ext_iscsi_storage_policy.hx_ext_iscsi_policy.moid
  }
  */
  
  
  software_version {
    moid = intersight_hyperflex_software_version_policy.hx_software_version_policy.moid
  }
   action = var.hx_profile_action 

}
# HX Data Orgination

data "intersight_organization_organization" "org_data" {
  name = var.org_name
}

#HX External FC Storage Policy
/*
resource "intersight_hyperflex_ext_fc_storage_policy" "hx_ext_fc_storage_policy" {
  name        = "${var.cluster_name}_ext_fc_storage"
  description = "External FC Storage Policy"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org_data.results[0].moid
  }
  tags {
    key   = var.tag_key1
    value = var.tag_value1
  }
  admin_state = var.hx_fc_admin_state
  exta_traffic {
    name    = var.hx_fc_exta_vsan_name
    vsan_id = var.hx_fc_exta_vsan_id
  }
  extb_traffic {
    name    = var.hx_fc_extb_vsan_name
    vsan_id = var.hx_fc_extb_vsan_id
  }
  wwxn_prefix_range {
    start_addr = var.hx_fc_wwxn_prefix_start_addr
    end_addr   = var.hx_fc_wwxn_prefix_end_addr
  }
}*/

# HX Ext iSCSI Storage Policy
/*
resource "intersight_hyperflex_ext_iscsi_storage_policy" "hx_ext_iscsi_policy" {
  name        = "${var.cluster_name}_ext_iscsi_storage"
  description = "HX Ext iSCSI Storage Policy"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org_data.results[0].moid
  }
  tags {
    key   = var.tag_key1
    value = var.tag_value1
  }
  admin_state = var.hx_ext_iscsi_admin_state
  exta_traffic {
    name    = var.hx_iscsi_exta_name
    vlan_id = var.hx_iscsi_exta_vlan_id
  }
  extb_traffic {
    name    = var.hx_iscsi_extb_name
    vlan_id = var.hx_iscsi_extb_vlan_id
  }*/



# HX Network Configuration
resource "intersight_hyperflex_cluster_network_policy" "hx_network_config_policy" {
  name        = "${var.cluster_name}_network_config"
  description = "HX Network Config Policy"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org_data.results[0].moid
  }
  tags {
    key   = var.tag_key1
    value = var.tag_value1
  }
  jumbo_frame  = var.hx_jumbo_frame
  uplink_speed = var.hx_uplink_speed
  mgmt_vlan {
    name    = var.hx_mgmt_vlan_name
    vlan_id = var.hx_mgmt_vlan_id
  }
  # Uncomment below code when Uplink speed is set to 10G 
  mac_prefix_range {
    start_addr = var.hx_mac_prefix_start_addr
    end_addr   = var.hx_mac_prefix_end_addr
  }
  # vm_network_vlans = [{
  #   name    = var.hx_vm_network_vlans_name
  #   vlan_id = var.hx_vm_network_vlans_id
  # }]
  # vm_migration_vlan {
  #   name    = var.hx_vm_migration_vlan_name
  #   vlan_id = var.hx_vm_migration_vlan_id
  # }
  # kvm_ip_range {
  #   start_addr = var.hx_kvm_oob_start_addr
  #   end_addr   = var.hx_kvm_oob_end_addr
  #   netmask    = var.hx_kvm_oob_netmask
  #   gateway    = var.hx_kvm_oob_gateway
  # }
}

# HX Node Config Policy IP & Hostname
resource "intersight_hyperflex_node_config_policy" "hx_node_config_policy" {
  name        = "${var.cluster_name}_node_config"
  description = "HX Node Config Policy"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org_data.results[0].moid
  }
  tags {
    key   = var.tag_key1
    value = var.tag_value1
  }
  node_name_prefix = var.hx_node_name_prefix
  # Hypervisor vmk0 IP range 
  mgmt_ip_range {
    start_addr = var.hx_hypervisor_mgmt_start_addr
    end_addr   = var.hx_hypervisor_mgmt_end_addr
    gateway    = var.hx_hypervisor_mgmt_gateway
    netmask    = var.hx_hypervisor_mgmt_netmask
  }
  # CtrlVM eth0 IP range 
  hxdp_ip_range {
    start_addr = var.hx_hxdp_mgmt_start_addr
    end_addr   = var.hx_hxdp_mgmt_end_addr
    gateway    = var.hx_hxdp_mgmt_gateway
    netmask    = var.hx_hxdp_mgmt_netmask
  }
  ## Guessing CtrlVM eth1 IP range 
  # data_ip_range {
  #   start_addr = var.hx_hxdp_data_start_addr
  #   end_addr   = var.hx_hxdp_data_end_addr
  #   gateway    = var.hx_hxdp_data_gateway
  #   netmask    = var.hx_hxdp_data_netmask
  # }
  ## Hypervisor IP's for VM migration 
  # hypervisor_control_ip_range {
  #   start_addr = var.hx_hypervisor_vmotion_start_addr
  #   end_addr   = var.hx_hypervisor_vmotion_end_addr
  #   gateway    = var.hx_hypervisor_vmotion_gateway
  #   netmask    = var.hx_hypervisor_vmotion_netmask
  # }
}

# HX Node Profile

resource "intersight_hyperflex_node_profile" "hx_node_profile_1" {
  name = "${var.cluster_name}-01"
  assigned_server {
    selector = "$filter=Name eq 'hxc220m5-2j-a'"
    //moid = intersight_hyperflex_cluster_profile.hx_cluster_profile.moid
    object_type = "compute.RackUnit"
  }
  cluster_profile {
    moid = intersight_hyperflex_cluster_profile.hx_cluster_profile.moid
    object_type = "hyperflex.ClusterProfile"
  }
}
resource "intersight_hyperflex_node_profile" "hx_node_profile_2" {
  name = "${var.cluster_name}-02"
  assigned_server {
    selector = "$filter=Name eq 'hxc220m5-2j-b'"
    //moid = intersight_hyperflex_cluster_profile.hx_cluster_profile.moid
    object_type = "compute.RackUnit"
  }
  cluster_profile {
    moid = intersight_hyperflex_cluster_profile.hx_cluster_profile.moid
    object_type = "hyperflex.ClusterProfile"
  }
}
resource "intersight_hyperflex_node_profile" "hx_node_profile_3" {
  name = "${var.cluster_name}-03"
  assigned_server {
    selector = "$filter=Name eq 'hxc220m5-2j-f'"
    //moid = intersight_hyperflex_cluster_profile.hx_cluster_profile.moid
    object_type = "compute.RackUnit"  
  }
  cluster_profile {
    moid = intersight_hyperflex_cluster_profile.hx_cluster_profile.moid
    object_type = "hyperflex.ClusterProfile"
  }
}

# HX Proxy Settings
 resource "intersight_hyperflex_proxy_setting_policy" "hx_proxy_setting_policy" {
  name        = "${var.cluster_name}_proxy_settings"
  description = "HX Proxy Settings"
  hostname    = var.hx_proxy_ip
  password    = var.hx_proxy_password
  port        = var.hx_proxy_port
  username    = var.hx_proxy_username
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org_data.results[0].moid
  }
  tags {
    key   = var.tag_key1
    value = var.tag_value1
  }
}

#HX Replication Network Policy"
/*
resource "intersight_hyperflex_cluster_replication_network_policy" "hx_replication_network_policy" {
  name        = "${var.cluster_name}_replication_network"
  description = "HX Replication Network Policy"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org_data.results[0].moid
  }
  tags {
    key   = var.tag_key1
    value = var.tag_value1
  }
  replication_vlan {
    name    = var.hx_replication_vlan_name
    vlan_id = var.hx_replication_vlad_id
  }
  replication_bandwidth_mbps = var.hx_replication_bandwidth_mbps
  replication_mtu            = var.hx_replication_mtu
  replication_ipranges {
    start_addr = var.hx_replication_ip_start_addr
    end_addr   = var.hx_replication_ip_end_addr
    netmask    = var.hx_replication_netmask
    gateway    = var.hx_replication_gateway
  }
}
*/


# HX Software Version Policy"
resource "intersight_hyperflex_software_version_policy" "hx_software_version_policy" {
  name        = "${var.cluster_name}_software_version"
  description = "HX Software Version Policy"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org_data.results[0].moid
  }
  tags {
    key   = var.tag_key1
    value = var.tag_value1
  }
  hxdp_version = var.hx_hxdp_version
}

# HX Storage Configuration"
resource "intersight_hyperflex_cluster_storage_policy" "hx_storage_config_policy" {
  name        = "${var.cluster_name}_storage_config"
  description = "HX Storage Configuration"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org_data.results[0].moid
  }
  tags {
    key   = var.tag_key1
    value = var.tag_value1
  }
  #disk_partition_cleanup = var.hx_disk_partition_cleanup
  vdi_optimization       = var.hx_vdi_optimization
  # logical_avalability_zone_config = [{
  #   auto_config = var.hx_logical_avalability_zone_config
  #   "additional_properties" = ""
  #   "class_id" = ""
  #   "object_type" = ""
  # }]
}

# HX System  Config PolicyDNS, NTP and Timezone
resource "intersight_hyperflex_sys_config_policy" "hx_sys_config_policy" {
  name        = "${var.cluster_name}_sys_config"
  description = "HX Sys Config Policy"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org_data.results[0].moid
  }
  tags {
    key   = var.tag_key1
    value = var.tag_value1
  }
  dns_domain_name = var.hx_dns_domain_name
  dns_servers     = var.hx_dns_servers
  ntp_servers     = var.hx_ntp_servers
  timezone        = var.hx_timezone
}

# HX vCenter Config Policy
resource "intersight_hyperflex_vcenter_config_policy" "hx_vcenter_policy" {
  name        = "${var.cluster_name}_vcenter_config"
  description = "HX vCenter Config Policy"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org_data.results[0].moid
  }
  tags {
    key   = var.tag_key1
    value = var.tag_value1
  }
  data_center = var.hx_vcenter_dc_name
  hostname    = var.hx_vcenter_ip
  password    = base64decode(var.hx_vcenter_password)
  username    = var.hx_vcenter_username
}

