# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# datasource.tf
#
# Purpose: The following script defines the lookup logic used in code to obtain pre-created or JIT-created resources in tenancy.

data "oci_identity_availability_domain" "AD" {
  compartment_id = var.tenancy_ocid
  ad_number      = var.dg_availability_domain_number
}

data "oci_identity_compartments" "COMPARTMENTS" {
  compartment_id            = var.tenancy_ocid
  compartment_id_in_subtree = true
  filter {
    name   = "name"
    values = [var.dg_instance_compartment_name]
  }
}

data "oci_identity_compartments" "NWCOMPARTMENTS" {
  compartment_id            = var.tenancy_ocid
  compartment_id_in_subtree = true
  filter {
    name   = "name"
    values = [var.dg_network_compartment_name]
  }
}

data "oci_core_vcns" "VCN" {
  compartment_id = local.nw_compartment_id
}

/********** Subnet Accessors **********/

data "oci_core_subnets" "SUBNET" {
  compartment_id = local.nw_compartment_id
  vcn_id         = local.vcn_id
  filter {
    name   = "display_name"
    values = [var.network_subnet_name]
  }
}




/********** Dataguard Accessors **********/

data "oci_database_db_systems" "DBSYSTEMS" {
  compartment_id = local.compartment_id
  filter {
    name   = "display_name"
    values = ["${var.primary_database_name}"]
  }
}

data "oci_database_db_homes" "DBHOMES" {
  compartment_id = local.compartment_id
  db_system_id   = local.db_system_id

  filter {
    name   = "display_name"
    values = ["${var.primary_db_home_display_name}"]
  }
}

data "oci_database_databases" "DATABASES" {
  compartment_id = local.compartment_id
  db_home_id     = local.primary_db_home_id
}


locals {


  /********** Backup windows definitions and Local Accessor **********/


  # Subnet OCID local accessors
  subnet_ocid        = length(data.oci_core_subnets.SUBNET.subnets) > 0 ? data.oci_core_subnets.SUBNET.subnets[0].id : null
  

  # Compartment OCID Local Accessors
  compartment_id      = lookup(data.oci_identity_compartments.COMPARTMENTS.compartments[0], "id")
  nw_compartment_id   = lookup(data.oci_identity_compartments.NWCOMPARTMENTS.compartments[0], "id")
  availability_domain = data.oci_identity_availability_domain.AD.name
  
  # VCN OCID Local Accessor 
  vcn_id = data.oci_core_vcns.VCN.virtual_networks[0].id

  # Dataguard Local Accessor 
  db_system_id       = data.oci_database_db_systems.DBSYSTEMS.db_systems.0.id
  primary_db_home_id = data.oci_database_db_homes.DBHOMES.db_homes.0.db_home_id
  primary_db_id      = data.oci_database_databases.DATABASES.databases.0.id
}