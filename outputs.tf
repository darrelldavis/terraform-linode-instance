output "id" { 
  description = "Linode id"
  value       = linode_instance.this.id
}

output "label" { 
  description = "Linode label"
  value       = linode_instance.this.label
}

output "status" {
  description = "The status of the instance, indicating the current readiness state."
  value       = linode_instance.this.status
}

output "ip_address" {
  description = "A string containing the Linode's public IP address."
  value       = linode_instance.this.ip_address
}

output "private_ip_address" {
  description = "This Linode's Private IPv4 Address, if enabled. "
  value       = linode_instance.this.private_ip_address
}

output "ipv6" {
  description = "This Linode's IPv6 SLAAC addresses."
  value       = linode_instance.this.ipv6
}

output "ipv4" {
  description = "This Linode's IPv4 Addresses."
  value       = tolist(linode_instance.this.ipv4)
}

output "specs" {
  description = "Specs"
  value       = tolist(linode_instance.this.specs.*)
}

output "backups" {
  description = "Information about this Linode's backups status"
  value       = tolist(linode_instance.this.backups)
}
