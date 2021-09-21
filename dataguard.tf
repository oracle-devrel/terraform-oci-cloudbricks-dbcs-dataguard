# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# dataguard.tf
#
# Purpose: The following script defines the logic to create a dataguard artifact depending on a primary pre-created DBCS DBSystem
# Registry: https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/database_data_guard_association
resource "oci_database_data_guard_association" "dataguard" {
  creation_type                    = var.creation_type
  database_admin_password          = var.database_admin_password
  database_id                      = local.primary_db_id
  delete_standby_db_home_on_delete = var.delete_standby_db_home_on_delete
  protection_mode                  = var.protection_mode
  transport_type                   = var.transport_type

  #Optional
  availability_domain = local.availability_domain

  display_name = var.dg_display_name
  hostname     = var.dg_hostname

  shape     = var.dg_shape
  subnet_id = local.subnet_ocid
}