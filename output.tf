# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# output.tf
#
# Purpose: The following script defines the DBCS output when creation is completed


output "Database_Peered_Ocid" {
  description = "Returns de id of peered database created"
  value       = oci_database_data_guard_association.dataguard.database_id
}


output "Dataguard_Ocid" {
  description = "Returns de id of dataguard"
  value       = oci_database_data_guard_association.dataguard.id
}


output "Protection_Mode" {
  description = "Returns de protection mode of Dataguard Created"
  value       = oci_database_data_guard_association.dataguard.protection_mode
}


output "Peer_Role" {
  description = "Returns de Peer Role configured"
  value       = oci_database_data_guard_association.dataguard.peer_role
}

output "Role" {
  description = "The role of the reporting database in this Data Guard association"
  value       = oci_database_data_guard_association.dataguard.role
}

output "Apply_Rate" {
  description = "he rate at which redo logs are synced between the associated databases. Example: 180 Mb per second"
  value       = oci_database_data_guard_association.dataguard.apply_rate
}

output "dataguard_instance" {
  description = "Dataguard Instance for integration purposes"
  value       = oci_database_data_guard_association.dataguard
}

