 
# Intersight Access API Key
api_key                                     = "601c3b7c7564612d33ab34aa/65025cad756461330118f7e2/65026268756461310162fc8a"
secret_key                                  = "../creds/intersight-SecretKey.txt"
endpoint                                    = "https://usps-lab.intersight.com"
# Common
org_name                                    = "USPS"
# Tags
tag_key1                                    = "hx"
tag_value1                                  = "m5"

# auto_support_policy 
hx_auto_support_name                        = "hx-pod03-autoSupport"
hx_auto_support_description                 = "auto support policy"
hx_auto_support_service_ticket_receipient   = ""
hx_auto_support_admin_state                 = false

# cluster_network_policy
hx_network_policy_name                      = "hx-pod03-networPolicy"
hx_network_policy_description               = "Network Policy Definition"
hx_jumbo_frame                              = true
hx_uplink_speed                             = "10G"
hx_mgmt_vlan_name                           = "VLAN20"
hx_mgmt_vlan_id                             = "20"
## 10G options 
#hx_vm_migration_vlan_name                   = "VLAN1202"
#hx_vm_migration_vlan_id                     = "1202" # <int>
#hx_vm_network_vlans_name                    = "VLAN1200"
#hx_vm_network_vlans_id                      = "1200" # <int>
hx_mac_prefix_start_addr                    = "00:25:B5:AA"
hx_mac_prefix_end_addr                      = "00:25:B5:BB"

# cluster_storage_policy
hx_storage_policy_name                      = "hx-pod03-cluster-storage-Pol"
hx_storage_policy_description               = "Storage policy for hx cluster"
hx_vdi_optimization                         = false
#hx_disk_partition_cleanup                   = true
hx_logical_avalability_zone_config          = false

# local_credential_policy
hx_local_credential_policy_name             = "hx-pod03-localCreds"
hx_local_credential_policy_description      = "Local Credential Policy"
hx_factory_hypervisor_password              = true
hx_hxdp_root_pwd                            = "Q2lzY08hMTIzNDU="
hx_hypervisor_admin                         = "root"
hx_hypervisor_admin_pwd                     = "Q2lzY08hMTIzNDU="

# node_config_policy
node_config_policy_name                     = "hx-pod03-nodePol"
node_config_policy_description              = "Node Config Policy"
hx_node_name_prefix                         = "hx-pod03"

hx_hxdp_mgmt_start_addr                     = "172.16.7.81"
hx_hxdp_mgmt_end_addr                       = "172.16.7.83"
hx_hxdp_mgmt_gateway                        = "172.16.1.1"
hx_hxdp_mgmt_netmask                        = "255.255.0.0"

# hx_hxdp_data_start_addr                   = ""
# hx_hxdp_data_end_addr                     = ""
# hx_hxdp_data_gateway                      = ""
# hx_hxdp_data_netmask                      = ""

hx_hypervisor_mgmt_start_addr               = "172.16.7.71"
hx_hypervisor_mgmt_end_addr                 = "172.16.7.73"
hx_hypervisor_mgmt_gateway                  = "172.16.1.1"
hx_hypervisor_mgmt_netmask                  = "255.255.0.0"



#hx_hypervisor_vmotion_start_addr            = "172.16.7.81"    
#hx_hypervisor_vmotion_end_addr              = "1172.16.7.83"  
#hx_hypervisor_vmotion_gateway               = "172.16.1.1" 
#hx_hypervisor_vmotion_netmask               = "255.255.0.0" 
hx_hypervisor_admin_user                    = "root"

# software_version_policy
hx_software_version_policy_name             = "hx-pod03-swVerPol"
hx_software_version_policy_description      = "Software Version Policy"
hx_hxdp_version                             = "5.0(2a)"

# sys_config_policy
hx_sys_config_policy_name                   = "hx-pod03-sysConfgi"
hx_sys_config_policy_description            = "System Config Policy"
hx_dns_domain_name                          = "cisco.com"
hx_dns_servers                              = ["172.16.2.126"] # ["x.x.x.1", "x.x.x.2"]
hx_ntp_servers                              = ["172.16.1.1"] # ["x.x.x.3", "x.x.x.4"]
hx_timezone                                 = "America/New_York"

# hx_proxy_setting_policy
 hx_proxy_policy_name                      = "hx_proxy_setting_policy"
 hx_proxy_policy_description               = "HX Proxy Settings"
hx_proxy_username                           = ""
hx_proxy_password                           = ""
hx_proxy_port                               = "80"
hx_proxy_ip                                 = "proxy.esl.cisco.com"

# vcenter_config_policy 
hx_vcenter_config_policy_name               = "hx-pod03-vcenterPol"
hx_vcenter_config_policy_description        = "vCenter Config Policy"
hx_vcenter_dc_name                          = "HX-Pod3-DataCenter"
hx_vcenter_ip                               = "10.83.114.144"
hx_vcenter_password                         = "Q2lzY08hMTIzNDU="
hx_vcenter_username                         = "administrator@vsphere.local"


/*## Replication_network_policy
# hx_replication_network_policy_name        = ""
# hx_replication_network_policy_description = ""
hx_replication_bandwidth_mbps               = "10000"
hx_replication_mtu                          = "1500" # <int>
hx_replication_vlan_name                    = "VLAN1205"
hx_replication_vlad_id                      = "1205"
hx_replication_ip_start_addr                = "172.16.117.1"
hx_replication_ip_end_addr                  = "172.16.117.10"
hx_replication_netmask                      = "255.255.255.0"
hx_replication_gateway                      = "172.16.117.254"*/

## Ext iSCSI Policy 
# hx_ext_iscsi_policy_name                  = ""
# hx_ext_iscsi_policy_description           = ""
#hx_ext_iscsi_admin_state                    = false
#hx_iscsi_exta_name                          = "VLAN20"
#hx_iscsi_exta_vlan_id                       = 20
#hx_iscsi_extb_name                          = "VLAN20"
#hx_iscsi_extb_vlan_id                       = 20

## Ext FC storage policy
#hx_fc_storage_policy_name                  = ""
#hx_fc_storage_policy_description           = ""
#hx_fc_admin_state                          = "" # bool
#hx_fc_exta_vsan_name                        = "VSAN1"
#hx_fc_exta_vsan_id                          = "1" # <int>
#hx_fc_extb_vsan_name                        = "VSAN1"
#hx_fc_extb_vsan_id                          = "1" # <int>
#hx_fc_wwxn_prefix_start_addr                = "20:00:00:25:B5:AA"
#hx_fc_wwxn_prefix_end_addr                  = "20:00:00:25:B5:EF"
#hx_fc_admin_state                           = false # bool

# cluster_profile
hx_profile_name                             = "hx-pod03-hxProfile"
hx_profile_description                      = "HX Cluster Profile"
cluster_name                                = "HX-pod03"
hx_host_name_prefix                         = "hx-pod03"
hx_data_ip_address                          = "169.254.1.1"
hx_hypervisor_type                          = "ESXi"
hx_mac_address_prefix                       = "00:25:B5:3A"
hx_mgmt_ip_address                          = "172.16.7.80"
hx_mgmt_platform                            = "EDGE"
hx_replication                              = "3"# <int>
hx_storage_data_vlan_name                   = "VLAN1001"
hx_storage_data_vlan_id                     = "1001" # <int>

# Server Names
server_names = [
  {
    name = "hx-pod03-01",
    hostname = "hx-pod03-01"
  },
  {
    name = "hx-pod03-02",
    hostname = "hx-pod03-02"
  },
  {
    name = "hx-pod03-03",
    hostname = "hx-pod03-01"
  }
]
