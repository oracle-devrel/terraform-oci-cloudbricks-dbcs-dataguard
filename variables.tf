# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# variables.tf 
#
# Purpose: The following file declares all variables used in this backend repository

/********** Provider Variables NOT OVERLOADABLE **********/
variable "region" {
  description = "Target region where artifacts are going to be created"
}

variable "tenancy_ocid" {
  description = "OCID of tenancy"
}

variable "user_ocid" {
  description = "User OCID in tenancy"
}

variable "fingerprint" {
  description = "API Key Fingerprint for user_ocid derived from public API Key imported in OCI User config"
}

variable "private_key_path" {
  description = "Private Key Absolute path location where terraform is executed"
}
/********** Provider Variables NOT OVERLOADABLE **********/

/********** Brick Variables **********/

/********** DataGuard Variables **********/

variable "dg_availability_domain_number" {
  description = "Describes the Availability domain number where the primary DBCS is located at"

}
variable "primary_db_home_display_name" {
  description = "Describes the user friendly display name of primary DB"
}

variable "creation_type" {
  description = "Specifies whether to create the peer database in an existing DB system or in a new DB system."
  default     = "NewDbSystem"
}

variable "database_admin_password" {
  description = "A strong password for the SYS, SYSTEM, and PDB Admin users to apply during standby creation."
}

variable "delete_standby_db_home_on_delete" {
  description = "if set to true the destroy operation will destroy the standby dbHome/dbSystem that is referenced in the Data Guard Association. The Data Guard Association gets destroyed when standby dbHome/dbSystem is terminated. Only true is supported at this time. If you change an argument that is used during the delete operation you must run terraform apply first so that that the change in the value is registered in the statefile before running terraform destroy. terraform destroy only looks at what is currently on the statefile and ignores the terraform configuration files."
  default     = true
}

variable "protection_mode" {
  description = "The protection mode to set up between the primary and standby databases. For more information, see Oracle Data Guard Protection Modes in the Oracle Data Guard documentation."
}

variable "transport_type" {
  description = "The redo transport type to use for this Data Guard association. Valid values depend on the specified protectionMode MAXIMUM_AVAILABILITY - SYNC or FASTSYNC MAXIMUM_PERFORMANCE - ASYNC MAXIMUM_PROTECTION - SYNC"
}

variable "dg_display_name" {
  description = "Display name of Dataguard DB Instance"
}

variable "dg_hostname" {
  description = "The hostname for the DB node."
}

variable "dg_shape" {
  description = "he virtual machine DB system shape to launch for the standby database in the Data Guard association. The shape determines the number of CPU cores and the amount of memory available for the DB system. Only virtual machine shapes are valid options. If you do not supply this parameter, the default shape is the shape of the primary DB system."
}

variable "primary_database_name" {
  description = "Name of the primary database to which this dataguard will be attached to"
}

/********** DataGuard Variables **********/

/********** Datasource and Subnet Lookup related variables **********/
variable "dg_instance_compartment_name" {
  description = "Defines the compartment name where the infrastructure will be created"
}

variable "dg_network_compartment_name" {
  description = "Defines the compartment where the Network is currently located"
}

variable "network_subnet_name" {
  description = "Defines the subnet name associated to the artifact"
}



/********** Datasource related variables **********/

/********** Brick Variables **********/
